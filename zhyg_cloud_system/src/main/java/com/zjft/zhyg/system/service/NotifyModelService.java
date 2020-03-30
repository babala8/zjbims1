package com.zjft.zhyg.system.service;

import com.zjft.zhyg.system.pojo.RspMsg;

import java.util.Map;

/**
 * @Author fqz
 * @Description 信息通知模版服务
 **/
public interface NotifyModelService {
    /**
     * 保存信息通知内容
     * @param param
     * @return
     */
    RspMsg addNotifyModel(Map<String, Object> param);

    RspMsg qryInfoSetByType(Integer notifyType);
}
