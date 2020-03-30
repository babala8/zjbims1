package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.BankManager;
import com.zjft.zhyg.system.pojo.DevResponsor;
import com.zjft.zhyg.system.pojo.DevServicePerson;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DevResponsorDao {

    /**
     *查询设备编号和对应机构编号
     * @param param
     * @return
     */
    List<Map<String,Object>> qryList(Map<String,Object> param);

    /**
     * 查询对应机构名称
     * @param no
     * @return
     */
    String qryOrgName(@Param("no") String no);

    /**
     * 根据编号查询设备责任人
     * @param no
     * @return
     */
    List<DevResponsor> qry(@Param("no") String no);

    /**
     * 根据编号查询管机员
     * @param no
     * @return
     */
    List<Map<String,Object>> qryManager(@Param("no") String no);

    /**
     * 根据编号查询维护员
     * @param no
     * @return
     */
    List<Map<String,Object>> qryService(@Param("no") String no);
    /**
     * 查询所有管机员
     * @param orgNo
     * @return
     */
    List<String> qryAllManager(@Param("orgNo") String orgNo);
    /**
     * 查询所有维护员
     * @return
     */
    List<String> qryAllService();

    /**
     * 根据管机员姓名查询管机员编号
     * @param name
     * @return
     */
    String qryManagerByName(@Param("name") String name,@Param("orgNo") String orgNo);
    /**
     * 根据维护员姓名查询维护员编号
     * @param name
     * @return
     */
    String qryServiceByName(@Param("name") String name);

    /**
     * 根据设备号删除设备责任人
     * @param devNo
     */
    void del(@Param("devNo") String devNo);

    /**
     * 添加设备责任人
     * @param nodes
     */
    void add(@Param("nodes") List<DevResponsor> nodes);

    List<DevResponsor> qryByUseNo(@Param("no") String no);

}
