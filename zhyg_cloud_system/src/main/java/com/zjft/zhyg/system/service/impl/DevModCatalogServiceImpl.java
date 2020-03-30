package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.dao.DevModCatalogDao;
import com.zjft.zhyg.system.pojo.DevModCatalog;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevModCatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author:limengrd
 * @Description:
 */
@Service
public class DevModCatalogServiceImpl implements DevModCatalogService {
    @Autowired
    DevModCatalogDao devModCatalogDao;

    @Override
    public RspMsg qryAllModCatalog(Map<String,String> param) {
        RspMsg rspMsg = new RspMsg();
        List<DevModCatalog> retList;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize =Integer.parseInt(param.get("pageSize"));
            Page<DevModCatalog> page = PageHelper.startPage(curPage, pageSize);
            retList =  devModCatalogDao.qryAllModCatalog();
            PageInfo<DevModCatalog> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            retList = devModCatalogDao.qryAllModCatalog();
        }
        rspMsg.setRetCode(FinalValues.OK);
        rspMsg.setRetMsg("查询所有模块类型成功");
        rspMsg.setData(retList);
        return rspMsg;
    }
}
