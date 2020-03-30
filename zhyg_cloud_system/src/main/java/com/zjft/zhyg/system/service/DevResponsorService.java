package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevResponsor;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

public interface DevResponsorService {
    /**
     * 查询设备责任人
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);
    /**
     * 查询已设置和未设置的设备责任人
     * @param param
     * @return
     */
    RspMsg qrySet(Map<String, String> param);

    /**
     * 根据设备号查询已设置的设备管机员和维护人员
     * @param devNo
     * @return
     */
    Map<String, Object> qrySelector(String devNo);

    /**
     * 设置设备责任人
     * @param param
     * @return
     */
    RspMsg set(Map<String, String> param);

    /**
     * 根据管机员名字设置设备责任人
     * @param flag
     * @param devNo
     * @param manager
     * @return
     */
    DevResponsor managerList(String flag,String devNo,String manager,String orgNo);
    /**
     * 根据管机员名字设置设备责任人
     * @param flag
     * @param devNo
     * @param service
     * @return
     */
    DevResponsor serviceList(String flag,String devNo,String service);
}
