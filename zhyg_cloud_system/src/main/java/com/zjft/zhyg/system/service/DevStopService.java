package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevStop;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

public interface DevStopService {
    /**
     * 通过设备编号获取停机信息
     * @param no
     * @return
     */
    RspMsg qryByDevNo(String no);

    /**
     * 添加停机信息
     * @param devStop
     */
    RspMsg  add(DevStop devStop);
    /**
     * 获取当前停机信息
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);
    /**
     * 获取设备停机详细信息
     * @param param
     * @return
     */
    RspMsg qryStopDevDetail(Map<String, String> param);

    /**
     * 根据logicId获取停机信息
     * @param logicId
     * @return
     */
    RspMsg qryByLogicId(String logicId);

    /**
     * 修改设备停机信息
     * @param devStop
     * @return
     */
    RspMsg mod(DevStop devStop);

    /**
     * 查询停机历史
     * @param param
     * @return
     */
    RspMsg qryStopHis(Map<String,String> param);

    /**
     * 查设备停机设定开始时间距当前时间的最小期限
     * @param userOrgNo
     * @return
     */
    RspMsg getMinDays(String userOrgNo);

    /**
     * 更改设备事后停机开始时间期限
     * @param param
     * @return
     */
    RspMsg modMinDays(Map<String, String> param);

}
