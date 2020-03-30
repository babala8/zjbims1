package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevCatalog;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;


/**
 * @Author:limengrd
 * @Description:设备类型操作
 */
public interface DevCatalogService {
    /**
     * 根据监控类型查询设备类型信息
     * @param monitorType
     * @return
     */
    RspMsg qryDevCatalogByMonitorType(String monitorType);

    /**
     * 查询设备类型
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 添加设备类型
     * @param devCatalog
     * @return
     */
    RspMsg add(DevCatalog devCatalog);

    /**
     * 根据编号查询设备类型
     * @return
     */
    RspMsg qryByNo(String no);

    /**
     * 查询所有设备类型
     * @return
     */
    RspMsg qryAllDevCatalogs();

    /**
     * 修改设备类型
     * @param newObj
     * @param oldObj
     * @return
     */
    RspMsg mod(DevCatalog newObj,DevCatalog oldObj);
    /**
     * 删除设备类型
     * @return
     */
    RspMsg del(String no);
}
