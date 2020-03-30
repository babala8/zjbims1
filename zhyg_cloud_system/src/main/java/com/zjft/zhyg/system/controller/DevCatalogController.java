package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.DevCatalog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevCatalogService;
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
 * @Author:limengrd
 * @Description:设备类型
 */
@RestController
@RequestMapping("/catalog")
public class DevCatalogController {
    private static final Logger log = LoggerFactory.getLogger(DevCatalogController.class);

    @Autowired
    DevCatalogService devCatalogService;

    /**
     * 根据监控类型查询设备类型
     * @param monitorType
     * @return
     */
    @RequestMapping(value = "/qryDevCatalogByMonitorType",method = RequestMethod.GET)
    RspMsg qryDevCatalogByMonitorType(@RequestParam("monitorType") String monitorType){
        log.info("qryDevCatalogByMonitorType");
        RspMsg rspMsg = new RspMsg();
        try {
            rspMsg = devCatalogService.qryDevCatalogByMonitorType(monitorType);
        }catch (Exception e){
            log.error("根据监控类型查询设备类型失败", e);
            rspMsg.setRetMsg("根据监控类型查询设备类型失败");
            rspMsg.setRetCode("fail");
        }
        return  rspMsg;
    }

    /**
     * 查询设备类型
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryCatalog", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("no", request.getParameter("no"));
            param.put("enname", request.getParameter("enname"));
            param.put("userNo",request.getHeader("userNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devCatalogService.qry(param);
        } catch (Exception e) {
            log.error("查询设备类型失败", e);
            rspMsg = new RspMsg("fail", " 查询设备类型异常");
        }
        return rspMsg;
    }

    /**
     * 查询所有设备类型
     * @param
     * @return
     */
    @RequestMapping(value = "/qryAllCatalog",method = RequestMethod.GET)
    RspMsg qryAllDevCatalogs(){
        log.info("qryAllDevCatalogs()");
        RspMsg rspMsg = new RspMsg();
        try {
            rspMsg = devCatalogService.qryAllDevCatalogs();
        }catch (Exception e){
            log.error("查询所有设备类型失败", e);
            rspMsg.setRetMsg("查询所有设备类型失败");
            rspMsg.setRetCode("fail");
        }
        return  rspMsg;
    }
    /**
     * 添加设备类型
     * @param devCatalog
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_CATALOG,button = Buttons.ADD)
    @RequestMapping(value = "/addCatalog", method = RequestMethod.POST)
    public RspMsg add(@RequestBody DevCatalog devCatalog) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if ( StringUtils.isEmpty(devCatalog.getEnname())) {
                rspMsg = new RspMsg("fail", "添加设备类型参数校验失败");
            } else {
                rspMsg = devCatalogService.add(devCatalog);
            }
        } catch (Exception e) {
            log.error("添加设备类型失败", e);
            rspMsg = new RspMsg("fail", "添加设备类型异常");
        }
        return rspMsg;
    }
    /**
     * 根据编号查询设备类型
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryCatalogById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no){
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","设备类型编号不能为空");
            }else {
                rspMsg = devCatalogService.qryByNo(no);
            }
        }catch (Exception e){
            log.error("查询设备类型失败", e);
            rspMsg = new RspMsg("fail","查询设备类型失败");
        }
        return rspMsg;

    }
    /**
     * 修改设备类型
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_CATALOG,button = Buttons.MOD)
    @RequestMapping(value = "/modCatalog", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        DevCatalog newObj = new DevCatalog();
        DevCatalog oldObj = new DevCatalog();
        try {
            if (map!=null){
                BeanUtils.populate(newObj, ((LinkedHashMap) map.get("current")));
                BeanUtils.populate(oldObj, ((LinkedHashMap) map.get("before")));
            }
            if ( StringUtils.isEmpty(newObj.getNo())||StringUtils.isEmpty(newObj.getEnname())) {
                rspMsg = new RspMsg("fail", "修改设备类型参数校验失败");
            } else {
                rspMsg = devCatalogService.mod(newObj,oldObj);
            }
        } catch (Exception e) {
            log.error("修改设备类型失败", e);
            rspMsg = new RspMsg("fail", "修改设备类型异常");
        }
        return rspMsg;
    }
    /**
     * 删除类型
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_CATALOG,button = Buttons.DEL)
    @RequestMapping(value = "/delCatalog", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no){
        log.info("del");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","删除设备类型编号不能为空");
            }else {
                rspMsg = devCatalogService.del(no);
            }
        }catch (Exception e){
            log.error("删除设备类型失败", e);
            rspMsg = new RspMsg("fail","删除设备类型失败");
        }
        return rspMsg;

    }


}
