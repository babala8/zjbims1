package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.BankManagerDao;
import com.zjft.zhyg.system.dao.DevResponsorDao;
import com.zjft.zhyg.system.dao.OrgDao;
import com.zjft.zhyg.system.dto.BankManagerDto;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.BankManagerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import com.zjft.zhyg.system.dto.DtoMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author:xss
 * @Description:银行网点人员实现类
 */
@Transactional
@Service
public class BankManagerServiceImpl implements BankManagerService {

    private static final Logger log = LoggerFactory.getLogger(BankManagerServiceImpl.class);

    @Autowired
    private OrgDao orgDao;
    @Autowired
    private BankManagerDao bankManagerDao;
    @Autowired
    private DevResponsorDao devResponsorDao;

    /**
     * 查询银行网点人员信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param){
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        map.put("orgNo", param.get("orgNo"));
        if (!StringUtils.isEmpty(param.get("name"))) {
            map.put("name", param.get("name"));
        }
        // 需要分页查询
        List<BankManager> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<BankManager> page = PageHelper.startPage(curPage, pageSize);
            result = bankManagerDao.qry(map);
            PageInfo<BankManager> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = bankManagerDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "银行网点人员不存在");
        }
        List<BankManagerDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromBankManager).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    /**
     * 银行网点人员添加
     * @param bankManager
     * @return
     */
    @Override
    public RspMsg add(BankManager bankManager) {
        log.info("开始添加网点人no:"+bankManager.getNo());
        String maxId = bankManagerDao.qryMaxId();
        if (maxId == null || Integer.parseInt(maxId) < 10001) {
            //数据库不存在编号或编号小于10001则重新设置
            bankManager.setNo("10001");
        } else {
            //在已有最大编号基础上加1
            bankManager.setNo(String.valueOf(Integer.parseInt(maxId) + 1));
        }
        Org temp = orgDao.qryByNo(bankManager.getOrgNo());
        if (temp == null) {
            log.warn("所属机构不存在 orgNo:"+bankManager.getOrgNo());
            return new RspMsg("fail", "所属机构不存在");
        }
        BankManager temp1 = bankManagerDao.qryByName(bankManager.getName(),bankManager.getOrgNo(),bankManager.getNo());
        if (temp1 != null) {
            log.warn("银行网点人员已存在 name:"+bankManager.getName());
            return new RspMsg("fail", "银行网点人员已存在");
        }
        bankManagerDao.add(bankManager);
        log.info("添加银行网点人员成功 no:"+bankManager.getNo());
        return new RspMsg("ok", "添加银行网点人员成功");

    }

    /**
     * 根据银行网点人员编号查询银行网点人员信息
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        BankManagerDto bankManager = DtoMapper.MAPPER.fromBankManager(bankManagerDao.qryByNo(no));
        if (bankManager == null) {
            return new RspMsg("fail", "银行网点人员不存在");
        } else {
            return new RspMsg("ok", "查询银行网点人员成功", bankManager);
        }
    }
    /**
     * 修改银行网点人员
     * @param bankManager
     * @return
     */
    @Override
    public RspMsg mod(BankManager bankManager) {
        log.info("修改银行网点人员开始 no:"+bankManager.getNo());
        Org temp = orgDao.qryByNo(bankManager.getOrgNo());
        if (temp == null) {
            log.warn("所属机构不存在 orgNo:"+bankManager.getOrgNo());
            return new RspMsg("fail", "所属机构不存在");
        }
        BankManager temp1 = bankManagerDao.qryByName(bankManager.getName(),bankManager.getOrgNo(),bankManager.getNo());
        BankManager bankManager1 = bankManagerDao.qryByNo(bankManager.getNo());
        if(!(bankManager.getOrgNo().equalsIgnoreCase(bankManager1.getOrg().getNo()))||!(bankManager.getIsDevManager().equalsIgnoreCase(bankManager1.getIsDevManager()))){
            String no = bankManager.getNo();
            List<DevResponsor> devResponsors = devResponsorDao.qryByUseNo(no);
            if(devResponsors.size()>0){
                return new RspMsg("fail","该人员已经被设置为设备责任人，请先解除其设备责任人关系");
            }
        }
        if (temp1 != null) {
            log.warn("银行网点人员已存在 name:"+bankManager.getName());
            return new RspMsg("fail", "银行网点人员重复");
        }
        bankManagerDao.mod(bankManager);
        log.info("修改银行网点人员成功 no:"+bankManager.getNo());
        return new RspMsg("ok", "修改银行网点人员成功");

    }
    /**
     * 银行网点人员删除
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("删除银行网点人员开始 no:"+no);
        BankManager temp = bankManagerDao.qryByNo(no);
        if (temp == null) {
            log.warn("银行网点人员已被删除 no:"+no);
            return new RspMsg("fail", "银行网点人员已被删除");
        }
        List<DevResponsor> devResponsors = devResponsorDao.qryByUseNo(no);
        if(devResponsors.size()>0){
            return new RspMsg("fail","该人员已经被设置为设备责任人，请先解除其设备责任人关系");
        }
        bankManagerDao.del(no);
        log.info("删除银行网点人员成功 no:"+no);
        return new RspMsg("ok", "删除银行网点人员成功");
    }


}
