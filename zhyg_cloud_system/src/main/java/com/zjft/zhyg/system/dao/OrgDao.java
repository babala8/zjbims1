package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.orgtree.OrgNode;
import com.zjft.zhyg.system.pojo.Org;
import com.zjft.zhyg.system.pojo.OrgType;
import com.zjft.zhyg.system.pojo.ProvinceCityCode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author zyq
 * @Description 机构操作
 **/
@Repository
public interface OrgDao {
    /**
     * 根据编号查询机构
     * @param no
     * @return
     */
    Org qryByNo(@Param("no") String no);

    /**
     * 根据编号查询机构类型
     * @param no
     * @return
     */
    OrgType qryOrgTypeByNo(@Param("no") String no);

    /**
     * 动态查询机构列表
     * @param param
     * @return
     */
    List<Org> qry(Map<String, Object> param);

    /**
     * 添加机构
     * 注：可能为null 的字段，需要设置jdbcType
     * @param org
     */
    void add(Org org);

    /**
     * 更新机构
     * @param org
     */
    void mod(Org org);

    /**
     * 机构删除
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 根据机构级别查询机构类型
     * @param grade
     * @return
     */
    List<OrgType> qryTypeByGrade(@Param("grade") String grade);

    /**
     * 根据机构号查询机构类型
     * @param orgno
     * @return
     */
    List<OrgType> qryOrgTypesByOrgNo(@Param("orgno") String orgno);

    /**
     * 根据机构查询下级机构
     * @param orgNo
     * @param orgNo2
     * @return
     */
    List<Map<String, Object>> qryAuthOrg(@Param("orgNo1") String orgNo, @Param("orgNo2") String orgNo2);

    /**
     * 更新机构树
     * @param nodes
     */
    void updateTree(@Param("nodes") List<OrgNode> nodes);

    /**
     * @description   查询所有的机构
     * @param
     * @date 2019/7/2 15:31
     */
    List<Org> qryAllOrg();
    /**
     * 查询银联标准地区
     * @return
     */
    List<Map> qryCupArea();
    /**
     * 查询市级地区列表
     * @return
     */
    List<ProvinceCityCode> qryProvinceCityArea(Map params);

    /**
     * 根据机构号查所属用户
     * @param no
     * @return
     */
    List<String> qryUsersByOrgNo(@Param("no") String no);

    /**
     * 根据机构号查所属设备
     * @param no
     * @return
     */
    List<String> qryDevsByOrgNo(@Param("no")String no);

    /**
     * 根据机构名查机构
     * @param name
     * @return
     */
    Org qryByName(@Param("name")String name);

    /**
     * 查询总行机构信息
     * @return
     */
    Org qryTopOrg();
}
