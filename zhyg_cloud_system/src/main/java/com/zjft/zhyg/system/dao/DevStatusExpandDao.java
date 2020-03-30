package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.DevStatusExpand;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @Author: limengrd
 * @Description: 设备模块状态扩展
 */
@Mapper
@Repository
public interface DevStatusExpandDao {
    /**
     * 添加设备模块状态扩展
     * @param devNo
     * @return
     */
    void add(@Param("devNo")String devNo);
    /**
     * 删除设备模块状态扩展
     * @param devNo
     */
    void del(@Param("devNo")String devNo);

    DevStatusExpand qryByDevNo(@Param("devNo") String devNo);
}
