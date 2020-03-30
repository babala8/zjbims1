package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.DevServicePerson;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevServicePersonService;
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
 * @Author xss
 * @Description 厂商维护商管理模块
 */
@RestController
@RequestMapping("/factory")
public class CompanyMaintainController {
    private static final Logger log = LoggerFactory.getLogger(CompanyMaintainController.class);

    @Autowired
    DevServicePersonService devServicePersonService;
    /**
     * 查询设备维护人员信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryFactoryManagerPerson", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("name", request.getParameter("name"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devServicePersonService.qry(param);
        } catch (Exception e) {
            log.error("查询设备维护人员信息失败", e);
            rspMsg = new RspMsg("fail", " 查询设备维护人员异常");
        }
        return rspMsg;
    }
    /**
     * 添加设备维护人员
     * @param devServicePerson
     * @return
     */
    @ZjftOperateLog(menu = Menus.COMPANY_MAINTAIN,button = Buttons.ADD)
    @RequestMapping(value = "/addFactoryManagerPerson", method = RequestMethod.POST)
    public RspMsg add(@RequestBody DevServicePerson devServicePerson) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if ( StringUtils.isEmpty(devServicePerson.getName())) {
                rspMsg = new RspMsg("fail", "添加设备维护人员参数校验失败");
            } else {
                rspMsg = devServicePersonService.add(devServicePerson);
            }
        } catch (Exception e) {
            log.error("添加设备维护人员信息失败", e);
            rspMsg = new RspMsg("fail", "添加设备维护人员异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询设备维护人员
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryFactoryManagerPersonById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no){
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","设备维护人员编号不能为空");
            }else {
                rspMsg = devServicePersonService.qryByNo(no);
            }
        }catch (Exception e){
            log.error("查询设备维护人员失败", e);
            rspMsg = new RspMsg("fail","查询设备维护人员失败");
        }
        return rspMsg;

    }
    /**
     * 修改设备维护人员
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.COMPANY_MAINTAIN,button = Buttons.MOD)
    @RequestMapping(value = "/modFactoryManagerPerson", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        DevServicePerson oldObj = new DevServicePerson();
        DevServicePerson newObj = new DevServicePerson();
        try {
            if (map!=null){
                BeanUtils.populate(newObj, ((LinkedHashMap) map.get("current")));
                BeanUtils.populate(oldObj, ((LinkedHashMap) map.get("before")));
            }
            if ( StringUtils.isEmpty(newObj.getNo())||StringUtils.isEmpty(newObj.getName())) {
                rspMsg = new RspMsg("fail", "修改设备维护人员参数校验失败");
            } else {
                rspMsg = devServicePersonService.mod(newObj,oldObj);
            }
        } catch (Exception e) {
            log.error("修改设备维护人员信息失败", e);
            rspMsg = new RspMsg("fail", "修改设备维护人员异常");
        }
        return rspMsg;
    }
    /**
     * 删除设备维护人员
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.COMPANY_MAINTAIN,button = Buttons.DEL)
    @RequestMapping(value = "/delFactoryManagerPerson", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no){
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)){
                rspMsg = new RspMsg("fail","设备维护人员编号不能为空");
            }else {
                rspMsg = devServicePersonService.del(no);
            }
        }catch (Exception e){
            log.error("删除设备维护人员失败", e);
            rspMsg = new RspMsg("fail","删除设备维护人员失败");
        }
        return rspMsg;

    }



}