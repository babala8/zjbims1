package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.ButtonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author yuechen
 * @Description 按钮管理模块
 **/
@RestController
@RequestMapping("/button")
public class ButtonController {
    private static final Logger log = LoggerFactory.getLogger(ButtonController.class);
    @Autowired
    private ButtonService buttonService;
    /**
     * 查询所有按钮
     * @return
     */
    @RequestMapping(value = "/qryAllButtons", method = RequestMethod.GET)
    public RspMsg qryAllButtons(HttpServletRequest request) {
        log.info("qryAllButtons()");
        RspMsg rspMsg;
        try {
            rspMsg = buttonService.qryAllButtons();
        } catch (Exception e) {
            log.error("查询所有按钮异常");
            rspMsg = new RspMsg("fail", "查询所有按钮异常");
        }
        return rspMsg;
    }

}
