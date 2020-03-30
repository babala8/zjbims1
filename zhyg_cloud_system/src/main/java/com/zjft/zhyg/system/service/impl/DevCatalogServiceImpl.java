package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.DevCatalogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Author:limengrd
 * @Description:设备类型实现类
 */
@Service
public class DevCatalogServiceImpl implements DevCatalogService {
    private static final Logger log = LoggerFactory.getLogger(DevCatalogServiceImpl.class);

    @Autowired
    DevCatalogDao devCatalogDao;

    /**
     * 根据监控类型查询设备类型信息
     * @param monitorType
     * @return
     */
    @Override
    public RspMsg qryDevCatalogByMonitorType(String monitorType) {
        RspMsg rspMsg = new RspMsg();
        List<Map<String,Object>> list = devCatalogDao.qryDevCatalogByMonitorType(monitorType);
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("根据监控类型查询设备类型信息成功");
        rspMsg.setData(list);
        return rspMsg;
    }


    /**
     * 动态查询设备类型信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param){
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if(!StringUtils.isEmpty(param.get("userNo"))){
            if (devCatalogDao.allAccess(param.get("userNo")) == 0) {
                map.put("userNo",param.get("userNo"));
            }
        }
        if (!StringUtils.isEmpty(param.get("no"))) {
            map.put("no", param.get("no"));
        }
        if (!StringUtils.isEmpty(param.get("enname"))) {
            map.put("enname", param.get("enname"));
        }
        List<DevCatalog> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevCatalog> page = PageHelper.startPage(curPage, pageSize);
            result = devCatalogDao.qry(map);
            PageInfo<DevCatalog> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devCatalogDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备类型不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }
    /**
     * 设备类型添加
     * @param devCatalog
     * @return
     */
    @Override
    public RspMsg add(DevCatalog devCatalog) {
        log.info("开始设备类型添加 no:"+devCatalog.getNo());
        if (devCatalogDao.qryByNo(devCatalog.getNo()) != null) {
            log.warn("设备类型编号已存在 no:"+devCatalog.getNo());
            return new RspMsg("fail", "设备类型编号已存在");
        }
        if (devCatalogDao.qryByName(devCatalog.getEnname()) != null) {
            log.warn("设备类型已存在 name:"+devCatalog.getEnname());
            return new RspMsg("fail", "设备类型已存在");
        }
        devCatalog.setName(devCatalog.getNo());
        devCatalogDao.add(devCatalog);
        log.info("添加设备类型成功 devCatalog:"+devCatalog);
        return new RspMsg("ok", "添加设备类型成功");

    }

    /**
     * 根据设备类型编号查询设备类型信息
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        DevCatalog devCatalog = devCatalogDao.qryByNo(no);
        if (devCatalog == null) {
            return new RspMsg("fail", "设备类型不存在");
        } else {
            return new RspMsg("ok", "查询成功", devCatalog);
        }
    }

    /**
     * 查询所有设备类型
     * @param
     * @return
     */
    @Override
    public RspMsg qryAllDevCatalogs() {
        RspMsg rspMsg = new RspMsg();
        List<Map<String,Object>> list = devCatalogDao.qryAllDevCatalogs();
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询所有设备类型信息成功");
        rspMsg.setData(list);
        return rspMsg;
    }

    /**
     * 修改设备类型
     * @param newObj
     * @param oldObj
     * @return
     */
    @Override
    public RspMsg mod(DevCatalog newObj,DevCatalog oldObj) {
        log.info("设备类型修改开始 no:"+newObj.getNo());
        // DevCatalog temp = devCatalogDao.qryByNameNo(devCatalog.getName(),devCatalog.getNo());
        DevCatalog temp=null;
        if (!newObj.getEnname().equals(oldObj.getEnname())){
             temp = devCatalogDao.qryByName(newObj.getEnname());
        }
        if (temp != null) {
            log.warn("设备类型重复 name:"+newObj.getEnname());
            return new RspMsg("fail", "设备类型重复");
        }
        devCatalogDao.mod(newObj);
        log.info("修改设备类型成功 devCatalog:"+newObj);
        return new RspMsg("ok", "修改设备类型成功");

    }
    /**
     * 设备类型删除
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("设备类型删除开始 no:"+no);
        DevCatalog devVendor = devCatalogDao.qryByNo(no);
        if (devVendor == null) {
            log.warn("设备类型已被删除 no:"+no);
            return new RspMsg("fail", "设备类型已被删除");
        }
        List<DevType> devTyps = devCatalogDao.qryTypeByCatalog(no);
        if (devTyps.size()!=0){
            log.warn("设备类型正在被设备型号使用，不能删除 no:"+no);
            return new RspMsg("fail","该类型正在被设备型号使用，无法删除");
        }
        List<DevBase> devBases = devCatalogDao.qryDevByCatalog(no);
        if (devBases.size()!=0){
            log.warn("设备类型正在被设备信息使用，不能删除 no:"+no);
            return new RspMsg("fail","该类型正在被设备信息使用，无法删除");
        }
        devCatalogDao.del(no);
        log.info("删除设备类型成功 no:"+no);
        return new RspMsg("ok", "删除设备类型成功");

    }
}
