package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.DevVendor;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author:xss
 * @Description:设备品牌操作
 */
public interface DevVendorService {



    /**
     * 查询设备品牌
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);
    /**
     * 添加设备品牌
     * @param devVendor
     * @return
     */
    RspMsg add(DevVendor devVendor);

    /**
     * 根据编号查询设备品牌
     * @return
     */
    RspMsg qryByNo(String no);
    /**
     * 修改设备品牌
     * @param devVendor
     * @return
     */
    RspMsg mod(DevVendor devVendor);
    /**
     * 删除设备品牌
     * @return
     */
    RspMsg del(String no);


}
