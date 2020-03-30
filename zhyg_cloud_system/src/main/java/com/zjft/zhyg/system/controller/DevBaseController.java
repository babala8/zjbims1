package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevBaseService;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备信息管理模块
 */
@RestController
@RequestMapping("/dev")
public class DevBaseController {
    private static final Logger log = LoggerFactory.getLogger(DevBaseController.class);

    @Autowired
    DevBaseService devBaseService;

    /**
     * 查询投入主体，即机构类型
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryOrgTypes",method = RequestMethod.GET)
    public RspMsg qryOrgTypes(HttpServletRequest request){
        log.info("qryOrgTypes()");
        return devBaseService.qryOrgTYpes();
    }

    /**
     * 查询设备信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryDev", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(16);
            param.put("devNo", request.getParameter("devNo"));
            param.put("userNo",request.getHeader("userNo"));
            param.put("ip", request.getParameter("ip"));
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("devType", request.getParameter("devType"));
            param.put("devCatalog", request.getParameter("devCatalog"));
            param.put("devVendor", request.getParameter("devVendor"));
            param.put("buyDate", request.getParameter("buyDate"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devBaseService.qry(param);
        } catch (Exception e) {
            log.error("查询设备信息失败", e);
            rspMsg = new RspMsg("fail", " 查询设备信息异常");
        }
        return rspMsg;
    }

    /**
     * 添加设备
     * @param devBase
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV, button = Buttons.ADD)
    @RequestMapping(value = "/addDev", method = RequestMethod.POST)
    public RspMsg add(@RequestBody DevBase devBase) {
        log.info("add()");
        RspMsg rspMsg;
        try {
                rspMsg = devBaseService.add(devBase);
        } catch (Exception e) {
            log.error("添加设备失败", e);
            rspMsg = new RspMsg("fail", "添加设备异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询设备
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryDevById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no) {
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)) {
                rspMsg = new RspMsg("fail", "设备号不能为空");
            } else {
                rspMsg = devBaseService.qryByNo(no);
            }
        } catch (Exception e) {
            log.error("查询设备失败", e);
            rspMsg = new RspMsg("fail", "查询设备失败");
        }
        return rspMsg;

    }

    /**
     * 修改设备
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV, button = Buttons.MOD)
    @RequestMapping(value = "/modDev", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        DevBase newObj = new DevBase();
        DevBase oldObj = new DevBase();
        try {
            if (map!=null) {
                BeanUtils.populate(newObj, (LinkedHashMap)map.get("current"));
                BeanUtils.populate(oldObj, (LinkedHashMap)map.get("before"));
            }
                rspMsg = devBaseService.mod(newObj,oldObj);
        } catch (Exception e) {
            log.error("修改设备信息失败", e);
            rspMsg = new RspMsg("fail", "修改设备异常");
        }
        return rspMsg;
    }

    /**
     * 删除设备
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV, button = Buttons.DEL)
    @RequestMapping(value = "/delDev", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no) {
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)) {
                rspMsg = new RspMsg("fail", "设备号不能为空");
            } else {
                rspMsg = devBaseService.del(no);
            }
        } catch (Exception e) {
            log.error("删除设备失败", e);
            rspMsg = new RspMsg("fail", "删除设备失败");
        }
        return rspMsg;

    }

}