package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.BulletinInfo;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @author liurenfei
 * @Description 系统公告操作
 */
public interface BulletinInfoService {
    /**
     * 动态查询所有系统公告
     * @return
     */
    RspMsg qry(Map<String,String> param);

    /**
     * 添加系统公告
     * @param bulletinInfo
     * @return
     */
    RspMsg add(BulletinInfo bulletinInfo);

    /**
     * 删除系统公告
     * @param bulletinId
     * @return
     */
    RspMsg del(String bulletinId);

    /**
     * 修改系统公告
     * @param bulletinInfo
     * @return
     */
    RspMsg mod(BulletinInfo bulletinInfo);

    /**
     * 根据编号查公告
     * @param bulletinId
     * @return
     */
    RspMsg qryById(String bulletinId);

    /**
     * 删除用户未读公告
     * @param userNo
     */
    void deleteUserUnread(String userNo);
}
