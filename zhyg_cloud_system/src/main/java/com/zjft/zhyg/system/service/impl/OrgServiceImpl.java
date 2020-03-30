package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.configure.MyProperties;
import com.zjft.zhyg.system.dao.OrgDao;
import com.zjft.zhyg.system.dao.OrgManageCostDao;
import com.zjft.zhyg.system.dao.OrgStaticCostDao;
import com.zjft.zhyg.system.dto.DtoMapper;
import com.zjft.zhyg.system.dto.OrgDto;
import com.zjft.zhyg.system.orgtree.OrgNode;
import com.zjft.zhyg.system.orgtree.TreeBuilder;
import com.zjft.zhyg.system.pojo.*;
import com.zjft.zhyg.system.service.OrgService;
import com.zjft.zhyg.system.zjucp.POrgDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author zyq
 * @Description 机构服务
 **/
@Transactional
@Service
public class OrgServiceImpl implements OrgService {
    private static final Logger log=LoggerFactory.getLogger(OrgServiceImpl.class);
    @Autowired
    private OrgDao orgDao;
    @Autowired(required = false)
    private POrgDao pOrgDao;
    @Autowired
    private OrgStaticCostDao staticCostDao;
    @Autowired
    private OrgManageCostDao manageCostDao;
    @Autowired
    private MyProperties myProperties;

    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        map.put("userOrgNo", param.get("userOrgNo"));
        Org userOrg = orgDao.qryByNo(param.get("userOrgNo"));
        map.put("userLeftNo", userOrg.getLeftNo());
        map.put("userRightNo", userOrg.getRightNo());
        if (!StringUtils.isEmpty(param.get("orgNo"))) {
            map.put("orgNo", param.get("orgNo"));
        }
        // 用户机构和父机构相同则不需要重复筛选
        if (!StringUtils.isEmpty(param.get("parentOrgNo"))) {
            map.put("parentOrgNo", param.get("parentOrgNo"));
            Org parentOrg = orgDao.qryByNo(param.get("parentOrgNo"));
            map.put("parentLeftNo", parentOrg.getLeftNo());
            map.put("parentRightNo", parentOrg.getRightNo());
        }
        if (!StringUtils.isEmpty(param.get("orgTypeNo"))) {
            map.put("orgTypeNo", param.get("orgTypeNo"));
        }
        RspMsg rspMsg = new RspMsg();
        // 需要分页查询
        List<Org> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<Org> page = PageHelper.startPage(curPage, pageSize);
            result = orgDao.qry(map);
            PageInfo<Org> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = orgDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "无满足条件的机构");
        }
        List<OrgDto> dtoResult = result.stream().map(DtoMapper.MAPPER::fromOrg).collect(Collectors.toList());
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

    @Override
    public RspMsg add(Org org) {
        log.info("新增机构开始 org:{}",org);
        Org temp = orgDao.qryByNo(org.getNo());
        if (temp != null) {
            log.warn("机构已存在 orgNo:"+org.getNo());
            return new RspMsg("fail", "机构已存在");
        }
        Org temp1 = orgDao.qryByName(org.getName());
        if (temp1 !=null){
            log.warn("机构名称已存在 orgNo:"+org.getNo());
            return new RspMsg("fail", "机构名称已存在");
        }
        orgDao.add(org);
        if(syncXlinkOrg()){
            try {
                if(pOrgDao.qry(org.getNo())==null){
                    //p端插入机构的等级
                  //  org.setOrgTypeNo(orgDao.qryOrgTypeByNo(org.getOrgTypeNo()).getGrade());
                    pOrgDao.add(org);
                }
            } catch (Exception e) {
                log.error("插入P端机构数据失败:"+e);
                throw new RuntimeException();//不抛出异常事务不会回滚
            }
        }
        updateOrgTree();
        log.info("新增机构成功 org:{}",org);
        return new RspMsg("ok", "新增机构成功");
    }

    @Override
    public RspMsg qryByNo(String no) {
        Org org = orgDao.qryByNo(no);
        if (org == null) {
            return new RspMsg("fail", "机构不存在");
        } else {
            return new RspMsg("ok", "查询成功", org);
        }
    }

    @Override
    public RspMsg mod(Org newObj,Map<String,Object> param) {
        log.info("修改机构开始 org:{}",newObj);
        Org temp = orgDao.qryByNo(newObj.getNo());
        if (temp == null) {
            log.warn("机构已被删除 orgNo:"+newObj.getNo());
            return new RspMsg("fail", "机构已被删除");
        }
        if (!newObj.getName().equals(param.get("name"))){
            Org temp1 = orgDao.qryByName(newObj.getName());
            if (temp1!=null){
                log.warn("机构名称已存在 orgName:"+newObj.getName());
                return new RspMsg("fail","机构名称已存在,请重新输入");
            }
        }
        orgDao.mod(newObj);
        if(syncXlinkOrg()){
            try {
               // newObj.setOrgTypeNo(orgDao.qryOrgTypeByNo(newObj.getOrgTypeNo()).getGrade());
                if(pOrgDao.qry(newObj.getNo())==null){
                    pOrgDao.add(newObj);
                }else {
                    pOrgDao.mod(newObj);
                }
            } catch (Exception e) {
                log.error("修改P端机构数据失败:",e);
                throw new RuntimeException();//不抛出异常事务不会回滚

            }
        }
        updateOrgTree();
        log.info("修改机构成功 orgNo:"+newObj.getNo());
        return new RspMsg("ok", "修改机构成功");
    }

    @Override
    public RspMsg del(String no) {
        log.info("删除机构开始 no:"+no);
        Org temp = orgDao.qryByNo(no);
        if (temp == null) {
            if(syncXlinkOrg()){
                pOrgDao.del(no);
            }
            log.warn("机构已被删除 orgNo:"+no);
            return new RspMsg("fail", "机构已被删除");
        }
        Map<String, Object> map = new HashMap<>(8);
        map.put("parentOrgNo", no);
        map.put("parentLeftNo", temp.getLeftNo());
        map.put("parentRightNo", temp.getRightNo());
        List<Org> orgs = orgDao.qry(map);
        if (orgs.size() > 1) {
            log.warn("该机构存在子机构，请先删除子机构 orgNo:"+no);
            return new RspMsg("fail", "该机构存在子机构，请先删除子机构");
        }
        //判断该机构下是否有用户
        List<String> userNos = orgDao.qryUsersByOrgNo(no);
        if (userNos.size()>0){
            log.warn("该机构下存在用户，请先删除用户 orgNo:"+no);
            return new RspMsg("fail","该机构下存在用户，请先删除用户");
        }
        //判断该机构下是否有设备
        List<String> devNos = orgDao.qryDevsByOrgNo(no );
        if (devNos.size()>0){
            log.warn("该机构下存在设备，请先删除设备 orgNo:"+no);
            return new RspMsg("fail","该机构下存在设备，请先删除设备");
        }
        orgDao.del(no);
        try {
            if(syncXlinkOrg()){
                pOrgDao.del(no);
            }
        } catch (Exception e) {
            log.error("删除P端机构数据失败:"+e);
            throw new RuntimeException();//不抛出异常事务不会回滚


        }
        updateOrgTree();
        log.info("删除机构成功 orgNo:"+no);
        return new RspMsg("ok", "删除机构成功");
    }

    @Override
    public RspMsg qryTypeByGrade(String grade) {
        List<OrgType> types = orgDao.qryTypeByGrade(grade);
        return new RspMsg("ok", "查询成功", types);
    }

    /**
     * 查询机构成本
     *
     * @param orgNo
     * @return
     */
    @Override
    public RspMsg qryCost(String orgNo) {
        OrgStaticCost staticCost;
        List<OrgManageCost> manageCostList;
        try {
            staticCost = staticCostDao.qryByNo(orgNo);
        } catch (Exception e) {
            return new RspMsg("fail", "查询银行固定成本异常");
        }
        try {
            manageCostList = manageCostDao.qryByNo(orgNo);
        } catch (Exception e) {
            return new RspMsg("fail", "查询银行经营成本异常");
        }
        Map<String, Object> retMap = new HashMap<>(4);
        retMap.put("staticCost", staticCost);
        retMap.put("manageCost", manageCostList);
        return new RspMsg("ok", "查询机构成本成功", retMap);
    }

    /**
     * 修改机构经营成本
     *
     * @param manageCost
     * @return
     */
    @Override
    public RspMsg modManageCost(OrgManageCost manageCost) {
        log.info("录入机构经营成本开始");
        manageCostDao.delByKey(manageCost.getOrgNo(), manageCost.getYear(), manageCost.getMonth());
        manageCostDao.add(manageCost);
        log.info("录入机构经营成本成功");
        return new RspMsg("ok", "录入机构经营成本成功");
    }

    /**
     * 修改机构固定成本
     *
     * @param staticCost
     * @return
     */
    @Override
    public RspMsg modStaticCost(OrgStaticCost staticCost) {
        log.info("录入机构固定成本开始 orgNo:"+staticCost.getOrgNo());
        staticCostDao.delByNo(staticCost.getOrgNo());
        staticCostDao.add(staticCost);
        log.info("录入机构固定成本成功 orgNo:"+staticCost.getOrgNo());
        return new RspMsg("ok", "录入机构固定成本成功");
    }

    @Override
    public RspMsg qryOrgTypesByOrgNo(String orgno) {
        List<OrgType> types = orgDao.qryOrgTypesByOrgNo(orgno);
        return new RspMsg("ok", "查询成功", types);
    }

    /**
     * 查询下级机构
     * @param orgNo
     * @return
     */
    @Override
    public RspMsg qryAuthOrg(String orgNo) {
        RspMsg rspMsg = new RspMsg(FinalValues.OK,"查询下级机构成功");
        rspMsg.setData(orgDao.qryAuthOrg(orgNo,orgNo));
        return rspMsg;
    }

    /**
     * 更新机构树
     */
    private void updateOrgTree() {
        List<Org> allOrgs = orgDao.qry(new HashMap<>(8));
        List<OrgNode> nodes = new LinkedList<>();
        for (Org x : allOrgs) {
            OrgNode node = new OrgNode();
            node.setNo(x.getNo());
            node.setName(x.getName());
            node.setParentOrgNo(x.getParentOrgNo());
            nodes.add(node);
        }
        TreeBuilder orgTree = new TreeBuilder(nodes);
        orgTree.buildSingleTree();
        nodes = orgTree.getAllNodes();
        orgDao.updateTree(nodes);
        if(syncXlinkOrg()){
            pOrgDao.updateTree(nodes);
        }
    }

    private boolean syncXlinkOrg(){
        log.info("是否同步P端？："+"Y".equalsIgnoreCase(myProperties.getProperty("syncXlinkOrgFlag")));
        return "Y".equalsIgnoreCase(myProperties.getProperty("syncXlinkOrgFlag"));
    }


    /**
     * @param orgNo 当前机构号
     * @description 查询所有的父级机构
     * @date 2019/7/2 11:28
     */
    @Override
    public RspMsg qryParentOrg(String orgNo) {
        RspMsg rspMsg = new RspMsg();
        List<Org> orgs = orgDao.qryAllOrg();
        List<Org> parentNOdes= new ArrayList<>();
        getParentNodes(orgs,orgNo,parentNOdes);
        List<OrgDto> dtoResult = parentNOdes.stream().map(DtoMapper.MAPPER::fromOrg).collect(Collectors.toList());
        rspMsg.setRetCode(FinalValues.OK);
        rspMsg.setData(dtoResult);
        rspMsg.setRetMsg("查询当前机构父机构成功");
        return rspMsg;
    }

    /**
     * 查询银联标准地区
     *
     * @return
     */
    @Override
    public RspMsg qryCupArea() {
        RspMsg rspMsg = new RspMsg(FinalValues.OK,"查询下级机构成功");
        rspMsg.setData(orgDao.qryCupArea());
        return rspMsg;
    }

    /**
     * 查询省级地区列表
     *
     * @return
     */
    @Override
    public RspMsg qryProvinceCityArea(Map params) {
        RspMsg rspMsg = new RspMsg(FinalValues.OK,"查询下级机构成功");
        rspMsg.setData(orgDao.qryProvinceCityArea(params));
        return rspMsg;
    }

    //递归获得所有的父级节点
    void getParentNodes(List<Org> orgs, String userOrgNo, List<Org> parentNOdes){
        orgs.forEach(org -> {
            if (org.getNo().equals(userOrgNo)){
                parentNOdes.add(org);
                getParentNodes(orgs,org.getParentOrgNo(),parentNOdes);
            }
        });
    }

    @Override
    public RspMsg qryOrgTypeByNo(String no) {
        RspMsg rspMsg;
        OrgType orgType = orgDao.qryOrgTypeByNo(no);
        if(orgType==null){
            return  new RspMsg("ok","不存在该类型");
        }
        return new RspMsg("ok","查询成功",orgType);
    }

    @Override
    public RspMsg qryTopOrg() {
        RspMsg rspMsg;
        Org org = orgDao.qryTopOrg();
        if(org==null){
            return new RspMsg("ok","查询总行信息失败");
        }
        return new RspMsg("ok","查询成功",org);
    }
}
