package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevStop;
import com.zjft.zhyg.system.pojo.RunStatus;
import org.springframework.stereotype.Repository;

@Repository
public interface RunStatusDao {

    /**
     * 添加设备运营状态修改
     * @param runStatus
     */
    void add(RunStatus runStatus);
    /**
     * 事后停机删除设备运行状态
     */
    void deleteByTime(DevStop devStop);
}
