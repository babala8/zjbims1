package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 角色按钮
 **/
@Data
public class RoleButton implements Serializable {
    /**
     * 角色编号
     */
    private String roleNo;
    /**
     * 按钮编号
     */
    private Button button;
}
