package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Log;
import com.zjft.zhyg.system.pojo.Operate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author zyq
 * @Description 日志记录
 **/
@Repository
public interface LogDao {

    /**
     * 查询操作编号
     *
     * @param menuNo
     * @param btnName
     * @return
     */
    String qryOperate(@Param("menuNo") String menuNo, @Param("btnName") String btnName);

    /**
     * 保存操作日志
     * @param param
     */
    void saveLog(Map<String, Object> param);

    /**
     * 动态分页查询日志
     * @param param
     * @return
     */
    List<Log> qryLog(Map<String, String> param);

    /**
     * 查询操作
     * @return
     */
    List<Operate> qryAllOperate();

}
