package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author yuechen
 * @Description 角色管理模块
 **/
@RestController
@RequestMapping("/role")
public class RoleController {
    private static final Logger log = LoggerFactory.getLogger(RoleController.class);
    @Autowired
    private RoleService roleService;

    /**
     * 查询角色列表
     * @return
     */
    @RequestMapping(value = "/qryRolesByPages", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("roleName", request.getParameter("roleName"));
            param.put("userOrgNo", request.getParameter("userOrgNo"));
            param.put("orgTypeNo", request.getParameter("orgTypeNo"));
            //param.put("userOrgTypeNo", request.getParameter("userOrgTypeNo"));

            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
//            if (StringUtils.isEmpty(param.get("userOrgNo"))) {
//                return new RspMsg("fail", "用户所属机构不能为空");
//            }
            rspMsg = roleService.qry(param);
        } catch (Exception e) {
            log.error("查询角色异常",e);
            rspMsg = new RspMsg("fail", "查询角色异常");
        }
        return rspMsg;
    }

    /**
     * 新增角色信息
     * @return
     */
    @ZjftOperateLog(menu = Menus.ROLE, button = Buttons.ADD)
    @PostMapping
    public RspMsg add(@RequestBody Map<String, String> param) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(param.get("roleName")) || StringUtils.isEmpty(param.get("orgType"))) {
                return new RspMsg("fail", "角色名称和所属机构不能为空");
            }
            rspMsg = roleService.add(param);
        } catch (Exception e) {
            log.error("新增角色异常",e);
            rspMsg = new RspMsg("fail", "新增角色异常");
        }
        return rspMsg;
    }

    /**
     * 查询角色权限
     * @param roleNo
     * @return
     */
    @GetMapping("/access/{roleNo}")
    public RspMsg qryAccessById(@PathVariable("roleNo") String roleNo) {
        log.info("qryAccessById");
        RspMsg rspMsg;
        try {
            rspMsg = roleService.qryAccessById(roleNo);
        } catch (Exception e) {
            log.error("查询角色权限异常", e);
            rspMsg = new RspMsg("fail", "查询角色权限异常");
        }
        return rspMsg;
    }

    /**
     * 修改角色权限
     * @param param
     * @return
     */
    @PutMapping("/access")
    public RspMsg modAccess(@RequestBody Map<String, Object> param) {
        log.info("modAccess()");
        try {
            return roleService.modAccess(param);
        } catch (Exception e) {
            log.error("修改权限异常", e);
            return new RspMsg("fail", "修改权限异常");
        }
    }

    /**
     * 修改角色信息
     * @return
     */
    @ZjftOperateLog(menu = Menus.ROLE, button = Buttons.MOD)
    @PutMapping
    public RspMsg mod(@RequestBody Map<String, Object> map) {
        RspMsg rspMsg;
        Map<String, String> oldParam = new HashMap<>();
        Map<String, String> newParam = new HashMap<>();
        try {
            if(map!=null){
                newParam = (HashMap)map.get("current");
                oldParam = (HashMap) map.get("before");
            }
            rspMsg = roleService.mod(newParam,oldParam);
        } catch (Exception e) {
            log.error("修改角色信息异常", e);
            rspMsg = new RspMsg("fail", "更新角色异常");
        }
        return rspMsg;
    }

    /**
     * 删除角色信息
     * @return
     */
    @ZjftOperateLog(menu = Menus.ROLE, button = Buttons.DEL)
    @DeleteMapping("/{roleNo}")
    public RspMsg del(@PathVariable("roleNo") String roleNo) {
        log.info("del()");
        RspMsg rspMsg;
        try {
            rspMsg = roleService.del(roleNo);
        } catch (Exception e) {
            log.error("删除角色异常",e);
            rspMsg = new RspMsg("fail", "删除角色异常");
        }
        return rspMsg;
    }

    /**
     * 根据机构编号查询该机构及其下属机构角色列表
     * @return
     */
    @RequestMapping(value = "/qryAvailableRoleByOrgNo", method = RequestMethod.GET)
    public RspMsg qryAvailableRoleByOrgNo(HttpServletRequest request) {
        log.info("qryAvailableRoleByOrgNo()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>();
            param.put("orgNo", request.getParameter("orgNo"));
            rspMsg = roleService.qryAvailableRoleByOrgNo(param);
        } catch (Exception e) {
            log.error("根据机构编号查询该机构及其下属机构角色列表失败:",e);
            rspMsg = new RspMsg("fail", "查询角色异常");
        }
        return rspMsg;
    }

    @RequestMapping(value = "/qryByNo", method = RequestMethod.GET)
    public RspMsg qryByNo(HttpServletRequest request) {
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            String no = request.getParameter("roleNo");
            if(StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail", "角色编号不能为空");
            }
            rspMsg = roleService.qryByNo(no);
        } catch (Exception e) {
            log.error("查询角色异常",e);
            rspMsg = new RspMsg("fail", "查询角色异常");
        }
        return rspMsg;
    }

}
