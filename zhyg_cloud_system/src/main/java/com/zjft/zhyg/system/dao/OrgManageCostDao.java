package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.OrgManageCost;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author tps
 * @Description 机构经营成本
 **/
@Repository
public interface OrgManageCostDao {
    /**
     * 根据机构号查询机构经营成本列表
     *
     * @param orgNo
     * @return
     */
    List<OrgManageCost> qryByNo(@Param("orgNo") String orgNo);

    /**
     * 根据机构号、年份、月份删除机构经营成本
     *
     * @param orgNo
     * @param year
     * @param month
     * @return
     */
    void delByKey(@Param("orgNo") String orgNo, @Param("year") String year, @Param("month") String month);

    /**
     * 新增机构经营成本
     *
     * @param manageCost
     * @return
     */
    void add(OrgManageCost manageCost);


}
