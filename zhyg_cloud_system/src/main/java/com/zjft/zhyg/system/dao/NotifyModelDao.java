package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Log;
import com.zjft.zhyg.system.pojo.NotifyModel;
import com.zjft.zhyg.system.pojo.Operate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author fqz
 * @Description 信息通知模版操作
 **/
@Repository
public interface NotifyModelDao {
    /**
     * 保存信息通知内容
     * @param param
     */
    void addNotifyModel(Map<String, Object> param);

    NotifyModel qryBuNotifyType (@Param("notifyType") Integer notifyType);

    void modNotifyType(NotifyModel notifyModel);

}
