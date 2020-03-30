package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 菜单信息
 **/
@Data
public class Menu implements Serializable {
    /**
     * 菜单编号
     */
    private String no;
    /**
     * 菜单名称
     */
    private String name;
    /**
     * 菜单说明
     */
    private String note;
}
