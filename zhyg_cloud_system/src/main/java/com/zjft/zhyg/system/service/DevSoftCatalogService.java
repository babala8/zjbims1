package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevSoftCatalog;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @author liurenfei
 * @Description 设备软件类型操作
 */
public interface DevSoftCatalogService {

    /**
     *
     * @param param
     * @return查询设备软件类型
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 获取下拉框数据
     * @return
     */
    RspMsg getInitData();

    /**
     * 根据ID查设备软件类型
     * @param groupId
     * @return
     */
    RspMsg qryById(String groupId);

    /**
     * 修改设备软件类型
     * @param oldObj
     * @param newObj
     * @return
     */
    RspMsg mod(DevSoftCatalog oldObj, DevSoftCatalog newObj);

    /**
     * 添加设备软件类型
     * @param devSoftCatalog
     * @return
     */
    RspMsg add(DevSoftCatalog devSoftCatalog);

    /**
     * 删除设备软件类型
     * @param groupId
     * @return
     */
    RspMsg del(String groupId);
}
