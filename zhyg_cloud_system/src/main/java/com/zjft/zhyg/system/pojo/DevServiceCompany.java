package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备维护商表
 */
@Data
public class DevServiceCompany implements Serializable {
    /**
     * 编号
     */
    private String no;
    /**
     * 服务商名称
     */
    private String name;
    /**
     * 联系人
     */
    private String linkMan;
    /**
     *地址
     */
    private String address;
    /**
     * 固定电话
     */
    private String phone;
    /**
     * 手机
     */
    private String mobile;
    /**
     * 传真
     */
    private String fax;
    /**
     * 电子邮箱
     */
    private String email;
    /**
     * 信息文件路径
     */
    private String infoFilePath;
    /**
     * 信息文件名称
     */
    private String infoFileName;

}
