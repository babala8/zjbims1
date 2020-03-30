package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.LogDao;
import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.Log;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.LogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * @Author zyq
 * @Description 日志记录如无误
 **/
@Transactional
@Service
public class LogServiceImpl implements LogService {
    private static final Logger logger = LoggerFactory.getLogger(LogServiceImpl.class);

    @Autowired
    private LogDao logDao;

    @Override
    public RspMsg log(Map<String, Object> param) {
        logger.info("添加日志开始");
        try {
            logDao.saveLog(param);
            logger.info("添加日志成功");
            return new RspMsg("ok", "操作成功");
        } catch (Exception e) {
            logger.error("记录日志异常", e);
            return new RspMsg("fail", "记录日志异常");
        }
    }

    @Override
    public RspMsg qryLog(Map<String, String> param) {
        int curPage = Integer.parseInt(param.get("curPage"));
        int pageSize = Integer.parseInt(param.get("pageSize"));
        Page<Log> page = PageHelper.startPage(curPage, pageSize);
        List<Log> result = logDao.qryLog(param);
        PageInfo<Log> pageInfo = new PageInfo<>(page.getResult());
        for (Log log:result
             ) {
            byte[] currentDetail = log.getCurrentDetail();
            byte[] beforeDetail = log.getBeforeDetail();
            Object cureent = ByteToObject(currentDetail);
            log.setCurrent(cureent);
            if(beforeDetail!=null){
                Object before = ByteToObject(beforeDetail);
                log.setBefore(before);
            }
        }
        int totalRow = (int) pageInfo.getTotal();
        int totalPage = (int) Math.ceil((double) totalRow / pageSize);
        return new RspMsg("ok", "查询日志信息成功", result,
                new MyPage(pageSize, curPage, totalRow, totalPage));
    }

    @Override
    public RspMsg qryOperate() {
        return new RspMsg("ok", "查询操作列表成功", logDao.qryAllOperate());
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
}
