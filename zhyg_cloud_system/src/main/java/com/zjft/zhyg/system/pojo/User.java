package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 用户信息
 **/
@Data
public class User implements Serializable {

    /**
     * 账号
     */
    private String no;
    /**
     * 密码
     */
    private String passwd;
    /**
     * 姓名
     */
    private String name;
    /**
     * 状态
     */
    private String status;
    /**
     * 在线标志
     */
    private String onlineFlag;
    /**
     * 所属角色
     */
    private Role role;
    /**
     * 所属角色编号
     */
    private String roleNo;
    /**
     * 所属机构
     */
    private Org org;
    /**
     * 所属机构编号
     */
    private String orgNo;
    /**
     * 电话号码
     */
    private String phone;
    /**
     * 手机号码
     */
    private String mobile;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 登录ip
     */
    private String loginIp;
    /**
     * 登录时间
     */
    private String loginTime;
    /**
     * 密码到期日
     */
    private  String passwdExpiration;
    /**
     * 密码错误次数
     */
    private Integer passwdError;
    /**
     * 设备类型权限
     */
    private String devCatalog;

    public User() {
    }

}
