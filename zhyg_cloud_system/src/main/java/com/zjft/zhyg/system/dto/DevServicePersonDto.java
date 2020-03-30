package com.zjft.zhyg.system.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备维护员数据传输对象
 */
@Data
public class DevServicePersonDto implements Serializable {
    /**
     * 设备维护员编号
     */
    private String no;
    /**
     * 设备维护员姓名
     */
    private String name;
    /**
     * 所属设备维护商姓名
     */
    private String belongToName;
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