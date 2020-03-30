package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.SelfHelpBank;

import java.util.Map;

/**
 * @author: liurenfei
 * @description:自助银行管理操作
 */
public interface SelfHelpBankService {
    /**
     * 动态查询自助银行
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 添加自助银行
     * @param selfHelpBank
     * @return
     */
    RspMsg add(SelfHelpBank selfHelpBank);

    /**
     * 删除自助银行
     * @param logicId
     * @return
     */
    RspMsg del(String logicId);

    /**
     * 修改自助银行信息
     * @param selfHelpBank
     * @return
     */
    RspMsg mod(SelfHelpBank selfHelpBank);

    /**
     * 根据编号查自助银行
     * @param logicId
     * @return
     */
    RspMsg qryById(String logicId);

    /**
     * 获取所有省数据
     * @return
     */
    RspMsg getProvinces();

    /**
     * 根据省获取所有市
     * @param provinceCode
     * @return
     */
    RspMsg getCitys(String provinceCode);

    /**
     * 获取所有区县
     * @param cityCode
     * @return
     */
    RspMsg getCountys(String cityCode);

    /**
     * 将省市县数据格式成一个指定json格式的数组
     * @return
     */
    RspMsg getFormtAreaData();
}
