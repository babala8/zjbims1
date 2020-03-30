package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.BulletinInfoDao;
import com.zjft.zhyg.system.dao.UserDao;
import com.zjft.zhyg.system.pojo.BulletinInfo;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.BulletinInfoService;
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
 * @Description 系统公告实现类
 */
@Transactional
@Service
public class BulletinInfoServiceImpl implements BulletinInfoService {
    private static final Logger log = LoggerFactory.getLogger(BulletinInfoServiceImpl.class);


    @Autowired
    BulletinInfoDao bulletinInfoDao;

    @Autowired
    private UserDao userDao;

    /**
     * 动态查询所有系统公告
     *
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String, Object> map = new HashMap<>(16);
        RspMsg rspMsg = new RspMsg();
        if (!StringUtils.isEmpty(param.get("publisher"))) {
            map.put("publisher", param.get("publisher"));
        }
        if (!StringUtils.isEmpty(param.get("title"))) {
            map.put("title", param.get("title"));
        }
        if (!StringUtils.isEmpty(param.get("startTime"))) {
            map.put("startTime", param.get("startTime"));
        }
        if (!StringUtils.isEmpty(param.get("endTime"))) {
            map.put("endTime", param.get("endTime"));
        }
        //接受数据库查询结构集
        List<BulletinInfo> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<BulletinInfo> page = PageHelper.startPage(curPage, pageSize);
            result = bulletinInfoDao.qry(map);
            PageInfo<BulletinInfo> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = bulletinInfoDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "系统公告不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    /**
     * 添加系统公告
     *
     * @param bulletinInfo
     * @return
     */
    @Override
    public RspMsg add(BulletinInfo bulletinInfo) {
        log.info("添加公告开始 bulletinInfo:"+bulletinInfo);
        BulletinInfo temp = bulletinInfoDao.qryByTitle(bulletinInfo.getTitle());
        if (temp != null){
            log.warn("公告标题已存在 title:"+bulletinInfo.getTitle());
            return new RspMsg("fail","公告标题已存在");
        }
        //先查已有系统公告中最大的公告编号
        String maxId = bulletinInfoDao.qryMaxId();
        if (maxId == null || Integer.parseInt(maxId) < 10001) {
            //数据库不存在编号或编号小于10001则重新设置
            bulletinInfo.setBulletinId("10001");
        } else {
            //在已有最大编号基础上加1
            bulletinInfo.setBulletinId(String.valueOf(Integer.parseInt(maxId) + 1));
        }
        bulletinInfoDao.add(bulletinInfo);
        //为所有用户增加未读公告
        List<String> userNos = userDao.getAllNo();
        bulletinInfoDao.addUnread(bulletinInfo.getBulletinId(), userNos);
        log.info("添加系统公告成功 bulletinInfo:"+bulletinInfo);
        return new RspMsg("ok", "添加系统公告成功");
    }

    /**
     * 删除系统公告
     *
     * @param bulletinId
     * @return
     */
    @Override
    public RspMsg del(String bulletinId) {
        log.info("开始删除公告 bulletinId:"+bulletinId);
        BulletinInfo bulletinInfo = bulletinInfoDao.qryById(bulletinId);
        if (bulletinInfo == null) {
            log.warn("系统公告已被删除 bulletinId:"+bulletinId);
            return new RspMsg("fail", "系统公告已被删除");
        }
        bulletinInfoDao.del(bulletinId);
        // 删除该公告的未读记录
        bulletinInfoDao.deleteUnread(bulletinId);
        log.info("删除系统公告成功 bulletinId:"+bulletinId);
        return new RspMsg("ok", "删除系统公告成功");
    }

    /**
     * 修改系统公告
     *
     * @param bulletinInfo
     * @return
     */
    @Override
    public RspMsg mod(BulletinInfo bulletinInfo) {
        log.info("修改系统公告开始 bulletinInfo:"+bulletinInfo);
        bulletinInfoDao.mod(bulletinInfo);
        return new RspMsg("ok", "修改系统公告成功");
    }

    /**
     * 根据编号查公告
     *
     * @param bulletinId
     * @return
     */
    @Override
    public RspMsg qryById(String bulletinId) {
        BulletinInfo bulletinInfo = bulletinInfoDao.qryById(bulletinId);
        if (bulletinInfo == null) {
            return new RspMsg("fail", "系统公告不存在");
        } else {
            return new RspMsg("ok", "查询成功", bulletinInfo);
        }
    }

    @Override
    public void deleteUserUnread(String userNo) {
        log.info("删除用户未读记录 userNo:"+userNo);
        bulletinInfoDao.deleteUserUnread(userNo);
    }
}
