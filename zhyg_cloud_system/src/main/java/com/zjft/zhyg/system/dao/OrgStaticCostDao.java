package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.OrgStaticCost;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author tps
 * @Description 机构固定成本
 **/
@Repository
public interface OrgStaticCostDao {
    /**
     * 根据机构号查询银行的固定成本
     *
     * @param orgNo
     * @return
     */
    OrgStaticCost qryByNo(@Param("orgNo") String orgNo);

    /**
     * 根据机构号删除银行的固定成本
     *
     * @param orgNo
     * @return
     */
    void delByNo(@Param("orgNo") String orgNo);

    /**
     * 新增银行的固定成本
     *
     * @param staticCost
     * @return
     */
    void add(OrgStaticCost staticCost);
}
