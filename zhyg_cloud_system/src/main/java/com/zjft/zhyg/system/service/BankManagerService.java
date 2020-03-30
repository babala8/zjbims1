package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.BankManager;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:xss
 * @Description:银行网点人员操作
 */
public interface BankManagerService {

    /**
     * 添加银行网点人员
     * @param bankManager
     * @return
     */
    RspMsg add(BankManager bankManager);


    /**
     * 查询银行网点人员
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 根据银行网点人员编号查询银行网点人员信息
     * @param no
     * @return
     */
    RspMsg qryByNo(String no);
    /**
     * 修改银行网点人员
     * @param bankManager
     * @return
     */
    RspMsg mod(BankManager bankManager);
    /**
     * 删除银行网点人员
     * @param no
     * @return
     */
    RspMsg del(String no);



}