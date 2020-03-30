package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.DevWorkTime;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:工作时间设定操作
 */
@Mapper
@Repository
public interface DevWorkTimeDao {
    /**
     * 根据编号查询工作时间设定
     * @param no
     * @return
     */
    List<Map<String,Object>> qry(@Param("no") String no);
    /**
     * 添加工作时间设定
     * @param devWorkTime
     */
    void add(DevWorkTime devWorkTime);
    /**
     * 根据设备号删除工作时间设定
     * @param devNo
     */
    void del(@Param("devNo") String devNo);
    /**
     * 根据设备号和星期删除标准设备工作时间
     * @param devNo
     * @param datesType
     */
    void delStandWorkTime(@Param("devNo") String devNo,@Param("datesType")String datesType);
    /**
     * 根据设备号和星期删除标准设备工作时间
     * @param devNo
     * @param dates
     */
    void delSpecialWorkTime(@Param("devNo") String devNo,@Param("dates")String dates);
    /**
     * 根据编号查询工作时间设定
     * @param devNo
     * @return
     */
    List<DevWorkTime> qryById(@Param("devNo") String devNo);

}
