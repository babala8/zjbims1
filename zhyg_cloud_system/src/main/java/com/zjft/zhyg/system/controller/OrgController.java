package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.common.StringUtil;
import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.Org;
import com.zjft.zhyg.system.pojo.OrgManageCost;
import com.zjft.zhyg.system.pojo.OrgStaticCost;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.OrgService;
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
 * @Author zyq
 * @Description 机构管理模块
 **/
@RestController
@RequestMapping("/org")
public class OrgController {
    private  static final Logger log = LoggerFactory.getLogger(OrgController.class);

    @Autowired
    private OrgService orgService;

    /**
     * 查询机构列表
     *45678979
     * @return
     */
    @RequestMapping(value = "/qryOrgs", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("orgNo", request.getParameter("orgNo"));
            param.put("userOrgNo", request.getParameter("userOrgNo"));
            param.put("orgTypeNo", request.getParameter("orgTypeNo"));
            param.put("parentOrgNo", request.getParameter("parentOrgNo"));
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            if (StringUtils.isEmpty(param.get("userOrgNo"))) {
                return new RspMsg("fail", "用户所属机构不能为空");
            }
            rspMsg = orgService.qry(param);
        } catch (Exception e) {
            log.error("查询机构异常:", e);
            rspMsg = new RspMsg("fail", " 查询机构异常");
        }
        return rspMsg;
    }

    /**
     * 添加机构
     * @param org
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG, button = Buttons.ADD)
    @RequestMapping(value = "/addOrg", method = RequestMethod.POST)
    public RspMsg add(@RequestBody Org org) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(org.getNo()) || StringUtils.isEmpty(org.getName()) || StringUtils.isEmpty(org.getOrgTypeNo())) {
                rspMsg = new RspMsg("fail", "机构号，机构名，机构类型不能为空");
            } else if (StringUtils.isEmpty(org.getParentOrgNo()) && !"ZH".equals(org.getOrgTypeNo())) {
                // 除了总行，父机构不能为空78998798
                rspMsg = new RspMsg("fail", "父机构不能为空");
            } else {
                rspMsg = orgService.add(org);
            }
        } catch (Exception e) {
            log.error("添加机构异常:", e);
            rspMsg = new RspMsg("fail", "添加机构异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询机构
     *
     * @param orgNo
     * @return
     */
    @RequestMapping(value = "/qryOrg", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("orgNo") String orgNo) {
        log.info("qryByNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(orgNo)) {
                return new RspMsg("fail", "机构号不能空");
            }
            rspMsg = orgService.qryByNo(orgNo);
        } catch (Exception e) {
            log.error("查询机构异常:", e);
            return new RspMsg("fail", "查询机构异常");
        }
        return rspMsg;
    }

    /**
     * 修改机构
     *
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG, button = Buttons.MOD)
    @RequestMapping(value = "/modOrg", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        Org newObj = new Org();
        Org oldObj = new Org();
        Map<String,Object> param = new HashMap<>();
        try {
            if (map!=null) {
                BeanUtils.populate(newObj, (LinkedHashMap)map.get("current"));
               // BeanUtils.populate(oldObj, (LinkedHashMap)map.get("before"));
               param = (HashMap) map.get("before");
            }
            if (StringUtils.isEmpty(newObj.getNo()) || StringUtils.isEmpty(newObj.getName()) || StringUtils.isEmpty(newObj.getOrgTypeNo())) {
                rspMsg = new RspMsg("fail", "机构号，机构名，机构类型不能为空");
            } else if (StringUtils.isEmpty(newObj.getParentOrgNo()) && !"ZH".equals(newObj.getOrgTypeNo())) {
                rspMsg = new RspMsg("fail", "父机构不能为空");
            } else {
                rspMsg = orgService.mod(newObj,param);
            }
        } catch (Exception e) {
            log.error("修改机构异常:", e);
            rspMsg = new RspMsg("fail", "修改机构异常");
        }
        return rspMsg;
    }

    /**
     * 删除机构
     *
     * @param org
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG, button = Buttons.DEL)
    @RequestMapping(value = "/delOrg", method = RequestMethod.POST)
    public RspMsg del(@RequestBody Org org) {
        log.info("del()");
        RspMsg rspMsg;
        String orgNo = org.getNo();
        try {
            if (StringUtils.isEmpty(orgNo)) {
                return new RspMsg("fail", "机构号不能空");
            }
            rspMsg = orgService.del(orgNo);
        } catch (Exception e) {
            log.error("删除机构异常:", e);
            return new RspMsg("fail", "删除机构异常");
        }
        return rspMsg;
    }

    /**
     * 根据机构级别查询机构类型
     *
     * @param orgGrade
     * @return
     */
    @RequestMapping(value = "/qryTypeByGrade", method = RequestMethod.GET)
    public RspMsg qryTypeByGrade(@RequestParam("orgGrade") String orgGrade) {
        log.info("qryTypeByGrade()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(orgGrade)) {
                return new RspMsg("fail", "机构级别不能空");
            }
            rspMsg = orgService.qryTypeByGrade(orgGrade);
        } catch (Exception e) {
            log.error("查询机构类型异常：", e);
            return new RspMsg("fail", "查询机构类型异常");
        }
        return rspMsg;
    }

    /**
     * 查询机构成本
     *
     * @param orgNo
     * @return
     */
    @RequestMapping(value = "/qryCost", method = RequestMethod.GET)
    public RspMsg qryCost(@RequestParam("orgNo") String orgNo) {
        log.info("qryCost");
        RspMsg rspMsg;
        try {
            rspMsg = orgService.qryCost(orgNo);
        } catch (Exception e) {
            log.error("查询机构成本异常：", e);
            return new RspMsg("fail", "查询机构成本异常");
        }
        return rspMsg;
    }

    /**
     * 修改机构成本
     *
     * @param
     * @return
     */
    @ZjftOperateLog(menu = Menus.ORG, button = Buttons.COST_SET)
    @RequestMapping(value = "/setCost", method = RequestMethod.POST)
    public RspMsg setCost(@RequestBody Map<String, String> param) {
        log.info("setCost()");
        RspMsg rspMsg = new RspMsg();
        try {
            String type = param.get("type");
            String orgNo = param.get("orgNo");
            if ("manage".equals(type)) {
                OrgManageCost manageCost = new OrgManageCost();
                manageCost.setOrgNo(orgNo);
                manageCost.setYear(param.get("year"));
                manageCost.setMonth(param.get("month"));

                String other = "".equals(param.get("other")) ? "0" : param.get("other");
                String material = "".equals(param.get("material")) ? "0" : param.get("material");
                String promotion = "".equals(param.get("promotion")) ? "0" : param.get("promotion");
                String rent = "".equals(param.get("rent")) ? "0" : param.get("rent");
                String resourceFee = "".equals(param.get("resourceFee")) ? "0" : param.get("resourceFee");
                String wage = "".equals(param.get("wage")) ? "0" : param.get("wage");
                String staffCount = "".equals(param.get("staffCount")) ? "0" : param.get("staffCount");

                manageCost.setOther(Integer.parseInt(other));
                manageCost.setMaterial(Integer.parseInt(material));
                manageCost.setPromotion(Integer.parseInt(promotion));
                manageCost.setRent(Integer.parseInt(rent));
                manageCost.setResourceFee(Integer.parseInt(resourceFee));
                manageCost.setWage(Integer.parseInt(wage));
                manageCost.setStaffCount(Integer.parseInt(staffCount));
                rspMsg = orgService.modManageCost(manageCost);
            } else if ("static".equals(type)) {
                OrgStaticCost staticCost = new OrgStaticCost();
                staticCost.setOrgNo(orgNo);

                String place = "".equals(param.get("place")) ? "0" : param.get("place");
                String placeStage = "".equals(param.get("placeStage")) ? "0" : param.get("placeStage");
                String decoration = "".equals(param.get("decoration")) ? "0" : param.get("decoration");
                String decorationStage = "".equals(param.get("decorationStage")) ? "0" : param.get("decorationStage");
                String device = "".equals(param.get("device")) ? "0" : param.get("device");
                String deviceStage = "".equals(param.get("deviceStage")) ? "0" : param.get("deviceStage");
                String other = "".equals(param.get("other")) ? "0" : param.get("other");
                String otherStage = "".equals(param.get("otherStage")) ? "0" : param.get("otherStage");

                staticCost.setPlace(Integer.parseInt(place));
                staticCost.setPlaceStage(Integer.parseInt(placeStage));
                staticCost.setDecoration(Integer.parseInt(decoration));
                staticCost.setDecorationStage(Integer.parseInt(decorationStage));
                staticCost.setDevice(Integer.parseInt(device));
                staticCost.setDeviceStage(Integer.parseInt(deviceStage));
                staticCost.setOther(Integer.parseInt(other));
                staticCost.setOtherStage(Integer.parseInt(otherStage));
                rspMsg = orgService.modStaticCost(staticCost);
            }
        } catch (Exception e) {
            log.error("录入机构成本异常：", e);
            return new RspMsg("fail", "录入机构成本异常");
        }
        return rspMsg;
    }


    /**
     * 根据机构号查询机构类型
     * @param userOrgNo
     * @return
     */
    @RequestMapping(value = "/qryOrgTypesByOrgNo", method = RequestMethod.GET)
    public RspMsg qryOrgTypesByOrgNo(@RequestParam("userOrgNo") String userOrgNo) {
        log.info("qryOrgTypesByOrgNo()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(userOrgNo)) {
                return new RspMsg("fail", "机构号不能为空");
            }
            rspMsg = orgService.qryOrgTypesByOrgNo(userOrgNo);
        } catch (Exception e) {
            log.error("查询机构类型异常:", e);
            return new RspMsg("fail", "查询机构类型异常");
        }
        return rspMsg;
    }

	   /**
     * 查询下级机构
     * @param orgNo
     * @return
     */
    @RequestMapping(value = "/qryAuthOrg",method = RequestMethod.GET)
    RspMsg qryAuthOrg(@RequestParam("orgNo") String orgNo){
        log.info("qryAuthOrg()");
        RspMsg rspMsg = new RspMsg(FinalValues.FAIL,"查询下级机构失败");
        try {
            rspMsg = orgService.qryAuthOrg(orgNo);
        }catch (Exception e){
            log.error("查询下级机构：", e);
        }
        return  rspMsg;
    }

    /**
     * @description   查询所有的父级机构
     * @param userOrgNo
     * @date 2019/7/2 14:41
     */
    @RequestMapping(value = "/qryParentOrg",method = RequestMethod.GET)
    RspMsg qryParentOrg(@RequestParam("userOrgNo") String userOrgNo){
        log.info("qryParentOrg()");
        RspMsg rspMsg = new RspMsg(FinalValues.FAIL,"查询父级机构失败");
        try {
            rspMsg = orgService.qryParentOrg(userOrgNo);
        }catch (Exception e){
            log.error("查询父级机构：", e);
        }
        return  rspMsg;
    }

	@RequestMapping(value = "/qryOrgTypeByNo",method = RequestMethod.GET)
    RspMsg qryOrgTypeByNo(HttpServletRequest request){
        log.info("qryOrgTypeByNo");
        RspMsg rspMsg = new RspMsg();
        String no = request.getParameter("no");
        if(no==null){
           return new RspMsg(FinalValues.FAIL,"查询类型异常");
        }else{
            try {
                rspMsg = orgService.qryOrgTypeByNo(no);
            }catch (Exception e){
                log.error("查询父级机构：", e);
            }
        }
        return  rspMsg;
    }

    /**
     * @description 查询银联标准地区
     * @param request
     * @date 2019/7/8
     */
    @RequestMapping(value = "/qryCupArea",method = RequestMethod.GET)
    RspMsg qryCupArea(HttpServletRequest request){
        log.info("qryCupArea()");
        RspMsg rspMsg = new RspMsg(FinalValues.FAIL,"查询银联标准地区失败");
        try {
            rspMsg = orgService.qryCupArea();
        }catch (Exception e){
            log.error("查询银联标准地区失败：", e);
        }
        return  rspMsg;
    }

    /**
     * @description 查询省市地区
     * @param request
     * @date 2019/7/8
     */
    @RequestMapping(value = "/qryProvinceCityArea",method = RequestMethod.GET)
    RspMsg qryProvinceCityArea(HttpServletRequest request){
        log.info("qryProvinceCityArea()");
        RspMsg rspMsg = new RspMsg(FinalValues.FAIL,"查询省市地区失败");
        Map params = new HashMap();
        params.put("grade", StringUtil.parseString(request.getParameter("grade")));
        params.put("provinceCode", StringUtil.parseString(request.getParameter("provinceCode")));
        params.put("cityCode", StringUtil.parseString(request.getParameter("cityCode")));
        try {
            rspMsg = orgService.qryProvinceCityArea(params);
        }catch (Exception e){
            log.error("查询省市地区失败：", e);
        }
        return  rspMsg;
    }

    @RequestMapping(value = "/qryTopOrg",method = RequestMethod.GET)
    RspMsg qryTopOrg(HttpServletRequest request){
        log.info("qryTopOrg()");
        RspMsg rspMsg = new RspMsg();
        try {
            rspMsg = orgService.qryTopOrg();
        }catch (Exception e){
            log.error("查询总行信息失败：", e);
        }
        return  rspMsg;
    }
}
