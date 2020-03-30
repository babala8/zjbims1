package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.BankManager;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.BankManagerService;
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
 * @Description:银行网点人员管理模块
 */
@RestController
@RequestMapping("/bank")
public class BankManagerController {
    private static final Logger log = LoggerFactory.getLogger(BankManagerController.class);

    @Autowired
    BankManagerService bankManagerService;
    /**
     * 查询银行网点人员信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryBankManagerPerson", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("name", request.getParameter("name"));
            param.put("orgNo", request.getParameter("orgNo"));
            if (StringUtils.isEmpty(param.get("orgNo"))) {
                return new RspMsg("fail", "机构不能为空");
            }
            rspMsg =bankManagerService.qry(param);
        } catch (Exception e) {
            log.error("查询银行网点人员信息失败", e);
            rspMsg = new RspMsg("fail", " 查询银行网点人员异常");
        }
        return rspMsg;
    }
    /**
     * 添加银行网点人员
     * @param bankManager
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG_STAFF,button = Buttons.ADD)
    @RequestMapping(value = "/addBankManagerPerson", method = RequestMethod.POST)
    public RspMsg add(@RequestBody BankManager bankManager) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if ( StringUtils.isEmpty(bankManager.getName())|| StringUtils.isEmpty(bankManager.getOrgNo())) {
                rspMsg = new RspMsg("fail", "添加银行网点人员参数校验失败");
            } else {
                rspMsg = bankManagerService.add(bankManager);
            }
        } catch (Exception e) {
            log.error("添加银行网点人员失败", e);
            rspMsg = new RspMsg("fail", "添加银行网点人员异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询银行网点人员
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryBankManagerPersonById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no){
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","银行网点人员编号不能为空");
            }else {
                rspMsg = bankManagerService.qryByNo(no);
            }
        }catch (Exception e){
            log.error("查询银行网点人员失败", e);
            rspMsg = new RspMsg("fail","查询银行网点人员失败");
        }
        return rspMsg;

    }
    /**
     * 修改银行网点人员
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG_STAFF,button = Buttons.MOD)
    @RequestMapping(value = "/modBankManagerPerson", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        BankManager bankManager = new BankManager();
        try {
            if (map!=null){
                BeanUtils.populate(bankManager, ((LinkedHashMap) map.get("current")));
                System.out.println(bankManager);
            }
            if ( StringUtils.isEmpty(bankManager.getNo())||StringUtils.isEmpty(bankManager.getName())|| StringUtils.isEmpty(bankManager.getOrgNo())) {
                rspMsg = new RspMsg("fail", "修改银行网点人员参数校验失败");
            } else {
                rspMsg = bankManagerService.mod(bankManager);
            }
        } catch (Exception e) {
            log.error("修改银行网点人员失败", e);
            rspMsg = new RspMsg("fail", "修改银行网点人员异常");
        }
        return rspMsg;
    }
    /**
     * 删除银行网点人员
     *
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG_STAFF,button = Buttons.DEL)
    @RequestMapping(value = "/delBankManagerPerson", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no) {
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)) {
                return new RspMsg("fail", "银行网点人员编号不能空");
            }
            rspMsg = bankManagerService.del(no);
        } catch (Exception e) {
            return new RspMsg("fail", "删除机构异常");
        }
        return rspMsg;
    }



}