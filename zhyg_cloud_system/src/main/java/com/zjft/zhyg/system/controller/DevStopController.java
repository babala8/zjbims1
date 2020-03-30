package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.DevStop;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevStopService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author:xss
 * @Description:设备停机管理模块
 */
@RestController
@RequestMapping("/stop")
public class DevStopController {
    private static final Logger log = LoggerFactory.getLogger(DevBaseController.class);

    @Autowired
    DevStopService devStopService;

    /**
     * 查设备停机设定开始时间距当前时间的期限
     * @param request
     * @return
     */
    @GetMapping("getMinDays")
    public RspMsg getDevStopStartMinDays(HttpServletRequest request){
        log.info("getDevStopStartMinDays()");
        RspMsg rspMsg;
        try {
            rspMsg = devStopService.getMinDays(request.getParameter("userOrgNo"));
        } catch (Exception e) {
            log.info("查询设备停机开始最小期限异常",e);
            rspMsg = new RspMsg("fail", " 查询设备停机开始最小期限异常");
        }
        return  rspMsg;
    }

    /**
     * 更改设备事后停机开始时间期限
     * @param request
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_STOP, button = Buttons.MOD)
    @GetMapping("/modMinDays")
    public RspMsg modMinDays(HttpServletRequest request){
        log.info("modMinDays()");
        RspMsg rspMsg;
        try {
            Map<String,String> param = new HashMap<>();
            param.put("days",request.getParameter("devStopStartMinDays"));
            param.put("userOrgNo",request.getParameter("userOrgNo"));
            rspMsg = devStopService.modMinDays(param);
        } catch (Exception e) {
            log.info("修改设备事后停机开始时间期限异常",e);
            rspMsg = new RspMsg("fail","修改设备事后停机开始时间期限异常");
        }
        return rspMsg;
    }

    /**
     * 查设备停机历史
     * @param request
     * @return
     */
    @GetMapping("/qryStopHis")
    public RspMsg qryStopHis(HttpServletRequest request){
        log.info("qryStopHis()");
        RspMsg rspMsg;
        try {
            Map<String,String> param = new HashMap<>();
            param.put("curPage",request.getParameter("curPage"));
            param.put("pageSize",request.getParameter("pageSize"));
            param.put("devNo",request.getParameter("devNo"));
            param.put("userNo",request.getParameter("userNo"));
            param.put("orgNo",request.getParameter("orgNo"));
            rspMsg = devStopService.qryStopHis(param);
        } catch (Exception e) {
            log.error("查询设备停机历史信息异常", e);
            rspMsg = new RspMsg("fail", " 查询设备停机历史信息异常");
        }
        return rspMsg;
    }


    @RequestMapping(value = "/qry", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(16);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("userNo",request.getHeader("userNo"));
            param.put("devNo", request.getParameter("devNo"));
            param.put("devIp", request.getParameter("devIp"));
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("devType", request.getParameter("devType"));
            param.put("devCatalog", request.getParameter("devCatalog"));
            param.put("devVendor", request.getParameter("devVendor"));
            param.put("operateStatus", request.getParameter("operateStatus"));
            param.put("address", request.getParameter("address"));
            param.put("stopDevEndTime", request.getParameter("stopDevEndTime"));
            rspMsg = devStopService.qry(param);
        } catch (Exception e) {
            log.error("查询设备信息失败", e);
            rspMsg = new RspMsg("fail", " 查询设备失败");
        }
        return rspMsg;
    }

    @RequestMapping(value = "/gryByDevNo", method = RequestMethod.GET)
    public RspMsg qryByDevNo(HttpServletRequest request) {
        log.info("qryByDevNo");
        RspMsg rspMsg;
        String devNo = request.getParameter("devNo");
        try {
            rspMsg = devStopService.qryByDevNo(devNo);
        } catch (Exception e) {
            log.error("查询失败", e);
            rspMsg = new RspMsg("fail", " 查询设备品牌异常");
        }
        return rspMsg;
    }
    @ZjftOperateLog(menu = Menus.DEV_STOP, button = Buttons.ADD)
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public RspMsg add(@RequestBody Map<String, String> param) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            String devNo = param.get("devNo");
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String setTime = dateFormat.format(now);
            String stopDevStartTime = param.get("stopDevStartTime");
            String stopDevEndTime = param.get("stopDevEndTime");
            String stopDevType = param.get("stopDevType");
            String stopDevReason = param.get("stopDevReason");
            String opNo = param.get("opNo");
            Integer isAfter =Integer.parseInt(param.get("isAfter")) ;
            Integer status=0;
            String logicId = UUID.randomUUID().toString();
            DevStop devStop = new DevStop();
            devStop.setLogicId(logicId);
            devStop.setSetTime(setTime);
            devStop.setStopDevType(stopDevType);
            devStop.setStatus(status);
            devStop.setIsAfter(isAfter);
            devStop.setStopDevReason(stopDevReason);
            devStop.setOpNo(opNo);
            devStop.setStopDevStartTime(stopDevStartTime);
            devStop.setStopDevEndTime(stopDevEndTime);
            devStop.setDevNo(devNo);
            if (StringUtils.isEmpty(devStop.getLogicId()) || StringUtils.isEmpty(devStop.getDevNo()) ||
                    StringUtils.isEmpty(devStop.getOpNo()) || StringUtils.isEmpty(devStop.getIsAfter()+"") ||
                    StringUtils.isEmpty(devStop.getStopDevStartTime()) || StringUtils.isEmpty(devStop.getStopDevEndTime())
                    || StringUtils.isEmpty(devStop.getStopDevType()) || StringUtils.isEmpty(devStop.getStopDevReason())) {
                rspMsg = new RspMsg("fail", "校验信息失败");

            } else {
                rspMsg = devStopService.add(devStop);
            }
        } catch (Exception e) {
            log.error("添加停机设备失败", e);
            rspMsg = new RspMsg("fail", "添加停机设备失败");
        }
        return rspMsg;
    }

    @RequestMapping(value = "/qryDetail", method = RequestMethod.GET)
    public RspMsg qryStopDevDetail(HttpServletRequest request) {
        log.info("qryStopDevDetail()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(16);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("devNo", request.getParameter("devNo"));
            param.put("stopDevType", request.getParameter("stopDevType"));
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("devType", request.getParameter("devType"));
            param.put("devCatalog", request.getParameter("devCatalog"));
            param.put("devVendor", request.getParameter("devVendor"));
            param.put("stopDevStartTime", request.getParameter("stopDevStartTime"));
            param.put("stopDevEndTime", request.getParameter("stopDevEndTime"));
            rspMsg = devStopService.qryStopDevDetail(param);
        } catch (Exception e) {
            log.error("查询设备停机信息失败", e);
            rspMsg = new RspMsg("fail", " 查询设备失败");
        }
        return rspMsg;
    }
    @RequestMapping(value = "/qryByLogicId", method = RequestMethod.GET)
    public RspMsg qryByLogicId(HttpServletRequest request){
        log.info("qryByLogicId()");
        RspMsg rspMsg;
        String logicId = request.getParameter("logicId");
        try {
            rspMsg = devStopService.qryByLogicId(logicId);
        } catch (Exception e) {
            log.error("查询设备停机失败", e);
            rspMsg = new RspMsg("fail", " 查询设备停机异常");
        }
        return rspMsg;
    }

    @ZjftOperateLog(menu = Menus.DEV_STOP, button = Buttons.MOD)
    @RequestMapping(value="/mod",method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map){
        log.info("mod()");
        RspMsg rspMsg;
        DevStop devStop = new DevStop();
        try{
            if (map!=null){
                BeanUtils.populate(devStop, ((LinkedHashMap) map.get("current")));
            }
            if(StringUtils.isEmpty(devStop.getLogicId())||StringUtils.isEmpty(devStop.getDevNo())||
                    StringUtils.isEmpty(devStop.getStopDevReason())||StringUtils.isEmpty(devStop.getStopDevStartTime())||
                    StringUtils.isEmpty(devStop.getStopDevType())||StringUtils.isEmpty(devStop.getStopDevEndTime())||
                    StringUtils.isEmpty(devStop.getOpNo())){
                log.error("校验信息失败");
                return  new RspMsg("fail","校验信息失败");
            }else {
                rspMsg = devStopService.mod(devStop);
            }
        }catch (Exception e){
            log.error("修改停机失败");
            return  new RspMsg("fail","修改失败");
        }

        return  rspMsg;


    }


}
