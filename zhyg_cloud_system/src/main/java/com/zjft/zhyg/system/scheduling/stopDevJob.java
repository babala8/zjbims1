package com.zjft.zhyg.system.scheduling;

import com.zjft.zhyg.common.CalendarUtil;
import com.zjft.zhyg.system.controller.DevBaseController;
import com.zjft.zhyg.system.dao.*;
import com.zjft.zhyg.system.pojo.*;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class stopDevJob {
    private static final Logger log = LoggerFactory.getLogger(DevBaseController.class);
    @Autowired
    DevStopDao devStopDao;
    @Autowired
    DevBaseDao devBaseDao;
    @Autowired
    RunStatusDao runStatusDao;
    @Autowired
    DevStatusDao devStatusDao;
    @Autowired
    DevStatusExpandDao devStatusExpandDao;

    @Scheduled(fixedRate = 60*1000)
    public void stopDev(){
        log.info("停机开始");
        List<DevStop> devStopList = devStopDao.qryAll(0);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(DevStop devStop:devStopList){
            String devStopStartTime = devStop.getStopDevStartTime()+":00";
            String devNo = devStop.getDevNo();
            String stopDevReason = devStop.getStopDevReason();
            DevBase devBase = devBaseDao.qryByNo(devNo);
            DevStatus devStatus = devStatusDao.qryByDevNo(devNo);
            try{
                Date starTime = sdf.parse(devStopStartTime);
                Date now = new Date();
                if(starTime.getTime()<=now.getTime()){
                    devStop.setStatus(1);
                    devStopDao.mod(devStop);
                    devBase.setOperateStatus("2");
                    devBaseDao.modOperateStatus(devBase.getOperateStatus(),devBase.getNo());
                    //更新Run_Status_Table
                    RunStatus runStatus = new RunStatus();
                    String dateTime = sdf.format(now);
                    runStatus.setLogicId(devBase.getNo() + CalendarUtil.getSysTimeYMDHMS111());
                    runStatus.setDevNo(devNo);
                    runStatus.setDateTime(devStopStartTime);
                    runStatus.setRunStatus("B");
                    runStatus.setActionNote("B");
                    runStatusDao.add(runStatus);
                    if(devStatus==null){
                        devStatus = new DevStatus();
                        devStatus.setDevNo(devNo);
                        devStatus.setDevStatus("UNKNOWN");
                        devStatus.setDevTxStatus("UNKNOWN");
                        devStatus.setDevRunStatus("STOP");
                        devStatus.setDevModStatus("UNKNOWN");
                        devStatus.setDevCashboxStatus("UNKNOWN");
                        devStatus.setDevNetStatus("UNKNOWN");
                        devStatus.setIdcDeviceStatus("UNKNOWN");
                        devStatus.setCamDeviceStatus("UNKNOWN");
                        devStatus.setCdmDeviceStatus("UNKNOWN");
                        devStatus.setUpsDeviceStatus("UNKNOWN");
                        devStatus.setSprDeviceStatus("UNKNOWN");
                        devStatus.setDepDeviceStatus("UNKNOWN");
                        devStatus.setRprDeviceStatus("UNKNOWN");
                        devStatus.setJprDeviceStatus("UNKNOWN");
                        devStatus.setChkDeviceStatus("UNKNOWN");
                        devStatus.setTtuDeviceStatus("UNKNOWN");
                        devStatus.setPbkDeviceStatus("UNKNOWN");
                        devStatus.setPinDeviceStatus("UNKNOWN");
                        devStatusDao.add(devStatus);
                    }else{
                        devStatus.setDevRunStatus("STOP");
                        devStatus.setDevStatus("UNKNOWN");
                        devStatus.setDevTxStatus("UNKNOWN");
                        devStatus.setDevModStatus("UNKNOWN");
                        devStatus.setDevCashboxStatus("UNKNOWN");
                        devStatus.setDevNetStatus("UNKNOWN");
                        devStatus.setIdcDeviceStatus("UNKNOWN");
                        devStatus.setCamDeviceStatus("UNKNOWN");
                        devStatus.setCdmDeviceStatus("UNKNOWN");
                        devStatus.setUpsDeviceStatus("UNKNOWN");
                        devStatus.setSprDeviceStatus("UNKNOWN");
                        devStatus.setDepDeviceStatus("UNKNOWN");
                        devStatus.setRprDeviceStatus("UNKNOWN");
                        devStatus.setJprDeviceStatus("UNKNOWN");
                        devStatus.setChkDeviceStatus("UNKNOWN");
                        devStatus.setTtuDeviceStatus("UNKNOWN");
                        devStatus.setPbkDeviceStatus("UNKNOWN");
                        devStatus.setPinDeviceStatus("UNKNOWN");
                        devStatusDao.mod(devStatus);
                    }
                    log.info("设备"+devNo+"已停机,停机原因："+stopDevReason);
                }
            }catch (Exception e){
                log.error("停机异常",e);
            }
        }
    }

    @Scheduled(fixedRate = 60*1000)
    public void stopDevAfter(){
        log.info("设备停机结束");
        List<DevStop> devStopList = devStopDao.qryAll(1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(DevStop devStop:devStopList){
            String devStopEndTime = devStop.getStopDevEndTime()+":00";
            String devNo = devStop.getDevNo();
            DevBase devBase = devBaseDao.qryByNo(devNo);
            DevStatus devStatus = devStatusDao.qryByDevNo(devNo);
            try{
                Date endTime = sdf.parse(devStopEndTime);
                Date now = new Date();
                if(endTime.getTime()<=now.getTime()){
                    devStop.setStatus(2);
                    devStopDao.mod(devStop);
                    devBase.setOperateStatus("1");
                    devBaseDao.modOperateStatus(devBase.getOperateStatus(),devBase.getNo());
                    //更新Run_Status_Table
                    RunStatus runStatus = new RunStatus();
                    String dateTime = sdf.format(now);
                    runStatus.setLogicId(devBase.getNo() + CalendarUtil.getSysTimeYMDHMS111());
                    runStatus.setDevNo(devNo);
                    runStatus.setDateTime(devStopEndTime);
                    runStatus.setRunStatus("A");
                    runStatus.setActionNote("A");
                    runStatusDao.add(runStatus);
                    if(devStatus==null){
                        devStatus = new DevStatus();
                        devStatus.setDevNo(devNo);
                        devStatus.setDevStatus("UNKNOWN");
                        devStatus.setDevTxStatus("UNKNOWN");
                        devStatus.setDevRunStatus("STOP");
                        devStatus.setDevModStatus("UNKNOWN");
                        devStatus.setDevCashboxStatus("UNKNOWN");
                        devStatus.setDevNetStatus("UNKNOWN");
                        devStatus.setIdcDeviceStatus("UNKNOWN");
                        devStatus.setCamDeviceStatus("UNKNOWN");
                        devStatus.setCdmDeviceStatus("UNKNOWN");
                        devStatus.setUpsDeviceStatus("UNKNOWN");
                        devStatus.setSprDeviceStatus("UNKNOWN");
                        devStatus.setDepDeviceStatus("UNKNOWN");
                        devStatus.setRprDeviceStatus("UNKNOWN");
                        devStatus.setJprDeviceStatus("UNKNOWN");
                        devStatus.setChkDeviceStatus("UNKNOWN");
                        devStatus.setTtuDeviceStatus("UNKNOWN");
                        devStatus.setPbkDeviceStatus("UNKNOWN");
                        devStatus.setPinDeviceStatus("UNKNOWN");
                        devStatusDao.add(devStatus);
                    }else{
                        devStatus.setDevRunStatus("UNKNOWN");
                        devStatusDao.mod(devStatus);
                    }
                    log.info("设备"+devNo+"停机结束");
                }
            }catch (Exception e){
                log.error("停机结束异常" , e);
            }
        }
    }


    public void initDevBaseInfo(){
        log.info("初始化设备信息开始");
        Map<String, Object> param = new HashMap<>(16);
        param.put("userOrgNo", "9998");
        List<DevBase> result = devBaseDao.qry(param);
        for(DevBase devBase:result){
            //添加对应设备的设备模块状态
            addDevStatus(devBase);
            //添加设备号到设备模块状态扩展表
            addDevStatusExpand(devBase.getNo());
            // 添加设备号到业务参数配置表
            addParamBusinessConf(devBase.getNo(),"gaofeng");
            addInitRunStatus(devBase.getNo());
        }

    }

    /**
     * 同步默认参数到业务参数配置表
     * @param devNo
     * @param addUser
     */
    private void addParamBusinessConf(String devNo,String addUser) {
        log.info("开始同步默认参数到业务参数配置表 devNo:"+devNo);
        List<ParamBusinessTemplate> list = devBaseDao.getAllParamTemps();
        if (list.size()==0){
            return ;
        }
        List<ParamBusinessConfig> param = new ArrayList<>();
        ParamBusinessConfig pbc = null;
        String time = new DateTime().toString("yyyy-MM-dd HH:mm:ss");
        for (ParamBusinessTemplate obj: list){
            pbc = new ParamBusinessConfig();
            pbc.setAddUser(addUser);
            pbc.setDevNo(devNo);
            pbc.setTakeFlag("0");//0:未加载  1:已加载
            pbc.setTaskFlag("0");//0:未完成  1:已完成   2:已结束
            pbc.setAddTime(time);
            pbc.setParamKey(obj.getParamKey());
            pbc.setParamValue(obj.getParamValue());
            param.add(pbc);
        }
        try {
            List<Map<String,String>> result = devBaseDao.getParamByDevNo(devNo);
            if(result.size()==0){
                devBaseDao.addParamConf(param);
                log.info("同步默认参数到业务参数配置表成功 devNo:"+devNo);
            }
        } catch (Exception e) {
            log.error("同步默认参数到业务参数配置表异常:",e);
            throw new RuntimeException();//不抛出异常事务不会回滚
        }
    }

    /**
     * 根据设备，添加对应的设备状态
     * @param devBase
     */
    private void addDevStatus(DevBase devBase){
        log.info("添加对应的设备状态 devNo:"+devBase.getNo());
        DevStatus devStatus = new DevStatus();
        devStatus.setDevNo(devBase.getNo());
        devStatus.setDevStatus("UNKNOWN");
        devStatus.setDevTxStatus("UNKNOWN");
        if ("1".equals(devBase.getOperateStatus())) {
            devStatus.setDevRunStatus("UNKNOWN");
        } else {
            devStatus.setDevRunStatus("STOP");
        }
        devStatus.setDevModStatus("UNKNOWN");
        devStatus.setDevCashboxStatus("UNKNOWN");
        devStatus.setDevNetStatus("UNKNOWN");

        devStatus.setIdcDeviceStatus("UNKNOWN");
        devStatus.setCamDeviceStatus("UNKNOWN");
        devStatus.setCdmDeviceStatus("UNKNOWN");
        devStatus.setUpsDeviceStatus("UNKNOWN");
        devStatus.setSprDeviceStatus("UNKNOWN");
        devStatus.setDepDeviceStatus("UNKNOWN");
        devStatus.setRprDeviceStatus("UNKNOWN");
        devStatus.setJprDeviceStatus("UNKNOWN");
        devStatus.setChkDeviceStatus("UNKNOWN");
        devStatus.setTtuDeviceStatus("UNKNOWN");
        devStatus.setPbkDeviceStatus("UNKNOWN");
        devStatus.setPinDeviceStatus("UNKNOWN");
        try {
            DevStatus tmp = devStatusDao.qryByDevNo(devStatus.getDevNo());
            if(tmp==null){
                devStatusDao.add(devStatus);
                log.info("插入设备状态成功 devNo"+devBase.getNo());
            }
        } catch (Exception e) {
            log.error("插入设备状态异常:",e);
        }
    }

    /**
     *添加设备号到设备模块状态扩展表
     * @param  devNo
     */
    private void addDevStatusExpand(String devNo){
        log.info("添加设备号到设备模块状态扩展表 devNo:"+devNo);
        try {
            DevStatusExpand devStatusExpand = devStatusExpandDao.qryByDevNo(devNo);
            if(devStatusExpand==null){
                devStatusExpandDao.add(devNo);
                log.info("插入设备模块扩展成功 devNo:"+devNo);
            }
        } catch (Exception e) {
            log.error("插入设备模块扩展异常:"+e);
        }
    }

    private void addInitRunStatus(String devNo){
        RunStatus runStatus = new RunStatus();
        runStatus.setLogicId(devNo + CalendarUtil.getSysTimeYMDHMS111());
        runStatus.setDevNo(devNo);
        runStatus.setDateTime("2019-10-24 00:00:01");
        runStatus.setRunStatus("U");
        runStatusDao.add(runStatus);

    }
}
