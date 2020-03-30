package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.ButtonDao;
import com.zjft.zhyg.system.dao.MenuDao;
import com.zjft.zhyg.system.dao.RoleDao;
import com.zjft.zhyg.system.dao.UserDao;
import com.zjft.zhyg.system.dto.ButtonMenuDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.dto.RoleDto;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author yuechen
 * @Description 角色服务
 **/
@Transactional
@Service
public class RoleServiceImpl implements RoleService {
    private static final Logger log = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private ButtonDao buttonDao;

    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("userOrgNo", param.get("userOrgNo"));

        if (!StringUtils.isEmpty(param.get("orgTypeNo"))) {
            map.put("orgTypeNo", param.get("orgTypeNo"));
        }
        if (!StringUtils.isEmpty(param.get("roleName"))) {
            map.put("roleName", param.get("roleName"));
        }
        RspMsg rspMsg = new RspMsg();
        // 需要分页查询
        List<Role> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Role> page = PageHelper.startPage(curPage, pageSize);
            result = roleDao.qry(map);
            PageInfo<Role> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = roleDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "无满足条件的角色");
        }
        List<RoleDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromRole).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    @Override
    public RspMsg add(Map<String, String> param) {
        log.info("新增角色开始");
        Role role = roleDao.qryByName(param.get("roleName"));
        if (role!=null){
            log.warn("角色已存在 role:{}",role);
            return new RspMsg("fail","角色已存在");
        }
        param.put("no", System.currentTimeMillis() + "");
        roleDao.add(param);
        log.info("新增角色成功 role:{}"+role);
        return new RspMsg("ok", "新增角色成功");
    }

    @Override
    public RspMsg qryAccessById(String roleNo) {
        List<String> menus = roleDao.qryRoleMenu(roleNo);
        List<RoleButton> buttons = roleDao.qryRoleButton(roleNo);
        List<Menu> allMenus = menuDao.qryAll();
        List<ButtonMenuDto> allButtons = buttonDao.qryAllButtons();
        List<Map<String, Object>> result = new ArrayList<>();
        List<String> tmp = new ArrayList<>();
        // 整合全部菜单和全部按钮
        allButtons.forEach(x -> {
            String menuNo = x.getMenuNo();
            if (tmp.contains(menuNo)) {
                Map<String, String> tmp1 = new HashMap<>(4);
                tmp1.put("btnNo", x.getBtnNo());
                tmp1.put("btnName", x.getBtnName());
                ((List<Map<String, String>>) result.get(tmp.indexOf(menuNo)).get("buttons")).add(tmp1);
            } else {
                tmp.add(menuNo);
                Map<String, Object> tmp1 = new HashMap<>(8);
                tmp1.put("menuNo", menuNo);
                tmp1.put("menuName", x.getMenuName());
                Map<String, String> tmp2 = new HashMap<>(4);
                tmp2.put("btnNo", x.getBtnNo());
                tmp2.put("btnName", x.getBtnName());
                List<Map<String, String>> tmp3 = new ArrayList<>();
                tmp3.add(tmp2);
                tmp1.put("buttons", tmp3);
                result.add(tmp1);
            }
        });
        // 补充没有按钮的菜单
        allMenus.forEach(x -> {
            if (!tmp.contains(x.getNo()) && x.getNo().length() > 1) {
                Map<String, Object> tmp1 = new HashMap<>(4);
                tmp1.put("menuNo", x.getNo());
                tmp1.put("menuName", x.getName());
                result.add(tmp1);
            }
        });
        List<Map<String, Object>> tmp2 = new ArrayList<>();
        List<Menu> moduleMenus = allMenus.stream().filter(x -> x.getNo().length() == 1).collect(Collectors.toList());
        moduleMenus.forEach(x -> {
            Map<String, Object> tmp3 = new HashMap<>(8);
            tmp3.put("moduleNo", x.getNo());
            tmp3.put("moduleName", x.getName());
            tmp3.put("menus", result.stream().filter(y ->
                    ((String) y.get("menuNo")).startsWith(x.getNo())).collect(Collectors.toList()));
            tmp2.add(tmp3);
        });
        Map<String, Object> data = new HashMap<>(4);
        data.put("menus", menus);
        data.put("buttons", buttons);
        data.put("allAccesses", tmp2);
        return new RspMsg("ok", "查询角色权限成功", data);
    }

    @Override
    public RspMsg mod(Map<String, String> newParam,Map<String,String> oldParam) {
        if (StringUtils.isEmpty(newParam.get("name")) || StringUtils.isEmpty(newParam.get("orgType"))){
            return new RspMsg("fail","角色名称和所属机构不能为空");
        }
        if (!(newParam.get("name").equals(oldParam.get("name")))){
            Role role = roleDao.qryByName(newParam.get("name"));
            if (role!=null){
                if(!role.getNo().equalsIgnoreCase(oldParam.get("no"))){
                    return new RspMsg("fail","角色名称已存在");
                }
            }
            String no = newParam.get("no");
            List<Role> roles = roleDao.qryAll();
            for(Role role1:roles){
                System.out.println(role1);
                String roleNo = role1.getNo();
                if(roleNo.contains("|")){
                    System.out.println(roleNo);
                    StringBuilder stringBuffer = new StringBuilder();
                    String[] roleNos = roleNo.split("\\|");
                    boolean flag = false;
                    for(String roleno:roleNos){

                        if(roleno.equals(no)){
                            flag = true;
                            stringBuffer.append(",").append(newParam.get("name"));
                        }else{
                            stringBuffer.append(",").append(roleDao.qryByNo(roleno).getName());
                        }
                    }
                    if(flag){
                        System.out.println(roleNo);
                        Role role2 = new Role();
                        role2.setNo(roleNo);
                        role2.setName(stringBuffer.substring(1));
                        roleDao.modRole(role2);
                    }
                }
            }

        }
        roleDao.mod(newParam);
        return new RspMsg("ok", "修改角色信息成功");
    }

    @Override
    public RspMsg modAccess(Map<String, Object> param) {
        log.info("修改菜单权限开始");
        String roleNo = (String) param.get("roleNo");
        List<String> menus = (List<String>) param.get("menus");
        List<String> buttons = (List<String>) param.get("buttons");
        try {
            if (menus != null ) {
                menuDao.delMenusByRoleNo(roleNo);
                if (menus.size() > 0)
                    roleDao.addRoleMenu(param);
            }
        } catch (Exception e) {
            log.error("修改菜单权限异常", e);
            return new RspMsg("fail", "修改菜单权限异常");
        }
        try {
            if (buttons != null) {
                buttonDao.delButtonsByRoleNo(roleNo);
                if ( buttons.size() > 0)
                    roleDao.addRoleButton(param);
            }
        } catch (Exception e) {
            log.error("修改按钮权限异常", e);
            return new RspMsg("fail", "修改按钮权限异常");
        }
        log.info("修改权限成功 roleNo:"+roleNo);
        return new RspMsg("ok", "修改权限成功");
    }

    @Override
    public RspMsg del(String roleNo) {
        log.info("删除角色开始 roleNo:"+roleNo);
        RspMsg rspMsg = new RspMsg();
        try {
            //先判断该角色是否被用户使用，被使用则不可删除，采用模糊查询（防止多角色情况）
            List<User> result=userDao.qryByRoleNo(roleNo);
            if(!(result == null || result.size() == 0)) {
                log.warn("该角色下有用户存在，不可删除 roleNo:"+roleNo);
                return new RspMsg("fail", "该角色下有用户存在，不可删除");
            }

            menuDao.delMenusByRoleNo(roleNo);
            buttonDao.delButtonsByRoleNo(roleNo);
            roleDao.del(roleNo);

            rspMsg.setRetCode("ok");
            log.info("删除角色信息成功 roleNo:"+roleNo);
            rspMsg.setRetMsg("删除角色信息成功");
        } catch (Exception e) {
            log.error("操作异常:",e);
            rspMsg = new RspMsg("fail", "删除角色异常");
        }
        return rspMsg;
    }

    @Override
    public RspMsg qryAvailableRoleByOrgNo(Map<String, String> param) {
        List<Role> result = roleDao.qryAvailableRoleByOrgNo(param);
        return new RspMsg("ok", "查询银行网点人员成功", result);
    }

    @Override
    public RspMsg qryByNo(String no) {
        Role role = roleDao.qryByNo(no);
        if(role==null){
            return new RspMsg("ok", "该角色不存在");
        }
        return new RspMsg("ok", "查询角色成功", role);
    }

}
