package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:limengrd
 * @Description:模块类型
 */
public interface DevModCatalogService {
    /**
     * 查询所有模块类型
     * @return
     */
    RspMsg qryAllModCatalog(Map<String,String> param);
}
