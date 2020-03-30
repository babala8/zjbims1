package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.AuditService;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/audit")
public class AuditController {
    private static final Logger log = LoggerFactory.getLogger(AuditController.class);
    @Autowired
    AuditService auditService;

    @RequestMapping(value = "/qryMyApply",method = RequestMethod.GET)
    public RspMsg qryMyApply(HttpServletRequest request){
        log.info("qryMyApply()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("menuNo", request.getParameter("menuNo"));
            param.put("btnNo", request.getParameter("btnNo"));
            param.put("auditResult",request.getParameter("auditResult"));
            param.put("startTime",request.getParameter("startTime"));
            param.put("endTime",request.getParameter("endTime"));
            param.put("commitStatus",request.getParameter("commitStatus"));
            param.put("userNo",request.getParameter("userNo"));
            if (StringUtils.isEmpty(param.get("userNo"))) {
                return new RspMsg("fail", "用户不能为空");
            }
            rspMsg =auditService.qryMyApply(param);
        } catch (Exception e) {
            log.error("查询我的申请失败", e);
            rspMsg = new RspMsg("fail", " 查询我的申请异常");
        }
        return rspMsg;
    }

    @RequestMapping(value = "/qryMyAudit",method = RequestMethod.GET)
    public RspMsg qryMyAudit(HttpServletRequest request){
        log.info("qryMyAudit()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            param.put("menuNo", request.getParameter("menuNo"));
            param.put("btnNo", request.getParameter("btnNo"));
            param.put("auditResult",request.getParameter("auditResult"));
            param.put("startTime",request.getParameter("startTime"));
            param.put("endTime",request.getParameter("endTime"));
            param.put("commitStatus",request.getParameter("commitStatus"));
            param.put("userNo",request.getParameter("userNo"));
            param.put("orgNo",request.getParameter("orgNo"));
            if (StringUtils.isEmpty(param.get("userNo"))) {
                return new RspMsg("fail", "用户不能为空");
            }
            rspMsg =auditService.qryMyAudit(param);
        } catch (Exception e) {
            log.error("查询我的审批失败", e);
            rspMsg = new RspMsg("fail", " 查询我的审批异常");
        }
        return rspMsg;
    }


    @RequestMapping(value = "/changeAuditStatus",method = RequestMethod.GET)
    public RspMsg changeAuditStatus(HttpServletRequest request){
        log.info("changeAuditStatus()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("no",request.getParameter("no"));
            param.put("flag",request.getParameter("flag"));
            param.put("userNo",request.getParameter("userNo"));
            param.put("auditTime", DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
            rspMsg =auditService.changeAuditStatus(param);
        } catch (Exception e) {
            log.error("审批失败", e);
            rspMsg = new RspMsg("fail", " 审批异常");
        }
        return rspMsg;
    }


    @RequestMapping(value = "/changeCommitStatus",method = RequestMethod.GET)
    public RspMsg changeCommitStatus(@RequestParam("no") String no){
        log.info("changeCommitStatus()");
        RspMsg rspMsg;
        try {
            rspMsg =auditService.changeCommitStatus(no);
        } catch (Exception e) {
            log.error("撤销失败", e);
            rspMsg = new RspMsg("fail", " 撤销失败");
        }
        return rspMsg;
    }


}
