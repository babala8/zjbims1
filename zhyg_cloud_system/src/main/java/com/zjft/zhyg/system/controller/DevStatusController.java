package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevStatusService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author:limengrd
 * @Description:设备
 */
@RestController
@RequestMapping("/devstatus")
public class DevStatusController {
    private static final Logger log = LoggerFactory.getLogger(DevStatusController.class);

    @Autowired
    DevStatusService devStatusService;

    /**
     * 根据设备号查询设备状态
     * @param devNo
     * @return
     */
    @RequestMapping(value = "/qryDevStatusByNo")
    RspMsg qryDevStatsuByNo(String devNo){
        log.info("qryDevStatsuByNo()");
        RspMsg rspMsg = new RspMsg();
        try {
            rspMsg = devStatusService.qryDevStatusByNo(devNo);
        }catch (Exception e){
            log.error("根据设备号查询设备状态失败:", e);
            rspMsg.setRetCode("fail");
            rspMsg.setRetMsg("根据设备号查询设备状态失败");
        }
        return  rspMsg;
    }

}
