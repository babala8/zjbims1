package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.SelfHelpBank;
import com.zjft.zhyg.system.service.SelfHelpBankService;
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
 * @author: liurenfei
 * @description:自助银行管理模块
 */
@RestController
@RequestMapping("/selfHelpBank")
public class SelfHelpBankController {
    private static final Logger log = LoggerFactory.getLogger(SelfHelpBankController.class);

    @Autowired
    SelfHelpBankService selfHelpBankService;

    /**
     * 查询自助银行
     * @param request
     * @return
     */
    @RequestMapping(value = "/qrySelfHelpBank",method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request){
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String,String> param = new HashMap<>();
            param.put("bankName",request.getParameter("bankName"));
            param.put("bankArea",request.getParameter("bankArea"));
            param.put("fhOrgNo",request.getParameter("fhOrgNo"));
            param.put("areaNoProvince",request.getParameter("areaNoProvince"));
            param.put("areaNoCity",request.getParameter("areaNoCity"));
            param.put("areaNoCounty",request.getParameter("areaNoCounty"));
            param.put("curPage",request.getParameter("curPage"));
            param.put("pageSize",request.getParameter("pageSize"));
            rspMsg = selfHelpBankService.qry(param);
        } catch (Exception e) {
            log.error("查询自助银行异常",e);
            rspMsg = new RspMsg("fail","查询自助银行异常");
        }
        return rspMsg;
    }
    /**
     * 根据编号查自助银行
     * @param logicId
     * @return
     */
    @RequestMapping(value = "/qrySelfHelpBankById",method = RequestMethod.GET)
    public RspMsg qryById(@RequestParam("logicId")String logicId){
        log.info("qryById()");
        RspMsg rspMsg;
        if (StringUtils.isEmpty(logicId)){
            rspMsg=new RspMsg("fail","自助银行编号不能为空");
        }else {
            rspMsg=selfHelpBankService.qryById(logicId);
        }
        return  rspMsg;
    }

    /**
     * 添加自助银行
     * @param selfHelpBank
     * @return
     */
    @ZjftOperateLog(menu = Menus.SEIF_HELP_BANK,button = Buttons.ADD)
    @RequestMapping(value = "/addSelfHelpBank",method = RequestMethod.POST)
    public RspMsg add(@RequestBody SelfHelpBank selfHelpBank){
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(selfHelpBank.getBankName())){
                rspMsg = new RspMsg("fail","自助银行编号和名字不能为空");
            }else {
                rspMsg = selfHelpBankService.add(selfHelpBank);
            }
        } catch (Exception e) {
            log.error("添加自助银行异常",e);
            rspMsg = new RspMsg("fail","添加自助银行异常");
        }
        return rspMsg;
    }

    /**
     * 删除自助银行
     * @param logicId
     * @return
     */
    @ZjftOperateLog(menu = Menus.SEIF_HELP_BANK,button = Buttons.DEL)
    @RequestMapping(value = "/delSelfHelpBank",method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("logicId") String logicId){
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(logicId)){
                rspMsg = new RspMsg("fail","删除自助银行编号不能为空");
            }else {
                rspMsg = selfHelpBankService.del(logicId);
            }
        } catch (Exception e) {
            log.error("删除自助银行异常",e);
            rspMsg = new RspMsg("fail","删除自助银行异常");
        }
        return rspMsg;
    }

    /**
     * 修改自助银行
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.SEIF_HELP_BANK,button = Buttons.MOD)
    @RequestMapping(value = "/modSelfHelpBank",method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map){
        log.info("mod()");
        RspMsg rspMsg;
        SelfHelpBank selfHelpBank = new SelfHelpBank();
        try {
            if(map!=null){
                BeanUtils.populate(selfHelpBank, ((LinkedHashMap) map.get("current")));
                System.out.println(selfHelpBank);
            }
            if (StringUtils.isEmpty(selfHelpBank.getLogicId())||StringUtils.isEmpty(selfHelpBank.getBankName())){
                rspMsg = new RspMsg("fail","修改自助银行信息失败");
            }else {
                rspMsg = selfHelpBankService.mod(selfHelpBank);
            }
        } catch (Exception e) {
            log.error("修改自助银行信息异常",e);
            rspMsg = new RspMsg("fail","修改自助银行信息异常");
        }
        return rspMsg;
    }

    /**
     * 获取省数据
     * @return
     */
    @RequestMapping(value = "/getProvinces",method = RequestMethod.GET)
    public RspMsg getProvinces(){
        log.info("getProvinces()");
        RspMsg rspMsg;
        rspMsg = selfHelpBankService.getProvinces();
        return rspMsg;
    }

    /**
     * 获取市数据
     * @param provinceCode
     * @return
     */
    @RequestMapping(value = "/getCitys",method = RequestMethod.GET)
    public RspMsg getCitys(@RequestParam("provinceCode")String provinceCode){
        log.info("getCitys()");
        if (StringUtils.isEmpty(provinceCode)){
            return  new RspMsg("fail","请先选择省");
        }
        RspMsg rspMsg = selfHelpBankService.getCitys(provinceCode);
        return rspMsg;
    }

    /**
     * 获取区县数据
     * @return
     */
    @RequestMapping(value = "/getCountys",method =RequestMethod.GET )
    public RspMsg getCountys(@RequestParam("cityCode")String cityCode){
        log.info("getCountys()");
        if (StringUtils.isEmpty(cityCode)){
            return new RspMsg("fail","请先选择市");
        }
        RspMsg rspMsg = selfHelpBankService.getCountys(cityCode);
        return rspMsg;
    }

    /**
     * 将所有省市区格式化成一个指定格式的json数组传给前端
     * @return
     */
    @RequestMapping(value = "/getFormatArea",method = RequestMethod.GET)
    public RspMsg getFormtAreaData(){
        log.info("getFormtAreaData()");
        RspMsg rspMsg;
        rspMsg = selfHelpBankService.getFormtAreaData();
        return rspMsg;
    }
}