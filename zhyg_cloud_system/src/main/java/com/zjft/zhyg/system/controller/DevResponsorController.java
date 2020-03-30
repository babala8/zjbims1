package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevResponsorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author xss
 * @Description 设备责任人管理模块
 */
@RestController
@RequestMapping("/devResponsor")
public class DevResponsorController {
    private static final Logger log = LoggerFactory.getLogger(DevResponsorController.class);

    @Autowired
    DevResponsorService devResponsorService;

    /**
     * 查询设备责任人信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryDevResponsor", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("userNo",request.getHeader("userNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("devNo", request.getParameter("devNo"));
            rspMsg = devResponsorService.qry(param);
        } catch (Exception e) {
            log.error("查询设备责任人失败" , e);
            rspMsg = new RspMsg("fail", " 查询设备责任人异常");
        }
        return rspMsg;
    }
    /**
     * 查询已设置和未设置的设备责任人信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/qrySetDevResponsor", method = RequestMethod.GET)
    public RspMsg qrySet(HttpServletRequest request) {
        log.info("qrySet()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("devNo", request.getParameter("devNo"));
            rspMsg = devResponsorService.qrySet(param);
        } catch (Exception e) {
            log.error("查询已设置和未设置的设备责任人信息失败",e);
            rspMsg = new RspMsg("fail", " 查询已设置和未设置的设备责任人异常");
        }
        return rspMsg;
    }
    /**
     * 设置设备责任人
     * @param
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_RESPONSER,button = Buttons.MOD)
    @RequestMapping(value = "/setDevResponsor", method = RequestMethod.POST)
    public RspMsg setResponsor(@RequestBody Map<String, String> param) {
        log.info("setResponsor()");
        RspMsg rspMsg = new RspMsg();
        try {
            devResponsorService.set(param);
        } catch (Exception e) {
            log.error("设置设备责任人异常：", e);
            return new RspMsg("fail", "设置设备责任人异常");
        }
        return rspMsg;
    }
}