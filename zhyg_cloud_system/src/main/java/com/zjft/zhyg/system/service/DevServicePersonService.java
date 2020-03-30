package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevServicePerson;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:xss
 * @Description:设备维护员操作
 */
public interface DevServicePersonService {

    /**
     * 添加设备维护员
     * @param devServicePerson
     * @return
     */
    RspMsg add(DevServicePerson devServicePerson);


    /**
     * 查询设备维护员
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 根据设备维护员编号查询设备维护员信息
     * @param no
     * @return
     */
    RspMsg qryByNo(String no);

    /**
     * 修改设备维护员
     * @param newObj
     * @param oldObj
     * @return
     */
    RspMsg mod(DevServicePerson newObj,DevServicePerson oldObj);
    /**
     * 删除设备维护员
     * @param no
     * @return
     */
    RspMsg del(String no);



}