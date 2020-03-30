package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

/**
 * @Author:limengrd
 * @Description:设备状态
 */
public interface DevStatusService {
    /**
     * 根据设备号查询设备状态
     * @param devNo
     * @return
     */
    RspMsg  qryDevStatusByNo(String devNo);

}
