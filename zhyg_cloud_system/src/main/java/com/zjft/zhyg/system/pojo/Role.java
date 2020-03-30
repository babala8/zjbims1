package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 角色信息
 **/
@Data
public class Role implements Serializable {
    /**
     * 角色编号
     */
    private String no;
    /**
     * 角色名称
     */
    private String name;
    /**
     * 所属机构类型
     */
    private OrgType orgType;
    /**
     * 备注
     */
    private String note;

    public Role() {
    }
}
