package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 机构信息
 **/
@Data
public class Org implements Serializable {
    /**
     * 机构编号
     */
    private String no;
    /**
     * 机构名称
     */
    private String name;
    /**
     * 父机构
     */
    private String parentOrgNo;
    /**
     * 父机构名称
     */
    private String parentOrgName;
    /**
     * 机构左值
     */
    private Integer leftNo;
    /**
     * 机构右值
     */
    private Integer rightNo;
    /**
     * 机构类型
     */
    private OrgType orgType;
    /**
     * 机构类型编号
     */
    private String orgTypeNo;
    /**
     * 经度
     */
    private String x;
    /**
     * 纬度
     */
    private String y;
    /**
     * 地址
     */
    private String address;
    /**
     * 联系人
     */
    private String linkman;
    /**
     * 电话
     */
    private String telephone;
    /**
     * 传真
     */
    private String fax;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 业务范围
     */
    private String businessRange;
    /**
     * 银联标准地区代码
     */
    private String cupAreaCode;

    /**
     * 省级地区编码
     */
    private String areaNoProvince;
    /**
     * 市级地区编码
     */
    private String areaNoCity;
    /**
     * 县级地区编码
     */
    private String areaNoCounty;

    /**
     * 将备注字段用于 外包加钞柜员号
     */
    private String note;

}
