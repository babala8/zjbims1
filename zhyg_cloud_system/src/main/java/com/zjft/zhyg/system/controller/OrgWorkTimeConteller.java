package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.OrgWorkTimeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/SysOrgWorkTime")
public class OrgWorkTimeConteller {
    private static final Logger log = LoggerFactory.getLogger(OrgWorkTimeConteller.class);
    @Autowired
    private OrgWorkTimeService orgWorkTimeService;
    /**
     * 查询供应商类型
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryCooperation", method = RequestMethod.GET)
    public RspMsg qryCooperation(HttpServletRequest request) {
        log.info("qryCooperation()");
        RspMsg rspMsg;
        try {
            rspMsg = orgWorkTimeService.qryCooperationInfo();

        } catch (Exception e) {
            log.error("查询供应商失败", e);
            rspMsg = new RspMsg("fail", " 查询供应商异常");
        }
        return rspMsg;
    }

    /**
     * 获取机构类型
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/getOrgType", method = RequestMethod.GET)
    public RspMsg getOrgType(HttpServletRequest request) {
        log.info("getOrgType()");
        RspMsg rspMsg;
        try {
            rspMsg = orgWorkTimeService.orgType();//传递需要设置的机构，设置机构工作时间
        } catch (Exception e) {
            log.error("查询机构类型失败", e);
            rspMsg = new RspMsg("fail", " 查询机构类型异常");
        }
        return rspMsg;
    }

    /**
     * 批量设置机构特殊工作时间
     */
    @RequestMapping(value = "/SetBatchOrgWorkTime", method = RequestMethod.POST)
    public RspMsg setBatchOrgWorkTime(@RequestBody Map<String, Object> params) {
        log.info("setBatchOrgWorkTime()");
        RspMsg rspMsg;
        try {
            rspMsg = orgWorkTimeService.setSpecialWorkTime(params);
        } catch (Exception e) {
            log.error("查询机构信息失败", e);
            rspMsg = new RspMsg("fail", " 查询机构信息异常");
        }
        return rspMsg;

    }

    /**
     * 批量设置机构正常工作时间
     **/

    @RequestMapping(value = "/SetNormalBatchOrgWorkTime", method = RequestMethod.POST)
    public RspMsg setNormalBatchOrgWorkTime(@RequestBody Map<String, Object> params) {
        log.info("setNormalBatchOrgWorkTime()");
        RspMsg rspMsg;
        try {
            orgWorkTimeService.setNormalWorkTime(params);
            rspMsg = new RspMsg();
        } catch (Exception e) {
            log.error("批量设置机构正常工作时间失败", e);
            rspMsg = new RspMsg("fail", " 查询机构信息异常");
        }

        return rspMsg;

    }


    /**
     * 查询机构信息
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/qryOrg", method = RequestMethod.GET)
    public RspMsg qryOrg(HttpServletRequest request) {
        log.info("qryOrg()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("userOrgNo", request.getParameter("userOrgNo"));
            param.put("orgTypeNo", request.getParameter("orgTypeNo"));
            param.put("parentOrgNo", request.getParameter("parentOrgNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = orgWorkTimeService.qryOrg(param);
        } catch (Exception e) {
            log.error("查询机构信息失败", e);
            rspMsg = new RspMsg("fail", " 查询机构信息异常");
        }
        return rspMsg;

    }

    @RequestMapping(value = "/qryOrgSpecialDate", method = RequestMethod.GET)
    public RspMsg qryOrgSpecialDate(HttpServletRequest request) {
        log.info("qryOrgSpecialDate()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = orgWorkTimeService.qryOrgSpecialDate(param);
        } catch (Exception e) {
            log.error("查询机构特殊日期失败", e);
            rspMsg = new RspMsg("fail", " 查询机构信息异常");
        }
        return rspMsg;

    }

    @RequestMapping(value = "/qryOrgWorkTime", method = RequestMethod.GET)
    public RspMsg qryOrgWorkTime(HttpServletRequest request) {
        log.info("qryOrgWorkTime()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = orgWorkTimeService.qryOrgWokTime(param);
        } catch (Exception e) {
            log.error("查询机构工作时间信息失败", e);
            rspMsg = new RspMsg("fail", " 查询机构信息异常");
        }
        return rspMsg;

    }

    @RequestMapping(value = "/delSpecial", method = RequestMethod.PUT)
    public RspMsg delSpecial(@RequestBody Map<String, Object> param) {
        log.info("delSpecial()");
        RspMsg rspMsg;
        try {
            rspMsg = orgWorkTimeService.delSpecial(param);
        } catch (Exception e) {
            log.error("删除特殊日期失败", e);
            rspMsg = new RspMsg("fail", " 删除特殊日期异常");
        }
        return rspMsg;

    }


}
