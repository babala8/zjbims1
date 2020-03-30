package com.zjft.zhyg.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.zjft.zhyg.system.dao.MenuDao;
import com.zjft.zhyg.system.pojo.MenuNode;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author zyq
 * @time 2019-08-01
 * @description 菜单
 **/
@Transactional
@Service
public class MenuServiceImpl implements MenuService {

    private static final Logger log = LoggerFactory.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuDao menuDao;

    @Override
    public RspMsg qryMenuJson() {
        try {
            List<MenuNode> menus = menuDao.qryInfos();
            // 根菜单
            MenuNode root = new MenuNode();
            root.setId("zijin-itms");
            root.setText("业务菜单");
            root.setGroup(true);
            root.setChildren(new ArrayList<>());
            // 添加父菜单并排序
            Iterator<MenuNode> menuIterator = menus.iterator();
            while (menuIterator.hasNext()) {
                MenuNode menu = menuIterator.next();
                if (menu.getId().length() == 1) {
                    MenuNode node = new MenuNode(menu.getId(), menu.getText(), true, new ArrayList<>(), menu.getIcon(), 0, menu.getId());
                    node.getChildren().add(new MenuNode(menu.getId(), menu.getText(), true, new ArrayList<>(), 0, menu.getId(), menu.getBgColor()));
                    root.getChildren().add(node);
                    // 移除父元素
                    menuIterator.remove();
                }
            }
            // 添加子元素
            for (MenuNode menu : menus) {
                for (MenuNode item : root.getChildren()) {
                    if (menu.getId().startsWith(item.getId())) {
                        item.getChildren().get(0).getChildren().add(new MenuNode(menu.getId(), menu.getText(), 1, menu.getId(), menu.getLink(), "tile", menu.getTileImage()));
                    }
                }
            }
            List<MenuNode> result = new ArrayList<>();
            result.add(root);
            System.out.println(result);
            // 先转字符串再转对象，为了去除null的字段
            return new RspMsg("ok", "查询菜单树成功", JSONObject.parse(JSONObject.toJSONString(result)));
        } catch (Exception e) {
            log.error("查询菜单树异常：", e);
            return new RspMsg("fail", "查询菜单树异常");
        }
    }

    @Override
    public RspMsg mod(List<MenuNode> menus) {
        log.info("修改菜单信息开始 menus:{}",menus);
        try {
            List<MenuNode> results = new ArrayList<>();
            for (MenuNode menu : menus) {
                // 父节点
                MenuNode node = new MenuNode();
                node.setId(menu.getId());
                node.setText(menu.getText());
                node.setIcon(menu.getIcon());
                node.setBg_color(menu.getChildren().get(0).getBg_color());
                results.add(node);
                // 子节点
                results.addAll(menu.getChildren().get(0).getChildren());
            }
            menuDao.mod(results);
            log.info("修改菜单信息成功 menus:{}",menus);
            return new RspMsg("ok", "修改菜单信息成功");
        } catch (Exception e) {
            log.error("修改菜单树异常：", e);
            return new RspMsg("fail", "修改菜单树异常");
        }
    }
}
