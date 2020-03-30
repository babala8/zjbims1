package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;
import java.util.Map;


/**
 * @Author:xss
 * @Description:设备工作时间设定操作
 */
public interface DevWorkTimeService {

    /**
     * 查询设备信息
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);
    /**
     * 修改工作时间设定
     * @param param
     * @return
     */
    RspMsg mod(Map<String, Object> param);
    /**
     * 根据编号查询工作时间设定
     * @param devNo
     * @return
     */
    RspMsg qryById(String devNo);
}
