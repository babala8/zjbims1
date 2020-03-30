package com.zjft.zhyg.system.pojo;


import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备维护员表
 */
@Data
public class DevServicePerson implements Serializable {
    /**
     * 设备维护员编号
     */
    private String no;
    /**
     * 设备维护员姓名
     */
    private String name;
    /**
     * 所属设备维护商
     */
    private DevServiceCompany belongTo;
    /**
     * 所属设备维护商编号
     */
    private String belongToNo;
    /**
     * 状态
     */
    private String status;
    /**
     * 办公电话
     */
    private String phone;
    /**
     * 手机号码
     */
    private String mobile;
    /**
     * 电子邮件
     */
    private String email;
    /**
     * 设备维护员上级
     */
    private String leader;

}