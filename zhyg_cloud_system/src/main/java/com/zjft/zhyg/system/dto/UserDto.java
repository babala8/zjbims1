package com.zjft.zhyg.system.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 用户数据传输对象
 **/
@Data
public class UserDto implements Serializable {
    /**
     * 用户账号
     */
    private String no;
    /**
     * 用户名称
     */
    private String name;
    /**
     * 在线标志
     */
    private String onlineFlag;
    /**
     * 状态
     */
    private String status;
    /**
     * 角色编号
     */
    private String roleNo;
    /**
     * 角色名称
     */
    private String roleName;
    /**
     * 机构编号
     */
    private String orgNo;
    /**
     * 机构名称
     */
    private String orgName;
    /**
     * 最后登录时间
     */
    private String loginTime;
    /**
     * 设备类型权限
     */
    private String devCatalog;

}
