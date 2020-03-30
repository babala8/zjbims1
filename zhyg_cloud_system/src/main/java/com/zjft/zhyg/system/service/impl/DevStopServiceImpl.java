package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevBaseDao;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.dao.DevStopDao;
import com.zjft.zhyg.system.dao.RunStatusDao;
import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.DevStop;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevStopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DevStopServiceImpl  implements DevStopService {
    private static final Logger log = LoggerFactory.getLogger(DevBaseServiceImpl.class);

    @Autowired
    DevStopDao devStopDao;
    @Autowired
    DevBaseDao devBaseDao;
    @Autowired
     DevCatalogDao devCatalogDao;
    @Autowired
    RunStatusDao runStatusDao;

    @Override
    public RspMsg qryByDevNo(String no) {
        List<DevStop> devStops = devStopDao.qryByDevNo(no);
        if (devStops == null) {
            return new RspMsg("fail", "该设备不存在");
        } else {
            return new RspMsg("ok", "查询成功", devStops);
        }
    }

    @Override
    public RspMsg add(DevStop devStop) {
        log.info("添加设备停机 devStop:{}",devStop);
        DevBase devBase = devBaseDao.qryByNo(devStop.getDevNo());
        if (devBase == null) {
            log.warn("该设备不存在，devNo:{ }",devStop.getDevNo());
            return new RspMsg("fail", "该设备不存在");
        }
        if (!checkDevStop(devStop)) {
            log.warn("该时间段已有停机，devStop:{ }",devStop);
            return new RspMsg("fail", "该时间段已有停机");
        }
        if(devStop.getIsAfter()==1){
            runStatusDao.deleteByTime(devStop);
        }
        devStopDao.add(devStop);
        log.info("添加设备停机成功 devStop:"+devStop);
        return new RspMsg("ok", "添加设备停机成功");
    }

    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        RspMsg rspMsg = new RspMsg();
        if(!StringUtils.isEmpty(param.get("userNo"))){
            if (devCatalogDao.allAccess(param.get("userNo")) == 0) {
                map.put("userNo",param.get("userNo"));
            }
        }
        if (!StringUtils.isEmpty(param.get("devNo"))) {
            map.put("devNo", param.get("devNo"));
        }
        if (!StringUtils.isEmpty(param.get("devIp"))) {
            map.put("devIp", param.get("devIp"));
        }
        if (!StringUtils.isEmpty(param.get("orgNo"))) {
            map.put("orgNo", param.get("orgNo"));
        }
        if (!StringUtils.isEmpty(param.get("devType"))) {
            map.put("devType", param.get("devType"));
        }
        if (!StringUtils.isEmpty(param.get("devCatalog"))) {
            map.put("devCatalog", param.get("devCatalog"));
        }
        if (!StringUtils.isEmpty(param.get("devVendor"))) {
            map.put("devVendor", param.get("devVendor"));
        }
        if (!StringUtils.isEmpty(param.get("operateStatus"))) {
            map.put("operateStatus", param.get("operateStatus"));
        }
        if (!StringUtils.isEmpty(param.get("address"))) {
            map.put("address", param.get("address"));
        }
        if (!StringUtils.isEmpty(param.get("stopDevEndTime"))) {
            map.put("stopDevEndTime", param.get("stopDevEndTime"));
        }
        map.put("nowDate",sdf.format(new Date()));
        System.out.println(map);
        List<Map<String, String>> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Map<String, String>> page = PageHelper.startPage(curPage, pageSize);
            result = devStopDao.qry(map);
            PageInfo<Map<String, String>> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devStopDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    @Override
    public RspMsg qryStopDevDetail(Map<String, String> param) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if (!StringUtils.isEmpty(param.get("devNo"))) {
            map.put("devNo", param.get("devNo"));
        }
        if (!StringUtils.isEmpty(param.get("stopDevType"))) {
            map.put("stopDevType", param.get("stopDevType"));
        }
        if (!StringUtils.isEmpty(param.get("orgNo"))) {
            map.put("orgNo", param.get("orgNo"));
        }
        if (!StringUtils.isEmpty(param.get("devType"))) {
            map.put("devType", param.get("devType"));
        }
        if (!StringUtils.isEmpty(param.get("devCatalog"))) {
            map.put("devCatalog", param.get("devCatalog"));
        }
        if (!StringUtils.isEmpty(param.get("devVendor"))) {
            map.put("devVendor", param.get("devVendor"));
        }
        if (!StringUtils.isEmpty(param.get("stopDevStartTime"))) {
            map.put("stopDevStartTime", param.get("stopDevStartTime"));
        }
        if (!StringUtils.isEmpty(param.get("stopDevEndTime"))) {
            map.put("stopDevEndTime", param.get("stopDevEndTime"));
        }
        System.out.println(map);
        List<Map<String, String>> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Map<String, String>> page = PageHelper.startPage(curPage, pageSize);
            result = devStopDao.qryStopDevDetail(map);
            PageInfo<Map<String, String>> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devStopDao.qryStopDevDetail(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "无停机记录");
        }
        for (Map<String, String> res : result) {
            String startDate = res.get("stopDevStartTime").substring(0, 16);
            String endDate = res.get("stopDevEndTime").substring(0, 16);
            try {
                long startTime = sdf.parse(startDate).getTime();
                long endTime = sdf.parse(endDate).getTime();
                int hours = (int) ((endTime - startTime) / (60 * 60  * 1000));
                res.put("hours", hours + "");
            } catch (Exception e) {
                return new RspMsg("fail", "日期格式错误");
            }


        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    public boolean checkDevStop(DevStop devStop) {
        List<DevStop> devStops = devStopDao.qryByDevNo(devStop.getDevNo());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            long startTime = sdf.parse(devStop.getStopDevStartTime()).getTime();
            long endTime = sdf.parse(devStop.getStopDevEndTime()).getTime();
            for (DevStop devStop1 : devStops) {
                if(!devStop.getLogicId().equals(devStop1.getLogicId())){
                    long startTime1 = sdf.parse(devStop1.getStopDevStartTime()).getTime();
                    long endTime1 = sdf.parse(devStop1.getStopDevEndTime()).getTime();
                    if (startTime > startTime1 && startTime < endTime1) {
                        return false;
                    }
                    if (endTime > startTime1 && endTime < endTime1) {
                        return false;
                    }
                }
            }
        } catch (Exception e) {
        }
        return true;
    }

    @Override
    public RspMsg qryByLogicId(String logicId){
        DevStop devStop = devStopDao.qryByLogicId(logicId);
        if (devStop == null) {
            return new RspMsg("fail", "该设备不存在");
        } else {
            return new RspMsg("ok", "查询成功", devStop);
        }
    }

    public RspMsg mod(DevStop devStop){
        log.info("修改设备停机开始,logicId:"+devStop.getLogicId());
        DevStop devStop1 = devStopDao.qryByLogicId(devStop.getLogicId());
        if(devStop1==null){
            log.warn("该记录不存在,devStop:{}",devStop);
            return  new RspMsg("fail","该记录不存在");
        }
        devStop.setIsAfter(devStop1.getIsAfter());
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String setTime = dateFormat.format(now);
        devStop.setSetTime(setTime);
        Integer isAfter = devStop1.getIsAfter();
        Integer status=0;
        devStop.setStatus(status);
        if (!checkDevStop(devStop)) {
            log.warn("该时间段已有停机,devStop:{}",devStop);
            return new RspMsg("fail", "该时间段已有停机");
        }
        devStopDao.mod(devStop);
        log.info("修改停机信息成功,logicId:"+devStop.getLogicId());
        return new RspMsg("ok","修改停机信息成功");
    }

    /**
     * 查询设备停机历史
     * @param param
     * @return
     */
    @Override
    public RspMsg qryStopHis(Map<String,String > param) {
        if (StringUtils.isEmpty(param.get("devNo"))){
            return new RspMsg("fail","设备号不能为空");
        }
        if (StringUtils.isEmpty(param.get("orgNo"))){
            return new RspMsg("fail","用户所属机构不能为空");
        }
        RspMsg rspMsg = new RspMsg();
        Map<String,Object> map = new HashMap<>();
        map.put("devNo",param.get("devNo"));
        map.put("orgNo",param.get("orgNo"));
        if (!StringUtils.isEmpty(param.get("userNo"))){
            if (devCatalogDao.allAccess(param.get("userNo"))==0){
                map.put("userNo",param.get("userNo"));
            }
        }
        List<Map<String,String>> res;
        System.out.println(map+"996");
        res = devStopDao.qryStopHis(map);
        System.out.println(res);
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Map<String, String>> page = PageHelper.startPage(curPage, pageSize);
            res = devStopDao.qryStopHis(map);
            PageInfo<Map<String, String>> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        }else{
            res = devStopDao.qryStopHis(map);
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(res);
        return rspMsg;
    }

    /**
     * 查设备停机设定开始时间距当前时间的最小期限
     * @param userOrgNo
     * @return
     */
    @Override
    public RspMsg getMinDays(String userOrgNo) {
        if (StringUtils.isEmpty(userOrgNo)){
            return new RspMsg("fail","用户所属机构为空");
        }
        String res = devStopDao.getMinDays();
        if (StringUtils.isEmpty(res)){
            res = "7";//为空则设置7天默认
        }
        return new RspMsg("ok","查询成功",res);
    }

    /**
     * 更改设备事后停机开始时间期限
     * @param param
     * @return
     */
    @Override
    public RspMsg modMinDays(Map<String, String> param) {
        if (StringUtils.isEmpty(param.get("userOrgNo"))){
            return new RspMsg("fail","用户所属机构为空");
        }
        if (StringUtils.isEmpty(param.get("days"))){
            return new RspMsg("fail","需要修改的参数值不能为空");
        }
        devStopDao.modMinDays(param.get("days"));
        return new RspMsg("ok","修改成功");
    }

}


