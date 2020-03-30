package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.dao.DevResponsorDao;
import com.zjft.zhyg.system.pojo.DevResponsor;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevResponsorService;
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

/**
 * @Author:xss
 * @Description:设备责任人实现类
 */
@Transactional
@Service
public class DevResponsorServiceImpl implements DevResponsorService {

    private static final Logger log = LoggerFactory.getLogger(DevResponsorServiceImpl.class);


    @Autowired
    private DevResponsorDao devResponsorDao;
    @Autowired
    private DevCatalogDao devCatalogDao;
    /**
     * 查询设备责任人信息
     *
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
        if (!StringUtils.isEmpty(param.get("orgNo"))) {
            map.put("orgNo", param.get("orgNo"));
        }
        if (!StringUtils.isEmpty(param.get("devNo"))) {
            map.put("devNo", param.get("devNo"));
        }
        // 需要分页查询
        List<Map<String, Object>> resultList;
        List<Map<String, Object>> result = new ArrayList<>();
        int curPage = Integer.parseInt(param.get("curPage"));
        int pageSize = Integer.parseInt(param.get("pageSize"));
        Page<DevResponsor> page = PageHelper.startPage(curPage, pageSize);
        resultList = devResponsorDao.qryList(map);
        Map<String, Object> devMap = null;
        Map<String, Object> devResponsorMap = null;
        //管机员
        List<Object> managerfirst = null;
        List<Object> managersecond = null;
        List<Object> managerthird = null;
        //维护员
        List<String> servicefirst = null;
        List<String> servicesecond = null;
        List<String> servicethird = null;
        for (int i = 0; i < resultList.size(); i++) {
            devMap = resultList.get(i);
            String no = String.valueOf(devMap.get("devNo"));
            String orgNo = String.valueOf(devMap.get("orgNo"));
            String orgName = devResponsorDao.qryOrgName(no);
            List<DevResponsor> result1 = devResponsorDao.qry(no);
            devResponsorMap = new HashMap<>();
            //管机员
            managerfirst = new ArrayList<>();
            managersecond = new ArrayList<>();
            managerthird = new ArrayList<>();
            //维护员
            servicefirst = new ArrayList<>();
            servicesecond = new ArrayList<>();
            servicethird = new ArrayList<>();
            DevResponsor responsor = null;
            if (result1.size() >= 1) {
                for (int j = 0; j < result1.size(); j++) {
                    responsor = result1.get(j);
                    String devNo = String.valueOf(responsor.getDevNo());
                    String grade = String.valueOf(responsor.getGrade());
                    String catalog = String.valueOf(responsor.getCatalog());
                    String responserNo = String.valueOf(responsor.getResponserNo());
                    //管机员
                    if ("1".equals(catalog)) {
                        List<Map<String, Object>> result2 = devResponsorDao.qryManager(responserNo);
                        if (result2.size() >= 1) {
                            for (int k = 0; k < result2.size(); k++) {
                                Map<String, Object> devMap2 = null;
                                devMap2 = result2.get(k);
                                switch (grade) {
                                    case "1"://管机员1
                                        managerfirst.add(devMap2);
                                        break;
                                    case "2"://管机员2
                                        managersecond.add(devMap2);
                                        break;
                                    case "3"://管机员3
                                        managerthird.add(devMap2);
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }

                    } else if ("2".equals(catalog)) { //维护员
                        List<Map<String, Object>> result3 = devResponsorDao.qryService(responserNo);
                        if (result3.size() >= 1) {
                            for (int m = 0; m < result3.size(); m++) {
                                Map<String, Object> devMap3 = null;
                                devMap3 = result3.get(m);
                                String serviceNo = String.valueOf(devMap3.get("no"));
                                String serviceName = String.valueOf(devMap3.get("name"));
                                switch (grade) {
                                    case "1":
                                        servicefirst.add(serviceName);
                                        break;
                                    case "2":
                                        servicesecond.add(serviceName);
                                        break;
                                    case "3":
                                        servicethird.add(serviceName);
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }
                    }

                }
            }
            devResponsorMap.put("devNo", no);
            devResponsorMap.put("orgNo", orgNo);
            devResponsorMap.put("orgName", orgName);
            devResponsorMap.put("managerfirst", managerfirst);
            devResponsorMap.put("managersecond", managersecond);
            devResponsorMap.put("managerthird", managerthird);
            devResponsorMap.put("servicefirst", servicefirst);
            devResponsorMap.put("servicesecond", servicesecond);
            devResponsorMap.put("servicethird", servicethird);
            result.add(devResponsorMap);
            log.info("result"+result);
        }
        PageInfo<DevResponsor> pageInfo = new PageInfo<>(page.getResult());
        int totalRow = (int) pageInfo.getTotal();
        int totalPage = (int) Math.ceil((double) totalRow / pageSize);
        rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备责任人不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    /**
     * 查询已设置和未设置的设备责任人
     * @param param
     * @return
     */
    @Override
    public RspMsg qrySet(Map<String, String> param) {
        RspMsg rspMsg = new RspMsg();
        List<Map<String, Object>> result = new ArrayList<>();
        Map<String, Object> devResponsorMap = new HashMap<>();
        String devNo = param.get("devNo");
        String orgNo = param.get("orgNo");
        Map<String, Object> map = qrySelector(devNo);
        log.info(map.toString()+"map");
        if (!StringUtils.isEmpty(map.get("managerfirst"))){
            devResponsorMap.put("managerfirst", map.get("managerfirst"));
        }
        if (!StringUtils.isEmpty(map.get("managersecond"))){
            devResponsorMap.put("managersecond", map.get("managersecond"));
        }
        if (!StringUtils.isEmpty(map.get("managerthird"))){
            devResponsorMap.put("managerthird", map.get("managerthird"));
        }
        if (!StringUtils.isEmpty(map.get("servicefirst"))){
            devResponsorMap.put("servicefirst", map.get("servicefirst"));
        }
        if (!StringUtils.isEmpty(map.get("servicesecond"))){
            devResponsorMap.put("servicesecond", map.get("servicesecond"));
        }
        if (!StringUtils.isEmpty(map.get("servicethird"))){
            devResponsorMap.put("servicethird", map.get("servicethird"));
        }
        List<String> managerList = (List<String>) map.get("manager");
        List<String> serviceList = (List<String>) map.get("service");
        //根据设备号，机构号获取未设置的设备管机员
        List<String> manager = devResponsorDao.qryAllManager(orgNo);
        manager.removeAll(managerList);
        if (!manager.isEmpty()) {
            devResponsorMap.put("manager", manager);
        }else {
            devResponsorMap.put("manager",null);
        }
        //根据设备号查询未设置的设备维护员
        List<String> service = devResponsorDao.qryAllService();
        service.removeAll(serviceList);
        if (!service.isEmpty()) {
            devResponsorMap.put("service", service);
        }
        result.add(devResponsorMap);
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备责任人不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    /**
     * 根据设备号查询已设置的设备管机员和维护人员
     * @param devNo
     * @return
     */
    @Override
    public Map<String, Object> qrySelector(String devNo) {
        Map<String, Object> map = new HashMap<>();
        //管机员
        List<String> managerfirst = new ArrayList<>();
        List<String> managersecond = new ArrayList<>();
        List<String> managerthird = new ArrayList<>();
        List<String> manager = new ArrayList<>();
        //维护员
        List<String> servicefirst = new ArrayList<>();
        List<String> servicesecond = new ArrayList<>();
        List<String> servicethird = new ArrayList<>();
        List<String> service = new ArrayList<>();
        List<DevResponsor> result = devResponsorDao.qry(devNo);
        DevResponsor responsor = null;
        if (result.size() >= 1) {
            for (int j = 0; j < result.size(); j++) {
                responsor = result.get(j);
                String grade = String.valueOf(responsor.getGrade());
                String catalog = String.valueOf(responsor.getCatalog());
                String responserNo = String.valueOf(responsor.getResponserNo());
                //管机员
                if ("1".equals(catalog)) {
                    List<Map<String, Object>> result2 = devResponsorDao.qryManager(responserNo);
                    if (result2.size() >= 1) {
                        for (int k = 0; k < result2.size(); k++) {
                            Map<String, Object> devMap2 = null;
                            devMap2 = result2.get(k);
                            String managerName = String.valueOf(devMap2.get("name"));
                            manager.add(managerName);
                            switch (grade) {
                                case "1"://管机员1
                                    managerfirst.add(managerName);
                                    break;
                                case "2"://管机员2
                                    managersecond.add(managerName);
                                    break;
                                case "3"://管机员3
                                    managerthird.add(managerName);
                                    break;
                                default:
                                    break;
                            }
                            log.info("managerName" + managerfirst + "  " + managersecond + "  " + managerthird + "22");
                        }
                    }

                } else if ("2".equals(catalog)) { //维护员
                    List<Map<String, Object>> result3 = devResponsorDao.qryService(responserNo);
                    if (result3.size() >= 1) {
                        for (int m = 0; m < result3.size(); m++) {
                            Map<String, Object> devMap3 = null;
                            devMap3 = result3.get(m);
                            String serviceName = String.valueOf(devMap3.get("name"));
                            service.add(serviceName);
                            switch (grade) {
                                case "1":
                                    servicefirst.add(serviceName);
                                    break;
                                case "2":
                                    servicesecond.add(serviceName);
                                    break;
                                case "3":
                                    servicethird.add(serviceName);
                                    break;
                                default:
                                    break;
                            }
                        }
                    }
                }
            }
        }
        map.put("managerfirst", managerfirst);
        map.put("managersecond", managersecond);
        map.put("managerthird", managerthird);
        map.put("servicefirst", servicefirst);
        map.put("servicesecond", servicesecond);
        map.put("servicethird", servicethird);
        map.put("manager", manager);
        map.put("service", service);
        return map;
    }

    /**
     * 设置设备责任人
     * @param param
     * @return
     */
    @Override
    public RspMsg set(Map<String, String> param){
        log.info("开始设置设备责任人 devNo:"+param.get("devNo"));
        RspMsg rspMsg = new RspMsg();
        String devNo = param.get("devNo");
        String  orgNo = param.get("orgNo");
        String managerfirst = param.get("managerfirst");
        String managersecond = param.get("managersecond");
        String managerthird = param.get("managerthird");
        String servicefirst = param.get("servicefirst");
        String servicesecond = param.get("servicesecond");
        String servicethird = param.get("servicethird");
        log.info("devNo:"+devNo+",managerfirst:"+managerfirst+",managersecond:"+managersecond+",managerthird:"+managerthird+",servicefirst:"+servicefirst+",servicesecond:"+servicesecond+",servicethird:"+servicethird);
        List<DevResponsor> paramList = new ArrayList<>();
        if( managerfirst.length()>=3) {
            String []params = managerfirst.substring(1,managerfirst.length()-1).split("\\|");
            for(String str:params) {
                paramList.add(managerList("1", devNo, str,orgNo));
            }

        }

        if(managersecond.length()>=3) {
            String []params = managersecond.substring(1,managersecond.length()-1).split("\\|");
            for(String str:params) {
                paramList.add(managerList("2", devNo,  str,orgNo));
            }
        }

        if(managerthird.length()>=3) {
            String []params = managerthird.substring(1,managerthird.length()-1).split("\\|");
            for(String str:params) {
                paramList.add(managerList("3", devNo, str,orgNo));
            }
        }

        if(servicefirst.length()>=3) {
            String []params = servicefirst.substring(1,servicefirst.length()-1).split("\\|");
            for(String str:params) {
                paramList.add(serviceList("1", devNo, str));
            }
        }

        if(servicesecond.length()>=3) {
            String []params = servicesecond.substring(1,servicesecond.length()-1).split("\\|");
            for(String str:params) {
                paramList.add(serviceList("2", devNo, str));
            }
        }

        if(servicethird.length()>=3) {
            String []params = servicethird.substring(1,servicethird.length()-1).split("\\|");
            for(String str:params) {
                paramList.add(serviceList("3", devNo, str));
            }
        }
        devResponsorDao.del(devNo);
        if (paramList.size()>0) {
            try {
                devResponsorDao.add(paramList);
            } catch (Exception e) {
                log.error("设置设备责任人异常：",e);
                throw new RuntimeException();//不抛出异常事务不会回滚
            }
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("设置设备责任人成功");
        log.info("设置设备责任人成功 devNo:"+devNo);
        return rspMsg;

    }


    /**
     * 根据管机员名字设置设备责任人
     * @param flag
     * @param devNo
     * @param manager
     * @return
     */
    @Override
    public DevResponsor managerList(String flag,String devNo,String manager,String orgNo){
        log.info("根据管机员名字设置设备责任人 devNo:"+devNo);
        DevResponsor managerList = new DevResponsor();
        if(!StringUtils.isEmpty(manager)) {
            try {
                String uuid = UUID.randomUUID().toString();

                String no =devResponsorDao.qryManagerByName(manager,orgNo);

                if(!StringUtils.isEmpty(no)) {
                    managerList.setLogicId(uuid);
                    managerList.setDevNo(devNo);
                    managerList.setCatalog("1");
                    managerList.setGrade(flag);
                    managerList.setResponserNo(no);
                }

            } catch (Exception e) {
                log.error("管机员查询失败：", e);
            }
        }
        log.info("设置设备责任人成功 devNo:"+devNo);
        return managerList;

    }
    /**
     * 根据维护员名字设置设备责任人
     * @param flag
     * @param devNo
     * @param service
     * @return
     */
    @Override
    public DevResponsor serviceList(String flag,String devNo,String service){
        log.info("根据维护员名字设置设备责任人开始 devNo:"+devNo);
        DevResponsor serviceList = new DevResponsor();
        if(!StringUtils.isEmpty(service)) {
            try {
                String uuid = UUID.randomUUID().toString();

                String no =devResponsorDao.qryServiceByName(service);

                if(!StringUtils.isEmpty(no)) {
                    serviceList.setLogicId(uuid);
                    serviceList.setDevNo(devNo);
                    serviceList.setCatalog("2");
                    serviceList.setGrade(flag);
                    serviceList.setResponserNo(no);
                }

            } catch (Exception e) {
                log.error("维护员查询失败：", e);
            }
        }
        return serviceList;

    }



}