package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.configure.MyProperties;
import com.zjft.zhyg.system.dao.DevBaseDao;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.dao.DevStatusDao;
import com.zjft.zhyg.system.dao.DevStatusExpandDao;
import com.zjft.zhyg.system.dto.DevBaseDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.zjucp.PDevBaseDao;
import com.zjft.zhyg.system.service.DevBaseService;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.autoconfigure.info.ConditionalOnEnabledInfoContributor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author:xss
 * @Description:设备信息实现类
 */
@Transactional
@Service
public class DevBaseServiceImpl implements DevBaseService {
    private static final Logger log=LoggerFactory.getLogger(DevBaseServiceImpl.class);

    @Autowired
    private DevBaseDao devBaseDao;
    @Autowired
    private DevCatalogDao devCatalogDao;
    @Autowired(required = false)
    private PDevBaseDao pDevBaseDao;
    @Autowired
    private DevStatusDao devStatusDao;
    @Autowired
    private DevStatusExpandDao devStatusExpandDao;
    @Autowired
    private MyProperties myProperties;

    /**
     * 动态查询设备信息
     *
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if(!StringUtils.isEmpty(param.get("userNo"))){
            // 查询用户是否拥有全部权限，没有则需要添加筛选条件
            if (devCatalogDao.allAccess(param.get("userNo")) == 0) {
                map.put("userNo",param.get("userNo"));
            }
        }
        if (!StringUtils.isEmpty(param.get("devNo"))) {
            map.put("devNo", param.get("devNo"));
        }
        if (!StringUtils.isEmpty(param.get("ip"))) {
            map.put("ip", param.get("ip"));
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
        if (!StringUtils.isEmpty(param.get("buyDate"))) {
            map.put("buyDate", param.get("buyDate"));
        }
        map.put("userOrgNo", devBaseDao.qryOrgByUser(param.get("userNo")));
        // 需要分页查询
        List<DevBase> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevBase> page = PageHelper.startPage(curPage, pageSize);
            result = devBaseDao.qry(map);
            PageInfo<DevBase> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devBaseDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备不存在");
        }
        List<DevBaseDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromDevBase).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    /**
     * 设备添加
     *
     * @param devBase
     * @return
     */
    @Override
    public RspMsg add(DevBase devBase) {
        log.info("开始添加设备 devBase:"+devBase.getNo());
        DevBase temp = devBaseDao.qryByNo(devBase.getNo());
        if (temp != null) {
            log.warn("设备已存在 devNo:"+devBase.getNo());
            return new RspMsg("fail", "设备已存在");
        }
        DevBase temp1 = devBaseDao.qryIpByIp(devBase.getIp());
        if (temp1 != null) {
            log.warn("IP已存在 ip"+devBase.getIp());
            return new RspMsg("fail", "IP已存在");
        }
        // 防止远程控制传输文件时出错
        if (StringUtils.isEmpty(devBase.getCommPacket()) || "0".equals(devBase.getCommPacket())) {
            devBase.setCommPacket("8092");
        }
        devBase.setOperateStatus("1");//新增设备，运营状态默认启用
        devBaseDao.add(devBase);
        //添加设备运营状态：1.合作笔数 2.是否自助银行 3.投入主体d
        //devBaseDao.addDevOperate(devBase);
        //添加对应设备的设备模块状态
        addDevStatus(devBase);
        //添加设备号到设备模块状态扩展表
        addDevStatusExpand(devBase.getNo());

        // 添加设备号到业务参数配置表
        addParamBusinessConf(devBase.getNo(),devBase.getAddUser());
        if(syncXlinkDev()){
            try {
                if(pDevBaseDao.qry(devBase.getNo())==null){
                    pDevBaseDao.add(devBase);
                }
            } catch (Exception e) {
                log.error("插入P端设备数据失败:",e);
                throw  new RuntimeException();
            }
        }
        log.info("添加设备成功 devBase:"+devBase);
        return new RspMsg("ok", "添加设备成功");

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
            devBaseDao.addParamConf(param);
            log.info("同步默认参数到业务参数配置表成功 devNo:"+devNo);
        } catch (Exception e) {
            log.error("同步默认参数到业务参数配置表异常:",e);
            throw new RuntimeException();//不抛出异常事务不会回滚
        }
    }

    /**
     * 根据设备，添加对应的设备状态
     * @param devBase
     */
    public void addDevStatus(DevBase devBase){
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
            devStatusDao.add(devStatus);
            log.info("插入设备状态成功 devNo"+devBase.getNo());
        } catch (Exception e) {
            log.error("插入设备状态异常:",e);
        }
    }

    /**
     *添加设备号到设备模块状态扩展表
     * @param  devNo
     */
    void addDevStatusExpand(String devNo){
        log.info("添加设备号到设备模块状态扩展表 devNo:"+devNo);
        try {
            devStatusExpandDao.add(devNo);
            log.info("插入设备模块扩展成功 devNo:"+devNo);
        } catch (Exception e) {
            log.error("插入设备模块扩展异常:"+e);
        }
    }

    /**
     * 根据设备号查询设备信息
     *
     * @param devNo
     * @return
     */
    @Override
    public RspMsg qryByNo(String devNo) {
        DevBase devBase = devBaseDao.qryByNo(devNo);
        if (devBase == null) {
            return new RspMsg("fail", "设备不存在");
        } else {
            Map<String, Object> operate = devBaseDao.qryDevOperate(devNo);
            //查询p端运营状态
            Map<String, Object> pDev = pDevBaseDao.qry(devNo);
            DevBaseDto dtoResult = DtoMapper.MAPPER.fromDevBase(devBase);
            dtoResult.setSelfBank(devBase.getSelfBank());
            dtoResult.setInvestment(devBase.getInvestment());
            dtoResult.setOpenTime(devBase.getOpenTime());
            dtoResult.setCloseTime(devBase.getCloseTime());
            dtoResult.setAccountOrgNo(devBase.getAccountOrgNo());
            dtoResult.setAreaNo(devBase.getAreaNo());
            //添加设备运营信息
            if(operate!=null){
                dtoResult.setQuarterLeaseAmount(operate.get("quarterLeaseAmount")==null?null:(String)operate.get("quarterLeaseAmount"));
                dtoResult.setSelfBank(operate.get("selfbank")==null?null:(String)operate.get("selfbank"));
                dtoResult.setInvestment(operate.get("investment")==null?null:(String)operate.get("investment"));
                dtoResult.setCooperationNumber(operate.get("cooperationNumber")==null?null:Integer.valueOf(operate.get("cooperationNumber").toString()));
                dtoResult.setAreaDiv(operate.get("areaDiv")==null?null:(String)operate.get("areaDiv"));
                dtoResult.setBelongarea(operate.get("belongarea")==null?null:(String)operate.get("belongarea"));
                dtoResult.setCooperation(operate.get("cooperation")==null?null:(String)operate.get("cooperation"));
                dtoResult.setChangeDate(operate.get("changeDate")==null?null:(String)operate.get("changeDate"));
                dtoResult.setUseStatus(operate.get("useStatus")==null?null:(String)operate.get("useStatus"));
                dtoResult.setAssetsNo(operate.get("assetsNo")==null?null:(String)operate.get("assetsNo"));
                dtoResult.setNetworkOperator(operate.get("networkOperator")==null?null:(String)operate.get("networkOperator"));
                dtoResult.setRemark(operate.get("remark")==null?null:(String)operate.get("remark"));
                dtoResult.setInstallSite((String)operate.get("installSite"));
                dtoResult.setCaseWay(operate.get("caseWay")==null?null:(String)operate.get("caseWay"));
                dtoResult.setCurrstatus((String)pDev.get("CURRSTATUS"));
            }
            return new RspMsg("ok", "查询成功", dtoResult);
        }
    }

    /**
     * 修改设备
     * @param newObj 修改后的对象
     * @param oldObj 修改前的对象
     * @return
     */
    @Override
    public RspMsg mod(DevBase newObj,DevBase oldObj) {
        log.info("修改设备开始 devNo:"+newObj.getNo());
        DevBase temp=null;
        if (!newObj.getIp().equals(oldObj.getIp())){
            temp = devBaseDao.qryIpByIpNo(newObj.getIp(), newObj.getNo());
        }
        // DevBase temp = devBaseDao.qryIpByIpNo(newObj.getIp(), newObj.getNo());
        if (temp != null) {
            log.warn("IP已存在 ip"+newObj.getIp());
            return new RspMsg("fail", "IP已存在");
        }
        devBaseDao.mod(newObj);
        //修改设备运营状态
        //devBaseDao.modDevOperate(newObj);
        //todo 本地开发没用到，麻烦自行打开
        if(syncXlinkDev()){
            try {
                if(pDevBaseDao.qry(newObj.getNo())==null){
                    pDevBaseDao.add(newObj);
                }else {
                    pDevBaseDao.mod(newObj);
                }
            } catch (Exception e) {
                log.error("修改P端设备数据失败:"+e);
            }
        }
        log.info("修改设备成功 devNo:"+newObj.getNo());
        return new RspMsg("ok", "修改设备成功");
    }

    /**
     * 删除设备
     *
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("删除设备开始 devNo:"+no);
        DevBase devBase = devBaseDao.qryByNo(no);
        //删除设备运营状态信息
        if (devBase == null) {
            if(syncXlinkDev()){
                pDevBaseDao.del(no);
            }
            log.warn("设备不存在 devNo:"+no);
            return new RspMsg("fail", "设备不存在");
        } else {
           /* //added:添加删除设备模块状态扩展表中对应数据
            devStatusExpandDao.del(no);
            //added:添加删除设备状态表中数据
            devStatusDao.del(no);
            devBaseDao.del(no);*/
            //删除涉及到此设备的其他表中的数据
            devBaseDao.delAllReferDevNo(no);
            devBaseDao.delDevOperate(no);
            if(syncXlinkDev()){
                try {
                    pDevBaseDao.del(no);
                } catch (Exception e) {
                    log.error("删除P端设备数据失败:"+e);
                }
            }
            log.info("删除设备成功 devNo:"+no);
            return new RspMsg("ok", "删除设备成功");
        }
    }

    /**
     * 查所有机构类型
     * @return
     */
    @Override
    public RspMsg qryOrgTYpes() {
        List<OrgType> res = devBaseDao.qryOrgTypes();
        if (res.size()==0){
            return new RspMsg("fail","没有数据");
        }
        return new RspMsg("ok","投入主体数据查询成功",res);
    }

    private boolean syncXlinkDev(){
        return "Y".equalsIgnoreCase(myProperties.getProperty("syncXlinkDevFlag"));
    }
}