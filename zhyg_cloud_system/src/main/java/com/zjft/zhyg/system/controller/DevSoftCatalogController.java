package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.pojo.DevSoftCatalog;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevSoftCatalogService;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author: liurenfei
 * @description:设备软件类型管理
 */
@RestController
@RequestMapping("/devSoftCatalog")
public class DevSoftCatalogController {
    private static final Logger log = LoggerFactory.getLogger(DevSoftCatalogController.class);

    @Autowired
    DevSoftCatalogService devSoftCatalogService;

    /**
     * 获取下拉框数据
     * @return
     */
    @GetMapping("/getInitData")
    public RspMsg getInitData(){
        log.info("getInitData()");
        return devSoftCatalogService.getInitData();
    }

    /**
     * 查询设备软件类型
     * @param request
     * @return
     */
    @GetMapping("/qry")
    public RspMsg qry(HttpServletRequest request){
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(16);
            param.put("groupType", request.getParameter("groupType"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devSoftCatalogService.qry(param);
        } catch (Exception e) {
            log.error("查询设备软件类型异常", e);
            rspMsg = new RspMsg("fail", "查询设备软件类型异常");
        }
        return rspMsg;
    }

    /**
     * 根据ID查设备软件类型信息
     * @param request
     * @return
     */
    @GetMapping("/qryById")
    public RspMsg qryById(HttpServletRequest request){
        log.info("qryById()");
        RspMsg rspMsg;
        try {
            rspMsg = devSoftCatalogService.qryById(request.getParameter("groupId"));
        } catch (Exception e) {
            log.error("根据ID查询设备软件类型异常", e);
            rspMsg = new RspMsg("fail", "根据ID查询设备软件类型异常");
        }
        return rspMsg;
    }

    /**
     * 修改设备软件类型
     * @param map
     * @return
     */
    @PostMapping("/mod")
    public RspMsg mod(@RequestBody Map map){
        log.info("mod()");
        RspMsg rspMsg;
        DevSoftCatalog oldObj = new DevSoftCatalog();
        DevSoftCatalog newObj = new DevSoftCatalog();
        try {
            if (map!=null){
                BeanUtils.populate(oldObj, ((LinkedHashMap) map.get("before")));
                BeanUtils.populate(newObj, ((LinkedHashMap) map.get("current")));
            }
            if (StringUtils.isEmpty(newObj.getGroupId())){
                rspMsg = new RspMsg("fail","修改设备软件类型失败");
            }else {
                rspMsg = devSoftCatalogService.mod(oldObj,newObj);
            }
        } catch (Exception e) {
            log.error("修改设备软件类型异常");
           rspMsg = new RspMsg("fail","修改设备软件类型异常");
        }
        return  rspMsg;
    }

    /**
     * 添加设备软件类型
     * @param devSoftCatalog
     * @return
     */
    @PostMapping("/add")
    public RspMsg add(@RequestBody DevSoftCatalog devSoftCatalog){
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(devSoftCatalog.getGroupType())||
                    StringUtils.isEmpty(devSoftCatalog.getGroupValue())){
                        rspMsg = new RspMsg("fail","添加失败");
            }else {
                rspMsg = devSoftCatalogService.add(devSoftCatalog);
            }
        } catch (Exception e) {
            log.error("添加设备软件类型异常", e);
            rspMsg = new RspMsg("fail", "添加设备软件类型异常");
        }
        return rspMsg;
    }

    /**
     * 删除设备软件类型
     * @param groupId
     * @return
     */
    @RequestMapping(value = "/del",method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("groupId") String groupId){
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(groupId)){
                rspMsg = new RspMsg("fail","设备软件类型编号不能为空");
            }else {
                rspMsg = devSoftCatalogService.del(groupId);
            }
        } catch (Exception e) {
            log.error("删除设备软件类型异常", e);
            rspMsg = new RspMsg("fail", "删除设备软件类型异常");

        }
        return rspMsg;
    }
}
