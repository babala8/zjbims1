package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备品牌表
 */
@Data
public class DevVendor implements Serializable {
    /**
     * 编号
     */
    private String no;
    /**
     * 品牌名称
     */
    private String name;
    /**
     * 生产商地址
     */
    private String address;
    /**
     * 生产商热线
     */
    private String hotline1;
    /**
     * 生产商状态
     */
    private String status;

}