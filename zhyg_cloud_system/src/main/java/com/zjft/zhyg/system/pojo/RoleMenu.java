package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 角色菜单
 **/
@Data
public class RoleMenu implements Serializable {
    /**
     * 角色编号
     */
    private String roleNo;
    /**
     * 菜单编号
     */
    private Menu menu;
}
