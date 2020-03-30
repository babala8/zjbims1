package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevServiceCompany;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:xss
 * @Description:设备维护商操作
 */
public interface DevServiceCompanyService {

    /**
     * 添加设备维护商
     * @param devServiceCompany
     * @return
     */
    RspMsg add(DevServiceCompany devServiceCompany);


    /**
     * 查询设备维护商
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 根据设备维护商号查询设备维护商信息
     * @param no
     * @return
     */
    RspMsg qryByNo(String no);
    /**
     * 修改设备维护商
     * @param devServiceCompany
     * @return
     */
    RspMsg mod(DevServiceCompany devServiceCompany);
    /**
     *删除设备维护商
     * @param no
     * @return
     */
    RspMsg del(String no);

    /**
     * 根据编号删除维护商文件
     * @param no
     * @return
     */
    RspMsg delFileByNo(String no);

    /**
     * 根据维护商编号获取文件路径
     * @param no
     * @return
     */
    String getPathByNo(String no);
}