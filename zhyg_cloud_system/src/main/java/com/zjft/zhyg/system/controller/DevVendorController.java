package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.BankManager;
import com.zjft.zhyg.system.pojo.DevVendor;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevVendorService;
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
 * @Description:设备品牌管理模块
 */
@RestController
@RequestMapping("/vendor")
public class DevVendorController {
    private static final Logger log = LoggerFactory.getLogger(DevVendorController.class);

    @Autowired
    DevVendorService devVendorService;
    /**
     * 查询设备品牌
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryVendor", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("name", request.getParameter("name"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devVendorService.qry(param);
        } catch (Exception e) {
            log.error("查询设备品牌失败", e);
            rspMsg = new RspMsg("fail", " 查询设备品牌异常");
        }
        return rspMsg;
    }
    /**
     * 添加设备品牌
     * @param devVendor
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_VENDOR,button = Buttons.ADD)
    @RequestMapping(value = "/addVendor", method = RequestMethod.POST)
    public RspMsg add(@RequestBody DevVendor devVendor) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if ( StringUtils.isEmpty(devVendor.getName())) {
                rspMsg = new RspMsg("fail", "添加设备品牌参数校验失败");
            } else {
                rspMsg = devVendorService.add(devVendor);
            }
        } catch (Exception e) {
            log.error("添加设备品牌失败", e);
            rspMsg = new RspMsg("fail", "添加设备品牌异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询设备品牌
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryVendorById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no){
        log.info("qryByNo");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","设备品牌编号不能为空");
            }else {
                rspMsg = devVendorService.qryByNo(no);
            }
        }catch (Exception e){
            log.error("查询设备品牌失败", e);
            rspMsg = new RspMsg("fail","查询设备品牌失败");
        }
        return rspMsg;

    }
    /**
     * 修改设备品牌
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_VENDOR,button = Buttons.MOD)
    @RequestMapping(value = "/modVendor", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        DevVendor devVendor = new DevVendor();
        try {
            if(map!=null){
                BeanUtils.populate(devVendor, ((LinkedHashMap) map.get("current")));
                System.out.println(devVendor);
            }
            if ( StringUtils.isEmpty(devVendor.getNo())||StringUtils.isEmpty(devVendor.getName())) {
                rspMsg = new RspMsg("fail", "修改设备品牌参数校验失败");
            } else {
                rspMsg = devVendorService.mod(devVendor);
            }
        } catch (Exception e) {
            log.error("修改设备品牌失败", e);
            rspMsg = new RspMsg("fail", "修改设备品牌异常");
        }
        return rspMsg;
    }
    /**
     * 删除设备品牌
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_VENDOR,button = Buttons.DEL)
    @RequestMapping(value = "/delVendor", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no){
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","删除设备品牌编号不能为空");
            }else {
                rspMsg = devVendorService.del(no);
            }
        }catch (Exception e){
            log.error("删除设备品牌失败", e);
            rspMsg = new RspMsg("fail","删除设备品牌失败");
        }
        return rspMsg;

    }




}