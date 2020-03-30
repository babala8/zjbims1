package com.zjft.zhyg.system.dto;

import lombok.Data;

/**
 * @Author zyq
 * @Description 机构数据传输对象
 **/
@Data
public class OrgDto {
    /**
     * 机构编号
     */
    private String no;
    /**
     * 机构名
     */
    private String name;
    /**
     * 父机构号
     */
    private String parentOrgNo;
    /**
     * 父机构名称
     */
    private String parentOrgName;
    /**
     * 机构类型编号
     */
    private String orgTypeNo;
    /**
     * 机构类型名称
     */
    private String orgTypeName;
    /**
     * 地址
     */
    private String address;
    /**
     * 联系人
     */
    private String linkman;
    /**
     * 联系电话
     */
    private String telephone;

    /**
     * 经度
     */
    private String x;
    /**
     * 纬度
     */
    private String y;
    /**
     * 将备注字段用于 外包加钞柜员号
     */
    private String note;
    /**
     * 银联标准地区代码
     */
    private String cupAreaCode;
    /**
     * 所属省级区域编码
     */
    private String areaNoProvince;
    /**
     * 所属地市级区域编码
     */
    private String areaNoCity;
    /**
     * 所属县级区域编码
     */
    private String areaNoCounty;
}
