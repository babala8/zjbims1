package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备型号表
 */
@Data
public class DevType implements Serializable {
    /**
     * 编号
     */
    private String no;
    /**
     * 品牌型号
     */
    private String name;
    /**
     * 所属品牌
     */
    private DevVendor devVendor;
    /**
     * 所属品牌编号
     */
    private String vendorNo;
    /**
     * 所属类型
     */
    private DevCatalog devCatalog;
    /**
     * 所属类型编号
     */
    private String catalogNo;
    /**
     * 设备规格
     */
    private String spec;
    /**
     * 设备重量
     */
    private String weight;
    /**
     * 平均功率
     */
    private String watt;
    /**
     * 非现金标志
     */
    private String cashType;

}
