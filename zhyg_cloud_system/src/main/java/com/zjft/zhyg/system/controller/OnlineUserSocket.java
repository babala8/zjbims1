package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.dao.UserDao;
import com.zjft.zhyg.system.service.TokenService;
import com.zjft.zhyg.system.util.UrlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @author liurenfei
 * @Description 在线人数推送
 **/
@RestController
@ServerEndpoint("/onlineSocket")
public class OnlineUserSocket {
    private static final Logger logger = LoggerFactory.getLogger(WebSocketServer.class);
    static UserDao userDao;
    static TokenService tokenService;
    @Autowired
    public void setUserDao(UserDao userDao){
        OnlineUserSocket.userDao = userDao;
    }
    @Autowired
    public void setTokenService(TokenService tokenService){
        OnlineUserSocket.tokenService = tokenService;
    }
    /**
     * 客户端连接集，线程安全
     */
    private static CopyOnWriteArraySet<OnlineUserSocket> webSocketSet = new CopyOnWriteArraySet<>();
    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;
    private String userNo;
    private String token;

    public String getUserNo() {
        return userNo;
    }

    /**
     * 每个连接的编号
     */
    private String sessionId;

    public String getSessionId() {
        return sessionId;
    }

    @OnOpen
    public void onOpen(Session session) throws Exception {
        this.session = session;
        UrlUtil uu = new UrlUtil();
        uu = uu.UrlResolve(session.getRequestURI().toString());
        this.token = uu.getToken();
        this.sessionId = session.getId();
        this.userNo = uu.getUserNo();
        webSocketSet.add(this);
        userDao.updateOnlineFlag("1",this.userNo);
        String message = getMessage(this.sessionId,this.userNo,"1");
        sendMessage(message);//群发
        logger.info("开启推送服务,ID:" + sessionId);

    }

    @OnClose
    public void onClose() throws IOException {
        logger.info("关闭推送服务,ID:" + sessionId);
        userDao.updateOnlineFlag("0",userNo);
        webSocketSet.remove(this);
        //tokenService.removeToken(userNo);
        int onlineCount = userDao.getOnlineCount();
        String message = "{\"res\":\"" + true + "\",\"onlineCount\":\"" + onlineCount + "\"}";
        sendMessage(message);
    }

    @OnMessage
    public void onMessage(String message) {
        logger.info("收到来自[" + sessionId + "]的消息: " + message);
    }

    @OnError
    public void onError(Throwable error) {
        logger.error("推送服务[" + sessionId + "]异常:", error);
    }

    /**
     * 指定发送对象
     * @param sessionId
     * @param message
     */
    public static void sendMessage(String sessionId, String message) throws IOException {
        for (OnlineUserSocket socket : webSocketSet) {
            if (socket.sessionId.equals(sessionId)) {
                if (socket.session.isOpen()) {
                    System.out.println("websocket发送时token:"+socket.token);
                    socket.session.getBasicRemote().sendText(message);
                }
                break;
            }
        }
    }

    /**
     * 群发信息
     * @param message
     * @throws IOException
     */
    public static void sendMessage(String message) throws IOException {
        for (OnlineUserSocket socket : webSocketSet) {
            if (socket.session.isOpen()) {
                socket.session.getBasicRemote().sendText(message);
            }
        }

    }

    /**
     * 获取要发送的信息
     * @param sessionId
     * @param userNo
     * @param flag
     * @return
     */
    public String getMessage(String sessionId, String userNo,String flag) {
        String message = null;
        if (flag.equals("1")){
            int onlineCount = userDao.getOnlineCount();
            message = "{\"res\":\"" + true + "\",\"onlineCount\":\"" + onlineCount + "\"}";
        }else{
            // 用户被挤  登出
            message = "{\"res\":\"" + true + "\",\"onlineCount\":\"" + -401 + "\"}";
        }
        return message;
    }
    /**
     * 根据用户名查找连接编号
     * @param userNo
     * @return
     */
    public static String getSessionIdByUserNo(String userNo){
        String sessionId = null;
        for (OnlineUserSocket socket: webSocketSet){
            if (socket.userNo.equals(userNo)){
                sessionId = socket.sessionId;
                break;
            }
        }
        return sessionId;
    }

    /**
     * 判断用户是否已登录
     * @param userNo
     * @param token
     * @return
     */
    public static boolean userIsOnline(String userNo,String token){
        boolean flag = false;
        for (OnlineUserSocket socket: webSocketSet){
            if (socket.userNo.equals(userNo)&& !socket.token.equals(token)){
                flag = true;
                break;
            }
        }
        return flag;
    }

}
