package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.common.CalendarUtil;
import com.zjft.zhyg.common.StringUtil;
import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.dao.RoleDao;
import com.zjft.zhyg.system.dao.UserDao;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.dto.SessionDto;
import com.zjft.zhyg.system.dto.UserDto;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.UserService;
import com.zjft.zhyg.system.util.EncryptUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author zyq
 * @Description 登录服务
 **/
@Transactional
@Service
public class UserServiceImpl implements UserService {
    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private DevCatalogDao devCatalogDao;

    @Override
    public RspMsg login(User user) {
        log.info("用户登录开始 userName:" + user.getNo());
        RspMsg rspMsg = new RspMsg();
        User result = userDao.findByNo(user.getNo());
        if (result == null) {
            log.warn("账号不存在 userNo:" + user.getNo());
            rspMsg.setRetCode(FinalValues.FAIL);
            rspMsg.setRetMsg("账号不存在");
            return rspMsg;
        }
        // 第二天后先重置密码输错次数
        if (StringUtil.parseString(result.getLoginTime()).length() >= 10 && !result.getLoginTime().substring(0, 10).equals(CalendarUtil.getSysTimeYMD())) {
            Map<String, Object> map = new HashMap<>();
            map.put("passwdError", 0);
            map.put("status", result.getStatus());
            map.put("no", result.getNo());
            userDao.updatePasswdErrorAndStatus(map);
            result.setPasswdError(0);
        }
        if (result.getPasswdError() >= 5) {
            userDao.updateUserStatus("3", result.getNo());//锁定用户帐号
            rspMsg.setRetCode(FinalValues.FAIL);
            rspMsg.setRetMsg("该帐号已被锁定");
            log.warn("该帐号已被锁定 userNo:" + user.getNo());
            return rspMsg;
        }
        //密码输入错误
        if (!result.getPasswd().equals(EncryptUtil.MD5(user.getPasswd()))) {
            int loginTimes = 5 - result.getPasswdError() - 1 > 0 ? 5 - result.getPasswdError() - 1 : 0;
            userDao.updatePasswdError(result.getPasswdError() + 1, result.getNo());
            userDao.updateLoginTime(CalendarUtil.getSysTimeYMDHMS(), user.getNo());
            rspMsg.setRetCode(FinalValues.FAIL);
            rspMsg.setRetMsg("密码错误，今天剩余" + loginTimes + "次机会");
            return rspMsg;
        } else {
            //初次登录，设置状态为2
            if (result.getLoginTime() == null && !"2".equals(result.getStatus())) {
                userDao.updateUserStatus("2", result.getNo());
                result.setStatus("2");
            }else{
                Map<String, Object> map = new HashMap<>();
                map.put("passwdError", 0);
                map.put("status", "1");
                map.put("no", result.getNo());
                userDao.updatePasswdErrorAndStatus(map);
            }
            userDao.updateUser(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), "1", result.getNo());
            SessionDto sessionDto = new SessionDto();
            String passwdExpiratio = result.getPasswdExpiration();
            int outDate = 0;
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if ("".equals(StringUtil.parseString(passwdExpiratio))) {
                userDao.updateUserStatus("2", result.getNo());
                result.setStatus("2");
            } else {
                try {
                    outDate = (int) ((sdf.parse(passwdExpiratio).getTime() - date.getTime()) / (1000 * 60 * 60 * 24));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            //新增用户多角色情况处理
            HashSet<RoleButton> btnSet = new HashSet<>();
            HashSet<String> menuSet = new HashSet<>();
            HashSet<RoleButton> auditSet = new HashSet<>();

            List<RoleButton> btnList;
            List<String> menuList;
            String[] roleNos = result.getRole().getNo().split("\\|");
            for (String roleNo : roleNos) {
                btnList = roleDao.qryRoleButton(roleNo);
                menuList = roleDao.qryRoleMenu(roleNo);
                for (RoleButton roleButton : btnList) {
                    btnSet.add(roleButton);
                }
                for (String str : menuList) {
                    menuSet.add(str);
                }
            }
            if (outDate <= 0) {
                userDao.updateUserStatus("2", result.getNo());
                result.setStatus("2");
            } else {
                sessionDto.setOutDate(outDate);
            }
            auditSet = btnSet;
            sessionDto.setAuditFlagList(new ArrayList<>(auditSet));
            sessionDto.setBtnList(new ArrayList<>(btnSet));
            sessionDto.setMenuList(new ArrayList<>(menuSet));
            rspMsg.setRetCode(FinalValues.OK);
            rspMsg.setRetMsg("登录成功");
            sessionDto.setUser(DtoMapper.MAPPER.fromUser(result));
            rspMsg.setData(sessionDto);
            log.info("登录成功 userNo:" + user.getNo());
            return rspMsg;
        }
    }

    @Override
    public void logout(User user) {
        log.info("用户登出 userNo:" + user.getNo());
        User result = userDao.findByNo(user.getNo());
        if (result != null) {
            log.info("用户登成功 userNo:" + user.getNo());
            userDao.updateOnlineFlag("1", result.getNo());
        }
    }

    /**
     * 根据用户名查询用户
     *
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        User user = userDao.findByNo(no);
        List<String> devCatalogs = devCatalogDao.qryUserCatalog(no);
        StringBuilder devCatalog = new StringBuilder();
        for (String devCatalog1 : devCatalogs) {
            devCatalog.append("|");
            devCatalog.append(devCatalog1);
        }
        String devCatalogNo = devCatalog.substring(1);
        user.setDevCatalog(devCatalogNo);
        if (StringUtils.isEmpty(user.getNo())) {
            return new RspMsg("fail", "用户不存在");
        } else {
            return new RspMsg("ok", "查询成功", user);
        }
    }

    /**
     * 动态查询用户信息
     *
     * @param param
     * @return
     */

    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if (!StringUtils.isEmpty(param.get("orgNo"))) {
            map.put("orgNo", param.get("orgNo"));
        }
        if (!StringUtils.isEmpty(param.get("roleNo"))) {
            map.put("roleNo", param.get("roleNo"));
        }
        if (!StringUtils.isEmpty(param.get("userName"))) {
            map.put("userName", param.get("userName"));
        }
        if (!StringUtils.isEmpty(param.get("userNo"))) {
            map.put("userNo", param.get("userNo"));
        }
        if (!StringUtils.isEmpty(param.get("onlineFlag"))){
            map.put("onlineFlag",param.get("onlineFlag"));
        }
        // 需要分页查询
        List<User> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<User> page = PageHelper.startPage(curPage, pageSize);
            result = userDao.qry(map);
            PageInfo<User> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = userDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "用户不存在");
        }
        List<UserDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromUser).collect(Collectors.toList());
        for (int i = 0; i < dtoResult.size(); i++) {
            String no = dtoResult.get(i).getNo();
            List<String> devCatalogs = devCatalogDao.qryUserCatalog(no);
            StringBuilder devCatalog = new StringBuilder();
            for (String devCatalog1 : devCatalogs) {
                devCatalog.append("|");
                devCatalog.append(devCatalog1);
            }
            if (devCatalog.length() > 1) {
                String devCatalogNo = devCatalog.substring(1);
                dtoResult.get(i).setDevCatalog(devCatalogNo);
            } else {
                dtoResult.get(i).setDevCatalog(null);
            }
            log.info("dtoResult" + dtoResult.toString());
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    /**
     * 用户添加
     *
     * @param user
     * @return
     */
    @Override
    public RspMsg add(User user) {
        log.info("用户添加开始 user:{}", user);
        User temp = userDao.findByNo(user.getNo());
        if (temp != null) {
            log.warn("用户已存在 userNo:" + user.getNo());
            return new RspMsg("fail", "用户已存在");
        }
        //判断该用户是否是多角色&&表中是否存在该角色组合
        String[] roleNos = user.getRoleNo().split("\\|");
        if (roleNos.length > 1 && roleDao.qryByNo(user.getRoleNo()) == null) {
            Map<String, String> map = new HashMap<>();
            map.put("no", user.getRoleNo());//角色编号
            StringBuilder stringBuffer = new StringBuilder();
            for (String roleNo : roleNos) {
                stringBuffer.append(",").append(roleDao.qryByNo(roleNo).getName());
            }
            map.put("roleName", stringBuffer.substring(1));//角色名称
            map.put("note", "组合角色：" + user.getRoleNo());//备注
            roleDao.add(map);
        }
        String[] devCatalogs = user.getDevCatalog().split("\\|");
        for (String devCatalog : devCatalogs) {
            userDao.addDevRole(devCatalog, user.getNo());
        }
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 6);
        Date date = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        user.setPasswdExpiration(sdf.format(date));
        user.setPasswd(EncryptUtil.MD5(user.getPasswd()));
        userDao.add(user);
        log.info("添加用户成功 user:{}", user);
        return new RspMsg("ok", "添加用户成功");

    }

    /**
     * 用户修改
     *
     * @param user
     * @return
     */
    @Override
    public RspMsg mod(User user) {
        log.info("用户修改开始 user:{}" + user);
        User temp1 = userDao.findByNo(user.getNo());
        if (temp1 == null) {
            log.warn("用户不存在 userNo:" + user.getNo());
            return new RspMsg("fail", "用户不存在");
        }
        String devCatalog1 = user.getDevCatalog();
        userDao.delDevRole(user.getNo());
        String[] devCatalogs = devCatalog1.split("\\|");
        for (String devCatalog : devCatalogs) {
            userDao.addDevRole(devCatalog, user.getNo());
        }
        String[] roleNos = user.getRoleNo().split("\\|");
        if (roleNos.length > 1 && roleDao.qryByNo(user.getRoleNo()) == null) {
            Map<String, String> map = new HashMap<>();
            String no = user.getRoleNo();
            map.put("no", user.getRoleNo());//角色编号
            StringBuilder stringBuffer = new StringBuilder();
            for (String roleNo : roleNos) {
                stringBuffer.append(",").append(roleDao.qryByNo(roleNo).getName());
            }
            map.put("roleName", stringBuffer.substring(1));//角色名称
            map.put("note", "组合角色：" + user.getRoleNo());//备注
            Role role = roleDao.qryByNo(no);
            if (role == null) {
                roleDao.add(map);
            }
        }
        userDao.mod(user);
        log.info("修改用户成功 userNo:" + user.getNo());
        return new RspMsg("ok", "修改用户成功");
    }

    /**
     * 用户删除
     *
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("用户删除开始 userNo:" + no);
//        User temp = userDao.findByNo(no);
//        if (temp == null) {
//            return new RspMsg("fail", "用户已被删除");
//        }
        userDao.del(no);
        userDao.delDevRole(no);
        log.info("删除用户成功 userNo:" + no);
        return new RspMsg("ok", "删除用户成功");
    }

    /**
     * 修改密码
     *
     * @param param
     * @return
     */
    @Override
    public RspMsg modPasswd(Map<String, String> param) {
        log.info("修改密码开始");
        String no = param.get("no");
        String passwd = param.get("passwd");
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 6);
        Date date = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String passwdExpiration = sdf.format(date);
        if (StringUtils.isEmpty(param.get("oldPassword"))) {
            //重置密码
            passwd = EncryptUtil.MD5(passwd);
            userDao.modPasswd(passwd, no, passwdExpiration);
            userDao.updateUserStatus("2", no);
            userDao.updatePasswdError(0, no);
            return new RspMsg("ok", "重置密码成功");
        }
        String oldPassword = EncryptUtil.MD5(param.get("oldPassword"));
        User user = userDao.findByNo(no);
        if (!user.getPasswd().equals(oldPassword)) {
            log.warn("旧密码输入不正确");
            return new RspMsg("fail", "旧密码输入不正确");
        }
        passwd = EncryptUtil.MD5(passwd);
        if(user.getPasswd().equals(passwd)){
            log.warn("新密码不能与旧密码相同");
            return new RspMsg("fail", "新密码不能与旧密码相同");
        }
        userDao.modPasswd(passwd, no, passwdExpiration);
        userDao.updateUserStatus("1", no);
        log.info("修改密码成功 userNo:" + user.getNo());
        return new RspMsg("ok", "修改密码成功");
    }

    /**
     * 解锁用户
     *
     * @param userNo
     * @return
     */
    @Override
    public RspMsg unlock(String userNo) {
        try {
            userDao.updateUserStatus("1", userNo);
            userDao.updatePasswdError(0, userNo);
        } catch (Exception e) {
            log.error("解锁用户失败:", e);
            return new RspMsg("fail", "用户解锁失败");
        }
        return new RspMsg("ok", "用户解锁成功");
    }
}
