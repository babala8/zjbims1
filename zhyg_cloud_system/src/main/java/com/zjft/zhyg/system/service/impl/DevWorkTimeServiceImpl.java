package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevBaseDao;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.dao.DevWorkTimeDao;
import com.zjft.zhyg.system.dto.DevBaseDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.DevWorkTime;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevWorkTimeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import java.util.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author:xss
 * @Description:设备工作时间操作实现类
 */
@Transactional
@Service
public class DevWorkTimeServiceImpl implements DevWorkTimeService {

    private static final Logger log = LoggerFactory.getLogger(DevWorkTimeServiceImpl.class);


    @Autowired
    private DevBaseDao devBaseDao;
    @Autowired
    private DevWorkTimeDao devWorkTimeDao;
    @Autowired
    private DevCatalogDao devCatalogDao;
    /**
     * 查询设备信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        if(!StringUtils.isEmpty(param.get("userNo"))){
            if (devCatalogDao.allAccess(param.get("userNo")) == 0) {
                map.put("userNo",param.get("userNo"));
            }
        }
        if (!StringUtils.isEmpty(param.get("devNo"))) {
            map.put("devNo", param.get("devNo"));
        }
        if (!StringUtils.isEmpty(param.get("orgNo"))) {
            map.put("orgNo", param.get("orgNo"));
        }
        if (!StringUtils.isEmpty(param.get("devType"))) {//设备型号
            map.put("devType", param.get("devType"));
        }
        if (!StringUtils.isEmpty(param.get("devVendor"))) {//设备品牌
            map.put("devVendor", param.get("devVendor"));
        }
        // 需要分页查询
        List<DevBase> result;
        int curPage = 1;
        int pageSize = 20;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
             curPage = Integer.parseInt(param.get("curPage"));
             pageSize = Integer.parseInt(param.get("pageSize"));
        }
        Page<DevBase> page = PageHelper.startPage(curPage, pageSize);
        result = devBaseDao.qry(map);
        PageInfo<DevBase> pageInfo = new PageInfo<>(page.getResult());
        int totalRow = (int) pageInfo.getTotal();
        int totalPage = (int) Math.ceil((double) totalRow / pageSize);
        rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备工作时间不存在");
        }
        List<DevBaseDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromDevBase).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询设备工作时间成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    /**
     * 修改设备工作时间
     * @param param
     * @return
     */
    @Override
    public RspMsg mod(Map<String, Object> param){
        log.info("修改设备工作时间 devNos:"+param.get("devNos"));
        RspMsg rspMsg = new RspMsg();
        DevWorkTime devWorkTime = new DevWorkTime();
        ArrayList<String> devNos=(ArrayList<String>)param.get("devNos");
        for(String devNo:devNos){
            String datesType = (String)param.get("datesType");//先获取日期类型
            String datesType1;
            String dates = (String)param.get("dates");
            //插入标准设备工作时段，先检查该星期和编号，看表中是否存在，如果存在则删除
            List<DevWorkTime> result = devWorkTimeDao.qryById(devNo);
            if (result.size()>0 && "Special".equals(datesType)) { //特殊工作时间段，要删除该设备所有的标准工作时间
                for(DevWorkTime devWorkTime1:result) {
                    datesType1 = devWorkTime1.getDatesType();
                    if (!"Special".equals(datesType1)) {//如果是标准工作时间，则删除
                        devWorkTimeDao.delStandWorkTime(devNo, datesType1);
                    }else if (dates != null && !"".equals(dates)){//如果是特殊工作时间，则判断日期是否相同，相同则删除旧的时间
                        if(dates.equals(devWorkTime1.getDates())) {
                            devWorkTimeDao.delSpecialWorkTime(devNo, dates);
                        }
                    }
                }
            } else {//标准工作时间段，要删除对应的标准时间
                for(DevWorkTime devWorkTime1:result) {
                    datesType1 = devWorkTime1.getDatesType();
                    if (datesType1.equals(datesType)) {//如果日期相同，则删除
                        devWorkTimeDao.delStandWorkTime(devNo, datesType1);//设置设备工作时间前，先删除之前的工作时间设定
                    }
                }
            }

            devWorkTime.setLogicId(UUID.randomUUID().toString());//设置逻辑主键
            devWorkTime.setDevNo(devNo);//设置设备号
            devWorkTime.setDatesType(datesType);
            devWorkTime.setDatesTypeStatement((String)param.get("datesTypeStatement"));//设置日期类型说明
            devWorkTime.setDates((String)param.get("dates"));
            devWorkTime.setStartTime((String)param.get("startTime"));
            devWorkTime.setEndTime((String)param.get("endTime"));
            try {
                devWorkTimeDao.add(devWorkTime);
            } catch (Exception e) {
                log.error("添加设备工作时间异常:",e);
                return new RspMsg("fail","添加设备工作时间异常");
            }
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("修改设备工作时间设定成功");
        log.info("修改设备工作时间设定成功 devNos:"+devNos);
        return rspMsg;
    }

    /**
     * 根据编号查询工作时间设定
     * @param devNo
     * @return
     */
    @Override
    public RspMsg qryById(String devNo){
        List<DevWorkTime> result = devWorkTimeDao.qryById(devNo);
        return new RspMsg("ok", "查询成功", result);
    }
}