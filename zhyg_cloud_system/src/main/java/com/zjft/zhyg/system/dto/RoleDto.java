package com.zjft.zhyg.system.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author yuechen
 * @Description 用户数据传输对象
 **/
@Data
public class RoleDto implements Serializable {
    /**
     * 角色编号
     */
    private String no;
    /**
     * 角色名称
     */
    private String name;

    /**
     * 描述
     */
    private String note;

    /**
     * 机构类型
     */
    private String orgType;
    /**
     * 机构类型名称
     */
    private String orgTypeName;
}
