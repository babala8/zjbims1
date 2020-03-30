package com.zjft.zhyg.system.pojo;


import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:银行网点人员表
 */
@Data
public class BankManager implements Serializable {
    /**
     * 网点人员编号
     */
    private String no;
    /**
     * 网点人员姓名
     */
    private String name;
    /**
     * 所属机构
     */
    private Org org;
    /**
     * 所属机构编号
     */
    private String orgNo;
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