package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.MenuNode;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.List;

/**
 * @author zyq
 * @time 2019-08-01
 * @description 菜单
 **/
public interface MenuService {

    /**
     * 查询前端所需的菜单树
     * @return
     */
    RspMsg qryMenuJson();

    /**
     * 保存修改
     * @param menus
     * @return
     */
    RspMsg mod(List<MenuNode> menus);
}
