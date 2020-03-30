package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevWorkTimeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备工作时间管理模块
 */
@RestController
@RequestMapping("/devWorkTime")
public class DevWorkTimeController {
    private static final Logger log = LoggerFactory.getLogger(DevWorkTimeController.class);

    @Autowired
    DevWorkTimeService devWorkTimeService;

    /**
     * 查询设备信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryDevs", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("userNo",request.getHeader("userNo"));
            param.put("devNo", request.getParameter("devNo"));
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("devType", request.getParameter("devType"));
            param.put("devVendor", request.getParameter("devVendor"));
            rspMsg = devWorkTimeService.qry(param);
        } catch (Exception e) {
            log.error("查询设备工作时间失败" + e);
            rspMsg = new RspMsg("fail", " 查询设备工作时间异常");
        }
        return rspMsg;
    }

    /**
     * 查询设备工作时间信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryDevWorkTimeById", method = RequestMethod.GET)
    public RspMsg qryById(HttpServletRequest request) {
        log.info("qryById()");
        RspMsg rspMsg;
        try {
            rspMsg = devWorkTimeService.qryById(request.getParameter("devNo"));
        } catch (Exception e) {
            log.error("查询设备工作时间失败" , e);
            rspMsg = new RspMsg("fail", " 查询设备工作时间异常");
        }
        return rspMsg;
    }

}