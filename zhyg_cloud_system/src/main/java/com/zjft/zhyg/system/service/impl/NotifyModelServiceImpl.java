package com.zjft.zhyg.system.service.impl;

import com.zjft.zhyg.system.dao.NotifyModelDao;
import com.zjft.zhyg.system.pojo.NotifyModel;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.NotifyModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author fqz
 * @Description 信息通知模版服务实现类
 **/
@Transactional
@Service
public class NotifyModelServiceImpl implements NotifyModelService {
    private static final Logger log=LoggerFactory.getLogger(NotifyModelServiceImpl.class);
    @Autowired
    NotifyModelDao notifyModelDao;
    @Override
    public RspMsg addNotifyModel(Map<String, Object> param) {
        log.info("修改通知信息模开始");
        try {
            Integer notifyType = Integer.parseInt(param.get("notifyType").toString());
            NotifyModel notifyModel = notifyModelDao.qryBuNotifyType(notifyType);
            if(notifyModel==null){
                notifyModelDao.addNotifyModel(param);
            }else{
                Integer modelBy = Integer.parseInt(param.get("modelBy").toString());
                String infoSet = param.get("infoSet").toString();
                NotifyModel notifyModel1 = new NotifyModel();
                notifyModel.setNotifyType(notifyType);
                notifyModel.setModelBy(modelBy);
                notifyModel.setInfoSet(infoSet);
                notifyModelDao.modNotifyType(notifyModel);
            }
        } catch (Exception e) {
            log.error("信息通知模版设定异常：",e);
            return new RspMsg("fail","信息通知模版设定失败");
        }
        log.info("修改信息通知模板成功");
        return new RspMsg("ok", "信息通知模版设定成功");
    }

    @Override
    public RspMsg qryInfoSetByType(Integer notifyType) {
        NotifyModel notifyModel = notifyModelDao.qryBuNotifyType(notifyType);
        List<String> infoSetes = new ArrayList<String>();
        if(notifyModel==null){
            return new RspMsg("ok","该通知类型不存在");
        }else{
            String infoSet = notifyModel.getInfoSet();
            infoSet = infoSet.substring(infoSet.indexOf(",")+1,infoSet.length());
            String[]infoSets =infoSet.split(",");
            System.out.println(infoSet);
            if(infoSets.length>0){
                for(String str:infoSets){
                    System.out.println(str);
                    infoSetes.add(str.substring(0,str.indexOf(":")));
                    System.out.println(str.substring(0,str.indexOf(":")));
                }
            }else{
                return new RspMsg("ok","该通知类型不存在");
            }
        }
        return new RspMsg("ok","查询成功",infoSetes);
    }
}
