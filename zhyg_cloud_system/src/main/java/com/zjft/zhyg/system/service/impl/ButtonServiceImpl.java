package com.zjft.zhyg.system.service.impl;

import com.zjft.zhyg.system.dao.ButtonDao;
import com.zjft.zhyg.system.dto.ButtonMenuDto;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.ButtonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author yuechen
 * @Description 按钮服务
 **/
@Transactional
@Service
public class ButtonServiceImpl implements ButtonService {
    @Autowired
    private ButtonDao buttonDao;

    @Override
    public RspMsg qryAllButtons() {
        RspMsg rspMsg = new RspMsg();
        List<ButtonMenuDto> dtoResult = buttonDao.qryAllButtons();
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(dtoResult);
        return rspMsg;
    }

}
