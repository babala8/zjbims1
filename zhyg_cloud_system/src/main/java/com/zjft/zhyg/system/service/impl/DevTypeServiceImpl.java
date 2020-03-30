package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevBaseDao;
import com.zjft.zhyg.system.dao.DevCatalogDao;
import com.zjft.zhyg.system.dao.DevTypeDao;
import com.zjft.zhyg.system.dto.DevTypeDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.pojo.DevType;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author:xss
 * @Description:设备型号实现类
 */
@Service
public class DevTypeServiceImpl implements DevTypeService {
    private static final Logger log = LoggerFactory.getLogger(DevTypeServiceImpl.class);

    @Autowired
    private DevTypeDao devTypeDao;
	@Autowired
	private DevCatalogDao devCatalogDao;
	@Autowired
	private DevBaseDao devBaseDao;
    /**
     * 动态查询设备型号信息
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
        if (!StringUtils.isEmpty(param.get("devCatalog"))) {
            map.put("devCatalog", param.get("devCatalog"));
        }
        if (!StringUtils.isEmpty(param.get("devVendor"))) {
            map.put("devVendor", param.get("devVendor"));
        }
        // 需要分页查询
        List<DevType> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevType> page = PageHelper.startPage(curPage, pageSize);
            result = devTypeDao.qry(map);
            PageInfo<DevType> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devTypeDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备型号不存在");
        }
        List<DevTypeDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromDevType).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }
    /**
     * 设备品牌添加
     * @param devType
     * @return
     */
    @Override
    public RspMsg add(DevType devType) {
        log.info("设备型号添加开始 devType:{}",devType);
        if (devTypeDao.qryByNo(devType.getNo()) != null) {
            log.warn("设备型号编号已存在 no:"+devType.getNo());
            return new RspMsg("fail", "设备型号编号已存在");
        }
        if (devTypeDao.qryByName(devType.getName()) != null) {
            log.warn("设备型号已存在 name:"+devType.getName());
            return new RspMsg("fail", "设备型号已存在");
        }
        devTypeDao.add(devType);
        log.info("添加设备型号成功 devType:{}",devType);
        return new RspMsg("ok", "添加设备型号成功");

    }

    /**
     * 根据设备品牌编号查询设备品牌信息
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        DevTypeDto devVendor = DtoMapper.MAPPER.fromDevType(devTypeDao.qryByNo(no));
        if (devVendor == null) {
            return new RspMsg("fail", "设备品牌不存在");
        } else {
            return new RspMsg("ok", "查询成功", devVendor);
        }
    }
    /**
     * 设备品牌修改
     * @param devType
     * @return
     */
    @Override
    public RspMsg mod(DevType devType) {
        log.info("设备型号修改开始 typeNo:"+devType.getNo());
        DevType temp = devTypeDao.qryByNameNo(devType.getName(),devType.getNo());
        if (temp != null) {
            log.warn("设备型号重复 name:"+devType.getName());
            return new RspMsg("fail", "设备型号重复");
        }
        devTypeDao.mod(devType);
        log.info("修改设备型号成功 devType:{}"+devType);
        return new RspMsg("ok", "修改设备型号成功");

    }
    /**
     * 根据设备品牌编号查询设备品牌信息
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("删除设备型号开始 no:"+no);
        DevType devVendor = devTypeDao.qryByNo(no);
        if (devVendor == null) {
            log.warn("设备型号已被删除 no:"+no);
            return new RspMsg("fail", "设备型号已被删除");
        }
        String devTypeNo = no;
        List<String> devNos = devBaseDao.qryByType(devTypeNo);
        if(devNos.size()>0){
            return new RspMsg("fail","设备型号使用中，无法删除");
        }
        devTypeDao.del(no);
        log.info("删除设备型号成功 no:"+no);
        return new RspMsg("ok", "删除设备型号成功");

    }



}