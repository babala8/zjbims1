package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Menu;
import com.zjft.zhyg.system.pojo.MenuNode;
import com.zjft.zhyg.system.pojo.RoleMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author zyq
 * @Description 菜单操作
 **/
@Repository
public interface MenuDao {
    /**
     * 根据编号查询菜单
     * @param no
     * @return
     */
    Menu qryByNo(@Param("no") String no);

    /**
     * 根据角色删除其菜单列表
     * @param roleNo
     * @return
     */
    void delMenusByRoleNo(@Param("roleNo") String roleNo);

    /**
     * 查询所有菜单
     * @return
     */
    List<Menu> qryAll();

    /**
     * 查询菜单完整信息
     * @return
     */
    List<MenuNode> qryInfos();

    /**
     * 修改菜单
     * @param menus
     */
    void mod(@Param("menus") List<MenuNode> menus);
}
