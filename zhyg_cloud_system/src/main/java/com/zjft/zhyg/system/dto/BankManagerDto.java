package com.zjft.zhyg.system.dto;


import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:银行网点人员数据传输对象
 */
@Data
public class BankManagerDto implements Serializable {
    /**
     * 网点人员编号
     */
    private String no;
    /**
     * 网点人员姓名
     */
    private String name;
    /**
     * 所属机构编号
     */
    private String orgNo;
    /**
     * 所属机构名称
     */
    private String orgName;
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
     * 是否是网点经理
     */
    private String isLeader;
    /**
     * 是否是大堂经理
     */
    private String isLobbyManager;
    /**
     * 是否是设备管机员
     */
    private String isDevManager;
    /**
     * 是否是柜台人员
     */
    private String isDeskManager;

}