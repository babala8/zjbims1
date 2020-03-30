package com.zjft.zhyg.system.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author yuechen
 * @Description 菜单信息
 **/
@Data
public class MenuDto implements Serializable {
    /**
     * 菜单编号
     */
    private String no;
    /**
     * 菜单名称
     */
    private String name;
    /**
     * 上级菜单
     */
    private String father;
    /**
     * 菜单级别
     */
    private String level;
    /**
     * 菜单序号
     */
    private String order;
    /**
     * 菜单说明
     */
    private String note;
    /**
     * 菜单链接
     */
    private String url;
}
