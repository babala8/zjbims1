package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.dto.SessionDto;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.User;
import com.zjft.zhyg.system.service.TokenService;
import com.zjft.zhyg.system.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @Author zyq
 * @Description 登录模块
 **/
@RestController
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;

    /**
     * 登录
     * @param user
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ZjftOperateLog(menu = Menus.HOMEPAGE, button = Buttons.LOGIN)
    public RspMsg login(@RequestBody User user) {
        logger.info("login()");
        RspMsg rspMsg = new RspMsg();
        try {
            if(StringUtils.isEmpty(user.getNo())){
                return new RspMsg("fail", "用户名为空");
            }
            rspMsg = userService.login(user);
            // 登陆成功
            if ("ok".equals(rspMsg.getRetCode())) {
                // 为每个用户每次登陆生成随机的uuid标识
                String token = UUID.randomUUID().toString();
                Map<String, String> map = new HashMap<>(4);
                map.put("userNo", user.getNo());
                map.put("token", token);
                tokenService.saveToken(map);
                String sessionId =OnlineUserSocket.getSessionIdByUserNo(user.getNo());
                if (OnlineUserSocket.userIsOnline(user.getNo(),token)){
                    //用户之前在线
                    String message =  "{\"res\":\"" + true + "\",\"onlineCount\":\"" + -401 + "\"}";
                    OnlineUserSocket.sendMessage(sessionId,message);
                }
                // 将token返回给前端
                SessionDto sessionDto = (SessionDto) rspMsg.getData();
                sessionDto.setToken(token);
                rspMsg.setData(sessionDto);
            }
        } catch (Exception e) {
            logger.error("登录异常", e);
            rspMsg.setRetCode("fail");
            rspMsg.setRetMsg("登录异常");
        }
        return rspMsg;
    }

    /**
     * 登出
     * @param user
     * @return
     */
    @ZjftOperateLog(menu = Menus.HOMEPAGE, button = Buttons.LOGOUT)
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public RspMsg logout(@RequestBody User user) {
        logger.info("logout");
        try {
            userService.logout(user);
        } catch (Exception e) {
            logger.error("登出异常", e);
        }
        tokenService.removeToken(user.getNo());
        return null;
    }

}
