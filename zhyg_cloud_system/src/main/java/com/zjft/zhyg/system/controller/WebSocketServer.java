package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.dao.BulletinInfoDao;
import com.zjft.zhyg.system.util.UrlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @author liurenfei
 * @Description 系统公告推送
 **/
@RestController
@ServerEndpoint("/websocket")
public class WebSocketServer {
    private static final Logger logger = LoggerFactory.getLogger(WebSocketServer.class);
    static BulletinInfoDao bulletinInfoDao;

    @Autowired
    public void setBulletinInfoDao(BulletinInfoDao bulletinInfoDao) {
        WebSocketServer.bulletinInfoDao = bulletinInfoDao;
    }

     /**
     * 客户端连接集，线程安全
     */
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<>();
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
        String message = getMessage(sessionId,userNo);
        sendMessage(sessionId,message);
        logger.info("开启推送服务,ID:" + sessionId);

    }

    @OnClose
    public void onClose() {
        logger.info("关闭推送服务,ID:" + sessionId);
        webSocketSet.remove(this);
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
        for (WebSocketServer socket : webSocketSet) {
            if (socket.sessionId.equals(sessionId)) {
                if (socket.session.isOpen()) {
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
        for (WebSocketServer socket : webSocketSet) {
            if (socket.session.isOpen()) {
                socket.session.getBasicRemote().sendText(message);
            }
        }

    }

    /**
     * 获取要发送的信息
     * @param sessionId
     * @param userNo
     * @return
     */
    public String getMessage(String sessionId, String userNo) {
        String message = "";
        int count = bulletinInfoDao.unreadCount(userNo);
        if (count > 0) {
            if (count >= 99) {
                count = 99;
            }
            message = "{\"res\":\"" + true + "\",\"count\":\"" + count + "\"}";
            //sendMessage(sessionId,"{\"res\":\""+true+"\",\"count\":\""+count+"\"}");
        } else {
            message = "{\"res\":\"" + false + "\"}";
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
        for (WebSocketServer socket: webSocketSet){
            if (socket.userNo.equals(userNo)){
                sessionId = socket.sessionId;
                break;
            }
        }
        return sessionId;
    }
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }

}
