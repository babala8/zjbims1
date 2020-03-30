package com.zjft.zhyg.system.service.impl;

import com.zjft.zhyg.system.dao.CaseCatalogDao;
import com.zjft.zhyg.system.dto.CaseCatalogDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.service.CaseCatalogService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.pojo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author:xss
 * @Description:故障响应设定实现类
 */
@Transactional
@Service
public class CaseCatalogServiceImpl implements CaseCatalogService {

    private static final Logger log = LoggerFactory.getLogger(CaseCatalogServiceImpl.class);

    @Autowired
    private CaseCatalogDao caseCatalogDao;

    /**
     * 查询故障响应设定
     */
    @Override
    public RspMsg qry(Map<String, String> param){
        List<CaseCatalog> result;
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        map.put("orgNo", param.get("orgNo"));
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<CaseCatalog> page = PageHelper.startPage(curPage, pageSize);
            if (!StringUtils.isEmpty(map.get("orgNo"))){
                result = caseCatalogDao.qry(map);
            }else {
                String orgNo = caseCatalogDao.qryZHNo();
                map.put("orgNo",orgNo);
                result = caseCatalogDao.qry(map);
            }
            PageInfo<CaseCatalog> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        }else {
            if (!StringUtils.isEmpty(map.get("orgNo"))){
                result = caseCatalogDao.qry(map);
            }else {
                String orgNo = caseCatalogDao.qryZHNo();
                map.put("orgNo",orgNo);
                result = caseCatalogDao.qry(map);
            }
        }
        if ( result == null || result.size() == 0) {
            return new RspMsg("ok", "故障响应设定不存在");
        }
        List<CaseCatalogDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromCaseCatalog).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;

    }

    /**
     * 查询所有的短信通知次数
     * @return
     */
    @Override
    public RspMsg qryAllGrade(){
        RspMsg rspMsg = new RspMsg();
        List<Integer> result;
        result = caseCatalogDao.qryAllGrade();
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        log.info(rspMsg.toString());
        return rspMsg;
    }
    /**
     * 修改故障响应设定
     * @return
     */
    @Override
    public RspMsg mod(CaseCatalog caseCatalog){
        log.info("修改信息通知模板开始 caseCatalog:"+caseCatalog);
        RspMsg rspMsg = new RspMsg();
        caseCatalogDao.mod(caseCatalog);
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("成功");
        log.info("修改信息通知模板成功：");
        return rspMsg;
    }



}
