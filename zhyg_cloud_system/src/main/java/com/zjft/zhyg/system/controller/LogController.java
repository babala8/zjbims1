package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.LogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author zyq
 * @Description 日志查询和记录
 **/
@RestController
@RequestMapping("/log")
public class LogController {
    private static final Logger logger = LoggerFactory.getLogger(LogController.class);

    @Autowired
    private LogService logService;

    /**
     * 分页查询日志
     * @param request
     * @return
     */
    @GetMapping
    public RspMsg qry(HttpServletRequest request) {
        logger.info("qry()");
        try {
            String userOrgNo  = request.getParameter("userOrgNo");
            String userNo = request.getParameter("userNo");
            String menuNo = request.getParameter("menuNo");
            String btnName = request.getParameter("btnName");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            String curPage = request.getParameter("curPage");
            String pageSize = request.getParameter("pageSize");
            if (StringUtils.isEmpty(curPage) || StringUtils.isEmpty(pageSize)||StringUtils.isEmpty(userOrgNo)) {
                return new RspMsg("fail", "校验信息失败");
            }
            Map<String, String> map = new HashMap<>(8);
            map.put("userOrgNo",userOrgNo);
            map.put("userNo", userNo);
            map.put("menuNo", menuNo);
            map.put("btnName", btnName);
            map.put("startTime", startTime);
            map.put("endTime", endTime);
            map.put("curPage", curPage);
            map.put("pageSize", pageSize);
            return logService.qryLog(map);
        } catch (Exception e) {
            logger.error("查询日志异常", e);
            return new RspMsg("fail", "查询日志异常");
        }
    }

    /**
     * 查询操作列表
     * @return
     */
    @GetMapping("/operate")
    public RspMsg qryOperate() {
        logger.info("qryOperate");
        try {
            return logService.qryOperate();
        } catch (Exception e) {
            logger.error("查询操作列表异常", e);
            return new RspMsg("fail", "查询操作列表异常");
        }
    }
}
