package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevType;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:xss
 * @Description:设备型号操作
 */
public interface DevTypeService {

    /**
     * 查询设备型号
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);
    /**
     * 添加设备型号
     * @param devType
     * @return
     */
    RspMsg add(DevType devType);

    /**
     * 根据编号查询设备型号
     * @return
     */
    RspMsg qryByNo(String no);
    /**
     * 修改设备型号
     * @param devType
     * @return
     */
    RspMsg mod(DevType devType);
    /**
     * 删除设备型号
     * @return
     */
    RspMsg del(String no);

}
