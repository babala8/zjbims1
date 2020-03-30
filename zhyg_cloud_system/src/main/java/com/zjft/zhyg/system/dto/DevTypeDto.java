package com.zjft.zhyg.system.dto;


import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备型号数据传输对象
 */
@Data
public class DevTypeDto implements Serializable {
    /**
     * 编号
     */
    private String no;
    /**
     * 品牌型号
     */
    private String name;
    /**
     * 品牌编号
     */
    private String vendorNo;
    /**
     * 品牌名称
     */
    private String vendorName;
    /**
     * 类型编号
     */
    private String catalogNo;
    /**
     * 类型名称
     */
    private String catalogName;
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