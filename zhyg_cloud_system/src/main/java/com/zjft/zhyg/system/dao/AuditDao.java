package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Audit;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AuditDao {

    /**
     * 查询我的申请
     * @param param
     * @return
     */
    List<Audit> qryMyApply(Map<String, Object> param);

    /**
     * 查询我的审核
     * @param param
     * @return
     */
    List<Audit> qryMyAudit(Map<String, Object> param);

    void addAudit(Map<String, Object> audit);

    void changeAuditStatus(Map<String, String> audit);


    void changeCommitStatus(String no);


}
