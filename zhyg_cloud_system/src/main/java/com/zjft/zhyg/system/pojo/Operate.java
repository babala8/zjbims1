package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description
 **/
@Data
public class Operate implements Serializable {
    /**
     * 编号
     */
    private String btnNo;
    /**
     * 操作名称
     */
    private String btnName;
    /**
     * 菜单编号
     */
    private String menuNo;
    /**
     * 菜单名称
     */
    private String menuName;
}
