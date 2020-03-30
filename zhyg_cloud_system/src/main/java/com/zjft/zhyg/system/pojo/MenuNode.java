package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.util.List;

/**
 * @author zyq
 * @time 2019-08-01
 * @description 前端所需的菜单树
 **/
@Data
public class MenuNode {
    /**
     * 菜单编号
     */
    private String id;
    /**
     * 菜单名
     */
    private String text;
    /**
     * 是否是菜单组
     */
    private boolean group;
    /**
     * 子菜单
     */
    private List<MenuNode> children;
    /**
     * 树菜单图片
     */
    private String icon;
    /**
     * 蜜汁属性
     */
    private int type;
    /**
     * 权限编号
     */
    private String acl;
    /**
     * 背景色
     */
    private String bg_color;
    private String bgColor;
    /**
     * 路由
     */
    private String link;
    /**
     * 蜜汁属性
     */
    private String tile_size;
    /**
     * 叶子菜单图片
     */
    private String tile_image;
    private String tileImage;

    public MenuNode() {

    }

    /**
     * 创建一级菜单
     * @param id
     * @param text
     * @param group
     * @param children
     * @param icon
     * @param type
     * @param acl
     */
    public MenuNode(String id, String text, boolean group, List<MenuNode> children, String icon, int type, String acl) {
        this.id = id;
        this.text = text;
        this.group = group;
        this.children = children;
        this.icon = icon;
        this.type = type;
        this.acl = acl;
    }

    /**
     * 创建二级菜单
     * @param id
     * @param text
     * @param group
     * @param children
     * @param type
     * @param acl
     * @param bg_color
     */
    public MenuNode(String id, String text, boolean group, List<MenuNode> children, int type, String acl, String bg_color) {
        this.id = id;
        this.text = text;
        this.group = group;
        this.children = children;
        this.type = type;
        this.acl = acl;
        this.bg_color = bg_color;
    }

    /**
     * 创建三级菜单
     * @param id
     * @param text
     * @param type
     * @param acl
     * @param link
     * @param tile_size
     * @param tile_image
     */
    public MenuNode(String id, String text, int type, String acl, String link, String tile_size, String tile_image) {
        this.id = id;
        this.text = text;
        this.type = type;
        this.acl = acl;
        this.link = link;
        this.tile_size = tile_size;
        this.tile_image = tile_image;
    }
}
