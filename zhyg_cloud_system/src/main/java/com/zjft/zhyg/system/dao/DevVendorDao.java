package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevType;
import com.zjft.zhyg.system.pojo.DevVendor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备品牌
 */
@Mapper
@Repository
public interface DevVendorDao {

    /**
     *  添加设备品牌
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devVendor
     */
    void add(DevVendor devVendor);

    /**
     *删除设备品牌
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备品牌
     * @param devVendor
     */
    void mod(DevVendor devVendor);

    /**
     * 动态查询设备品牌
     * @param param
     * @return
     */
    List<DevVendor> qry(Map<String,Object> param);

    /**
     * 根据设备品牌编号查询设备品牌
     * @param no
     * @return
     */
    DevVendor qryByNo(@Param("no") String no);
    /**
     * 根据设备品牌名称查询行设备品牌
     * @param name
     * @return
     */
    DevVendor qryByName(@Param("name") String name);
    /**
     * 根据设备品牌和编号查询设备品牌是否重复
     * @param name
     * @return
     */
    DevVendor qryByNameNo(@Param("name") String name,@Param("no") String no);

    /**
     * 设备型号表是否正在使用该品牌
     * @param no
     * @return
     */
    List<DevType> qryTypeByVendor(@Param("no") String no);
}