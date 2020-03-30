package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 系统按钮
 **/
@Data
public class Button implements Serializable {
    /**
     * 按钮编号
     */
    private String no;
    /**
     * 按钮名称
     */
    private String name;
    /**
     * 按钮说明
     */
    private String note;
    /**
     * 按钮序号
     */
    private String buttonOrder;
    /**
     * 按钮链接
     */
    private String url;
    /**
     * 所属菜单编号
     */
    private Menu menu;
    /**
     * 是否需要审批标志
     */
    private String auditFlag;
}
