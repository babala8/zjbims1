package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.CaseCatalog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:故障响应设定操作
 */
@Mapper
@Repository
public interface CaseCatalogDao {
    /**
     * 查询故障响应设定
     * @param param
     * @return
     */
    List<CaseCatalog> qry(Map<String,Object> param);
    /**
     * 连表查询总行机构号查询
     * @return
     */
    String qryZHNo();
    /**
     * 查询所有的短信通知次数
     * @return
     */
    List<Integer> qryAllGrade();

    /**
     * 修改故障响应设定
     * @param caseCatalog
     */
    void mod(CaseCatalog caseCatalog);
}
