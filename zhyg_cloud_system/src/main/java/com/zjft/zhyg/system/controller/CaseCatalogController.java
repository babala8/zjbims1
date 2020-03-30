package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.CaseCatalog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.CaseCatalogService;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *@Author:xss
 *@Description:故障响应设定管理模块
 */
@RestController
@RequestMapping("/sysParam")
public class CaseCatalogController {
    private static final Logger log = LoggerFactory.getLogger(CaseCatalogController.class);

    @Autowired
    CaseCatalogService caseCatalogService;
    /**
     * 查询故障响应设定
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryCaseCatalog", method = RequestMethod.GET)
    public RspMsg qryByNo(HttpServletRequest request){
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("orgNo", request.getParameter("orgNo"));
            rspMsg = caseCatalogService.qry(param);
        }catch (Exception e){
            log.error("查询故障响应设定失败", e);
            rspMsg = new RspMsg("fail","查询故障响应设定失败");
        }
        return rspMsg;

    }

    /**
     * 查询所有短信通知次数
     * @return
     */
    @RequestMapping(value = "/qryAllGrade", method = RequestMethod.GET)
    public RspMsg qryAllGrade(){
        log.info("qryAllGrade()");
        RspMsg rspMsg;
        try {
            rspMsg = caseCatalogService.qryAllGrade();
        }catch (Exception e){
            log.error("查询所有短信通知次数失败", e);
            rspMsg = new RspMsg("fail","查询所有短信通知次数失败");
        }
        return rspMsg;

    }
    /**
     * 修改故障响应设定
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.FAULT_RESPONSE,button = Buttons.MOD)
    @RequestMapping(value = "/modCaseCatalog", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        CaseCatalog caseCatalog = new CaseCatalog();
        try {
            if (map!=null){
                BeanUtils.populate(caseCatalog, ((LinkedHashMap) map.get("current")));
            }
            if ( StringUtils.isEmpty(caseCatalog.getOrgNo())||StringUtils.isEmpty(caseCatalog.getCatalogName())||StringUtils.isEmpty(caseCatalog.getResponsorCatalog())
                ||StringUtils.isEmpty(caseCatalog.getOnsiteInterval())||StringUtils.isEmpty(caseCatalog.getOnsiteInterval1())||
                    StringUtils.isEmpty(caseCatalog.getCloseInterval())||StringUtils.isEmpty(caseCatalog.getOnsiteInterval1())||
                    StringUtils.isEmpty(caseCatalog.getMaxGrade())||StringUtils.isEmpty(caseCatalog.getNotifyWay())||StringUtils.isEmpty(caseCatalog.getSendMsgMethod())||
                    StringUtils.isEmpty(caseCatalog.getCatalogNo())) {
                rspMsg = new RspMsg("fail", "修改故障响应设定参数校验失败");
            } else {
                rspMsg = caseCatalogService.mod(caseCatalog);
            }
        } catch (Exception e) {
            log.error("修改故障响应设定失败", e);
            rspMsg = new RspMsg("fail", "修改故障响应设定异常");
        }
        return rspMsg;
    }
}
