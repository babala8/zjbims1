package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.ServicePropSystem;

import java.util.Map;

/**
 * @author liurenfei
 * @Description 系统运行参数操作
 */
public interface RunParamService {
    /**
     * 查询系统运行参数
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 修改系统运行参数
     * @param servicePropSystem
     * @return
     */
    RspMsg mod(ServicePropSystem servicePropSystem);

    /**
     * 根据编号查参数
     * @param keyId
     * @return
     */
    RspMsg qryById(String keyId);

}
