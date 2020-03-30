package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.ServicePropSystem;
import com.zjft.zhyg.system.service.RunParamService;
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
 * @Description 系统运行参数管理模块
 */
@RestController
@RequestMapping("/runParam")
public class RunParamController {
    private static final Logger log = LoggerFactory.getLogger(RunParamController.class);

    @Autowired
    RunParamService runParamService;

    /**
     * 查询系统运行参数
     * @param request
     * @return
     */
    @RequestMapping(value = "/qry", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("userOrgNo", request.getParameter("userOrgNo"));
            param.put("paramName", request.getParameter("paramName"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = runParamService.qry(param);
        } catch (Exception e) {
            log.error("查询系统运行参数异常", e);
            rspMsg = new RspMsg("fail", "查询系统运行参数异常");
        }
        return rspMsg;
    }

    /**
     * 根据ID查参数
     * @param keyId
     * @return
     */
    @RequestMapping(value = "/qryById", method = RequestMethod.GET)
    public RspMsg qryById(@RequestParam("keyId") String keyId) {
        log.info("qryById()");
        RspMsg rspMsg;
        if (StringUtils.isEmpty(keyId)) {
            rspMsg = new RspMsg("fail", "参数ID不能为空");
        } else {
            rspMsg = runParamService.qryById(keyId);
        }
        return rspMsg;
    }

    /**
     * @param map
     * @return
     */
    @RequestMapping(value = "/mod", method = RequestMethod.POST)
    @ZjftOperateLog(menu = Menus.RUN_PARAM,button = Buttons.MOD)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        ServicePropSystem newObj = new ServicePropSystem();
        try {
            if (map!=null){
                BeanUtils.populate(newObj, ((LinkedHashMap) map.get("current")));
            }
            if (StringUtils.isEmpty(newObj.getKeyId()) || StringUtils.isEmpty(newObj.getNote())||
                StringUtils.isEmpty(newObj.getValue())) {
                rspMsg = new RspMsg("fail", "修改参数失败");
            } else {
                rspMsg = runParamService.mod(newObj);
            }
        } catch (Exception e) {
            log.error("修改系统运行参数异常", e);
            rspMsg = new RspMsg("fail", "修改系统运行参数异常");
        }
        return rspMsg;
    }


}
