package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.configure.MyProperties;
import com.zjft.zhyg.system.pojo.User;
import com.zjft.zhyg.system.pojo.RspMsg;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import com.zjft.zhyg.system.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * @Author xss
 * @Description 用户管理模块
 */

@RestController
@RequestMapping("/user")
public class UserController {
    private static final Logger log = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private MyProperties myProperties;


    /**
     * 查询用户列表
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryUsers", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            // 把前端页面请求的数据放到Map中
            Map<String, String> param = new HashMap<>(8);
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("userName", request.getParameter("userName"));
            param.put("userNo", request.getParameter("userNo"));
            param.put("roleNo", request.getParameter("roleNo"));
            param.put("onlineFlag",request.getParameter("onlineFlag"));
            //判断机构是否为空
            if (StringUtils.isEmpty(param.get("orgNo"))) {
                return new RspMsg("fail", "机构不能为空");
            }
            rspMsg = userService.qry(param);
        } catch (Exception e) {
            log.error("查询用户失败", e);
            rspMsg = new RspMsg("fail", " 查询用户异常");
        }
        return rspMsg;
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @ZjftOperateLog(menu = Menus.USER, button = Buttons.ADD)
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public RspMsg add(@RequestBody User user) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(user.getNo()) || StringUtils.isEmpty(user.getOrgNo()) || StringUtils.isEmpty(user.getName())
                    || StringUtils.isEmpty(user.getRoleNo())) {
                rspMsg = new RspMsg("fail", "用户编号，所属机构，用户名,角色不能为空");
            } else {
                rspMsg = userService.add(user);
            }
        } catch (Exception e) {
            log.error("添加用户失败", e);
            rspMsg = new RspMsg("fail", "添加用户异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询用户
     * @param userNo
     * @return
     */
    @RequestMapping(value = "/qryUserById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("userNo") String userNo){
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(userNo)){
                rspMsg = new RspMsg("fail","用户编号不能为空");
            }else {
                rspMsg = userService.qryByNo(userNo);
            }
        }catch (Exception e){
            log.error("查询用户失败", e);
            rspMsg = new RspMsg("fail","查询用户失败");
        }
        return rspMsg;

    }

    /**
     * 修改用户
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.USER, button = Buttons.MOD)
    @RequestMapping(value = "/modUser", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        User user = new User();
        try {
            if (map!=null) {
                BeanUtils.populate(user, (LinkedHashMap)map.get("current"));
            }
            if (StringUtils.isEmpty(user.getNo()) || StringUtils.isEmpty(user.getName()) || StringUtils.isEmpty(user.getOrgNo()
            )) {
                rspMsg = new RspMsg("fail", "用户号，用户名，机构类型不能为空");
            } else {
                rspMsg = userService.mod(user);
            }
        } catch (Exception e) {
            log.error("修改用户失败", e);
            rspMsg = new RspMsg("fail", "修改用户异常");
        }
        return rspMsg;
    }

    /**
     * 用户删除
     * @param userNo
     * @return
     */
    @ZjftOperateLog(menu = Menus.USER, button = Buttons.DEL)
    @RequestMapping(value = "/delUser", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("userNo") String userNo){
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(userNo)) {
                return new RspMsg("fail", "用户编号不能空");
            }
            rspMsg = userService.del(userNo);
        } catch (Exception e) {
            log.error("删除用户失败", e);
            return new RspMsg("fail", "删除用户异常");
        }
        return rspMsg;
    }

    /**
     * 修改密码
     * @param param
     * @return
     */
    @ZjftOperateLog(menu = Menus.USER, button = Buttons.MOD_PASSWORD)
    @RequestMapping(value = "/modPasswd", method = RequestMethod.POST)
    public RspMsg modPasswd(@RequestBody Map<String,String> param) {
        log.info("modPasswd()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(param.get("no"))) {
                rspMsg = new RspMsg("fail", "用户编号不能为空");
            } else {
                rspMsg = userService.modPasswd(param);
            }
        } catch (Exception e) {
            log.error("修改用户密码失败", e);
            rspMsg = new RspMsg("fail", "修改用户异常");
        }
        return rspMsg;
    }

    /**
     * 给锁定用户解锁
     */
    @RequestMapping(value = "/unlock",method = RequestMethod.GET)
    public RspMsg unlock(@RequestParam String userNo){
        log.info("unlock()");
        RspMsg rspMsg;
        try {
            rspMsg=userService.unlock(userNo);
        } catch (Exception e) {
            log.error("解锁用户失败:",e);
            rspMsg=new RspMsg("fail","解锁用户异常");
        }
        return rspMsg;
    }


    @GetMapping(value = "/help")
    public RspMsg getHelp(HttpServletRequest request, HttpServletResponse response) {
        log.info("获取用户手册开始");
        FileInputStream in = null;
        BufferedInputStream bin = null;
        OutputStream out = null;
        try {
            String helpUrl = myProperties.getProperty("helpUrl");
            log.info("帮助手册文档路径："+helpUrl);
            File file = new File(helpUrl);
            if (!file.exists() && !file.isFile()) {
                return new RspMsg("fail", "用户帮助手册不存在");
            }
            // 配置文件下载
            response.setHeader("content-type", "application/octet-stream");
            response.setContentType("application/octet-stream");
            // 下载文件能正常显示中文
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("综合运管帮助手册.doc", "UTF-8"));
            // 实现文件下载
            byte[] buffer = new byte[1024];
            in = new FileInputStream(file);
            bin = new BufferedInputStream(in);
            out = response.getOutputStream();
            int i;
            while ((i = bin.read(buffer)) != -1) {
                out.write(buffer, 0, i);
            }
            log.info("获取用户手册成功");
            return new RspMsg("ok","获取用户手册成功");
        } catch (Exception e) {
            log.error("获取用户手册发生异常",e);
            return new RspMsg("fail", "获取用户手册发生异常");
        }finally {
            try {
                if(out!=null){
                    out.close();
                }
                if(bin!=null){
                    bin.close();
                }
                if(in!=null){
                    in.close();
                }
            } catch (Exception e) {
                log.error("获取用户手册关闭流异常",e);
            }
        }
    }
}
