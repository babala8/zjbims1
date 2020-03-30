package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevModCatalogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:limengrd
 * @Description:设备模块类型
 */
@RestController
@RequestMapping("/devModCatalog")
public class DevModCatalogController {
    private static final Logger log = LoggerFactory.getLogger(DevModCatalogController.class);

    @Autowired
    DevModCatalogService devModCatalogService;

    @GetMapping("/qryAllModCatalog")
    public RspMsg qryAllModCatalog(HttpServletRequest request){
        log.info("qryAllModCatalog()");
        RspMsg rspMsg = new RspMsg(FinalValues.FAIL,"查询所有设备模板失败");
        try {
            Map<String, String> param = new HashMap<>(16);
            if (request.getParameter("curPage")!=null) {
                param.put("curPage", request.getParameter("curPage"));
            }
            if (request.getParameter("pageSize")!=null) {
                param.put("pageSize", request.getParameter("pageSize"));
            }
            rspMsg = devModCatalogService.qryAllModCatalog(param);
        }catch (Exception e){
            log.error("查询所有设备模板失败:", e);
        }
        return  rspMsg;
    }
}
