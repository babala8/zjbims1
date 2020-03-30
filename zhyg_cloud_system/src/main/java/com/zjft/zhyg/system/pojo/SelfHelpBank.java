package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: liurenfei
 * @description:
 */
@Data
public class SelfHelpBank implements Serializable {
    private String logicId;
    /**
     * 自助银行名称
     */
    private String bankName;
    /**
     * 所属地址
     */
    private String bankArea;
    /**
     * 所属分行（2级机构）编号
     */
    private String fhOrgNo;
    /**
     * 机构名称
     */
    private String orgName;
    /**
     * 所属省级区编码
     */
    private String areaNoProvince;
    /**
     * 省级名称
     */
    private String provinceName;
    /**
     * 所属地市级区域编码
     */
    private String areaNoCity;
    /**
     * 市级名称
     */
    private String cityName;
    /**
     * 所属县级区域编码
     */
    private String areaNoCounty;
    /**
     * 区县名称
     */
    private String countyName;
    /**
     * 区域名称
     */
    private String areaName;
    /**
     * 横坐标(经度)
     */
    private String x;
    /**
     * 纵坐标(纬度)
     */
    private String y;
}
