package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.DevServicePerson;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备维护员操作
 */
@Mapper
@Repository
public interface DevServicePersonDao {

    /**
     *  添加设备维护员
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devServicePerson
     */
    void add(DevServicePerson devServicePerson);

    /**
     *删除设备维护员
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备维护商
     * @param devServicePerson
     */
    void mod(DevServicePerson devServicePerson);

    /**
     * 动态查询设备维护员
     * @param param
     * @return
     */
    List<DevServicePerson> qry(Map<String,Object> param);

    /**
     * 根据设备维护员编号查询设备维护员
     * @param no
     * @return
     */
    DevServicePerson qryByNo(@Param("no") String no);

    /**
     * 根据设备维护员名称查询维护员
     * @param name
     * @return
     */
    DevServicePerson qryByName(@Param("name") String name);

    /**
     * 根据设备维护员名称查询维护员
     * @param name
     * @param no
     * @return
     */
    DevServicePerson qryByNameNo(@Param("name") String name,@Param("no") String no);

    /**
     * 根据设备维护员名称和所属维护商查维护员信息
     * @param name
     * @param belongToNo
     * @return
     */
    DevServicePerson qryByNameAndBelongNo(@Param("name") String name, @Param("belongToNo") String belongToNo);
}
