package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Org;
import com.zjft.zhyg.system.pojo.SelfHelpBank;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author: liurenfei
 * @description:自助银行管理操作
 */
@Repository
public interface SelfHelpBankDao {
    /**
     * 查询自助银行数据
     * @param map
     * @return
     */
    List<SelfHelpBank> qry(Map<String, Object> map);

    /**
     * 根据Id查自助银行
     * @param logicId
     * @return
     */
    SelfHelpBank qryById(@Param("logicId") String logicId);

    /**
     * 添加自助银行
     * @param selfHelpBank
     */
    void add(SelfHelpBank selfHelpBank);

    /**
     * 删除自助银行
     * @param logicId
     */
    void del(@Param("logicId") String logicId);

    /**
     * 修改自助银行信息
     * @param selfHelpBank
     */
    void mod(SelfHelpBank selfHelpBank);

    /**
     * 获取所有省数据
     * @return
     */
    List<Map<String, String>> getPronvinces();

    /**
     * 获取市数据
     * @param provinceCode
     * @return
     */
    List<Map<String, String>> getCitys(@Param("provinceCode") String provinceCode);

    /**
     * 获取区县数据
     * @param cityCode
     * @return
     */
    List<Map<String, String>> getCountys(@Param("cityCode") String cityCode);

    /**
     * 根据编码查区域名称
     * @param code
     * @return
     */
    String qryAreaNameByCode(@Param("code") String code);

    /**
     * 根据编号获取机构
     * @param fhOrgNo
     * @return
     */
    Org getOrgByNo(@Param("fhOrgNo") String fhOrgNo);
}
