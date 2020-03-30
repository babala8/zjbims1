package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.OrgDao;
import com.zjft.zhyg.system.dao.OrgWorkTimeSetDao;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.OrgWorkTimeService;
import com.zjft.zhyg.system.zjucp.POrgWorkTimeDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Transactional
@Service
public class OrgWorkTimeServiceImpl implements OrgWorkTimeService {
    private static final Logger log = LoggerFactory.getLogger(RoleServiceImpl.class);
    @Autowired
    private OrgWorkTimeSetDao orgWorkTimeSetDao;
    @Autowired
    private OrgDao orgDao;
    @Autowired(required = false)
    private POrgWorkTimeDao pOrgWorkTimeDao;

    @Override
    public RspMsg qryOrgWokTime(Map<String, String> param) {
        RspMsg rspMsg = new RspMsg();
        Map<String, Object> map = new HashMap<String, Object>();//设置特定的map用于查询 机构
        String orgNo = param.get("orgNo");
        map.put("orgNo", param.get("orgNo"));//设定orgNo="" 查询sql的条件不需要执行no=#{orgNo}
        //分页查询
        if (orgNo == null) {
            return new RspMsg("fail", "用户机构号不能为空");
        }
        int curPage = Integer.parseInt(param.get("curPage"));
        int pageSize = Integer.parseInt(param.get("pageSize"));
        Page<Map<String, String>> page = PageHelper.startPage(curPage, pageSize);
        List<Map<String, String>>  result = orgWorkTimeSetDao.qryOrgWorkTimes(map);
        PageInfo<Map<String, String>> pageInfo = new PageInfo<>(page.getResult());
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "没有机构");
        }

        for (Map<String, String> orgWorkTime : result) {
            String startTime = orgWorkTime.get("startTime");
            String endTime = orgWorkTime.get("endTime");
            String workTime = startTime + "-" + endTime;
            if (startTime != null && endTime != null) {
                orgWorkTime.put("workTime", workTime);
            } else {
                orgWorkTime.put("workTime", "");
            }
        }
        int totalRow = (int) pageInfo.getTotal();
        int totalPage = (int) Math.ceil((double) totalRow / pageSize);
        rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    /**
     * 查询机构信息
     *
     * @param param
     * @return
     */
    @Override
    public RspMsg qryOrg(Map<String, String> param) {
        RspMsg rspMsg = new RspMsg();
        Map<String, Object> map = new HashMap<String, Object>();//设置特定的map用于查询 机构
        map.put("userOrgNo", param.get("userOrgNo"));//设定userOrgNo="" 查询sql的条件不需要执行left_no&gt;=#{userLeftNo} and right_no&lt;=#{userRightNo}
        map.put("orgNo", "");//设定orgNo="" 查询sql的条件不需要执行no=#{orgNo}
        map.put("parentOrgNo", "");//设定parentOrgNo="" 查询sql的条件不需要执行 left_no&gt;=#{parentLeftNo} and right_no&lt;=#{parentRightNo}
        map.put("orgTypeNo", "");//设定orgTypeNo="" 查询sql的条件不需要执行org_type=#{orgTypeNo}
        //分页查询
        List<Org> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Org> page = PageHelper.startPage(curPage, pageSize);
            result = orgDao.qry(map);
            PageInfo<Org> pageInfo = new PageInfo<Org>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = orgDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "没有机构");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }


    /**
     * 查询机构类型
     *
     * @param
     * @return
     */
    public RspMsg orgType() {
        List<OrgType> result;
        result = orgWorkTimeSetDao.qryorgType();
        OrgType orgType = new OrgType();
        result.add(orgType);
        if (result.size() > 0) {
            return new RspMsg("ok", "查询机构类型成功", result);
        } else {
            return new RspMsg("fail", "查询机构类型异常,或没有机构类型");
        }
    }

    /**
     * 批量设置用户机构的正常工作时间
     *
     * @param
     * @return
     */
    public RspMsg setNormalWorkTime(Map<String, Object> params) {
        log.info("批量设置机构的正常工作时间开始");
        RspMsg rspMsg = new RspMsg();
        String[] nos = ((String) params.get("no")).split("-");
        String[] weeks = ((String) params.get("weekDays")).split("-");
        Map<String, String> weekName = new HashMap<>();
        weekName.put("Monday", "星期一");
        weekName.put("Tuesday", "星期二");
        weekName.put("Wednesday", "星期三");
        weekName.put("Thursday", "星期四");
        weekName.put("Friday", "星期五");
        weekName.put("Saturday", "星期六");
        weekName.put("Sunday", "星期天");
        List<String> mynos = new ArrayList<String>();
        for (int i = 0; i < nos.length; i++) {
            mynos.add(nos[i]);
        }
        OrgWorkTime orgWorkTime;
        List<OrgWorkTime> addTime = new ArrayList<OrgWorkTime>();
        for (int i = 0; i < nos.length; i++) {
            for (int j = 0; j < weeks.length; j++) {
                orgWorkTime = new OrgWorkTime();
                orgWorkTime.setLogicId(UUID.randomUUID().toString());
                orgWorkTime.setOrgNo(nos[i]);
                orgWorkTime.setDatesType(weeks[j]);
                orgWorkTime.setDatesTypeStatement(weekName.get(weeks[j]));
                orgWorkTime.setDates(" ");
                orgWorkTime.setStartTime((String) params.get("startWorkTime"));
                orgWorkTime.setEndTime((String) params.get("endWorkTime"));
                orgWorkTime.setBusinessFlag("");
                addTime.add(orgWorkTime);
            }
        }
        List<OrgWorkTime> onceTime = orgWorkTimeSetDao.onceWorkTime(mynos);//获得数据库中已选机构的工作时间数据
        List<String> delno = new ArrayList<String>();
        for (int i = 0; i < onceTime.size(); i++) {//获取数据库已有的数据
            delno.add(onceTime.get(i).getLogicId());
        }
        if (delno.size() != 0) {
            orgWorkTimeSetDao.delOnceWorkTime(delno);//删除已有的数据
            pOrgWorkTimeDao.delOnceWorkTime(delno);
        }
        for (OrgWorkTime a : addTime) {
            int result = orgWorkTimeSetDao.batchSpecialWorkTime(a);
            pOrgWorkTimeDao.batchSpecialWorkTime(a);
        }
        log.info("批量设置机构的正常工作时间成功");
        return new RspMsg();
    }

    /**
     * 批量设置用户机构的特殊工作时间
     *
     * @param
     * @return
     */
    public RspMsg setSpecialWorkTime(Map<String, Object> params) {
        log.info("批量设置机构的特殊工种时间开始");
        RspMsg rspMsg = new RspMsg();
        String[] nos = ((String) params.get("no")).split("-");
        List<String> mynos = new ArrayList<String>();
        for (int i = 0; i < nos.length; i++) {
            mynos.add(nos[i]);
        }
        List<OrgWorkTime> onceTime = orgWorkTimeSetDao.specialDate(mynos);
//        System.out.println(" 批量设置用户机构的特殊工作时间service");
        StringBuffer specialStartDate = new StringBuffer((String) params.get("specialStartDate"));
        specialStartDate.insert(6, "-");
        specialStartDate.insert(4, "-");

        StringBuffer specialEndDate = new StringBuffer((String) params.get("specialEndDate"));
        specialEndDate.insert(6, "-");
        specialEndDate.insert(4, "-");

        List<String> list = new ArrayList<String>();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date startDate = sf.parse(specialStartDate.toString());
            Date endDate = sf.parse(specialEndDate.toString());
            Calendar start = Calendar.getInstance();
            start.setTime(startDate);
            Calendar end = Calendar.getInstance();
            end.setTime(endDate);
            while (start.get(Calendar.YEAR) != end.get(Calendar.YEAR)
                    || start.get(Calendar.MONTH) != end.get(Calendar.MONTH)
                    || start.get(Calendar.DAY_OF_MONTH) != end.get(Calendar.DAY_OF_MONTH)) {
                String[] times = sf.format(start.getTime()).split("-");
                String time = new String();
                for (int i = 0; i < times.length; i++) {
                    if (i == 0) {
                        time = times[0];
                    } else {
                        time = time + times[i];
                    }
                }
                list.add(time);
                start.add(Calendar.DAY_OF_MONTH, 1);
            }
            String[] eTimes = sf.format(end.getTime()).split("-");
            String etime = new String();
            for (int i = 0; i < eTimes.length; i++) {
                if (i == 0) {
                    etime = eTimes[0];
                } else {
                    etime = etime + eTimes[i];
                }
            }
            list.add(etime);
        } catch (ParseException px) {
            log.warn("转换异常：", px);
        }

        List<OrgWorkTime> datas = new ArrayList<OrgWorkTime>();
        OrgWorkTime orgWorkTime;
        String LogicId;

        for (int i = 0; i < nos.length; i++) {//交机构与时间数据分成一条一条
            for (int j = 0; j < list.size(); j++) {
                orgWorkTime = new OrgWorkTime();
                LogicId = UUID.randomUUID().toString();
                orgWorkTime.setLogicId(LogicId);//设置逻辑主键
                orgWorkTime.setOrgNo(nos[i]);//设置设备号
                orgWorkTime.setDatesType("Special");
                orgWorkTime.setDatesTypeStatement("特殊日期");//设置日期类型说明
                orgWorkTime.setDates(list.get(j));
                orgWorkTime.setBusinessFlag((String) params.get("businessStatus"));
                orgWorkTime.setStartTime((String) params.get("specialStartWorkTime"));
                orgWorkTime.setEndTime((String) params.get("specialEndWorkTime"));
                datas.add(orgWorkTime);
            }
        }
        List<String> delno = new ArrayList<String>();
        for (int i = 0; i < onceTime.size(); i++) {//获取数据库时间重复的数据
            for (int j = 0; j < datas.size(); j++) {
                if (onceTime.get(i).getOrgNo().equals(datas.get(j).getOrgNo())
                        && onceTime.get(i).getDates().equals(datas.get(j).getDates())) {
                    delno.add(onceTime.get(i).getLogicId());
                }
            }
        }
        if (delno.size() != 0) {
            orgWorkTimeSetDao.delOnceWorkTime(delno);
            pOrgWorkTimeDao.delOnceWorkTime(delno);
        }
        for (OrgWorkTime o : datas) {
            int result = orgWorkTimeSetDao.batchSpecialWorkTime(o);
            pOrgWorkTimeDao.batchSpecialWorkTime(o);
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("批量设置机构的特殊工种时间成功");
        return new RspMsg();
    }

    @Override
    public RspMsg qryOrgSpecialDate(Map<String, String> param) {
        RspMsg rspMsg = new RspMsg();
        String orgNo = param.get("orgNo");
        if (StringUtils.isEmpty(orgNo)) {
            return new RspMsg("fail", "机构号不能为空");
        }
        List<Map<String, String>> result = new ArrayList<>();
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Org> page = PageHelper.startPage(curPage, pageSize);
            result = orgWorkTimeSetDao.qrySpecialDate(orgNo);
            PageInfo<Org> pageInfo = new PageInfo<Org>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = orgWorkTimeSetDao.qrySpecialDate(orgNo);
        }
        if (result == null) {
            return new RspMsg("fail", "无设置特殊日期记录");
        }
        for (Map<String, String> special : result) {
            String dates = special.get("dates");
            dates = dates.substring(0, 4) + "-" + dates.substring(4, 6) + "-" + dates.substring(6, 8);
            String start = special.get("startTime");
            String end = special.get("endTime");
            String workTime = start + "-" + end;
            special.put("dates", dates);
            special.put("workTime", workTime);
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    @Override
    public RspMsg delSpecial(Map<String, Object> param) {
        log.info("删除机构特殊工种日期开始：");
        RspMsg rspMsg = new RspMsg();
        List<String> logicIds = (List<String>) param.get("logicIds");
        try {
            if (logicIds != null) {
                orgWorkTimeSetDao.delOnceWorkTime(logicIds);
                pOrgWorkTimeDao.delOnceWorkTime(logicIds);
            }
        } catch (Exception e) {
            log.error("删除特殊日期失败", e);
            return new RspMsg("fail", "删除特殊日期异常");
        }
        log.info("删除特殊日期成功");
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("删除特殊日期成功");
        return rspMsg;
    }

    public RspMsg qryCooperationInfo() {
        try {
            List data = orgWorkTimeSetDao.qryCooperationInfo();
            return new RspMsg("ok", "获取供应商成功", data);
        } catch (Exception e) {
            return new RspMsg("fail", "获取供应商失败");
        }
    }
}
