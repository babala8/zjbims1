package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.Org;
import com.zjft.zhyg.system.pojo.OrgManageCost;
import com.zjft.zhyg.system.pojo.OrgStaticCost;
import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author zyq
 * @Description
 **/
public interface OrgService {
    /**
     * 查询机构列表
     * @param param
     * @return
     */
    RspMsg qry(Map<String, String> param);

    /**
     * 添加机构
     * @param org
     * @return
     */
    RspMsg add(Org org);

    /**
     * 根据编号查询机构
     * @param no
     * @return
     */
    RspMsg qryByNo(String no);

    /**
     * 修改机构
     * @param newObj
     * @param param
     * @return
     */
    RspMsg mod(Org newObj,Map<String,Object> param);

    /**
     * 删除机构
     * @param no
     * @return
     */
    RspMsg del(String no);

    /**
     * 根据机构级别查询机构类型
     * @param grade
     * @return
     */
    RspMsg qryTypeByGrade(String grade);

    /**
     * 查询机构成本
     * @param orgNo
     * @return
     */
    RspMsg qryCost(String orgNo);

    /**
     * 修改机构经营成本
     * @param manageCost
     * @return
     */
    RspMsg modManageCost(OrgManageCost manageCost);

    /**
     * 修改机构固定成本
     * @param staticCost
     * @return
     */
    RspMsg modStaticCost(OrgStaticCost staticCost);
	
    /**
     * 根据机构号查询机构类型
     * @param orgno
     * @return
     */
    RspMsg qryOrgTypesByOrgNo(String orgno);
	
	  /**
     * 查询下级机构
     * @param orgNo
     * @return
     */
    RspMsg qryAuthOrg(String orgNo);

    /**  
     * @description   查询所有的父级机构
     * @param orgNo   当前机构号
     * @date 2019/7/2 11:28 
     */  
    RspMsg qryParentOrg(String orgNo);

    RspMsg qryOrgTypeByNo(String no);
    /**
     * 查询银联标准地区
     * @return
     */
    RspMsg qryCupArea();
    /**
     * 查询省市级地区列表
     * @return
     */
    RspMsg qryProvinceCityArea(Map params);

    /**
     * 查询省市级地区列表
     * @return
     */
    RspMsg qryTopOrg();
}


