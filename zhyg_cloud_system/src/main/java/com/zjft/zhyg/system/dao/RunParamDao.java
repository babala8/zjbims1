package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.BulletinInfo;
import com.zjft.zhyg.system.pojo.ServicePropSystem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author liurenfei
 * @Description 系统运行参数
 */
@Mapper
@Repository
public interface RunParamDao {

    /**
     * 查询所有系统运行参数
     * @return
     */
    List<ServicePropSystem> qry(Map<String, Object> param);


    /**
     * 修改系统运行参数
     * @param servicePropSystem
     */
    void mod(ServicePropSystem servicePropSystem);


    /**
     * 根据编号查系统运行参数
     * @param keyId
     * @return
     */
    BulletinInfo qryById(@Param("keyId") String keyId);




}
