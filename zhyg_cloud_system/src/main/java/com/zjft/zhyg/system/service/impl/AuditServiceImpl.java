package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.controller.AuditController;
import com.zjft.zhyg.system.dao.AuditDao;
import com.zjft.zhyg.system.dao.UserDao;
import com.zjft.zhyg.system.dto.AuditDto;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.pojo.Audit;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.AuditService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class AuditServiceImpl implements AuditService {
    private static final Logger log = LoggerFactory.getLogger(AuditServiceImpl.class);
    @Autowired
    AuditDao auditDao;
    @Autowired
    private UserDao userDao;

    @Override
    public RspMsg qryMyApply(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        map.put("menuNo", param.get("menuNo"));
        map.put("btnNo", param.get("btnNo"));
        map.put("auditResult",param.get("auditResult"));
        map.put("startTime",param.get("startTime"));
        map.put("endTime",param.get("endTime"));
        map.put("commitStatus",param.get("commitStatus"));
        map.put("userNo",param.get("userNo"));
        System.out.println(param.get("userNo"));
        List<Audit> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Audit> page = PageHelper.startPage(curPage, pageSize);
            result = auditDao.qryMyApply(map);
            PageInfo<Audit> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = auditDao.qryMyApply(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "我的申请不存在");
        }
        List<AuditDto> auditDtos=result.stream().map(DtoMapper.MAPPER::fromAudit).collect(Collectors.toList());
        auditDtos.forEach(auditDto -> {
            if (auditDto.getCurrentDetail()!=null) {
                Object current = ByteToObject(auditDto.getCurrentDetail());
                //减小发送到前端的数据量
                auditDto.setCurrentDetail(null);
                auditDto.setCurrent(current);
            }
            if (auditDto.getBeforeDetail()!=null) {
                Object before = ByteToObject(auditDto.getBeforeDetail());
                auditDto.setBeforeDetail(null);
                auditDto.setBefore(before);
            }
        });
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(auditDtos);
        return rspMsg;
    }

    @Override
    public RspMsg qryMyAudit(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        map.put("orgNo",param.get("orgNo"));
        map.put("menuNo", param.get("menuNo"));
        map.put("btnNo", param.get("btnNo"));
        map.put("auditResult",param.get("auditResult"));
        map.put("startTime",param.get("startTime"));
        map.put("endTime",param.get("endTime"));
        map.put("commitStatus",param.get("commitStatus"));
        map.put("userNo",param.get("userNo"));
        System.out.println(param.get("userNo"));
        //todo 后续处理多角色情况
        String roleNo = userDao.findByNo(param.get("userNo")).getRole().getNo();
        List<String> roleNos = Arrays.asList(roleNo.split("\\|"));
        map.put("userRoles",roleNos);
        System.out.println(roleNos);
        List<Audit> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Audit> page = PageHelper.startPage(curPage, pageSize);
            result = auditDao.qryMyAudit(map);
            PageInfo<Audit> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = auditDao.qryMyAudit(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "无审批项");
        }
        List<AuditDto> auditDtos=result.stream().map(DtoMapper.MAPPER::fromAudit).collect(Collectors.toList());
        auditDtos.forEach(auditDto -> {
            if (auditDto.getCurrentDetail()!=null) {
                Object current = ByteToObject(auditDto.getCurrentDetail());
                auditDto.setCurrent(current);
            }
            if (auditDto.getBeforeDetail()!=null) {
                Object before = ByteToObject(auditDto.getBeforeDetail());
                auditDto.setBefore(before);
            }

        });
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(auditDtos);
        return rspMsg;
    }



    /**
     * 数组转对象
     * @param bytes
     * @return obj
     */
    private Object ByteToObject(byte[] bytes) {
        Object obj = null;
        ByteArrayInputStream byteArrayInputStream = null;
        ObjectInputStream objectInputStream = null;
        try {
            byteArrayInputStream = new ByteArrayInputStream(bytes);
            objectInputStream = new ObjectInputStream(byteArrayInputStream);
            obj = objectInputStream.readObject();
        } catch (Exception e) {
        } finally {
            if (byteArrayInputStream != null) {
                try {
                    byteArrayInputStream.close();
                } catch (IOException e) {
                }
            }
            if (objectInputStream != null) {
                try {
                    objectInputStream.close();
                } catch (IOException e) {
                }
            }
        }
        return obj;
    }
    /**
     * @param audit
     * @description 添加审批
     * @date 2019/7/2 9:23
     */
    @Override
    public RspMsg addAudit(Map<String, Object> audit) {
        log.info("开始添加审批业务数据：");
        RspMsg rspMsg=new RspMsg();
        if (audit.get("currentDetail")==null){
            rspMsg.setRetCode(FinalValues.FAIL);
            rspMsg.setRetMsg("审批业务数据为空！");
        }
        auditDao.addAudit(audit);
        log.info("添加审批业务成功");
        rspMsg.setRetMsg(FinalValues.OK);
        rspMsg.setRetMsg("添加审批业务成功！");
        return rspMsg;
    }

    /**
     * @param audit
     * @description 修改审核状态
     * @date 2019/7/5 15:36
     */
    @Override
    public RspMsg changeAuditStatus(Map<String, String> audit) {
        log.info("修改审核状态开始");
        RspMsg rspMsg=new RspMsg();
        auditDao.changeAuditStatus(audit);
        log.info("修改审核状态成功");
        rspMsg.setRetMsg(FinalValues.OK);
        rspMsg.setRetMsg("修改审批状态成功！");
        return rspMsg;
    }

    /**
     * @param no
     * @description 修改为撤销状态
     * @date 2019/7/6 9:53
     */
    @Override
    public RspMsg changeCommitStatus(String no) {
        log.info("修改审批状态开始");
        RspMsg rspMsg=new RspMsg();
        log.info("修改审批状态成功");
        auditDao.changeCommitStatus(no);
        rspMsg.setRetMsg(FinalValues.OK);
        rspMsg.setRetMsg("修改审批状态成功！");
        return rspMsg;
    }
}
