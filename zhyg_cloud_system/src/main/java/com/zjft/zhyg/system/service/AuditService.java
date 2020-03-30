package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;


public interface AuditService {
    /**
     * 查询我的申请
     * @param param
     * @return
     */
    RspMsg qryMyApply(Map<String, String> param);

    /**
     * 查询我的审核
     * @param param
     * @return
     */
    RspMsg qryMyAudit(Map<String, String> param);
    /**
     * @description   添加审批
     * @param audit
     * @date 2019/7/2 9:23
     */
    RspMsg addAudit(Map<String, Object> audit);

    /**
     * @description   修改审核状态
     * @param audit
     * @date 2019/7/5 15:36
     */
    RspMsg changeAuditStatus(Map<String, String> audit);

    /**
     * @description   修改为撤销状态
     * @param
     * @date 2019/7/6 9:53
     */
    RspMsg changeCommitStatus(String no);

}
