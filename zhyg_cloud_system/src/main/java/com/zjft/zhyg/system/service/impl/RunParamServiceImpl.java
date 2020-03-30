package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.RunParamDao;
import com.zjft.zhyg.system.pojo.BulletinInfo;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.ServicePropSystem;
import com.zjft.zhyg.system.service.RunParamService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liurenfei
 * @Description 系统运行参数实现类
 */
@Transactional
@Service
public class RunParamServiceImpl implements RunParamService {
    private static final Logger log = LoggerFactory.getLogger(RunParamServiceImpl.class);


    @Autowired
    RunParamDao runParamDao;


    /**
     * 查询系统运行参数
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if (StringUtils.isEmpty(param.get("userOrgNo"))) {
            return new RspMsg("fail","用户所属机构不能为空");
        }
        if (!StringUtils.isEmpty(param.get("paramName"))) {
            map.put("paramName", param.get("paramName"));
        }
        // todo 筛选全部参数请将下面 map.put("all",2)注释
        map.put("all",2);
        List<ServicePropSystem> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<ServicePropSystem> page = PageHelper.startPage(curPage, pageSize);
            result = runParamDao.qry(map);
            PageInfo<ServicePropSystem> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = runParamDao.qry(map);
        }
        for (ServicePropSystem sps: result){
            if (sps.getNote().contains("(单位")){
                sps.setIsEdit("1");
                sps.setDescription(sps.getNote().substring(sps.getNote().indexOf("(")+1,sps.getNote().indexOf(")")));
                sps.setNote(sps.getNote().substring(0,sps.getNote().indexOf("(")));
            }else{
                sps.setIsEdit("2");
                if (sps.getValue().equalsIgnoreCase("N")||
                        sps.getValue().equalsIgnoreCase("Y")){
                    sps.setDescription("Y:是  N:否");
                }
            }
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }


    /**
     * 修改系统运行参数
     * @param servicePropSystem
     * @return
     */
    @Override
    public RspMsg mod(ServicePropSystem servicePropSystem) {
        log.info("修改系统运行参数 servicePropSystem:"+servicePropSystem);
        runParamDao.mod(servicePropSystem);
        return new RspMsg("ok", "修改系统运行参数");
    }

    /**
     * 根据编号查公告
     *
     * @param keyId
     * @return
     */
    @Override
    public RspMsg qryById(String keyId) {
        BulletinInfo bulletinInfo = runParamDao.qryById(keyId);
        if (bulletinInfo == null) {
            return new RspMsg("fail", "系统运行参数不存在");
        } else {
            return new RspMsg("ok", "查询成功", bulletinInfo);
        }
    }

}
