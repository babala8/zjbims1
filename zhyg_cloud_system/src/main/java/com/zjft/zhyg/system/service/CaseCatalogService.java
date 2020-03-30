package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.CaseCatalog;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;


/**
 * @Author:xss
 * @Description:故障响应设定操作
 */
public interface CaseCatalogService {

    /**
     * 查询故障响应设定
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 查询所有的短信通知次数
     * @return
     */
    RspMsg qryAllGrade();
    /**
     * 修改故障响应设定
     * @param caseCatalog
     * @return
     */
    RspMsg mod(CaseCatalog caseCatalog);
}
