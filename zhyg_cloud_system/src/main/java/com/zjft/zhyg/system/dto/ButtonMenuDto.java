package com.zjft.zhyg.system.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author yuechen
 * @Description 按钮&菜单
 **/
@Data
public class ButtonMenuDto implements Serializable {
    /**
     * 按钮编号
     */
    private String btnNo;
    /**
     * 按钮名称
     */
    private String btnName;
    /**
     * 所属菜单编号
     */
    private String btnMenu;
    /**
     * 按钮序号
     */
    private String btnOrder;
    /**
     * 说明
     */
    private String note;
    /**
     * 菜单编号
     */
    private String menuNo;
    /**
     * 菜单名称
     */
    private String menuName;
}
