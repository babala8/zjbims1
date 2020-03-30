package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevSoftCatalogDao;
import com.zjft.zhyg.system.pojo.DevSoftCatalog;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevSoftCatalogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liurenfei
 * @Description 设备软件类型实现类
 */
@Service
public class DevSoftCatalogServiceImpl implements DevSoftCatalogService {
    private static final Logger log = LoggerFactory.getLogger(DevSoftCatalogServiceImpl.class);

    @Autowired
    DevSoftCatalogDao devSoftCatalogDao;

    /**
     *获取下拉框数据
     * @return
     */
    @Override
    public RspMsg getInitData() {
        List<Map<String,Object>> res = devSoftCatalogDao.getInitData();
        return new RspMsg("ok","获取成功",res);
    }

    /**
     * 查询设备软件类型
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String,Object> map = new HashMap<>();
        RspMsg rspMsg = new RspMsg();
        map.put("groupType",param.get("groupType"));
        List<DevSoftCatalog> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevSoftCatalog> page = PageHelper.startPage(curPage, pageSize);
            result = devSoftCatalogDao.qry(map);
            PageInfo<DevSoftCatalog> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devSoftCatalogDao.qry(map);
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }
    /**
     * 根据ID查设备软件类型信息
     * @param groupId
     * @return
     */
    @Override
    public RspMsg qryById(String groupId) {
        if (StringUtils.isEmpty(groupId)){
            return new RspMsg("fail","设备软件信息ID为空");
        }
        DevSoftCatalog obj = devSoftCatalogDao.qryById(groupId);
        if (obj==null){
            return new RspMsg("fail","不存在该条信息数据");
        }
        return new RspMsg("ok","查询成功",obj);
    }

    /**
     * 修改设备软件类型
     * @param oldObj
     * @param newObj
     * @return
     */
    @Override
    public RspMsg mod(DevSoftCatalog oldObj, DevSoftCatalog newObj) {
        log.info("修改设备软件类型开始 devSoftCatalog"+newObj);
        if (oldObj.getGroupType().equals(newObj.getGroupType())
            && oldObj.getGroupValue().equals(newObj.getGroupValue())){
            return new RspMsg("ok","修改成功");
        }
        DevSoftCatalog temp = devSoftCatalogDao.qryByNameAndValue(newObj.getGroupName(),newObj.getGroupValue());
        if (temp!=null){
            return  new RspMsg("fail","设备软件类型已存在");
        }
        devSoftCatalogDao.mod(newObj);
        return new RspMsg("ok","修改成功");
    }

    /**
     * 添加设备软件类型
     * @param devSoftCatalog
     * @return
     */
    @Override
    public RspMsg add(DevSoftCatalog devSoftCatalog) {
        log.info("添加设备软件类型开始设备软件类型 devSoftCatalog:"+devSoftCatalog);
        DevSoftCatalog temp = devSoftCatalogDao.qryByNameAndValue(devSoftCatalog.getGroupName(),devSoftCatalog.getGroupValue());
        if (temp != null){
            log.warn("设备软件类型已存在 devSoftCatalog:"+devSoftCatalog.toString());
            return new RspMsg("fail","设备软件类型已存在");
        }
        String maxId = devSoftCatalogDao.qryMaxId();
        if (maxId == null || Integer.parseInt(maxId) < 10001) {
            devSoftCatalog.setGroupId("10001");
        } else {
            devSoftCatalog.setGroupId(String.valueOf(Integer.parseInt(maxId) + 1));
        }
        devSoftCatalogDao.add(devSoftCatalog);
        log.info("添加设备软件类型成功 devSoftCatalog"+devSoftCatalog);
        return new RspMsg("ok","添加设备软件类型成功");
    }

    /**
     * 删除设备软件类型
     * @param groupId
     * @return
     */
    @Override
    public RspMsg del(String groupId) {
        log.info("开始删除设备软件类型 groupId:"+groupId);
        DevSoftCatalog temp = devSoftCatalogDao.qryById(groupId);
        if (temp == null) {
            log.warn("设备软件类型已被删除 groupId:"+groupId);
            return new RspMsg("fail", "设备软件类型已被删除");
        }
        devSoftCatalogDao.del(groupId);
        log.info("删除设备软件类型成功 groupId:"+groupId);
        return new RspMsg("ok", "删除设备软件类型成功");

    }


}
