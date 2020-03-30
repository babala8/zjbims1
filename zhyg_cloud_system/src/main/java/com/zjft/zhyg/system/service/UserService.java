package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.User;

import java.util.Map;

/**
 * @Author zyq
 * @Description 登录服务
 **/
public interface UserService {
    /**
     * 登录
     * @param user
     * @return
     */
    RspMsg login(User user);

    /**
     * 登出
     * @param user
     * @return
     */
    void logout(User user);

    /**
     * 根据编号查询用户
     * @return
     */
    RspMsg qryByNo(String no);

    /**
     * 查询所有用户
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 添加用户
     * @param user
     * @return
     */
    RspMsg add(User user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    RspMsg mod(User user);

    /**
     * 删除用户
     * @param no
     * @return
     */
    RspMsg del(String no);

    /**
     * 修改密码
     * @param param
     * @return
     */
    RspMsg modPasswd(Map<String,String> param);

    /**
     *  解锁用户
     * @param userNo
     */
    RspMsg unlock(String userNo);
}
