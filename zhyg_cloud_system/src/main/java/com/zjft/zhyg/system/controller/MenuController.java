package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.MenuNode;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author zyq
 * @time 2019-08-01
 * @description 菜单
 **/
@RestController
@RequestMapping("/menu")
public class MenuController {
    private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Autowired
    private MenuService menuService;

    /**
     * 获取菜单树
     * @return
     */
    @GetMapping
    public RspMsg getMenuJson()
    {
        logger.info("getMenuJson()");
        return menuService.qryMenuJson();
    }

    /**
     * 修改菜单树
     * @param menus
     * @return
     */
    @PutMapping
    public RspMsg save(@RequestBody List<MenuNode> menus) {
        logger.info("save()");
        if (menus == null || menus.size() == 0) {
            return new RspMsg("fail", "菜单树不能为空");
        }
        return menuService.mod(menus);
    }
}
