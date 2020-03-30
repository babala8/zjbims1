package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.DevStop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DevStopDao {
    /**
     * 通过设备编号获取停机信息
     * @param devNo
     * @return
     */
    List<DevStop> qryByDevNo(@Param("devNo") String devNo);

    /**
     * 添加停机信息
     * @param devStop
     */
    void add(DevStop devStop);

    /**
     * 获取当前停机信息
     * @param param
     * @return
     */
    List<Map<String,String>> qry(Map<String, Object> param);

    /**
     * 获取设备停机详细信息
     * @param param
     * @return
     */
    List<Map<String,String>> qryStopDevDetail(Map<String, Object> param);
    /**
     * 获取所有停机信息
     * @return
     */
    List<DevStop> qryAll(@Param("status") Integer status);

    /**
     * 根据logicId查询停机详情
     * @param logicId
     * @return
     */
    DevStop qryByLogicId(@Param("logicId") String logicId);
    /**
     * 修改停机信息
     * @param devStop
     */
    void mod(DevStop devStop);

    /**
     * 查询设备停机历史
     * @param map
     * @return
     */
    List<Map<String, String>> qryStopHis(Map<String, Object> map);

    /**
     * 查设备停机设定开始时间距当前时间的最小期限
     * @return
     */
    @Select("select value from service_prop_system where key_id='devStopStartMinDays'")
    String getMinDays();

    /**
     * 更改设备事后停机开始时间期限
     * @param days
     */
    @Update("update service_prop_system set value=#{days} where key_id='devStopStartMinDays' ")
    void modMinDays(@Param("days") String days);
}
