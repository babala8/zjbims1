package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

public interface OrgWorkTimeService {

    RspMsg qryCooperationInfo();
    /**
     * 查询所有机构信息
     * @param param
     * @return
     */
    RspMsg qryOrg(Map<String, String> param);

    /**
     * 查询所有机构类型
     * @param
     * @return
     */
    RspMsg orgType();


    /**
     * 批量设置用户机构的正常工作时间
     * @param
     * @return
     */
    RspMsg setNormalWorkTime(Map<String, Object> params);

    /**
     * 批量设置用户机构的特殊工作时间
     * @param
     * @return
     */
    RspMsg setSpecialWorkTime(Map<String, Object> params);

    RspMsg qryOrgWokTime(Map<String,String> param);

    RspMsg qryOrgSpecialDate(Map<String,String> param);

    RspMsg delSpecial (Map<String,Object> param);
}
