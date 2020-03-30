package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.NotifyModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author fqz
 * @Description 信息通知模版设定
 **/
@RestController
@RequestMapping("/notifyModel")
public class NotifyModelController {
    private static final Logger logger = LoggerFactory.getLogger(NotifyModelController.class);

    @Autowired
    private NotifyModelService notifyModelService;

    /**
     * 保存信息通知内容
     * @return
     */
    @RequestMapping(value = "/addNotifyModel", method = RequestMethod.POST)
    public RspMsg addNotifyModel(@RequestBody Map<String,String> param) {
        logger.info("qryOperate()");
        Map<String,Object> map=new HashMap<>();
        try {
            map.put("modelId",System.currentTimeMillis());//逻辑主键
            map.put("notifyType",Integer.parseInt(param.get("notifyType")));//通知类型
            map.put("notifyWay",Integer.parseInt(param.get("notifyWay")));//通知方式
            map.put("modelBy",Integer.parseInt(param.get("modelBy")));//模版来源
            map.put("infoSet",param.get("infoSet"));//短息格式
            return notifyModelService.addNotifyModel(map);
        } catch (Exception e) {
            logger.error("保存信息通知内容异常", e);
            return new RspMsg("fail", "保存信息通知内容异常");
        }
    }

    @RequestMapping(value = "/qryInfoSet", method = RequestMethod.GET)
    public RspMsg qryOperate(HttpServletRequest request) {
        logger.info("qryOperate()");
        Map<String,Object> map=new HashMap<>();
        try {
           Integer notifyType = Integer.parseInt(request.getParameter("notifyType"));
            return notifyModelService.qryInfoSetByType(notifyType);
        } catch (Exception e) {
            logger.error("查询信息格式异常", e);
            return new RspMsg("fail", "查询信息格式异常");
        }
    }
}
