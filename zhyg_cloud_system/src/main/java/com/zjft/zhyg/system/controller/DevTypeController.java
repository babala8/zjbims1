package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.DevType;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevTypeService;
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
 * @Author:xss
 * @Description:设备型号
 */
@RestController
@RequestMapping("/type")
public class DevTypeController {
    private static final Logger log = LoggerFactory.getLogger(DevTypeController.class);

    @Autowired
    DevTypeService devTypeService;
    /**
     * 查询设备型号
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryType", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("userNo",request.getHeader("userNo"));
            param.put("devCatalog", request.getParameter("devCatalog"));
            param.put("devVendor", request.getParameter("devVendor"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devTypeService.qry(param);
        } catch (Exception e) {
            log.error("查询设备型号失败", e);
            rspMsg = new RspMsg("fail", " 查询设备型号异常");
        }
        return rspMsg;
    }
    /**
     * 添加设备型号
     * @param devType
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_TYPE,button = Buttons.ADD)
    @RequestMapping(value = "/addType", method = RequestMethod.POST)
    public RspMsg add(@RequestBody DevType devType) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if ( StringUtils.isEmpty(devType.getName())||StringUtils.isEmpty(devType.getVendorNo())||StringUtils.isEmpty(devType.getCatalogNo())) {
                rspMsg = new RspMsg("fail", "添加设备型号参数校验失败");
            } else {
                rspMsg = devTypeService.add(devType);
            }
        } catch (Exception e) {
            log.error("添加设备型号失败", e);
            rspMsg = new RspMsg("fail", "添加设备型号异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询设备型号
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryTypeById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no){
        log.info("qryByNo");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","设备型号编号不能为空");
            }else {
                rspMsg = devTypeService.qryByNo(no);
            }
        }catch (Exception e){
            log.error("查询设备型号失败", e);
            rspMsg = new RspMsg("fail","查询设备型号失败");
        }
        return rspMsg;

    }
    /**
     * 修改设备型号
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_TYPE,button = Buttons.MOD)
    @RequestMapping(value = "/modType", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        DevType devType = new DevType();
        try {
            if (map!=null){
                BeanUtils.populate(devType, ((LinkedHashMap) map.get("current")));
            }
            if ( StringUtils.isEmpty(devType.getNo())||StringUtils.isEmpty(devType.getName())||StringUtils.isEmpty(devType.getVendorNo())||
                    StringUtils.isEmpty(devType.getCatalogNo())||StringUtils.isEmpty(devType.getCashType())) {
                rspMsg = new RspMsg("fail", "修改设备型号参数校验失败");
            } else {
                rspMsg = devTypeService.mod(devType);
            }
        } catch (Exception e) {
            log.error("修改设备型号失败", e);
            rspMsg = new RspMsg("fail", "修改设备型号异常");
        }
        return rspMsg;
    }
    /**
     * 删除设备型号
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_TYPE,button = Buttons.DEL)
    @RequestMapping(value = "/delType", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no){
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","删除设备型号编号不能为空");
            }else {
                rspMsg = devTypeService.del(no);
            }
        }catch (Exception e){
            log.error("删除型号失败", e);
            rspMsg = new RspMsg("fail","删除设备型号失败");
        }
        return rspMsg;

    }


}