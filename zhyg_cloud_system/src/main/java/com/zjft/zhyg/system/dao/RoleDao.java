package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Button;
import com.zjft.zhyg.system.pojo.Role;
import com.zjft.zhyg.system.pojo.RoleButton;
import com.zjft.zhyg.system.pojo.Menu;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author zyq
 * @Description 角色操作
 **/
@Repository
public interface RoleDao {
    /**
     * 根据编号查询角色
     * @param no
     * @return
     */
    Role qryByNo(@Param("no") String no);

    /**
     * 查询角色按钮
     * @param roleNo
     * @return
     */
    List<RoleButton> qryRoleButton(@Param("roleNo") String roleNo);

    /**
     * 查询角色菜单
     * @param roleNo
     * @return
     */
    List<String> qryRoleMenu(@Param("roleNo") String roleNo);

    /**
     * 根据条件查询角色列表
     * @param param
     * @return
     */
    List<Role> qry(Map<String, Object> param);

    /**
     * 新增角色信息
     * @param param
     * @return
     */
    void add(Map<String, String> param);

    /**
     * 根据角色查询其菜单列表
     * @param roleNo
     * @return
     */
    List<Menu> qryMenusByRoleNo(@Param("roleNo") String roleNo);

    /**
     * 根据角色查询其按钮列表
     * @param roleNo
     * @return
     */
    List<Button> qryButtonsByRoleNo(@Param("roleNo") String roleNo);

    /**
     * 更新角色信息
     * @param param
     * @return
     */
    void mod(Map<String, String> param);

    /**
     * 删除角色信息
     * @param roleNo
     * @return
     */
    void del(@Param("roleNo") String roleNo);

    /**
     * 根据机构编号查询该机构及其下属机构角色列表
     * @param param
     * @return
     */
    List<Role> qryAvailableRoleByOrgNo(Map<String, String> param);

    /**
     * 新增角色按钮信息
     * @param nodes
     * @return
     */
    void addRoleButton(Map<String, Object> nodes);

    /**
     * 新增角色菜单信息
     * @param nodes
     * @return
     */
    void addRoleMenu(Map<String, Object> nodes);

    /**
     * 根据角色名，机构类型查角色
     * @param roleName
     * @param orgType
     * @return
     */
    Role qryByNameAndType(@Param("roleName") String roleName,@Param("orgType") String orgType);
    /**
     * 根据角色名查角色
     * @param roleName
     * @return
     */
    Role qryByName(@Param("roleName") String roleName);
    /**
     * 查询所有角色
     * @return
     */
    List<Role> qryAll();

    /**
     * 修改组合角色
     * @param role
     */
    void modRole(Role role);
}
