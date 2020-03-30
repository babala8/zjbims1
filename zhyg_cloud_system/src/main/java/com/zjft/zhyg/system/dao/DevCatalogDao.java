package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.DevCatalog;
import com.zjft.zhyg.system.pojo.DevType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:limengrd
 * @Description:设备类型
 */
@Mapper
@Repository
public interface DevCatalogDao {
    /**
     * 根据监控类型查询设备类型
     * @param monitorType
     * @return
     */
    List<Map<String,Object>> qryDevCatalogByMonitorType(@Param("monitorType") String monitorType);


    /**
     *  添加设备类型
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devCatalog
     */
    void add(DevCatalog devCatalog);

    /**
     *
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备类型
     * @param devCatalog
     */
    void mod(DevCatalog devCatalog);

    /**
     * 动态查询设备类型
     * @param param
     * @return
     */
    List<DevCatalog> qry(@Param("param") Map<String,Object> param);

    /**
     * 根据设备类型编号查询设备类型
     * @param no
     * @return
     */
    DevCatalog qryByNo(@Param("no") String no);
    /**
     * 根据设备类型名称查询行设备类型
     * @param name
     * @return
     */
    DevCatalog qryByName(@Param("name") String name);

    /**
     * 查询所有设备类型
     * @return
     */
    List<Map<String, Object>> qryAllDevCatalogs();
    /**
     * 根据设备类型和编号查询设备类型是否重复
     * @param name
     * @return
     */
    DevCatalog qryByNameNo(@Param("name") String name, @Param("no") String no);

    /**
     * 根据用户编号查询用户设备类型权限
     * @param userNo
     * @return
     */
    @Select("select DEV_CATALOG from SYS_USER_DEVROLE where USER_NO=#{userNo}")
    List<String> qryUserCatalog(@Param("userNo") String userNo);

    /**
     * 查询用户是否有全部权限
     * @param userNo
     * @return
     */
    @Select("select count(DEV_CATALOG) from SYS_USER_DEVROLE where USER_NO=#{userNo} and upper(DEV_CATALOG)='ALL'")
    int allAccess(@Param("userNo") String userNo);

    /**
     * 根据设备类型查型号
     * @param no
     * @return
     */
    @Select("select * from dev_type_table where dev_catalog=#{no}")
    List<DevType> qryTypeByCatalog(String no);

    /**
     * 根据设备类型查设备
     * @param no
     * @return
     */
    @Select("select * from dev_base_info where dev_catalog=#{no}")
    List<DevBase> qryDevByCatalog(String no);
}
