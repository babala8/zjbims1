package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author yuechen
 * @Description
 **/
public interface RoleService {
    /**
     * 查询角色列表
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 新增角色
     * @param
     * @return
     */
    RspMsg add(Map<String, String> param);

    /**
     * 查询角色权限列表
     * @param roleNo
     * @return
     */
    RspMsg qryAccessById(String roleNo);

    /**
     * 修改角色
     * @param newParam
     * @param oldParam
     * @return
     */
    RspMsg mod(Map<String,String > newParam, Map<String,String> oldParam);

    /**
     * 修改角色权限
     * @param param
     * @return
     */
    RspMsg modAccess(Map<String, Object> param);

    /**
     * 删除角色
     * @param roleNo
     * @return
     */
    RspMsg del(String roleNo);

    /**
     * 根据机构编号查询该机构及其下属机构角色列表
     * @param param
     * @return
     */
    RspMsg qryAvailableRoleByOrgNo(Map<String, String> param);

    RspMsg qryByNo(String no);

}
