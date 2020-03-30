package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevResponsorDao;
import com.zjft.zhyg.system.dao.DevServicePersonDao;
import com.zjft.zhyg.system.dto.DevServicePersonDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.DevServicePersonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * @Author:xss
 * @Description:设备维护员实现类
 */
@Transactional
@Service
public class DevServicePersonServiceImpl implements DevServicePersonService {

    private static final Logger log = LoggerFactory.getLogger(DevServicePersonServiceImpl.class);

    @Autowired
    private DevServicePersonDao devServicePersonDao;

    @Autowired
    private DevResponsorDao devResponsorDao;

    /**
     * 查询设备维护员信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param){
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        if (!StringUtils.isEmpty(param.get("name"))) {
            map.put("name", param.get("name"));
        }
        // 需要分页查询
        List<DevServicePerson> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevServicePerson> page = PageHelper.startPage(curPage, pageSize);
            result = devServicePersonDao.qry(map);
            PageInfo<DevServicePerson> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devServicePersonDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备维护员不存在");
        }
        List<DevServicePersonDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromDevServicePerson).collect(Collectors.toList());

        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    /**
     * 设备维护员添加
     * @param devServicePerson
     * @return
     */
    @Override
    public RspMsg add(DevServicePerson devServicePerson) {
        log.info("设备维护员添加开始 name:"+devServicePerson.getName());
        DevServicePerson temp = devServicePersonDao.qryByName(devServicePerson.getName());
        if (temp != null) {
            log.warn("设备维护员已存在 name:"+devServicePerson.getName());
            return new RspMsg("fail", "设备维护员已存在");
        }
        devServicePerson.setNo(UUID.randomUUID().toString());
        devServicePersonDao.add(devServicePerson);
        log.info("添加设备维护员成功 devServicePerson:"+devServicePerson);
        return new RspMsg("ok", "添加设备维护员成功");

    }

    /**
     * 根据设备维护员编号查询设备维护员信息
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        DevServicePerson devServicePerson = devServicePersonDao.qryByNo(no);
        if (devServicePerson == null) {
            return new RspMsg("fail", "设备维护员不存在");
        } else {
            DevServicePersonDto dtoResult = DtoMapper.MAPPER.fromDevServicePerson(devServicePerson);
            return new RspMsg("ok", "查询维护员成功", dtoResult);
        }
    }
    /**
     * 修改设备维护员
     * @param newObj 修改后的对象
     * @param oldObj 修改前的对象
     * @return
     */
    @Override
    public RspMsg mod(DevServicePerson newObj,DevServicePerson oldObj) {
        log.info("修改设备维护员开始 DevServicePerson:"+newObj);
        if(!newObj.getStatus().equalsIgnoreCase(oldObj.getStatus())&&newObj.getStatus().equalsIgnoreCase("2")){
           List<DevResponsor> devResponsors = devResponsorDao.qryByUseNo(newObj.getNo());
           if(devResponsors.size()>0){
               return  new RspMsg("fail","该维护员已被设置为设备维护员，不能停用");
           }
        }
        // DevServicePerson temp = devServicePersonDao.qryByNameNo(devServicePerson.getName(),devServicePerson.getNo());
        if (newObj.getName().equals(oldObj.getName())){
            devServicePersonDao.mod(newObj);
            return new RspMsg("ok", "修改设备维护员成功");
        }
        DevServicePerson temp = devServicePersonDao.qryByNameAndBelongNo(newObj.getName(),newObj.getBelongToNo());
        if (temp != null) {
            log.warn("该维护商下设备维护员已存在 name:"+newObj.getName());
            return new RspMsg("fail", "该维护商下设备维护员已存在");
        }
        devServicePersonDao.mod(newObj);
        log.info("修改设备维护员成功 devServicePerson:"+newObj);
        return new RspMsg("ok", "修改设备维护员成功");

    }
    /**
     * 删除设备维护员
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("删除设备维护员开始 no:"+no);
        devServicePersonDao.del(no);
        log.info("删除维护员成功 no:"+no);
        return new RspMsg("ok", "删除维护员成功");

    }

}