package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author zyq
 * @Description 日志记录服务
 **/
public interface LogService {
    /**
     * 记录日志
     * @param param
     * @return
     */
    RspMsg log(Map<String, Object> param);

    /**
     * 查询日志
     * @param param
     * @return
     */
    RspMsg qryLog(Map<String, String> param);

    /**
     * 查询操作
     * @return
     */
    RspMsg qryOperate();
}
