package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.BulletinInfo;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.BulletinInfoService;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author liurenfei
 * @Description 系统公告模块
 */
@RestController
@RequestMapping("/bulletin")
public class BulletinInfoController {
    private static final Logger log = LoggerFactory.getLogger(BulletinInfoController.class);

    @Autowired
    BulletinInfoService bulletinInfoService;

    /**
     * 查询系统公告
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryBulletin", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("publisher", request.getParameter("publisher"));
            param.put("title", request.getParameter("title"));
            param.put("startTime", request.getParameter("startTime"));
            param.put("endTime", request.getParameter("endTime"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = bulletinInfoService.qry(param);
        } catch (Exception e) {
            log.error("查询系统公告异常", e);
            rspMsg = new RspMsg("fail", "查询系统公告异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查公告
     * @param bulletinId
     * @return
     */
    @RequestMapping(value = "/qryBulletinById", method = RequestMethod.GET)
    public RspMsg qryById(@RequestParam("bulletinId") String bulletinId) {
        log.info("qryById()");
        RspMsg rspMsg;
        if (StringUtils.isEmpty(bulletinId)) {
            rspMsg = new RspMsg("fail", "根据编号查公告时编号不能为空");
        } else {
            rspMsg = bulletinInfoService.qryById(bulletinId);
        }
        return rspMsg;
    }

    /**
     * 添加系统公告
     * @param bulletinInfo
     * @return
     */
    @RequestMapping(value = "/addBulletin", method = RequestMethod.POST)
    @ZjftOperateLog(menu = Menus.BULLETIN,button = Buttons.ADD)
    public RspMsg add(@RequestBody BulletinInfo bulletinInfo) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(bulletinInfo.getPublisher())) {
                rspMsg = new RspMsg("fail", "添加系统公告失败");
            } else {
                rspMsg = bulletinInfoService.add(bulletinInfo);
                if (rspMsg.getRetCode().equals("ok")){
                    //添加成功后推送
                    String message = "{\"res\":\"" + true + "\",\"count\":-1}";
                    WebSocketServer.sendMessage(message);
                }
            }
        } catch (Exception e) {
            log.error("添加系统公告失败", e);
            rspMsg = new RspMsg("fail", "添加系统公告异常");
        }
        return rspMsg;
    }

    /**
     * 删除系统公告
     * @param bulletinId
     * @return
     */
    @RequestMapping(value = "/delBulletin", method = RequestMethod.DELETE)
    @ZjftOperateLog(menu = Menus.BULLETIN,button = Buttons.DEL)
    public RspMsg del(@RequestParam("bulletinId") String bulletinId) {
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(bulletinId)) {
                rspMsg = new RspMsg("fail", "删除系统公告编号不能为空");
            } else {
                rspMsg = bulletinInfoService.del(bulletinId);
               /* WebSocketServer wss = new WebSocketServer();
                String message  = wss.getMessage(wss.getSessionId(),wss.getUserNo());
                WebSocketServer.sendMessage(wss.getSessionId(),message);*/
            }
        } catch (Exception e) {
            log.error("删除系统公告失败", e);
            rspMsg = new RspMsg("fail", "删除系统公告失败");
        }

        return rspMsg;
    }

    /**
     * @param map
     * @return
     */
    @RequestMapping(value = "/modBulletin", method = RequestMethod.POST)
    @ZjftOperateLog(menu = Menus.BULLETIN,button = Buttons.MOD)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        BulletinInfo bulletinInfo = new BulletinInfo();
        try {
            if (map!=null){
                BeanUtils.populate(bulletinInfo, ((LinkedHashMap) map.get("current")));
                System.out.println(bulletinInfo);
            }
            if (StringUtils.isEmpty(bulletinInfo.getBulletinId()) || StringUtils.isEmpty(bulletinInfo.getPublisher())) {
                rspMsg = new RspMsg("fail", "修改系统公告失败");
            } else {
                rspMsg = bulletinInfoService.mod(bulletinInfo);
            }
        } catch (Exception e) {
            log.error("修改系统公告失败", e);
            rspMsg = new RspMsg("fail", "修改系统公告异常");
        }
        return rspMsg;
    }

    /**
     * 根据登录用户查看表中的未读公告
     * @return
     */
    @RequestMapping(value = "/qryRedis", method = RequestMethod.GET)
    public RspMsg qryUnread(@RequestParam("userNo") String userNo) {
        log.info("qryUnread()");
        //用户只要点击前端页面右上角系统公告就删除缓存中的内容
        RspMsg rspMsg;
        //用来存放返回的data
        Map<String, Object> map = new HashMap<String, Object>(16);
        if (StringUtils.isEmpty(userNo)) {
            rspMsg = new RspMsg("fail", "系统公告缓存操作中用户编号或操作类型不能为空");
        } else {
            bulletinInfoService.deleteUserUnread(userNo);
            map.put("res", true);
            map.put("count", 0);
            rspMsg = new RspMsg("ok", "用户公告缓存删除成功", map);
        }
        return rspMsg;
    }

}
