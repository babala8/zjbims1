package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备型号
 */
@Mapper
@Repository
public interface DevTypeDao {

    /**
     *  添加设备型号
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devType
     */
    void add(DevType devType);

    /**
     *删除设备型号
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备型号
     * @param devType
     */
    void mod(DevType devType);

    /**
     * 动态查询设备型号
     * @param param
     * @return
     */
    List<DevType> qry(@Param("param") Map<String,Object> param);

    /**
     * 根据设备型号编号查询设备型号
     * @param no
     * @return
     */
    DevType qryByNo(@Param("no") String no);
    /**
     * 根据设备型号名称查询设备型号
     * @param name
     * @return
     */
    DevType qryByName(@Param("name") String name);
    /**
     * 根据设备型号名称和编号查询设备型号是否重复
     * @param name
     * @return
     */
    DevType qryByNameNo(@Param("name") String name,@Param("no") String no);
}
