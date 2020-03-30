package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.DevServiceCompany;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备维护商操作
 */
@Mapper
@Repository
public interface DevServiceCompanyDao {

    /**
     *  添加设备维护商
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devServiceCompany
     */
    void add(DevServiceCompany devServiceCompany);

    /**
     *删除设备维护商
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备维护商
     * @param devServiceCompany
     */
    void mod(DevServiceCompany devServiceCompany);

    /**
     * 动态查询设备维护商
     * @param param
     * @return
     */
    List<DevServiceCompany> qry(Map<String,Object> param);

    /**
     * 根据设备维护商编号查询设备维护商
     * @param no
     * @return
     */
    DevServiceCompany qryByNo(@Param("no") String no);

    /**
     * 根据设备维护商名称查询设备维护商
     * @param name
     * @return
     */
    DevServiceCompany qryByName(@Param("name") String name);

    /**
     * 根据设备维护商名称和编号查询设备维护商
     * @param name
     * @param no
     * @return
     */
    DevServiceCompany qryByNameNo(@Param("name") String name,@Param("no") String no);

    /**
     * 查询设备维护商是否被调用
     * @param no
     * @return
     */
    List<String> qryDevService(@Param("no") String no);

    /**
     * 获取系统管理服务配置表中的路径
     * @return
     */
    String getPath();

    /**
     * 根据编号获取老的路径
     * @param no
     * @return
     */
    String getOldPathByNo(@Param("no") String no);

    /**
     * 根据编号删除维护商文件
     * @param no
     */
    void delFileByNo(@Param("no") String no);
}
