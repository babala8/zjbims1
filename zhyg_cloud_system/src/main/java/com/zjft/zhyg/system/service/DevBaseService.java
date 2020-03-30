package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:xss
 * @Description:设备操作
 */
public interface DevBaseService {

    /**
     * 添加设备
     * @param devBase
     * @return
     */
    RspMsg add(DevBase devBase);


    /**
     * 查询设备
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 根据设备号查询设备信息
     * @return
     */
    RspMsg qryByNo(String devNo);

    /**
     * 修改设备
     * @param newObj 修改后的对象
     * @param oldObj 修改前的对象
     * @return
     */
    RspMsg mod(DevBase newObj,DevBase oldObj);

    /**
     * 删除设备
     * @param no
     * @return
     */
    RspMsg del(String no);

    /**
     * 查所有机构类型
     * @return
     */
    RspMsg qryOrgTYpes();
}