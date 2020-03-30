package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevStatus;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import  java.util.Map;

/**
 * @Author:limengrd
 * @Description:设备状态
 */
@Mapper
@Repository
public interface DevStatusDao {
    /**
     * 根据设备号查询设备状态信息
     * @param devNo
     * @return
     */
    Map<String,Object> qryDevStatusByNo(@Param("devNo") String devNo);


    /**
     * 添加设备状态信息
     * @param devStatus
     * @return
     */
    void add(DevStatus devStatus);
    /**
     * 删除设备状态信息
     * @param devNo
     */
    void del(@Param("devNo") String devNo);

    DevStatus qryByDevNo(@Param("devNo") String devNo);

    void mod(DevStatus devStatus);

}
