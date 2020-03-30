package com.zjft.zhyg.system.service.impl;

import com.zjft.zhyg.system.dao.DevStatusDao;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevStatusService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @Author:limengrd
 * @Description:设备状态实现
 */
@Service
public class DevStatusServiceImpl implements DevStatusService {
    private static final Logger log = LoggerFactory.getLogger(DevStatusServiceImpl.class);

    @Autowired
    DevStatusDao devStatusDao;

    /**
     * 根据设备号查询设备状态
     * @param devNo
     * @return
     */
    @Override
    public RspMsg qryDevStatusByNo(String devNo) {
        RspMsg rspMsg = new RspMsg();
        Map<String,Object> map = devStatusDao.qryDevStatusByNo(devNo);
        rspMsg.setData(map);
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("根据设备号查询设备状态成功");
        return rspMsg;
    }
}
