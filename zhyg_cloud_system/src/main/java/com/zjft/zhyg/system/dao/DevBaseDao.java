package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevBase;
import com.zjft.zhyg.system.pojo.OrgType;
import com.zjft.zhyg.system.pojo.ParamBusinessConfig;
import com.zjft.zhyg.system.pojo.ParamBusinessTemplate;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:设备信息
 */

@Repository
public interface DevBaseDao {

    /**
     *  添加设备
     * 注：可能为null 的字段，需要设置jdbcType
     * @param devBase
     */
    void add(DevBase devBase);

    /**
     *删除设备
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改设备
     * @param devBase
     */
    void mod(DevBase devBase);

    /**
     * 动态查询设备
     * @param param
     * @return
     */
    List<DevBase> qry(Map<String,Object> param);

    /**
     * 根据设备编号查询设备
     * @param no
     * @return
     */
    DevBase qryByNo(@Param("no") String no);
    /**
     * 根据设备IP编号查询设备是否存在
     * @param ip
     * @return
     */
    DevBase qryIpByIp(@Param("ip") String ip);

    /**
     * 根据机构号查询该机构及其下属机构的所有设备
     * @param no
     * @return
     */
    DevBase qryByOrgNo(@Param("no") String no);
    /**
     * 根据设备IP和编号查询设备是否存在
     * @param ip,no
     * @return
     */
    DevBase qryIpByIpNo(@Param("ip") String ip,@Param("no") String no);

    /**
     * 通过设备编号修改设备运营状态
     * @param operateStatus
     * @param no
     */
    void modOperateStatus(@Param("operateStatus") String operateStatus,@Param("no") String no);

    /**
     * 通过设备号删除所有涉及到此设备的数据
     * @param no
     */
    void delAllReferDevNo(@Param("no") String no);

    /**
     * 查所有机构类型
     * @return
     */
    List<OrgType> qryOrgTypes();

    /**
     * 获取业务参数模板表所有数据
     * @return
     */
    List<ParamBusinessTemplate> getAllParamTemps();

    /**
     * 同步默认参数到业务参数配置表
     * @param param
     */
    void addParamConf(List<ParamBusinessConfig> param);

    /**
     * 检查设备型号是否使用
     * @param devTypeNo
     * @return
     */
    List<String> qryByType(@Param("devTypeNo")String devTypeNo);

    /**
     * 查询用户所属机构号
     * @param userNo
     * @return
     */
    @Select("select ORG_NO from SYS_USER where NO=#{userNo} ")
    String qryOrgByUser(@Param("userNo") String userNo);

    //添加设备运营状态
    void addDevOperate(DevBase devBase);
    //根据设备号查运营状态
    Map<String,Object> qryDevOperate(String devNo);
    //根据设备号修改运营状态
    void modDevOperate(DevBase devBase);
    //根据设备号删除运营状态
    void delDevOperate(String devNo);
    List<Map<String,String>> getParamByDevNo(@Param("devNo") String devNo);
}