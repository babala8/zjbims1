package com.zjft.zhyg.system.zjucp;

import com.zjft.zhyg.system.pojo.DevBase;
import org.apache.ibatis.annotations.Param;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @Author: fqz
 * @Description: P端设备操作
 */
@ConditionalOnProperty(prefix = "spring.datasource.zjucp", name = "enable", havingValue = "true")
@Repository
public interface PDevBaseDao {

    /**
     * 根据设备号查询设备
     */
    Map<String,Object> qry(@Param("no")String no);
    /**
     *  添加设备
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devBase
     */
    void add(DevBase devBase);

    /**
     *删除设备
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备
     * @param devBase
     */
    void mod(DevBase devBase);
}