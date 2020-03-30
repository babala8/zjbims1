package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevVendorDao;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.DevVendorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Author:xss
 * @Description:设备品牌实现类
 */
@Service
public class DevVendorServiceImpl implements DevVendorService {
    private static final Logger log = LoggerFactory.getLogger(DevVendorServiceImpl.class);


    @Autowired
    DevVendorDao devVendorDao;

    /**
     * 动态查询设备品牌信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param){
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if (!StringUtils.isEmpty(param.get("name"))) {
            map.put("name", param.get("name"));
        }
        List<DevVendor> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevVendor> page = PageHelper.startPage(curPage, pageSize);
            result = devVendorDao.qry(map);
            PageInfo<DevVendor> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devVendorDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备品牌不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }
    /**
     * 设备品牌添加
     * @param devVendor
     * @return
     */
    @Override
    public RspMsg add(DevVendor devVendor) {
        log.info("设备品牌添加 devVendor:{}"+devVendor);
        if (devVendorDao.qryByNo(devVendor.getNo()) != null) {
            log.warn("设备品牌编号已存在 no:"+devVendor.getNo());
            return new RspMsg("fail", "设备品牌编号已存在");
        }
        if (devVendorDao.qryByName(devVendor.getName()) != null) {
            log.warn("设备品牌已存在 name:"+devVendor.getName());
            return new RspMsg("fail", "设备品牌已存在");
        }
        devVendorDao.add(devVendor);
        log.info("添加设备品牌成功 devVendor:{}",devVendor);
        return new RspMsg("ok", "添加设备品牌成功");

    }

    /**
     * 根据设备品牌编号查询设备品牌信息
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        DevVendor devVendor = devVendorDao.qryByNo(no);
        if (devVendor == null) {
            return new RspMsg("fail", "设备品牌不存在");
        } else {
            return new RspMsg("ok", "查询成功", devVendor);
        }
    }
    /**
     * 设备品牌修改
     * @param devVendor
     * @return
     */
    @Override
    public RspMsg mod(DevVendor devVendor) {
        log.info("设备品牌修改开始 devVendor:{}",devVendor);
        DevVendor temp = devVendorDao.qryByNameNo(devVendor.getName(),devVendor.getNo());
        if (temp != null) {
            log.warn("设备品牌重复 name:"+devVendor.getName());
            return new RspMsg("fail", "设备品牌重复");
        }
        devVendorDao.mod(devVendor);
        log.info("修改设备品牌成功 devVendor:{}"+devVendor);
        return new RspMsg("ok", "修改设备品牌成功");

    }
    /**
     * 根据设备品牌编号查询设备品牌信息
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("删除设备品牌开始 no:"+no);
        DevVendor devVendor = devVendorDao.qryByNo(no);
        if (devVendor == null) {
            log.warn("设备品牌已被删除 no:"+no);
            return new RspMsg("fail", "设备品牌已被删除");
        }
        //设备型号表是否正在使用该品牌
        List<DevType> devType = devVendorDao.qryTypeByVendor(no);
        if (devType.size()>0){
            return new RspMsg("fail","其他模块正在使用该品牌，无法删除");
        }
        //设备基本信息表，远程监控条件表，标杆设备范围表，多媒体播放任务范围表都涉及到设备品牌，暂不做处理
        devVendorDao.del(no);
        log.info("删除设备品牌成功 no:"+no);
        return new RspMsg("ok", "删除设备品牌成功");

    }



}

