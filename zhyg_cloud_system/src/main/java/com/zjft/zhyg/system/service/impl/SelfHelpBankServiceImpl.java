package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.SelfHelpBankDao;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.Org;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.SelfHelpBank;
import com.zjft.zhyg.system.service.SelfHelpBankService;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * @author: liurenfei
 * @description:自助银行管理实现类
 */
@Service
public class SelfHelpBankServiceImpl implements SelfHelpBankService {
    private static final Logger log = LoggerFactory.getLogger(SelfHelpBankServiceImpl.class);

    @Autowired
    SelfHelpBankDao selfHelpBankDao;

    /**
     * 动态查询所有自助银行信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param) {
        Map<String,Object> map = new HashedMap();
        RspMsg rspMsg = new RspMsg();
        if (!StringUtils.isEmpty(param.get("bankName"))){
            map.put("bankName",param.get("bankName"));
        }
        if (!StringUtils.isEmpty(param.get("bankArea"))){
            map.put("bankArea",param.get("bankArea"));
        }
        if (!StringUtils.isEmpty(param.get("fhOrgNo"))){
            Org org = selfHelpBankDao.getOrgByNo(param.get("fhOrgNo"));
            map.put("fhOrgLeftNo",org.getLeftNo());
            map.put("fhOrgRightNo",org.getRightNo());
        }
        if (!StringUtils.isEmpty(param.get("areaNoProvince"))){
            map.put("areaNoProvince",param.get("areaNoProvince"));
        }
        if (!StringUtils.isEmpty(param.get("areaNoCity"))){
            map.put("areaNoCity",param.get("areaNoCity"));
        }
        if (!StringUtils.isEmpty(param.get("areaNoCounty"))){
            map.put("areaNoCounty",param.get("areaNoCounty"));
        }
        List<SelfHelpBank> result;
        List<SelfHelpBank> formatRes = new ArrayList<>();
        if (!StringUtils.isEmpty(param.get("curPage"))&&!StringUtils.isEmpty(param.get("pageSize"))){
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<SelfHelpBank> page = PageHelper.startPage(curPage,pageSize);
            result = selfHelpBankDao.qry(map);
            PageInfo<SelfHelpBank> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow/pageSize);
            rspMsg.setPage(new MyPage(pageSize,curPage,totalRow,totalPage));
        }else {
            result = selfHelpBankDao.qry(map);
        }
        if (result.size()!=0){
            for (SelfHelpBank shb:result){
                String areaName = "";
                if (!StringUtils.isEmpty(shb.getAreaNoProvince())){
                    areaName = selfHelpBankDao.qryAreaNameByCode(shb.getAreaNoProvince());
                    shb.setProvinceName(areaName);
                }
                if (!StringUtils.isEmpty(shb.getAreaNoCity())){
                    //四个直辖市做特殊处理
                    String cityCode = shb.getAreaNoCity();
                    if (cityCode.startsWith("110")||cityCode.startsWith("120")||cityCode.startsWith("310")||cityCode.startsWith("500")){
                        cityCode = cityCode.substring(0,3)+"1";
                    }
                    String cityName = selfHelpBankDao.qryAreaNameByCode(cityCode);
                    areaName += cityName;
                    shb.setCityName(cityName);
                }
                if (!StringUtils.isEmpty(shb.getAreaNoCounty())){
                    String countyName = selfHelpBankDao.qryAreaNameByCode(shb.getAreaNoCounty());
                    areaName += countyName;
                    shb.setCountyName(countyName);
                }
                shb.setAreaName(areaName);
                formatRes.add(shb);
            }
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(formatRes);
        return rspMsg;
    }

    /**
     * 添加自助银行
     * @param selfHelpBank
     * @return
     */
    @Override
    public RspMsg add(SelfHelpBank selfHelpBank) {
        log.info("添加自助银行开始 selfHelpBank:{}",selfHelpBank);
       /* SelfHelpBank temp = selfHelpBankDao.qryById(selfHelpBank.getLogicId());
        if (temp != null){
            return new RspMsg("fail","编号已存在，请重新输入");
        }*/
        String uuid = UUID.randomUUID().toString();
        selfHelpBank.setLogicId(uuid);
        if (!StringUtils.isEmpty(selfHelpBank.getAreaNoCounty())){
            String tempCode = selfHelpBank.getAreaNoCounty();
            //前两位是省编码
            selfHelpBank.setAreaNoProvince(tempCode.substring(0,2));
            //前四位是市编码
            selfHelpBank.setAreaNoCity(tempCode.substring(0,4));
        }
        selfHelpBankDao.add(selfHelpBank);
        log.info("添加自助银行成功 selfHelpBank:{}",selfHelpBank);
        return new RspMsg("ok","添加自助银行成功");
    }

    /**
     * 删除自助银行
     * @param logicId
     * @return
     */
    @Override
    public RspMsg del(String logicId) {
        log.info("删除自助银行开始");
        SelfHelpBank temp = selfHelpBankDao.qryById(logicId);
        if (temp==null){
            log.warn("不存在要删除的自助银行");
            return new RspMsg("fail","不存在要删除的自助银行");
        }
        selfHelpBankDao.del(logicId);
        log.info("删除自助银行成功 id:"+logicId);
        return new RspMsg("ok","删除自助银行成功");
    }

    /**
     * 修改自助银行信息
     * @param selfHelpBank
     * @return
     */
    @Override
    public RspMsg mod(SelfHelpBank selfHelpBank) {
        log.info("修改自助银行信息开始 selfHelpBank:{}",selfHelpBank);
        if (!StringUtils.isEmpty(selfHelpBank.getAreaNoCounty())){
            String tempCode = selfHelpBank.getAreaNoCounty();
            //前两位是省编码
            selfHelpBank.setAreaNoProvince(tempCode.substring(0,2));
            //前四位是市编码
            selfHelpBank.setAreaNoCity(tempCode.substring(0,4));
        }
        //System.out.println(selfHelpBank.getAreaNoCounty());
        selfHelpBankDao.mod(selfHelpBank);
        log.info("修改自助银行信息成功 selfHelpBank:{}",selfHelpBank);
        return new RspMsg("ok","修改自助银行信息成功");
    }

    /**
     * 根据编号查自助银行
     * @param logicId
     * @return
     */
    @Override
    public RspMsg qryById(String logicId) {
        SelfHelpBank selfHelpBank = selfHelpBankDao.qryById(logicId);
        if (selfHelpBank == null){
            return new RspMsg("fail","自助银行不存在");
        }else {
            String areaName = "";
            if (!StringUtils.isEmpty(selfHelpBank.getAreaNoProvince())){
                areaName = selfHelpBankDao.qryAreaNameByCode(selfHelpBank.getAreaNoProvince());
                selfHelpBank.setProvinceName(areaName);
            }
            if (!StringUtils.isEmpty(selfHelpBank.getAreaNoCity())){
                String cityName = selfHelpBankDao.qryAreaNameByCode(selfHelpBank.getAreaNoCity());
                areaName += cityName;
                selfHelpBank.setCityName(cityName);
            }
            if (!StringUtils.isEmpty(selfHelpBank.getAreaNoCounty())){
                String countyName = selfHelpBankDao.qryAreaNameByCode(selfHelpBank.getAreaNoCounty());
                areaName += countyName;
                selfHelpBank.setCountyName(countyName);
            }
            selfHelpBank.setAreaName(areaName);
            return new RspMsg("ok","查询成功",selfHelpBank);
        }
    }

    /**
     * 获取所有省数据
     * @return
     */
    @Override
    public RspMsg getProvinces() {
        List<Map<String,String>> listPros = selfHelpBankDao.getPronvinces();
        if (listPros.size()==0){
            return new RspMsg("fail","数据库中不存在省数据");
        }
        return new RspMsg("ok","查询成功",listPros);
    }

    /**
     * 获取所有市数据
     * @param provinceCode
     * @return
     */
    @Override
    public RspMsg getCitys(String provinceCode) {
        List<Map<String,String>> listCitys = selfHelpBankDao.getCitys(provinceCode);
        if (listCitys.size()==0){
            return new RspMsg("fail","该省下不存在市");
        };
        return new RspMsg("ok","查询成功",listCitys);
    }

    /**
     * 获取所有区县
     * @param cityCode
     * @return
     */
    @Override
    public RspMsg getCountys(String cityCode) {
        List<Map<String,String>> listCountys = selfHelpBankDao.getCountys(cityCode);
        if (listCountys.size()==0){
            return new RspMsg("fail","该市下不存在区县");
        }
        return new RspMsg("ok","查询成功",listCountys);
    }

    /**
     * 格式化省市县[{"value":"","label":"","children":["value":"","label":"","children":["value","","label":"","isLeaf":true]]}，....]
     * @return
     */
    @Override
    public RspMsg getFormtAreaData() {
        RspMsg rspMsg;
        List<Object> result = new ArrayList<>();
        List<Map<String,String>> pros = selfHelpBankDao.getPronvinces();
        for (Map<String,String> map:pros) {
            Map<String,Object> formatRes = new HashMap<>();
            List<Object> proChild = new ArrayList<>();//省的孩子为市
            String provinceCode = map.get("code");
            formatRes.put("value",provinceCode);
            formatRes.put("label",map.get("codeName"));
            //System.out.println(provinceCode);
            List<Map<String,String>> citys = selfHelpBankDao.getCitys(provinceCode);
            for(Map<String,String> cit:citys){
                Map<String,Object> citysC = new HashMap<>();//存市数据
                String cityCode = cit.get("code");
                citysC.put("value",cityCode);
                citysC.put("label",cit.get("codeName"));
                //System.out.println(cityCode);
                //cityCode = cityCode.substring(0,3);//模糊前三位，因为有直辖市的存在
                List<Map<String,String>> countys = selfHelpBankDao.getCountys(cityCode);//根据市查所有区县
               List<Object> cityChild = new ArrayList<>();//存该市下的所有区县
                for (Map<String,String> county:countys){
                    Map<String,Object> countyChild = new HashMap<>();//存区县数据
                    countyChild.put("value",county.get("code"));
                    countyChild.put("label",county.get("codeName"));
                    countyChild.put("isLeaf",true);
                    cityChild.add(countyChild);
                }
                //System.out.println(cit.get("CODE_NAME")+":"+cityChild.toString());
                citysC.put("children",cityChild);//一个市下的所有区县
                proChild.add(citysC);//一个省下的所有市
                formatRes.put("children",proChild);
            }
            //System.out.println(map.get("CODE_NAME")+":"+proChild.toString());
            result.add(formatRes);
        }
        return new RspMsg("ok","获取成功",result);

    }

}
