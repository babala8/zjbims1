package com.zjft.zhyg.system.dao;


import com.zjft.zhyg.system.pojo.BankManager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author:xss
 * @Description:银行网点人操作
 */
@Mapper
@Repository
public interface BankManagerDao {

    /**
     *  添加银行网点人员
     * 注：可能为null 的字段，需要设置jdbcType
     * @param bankManager
     */
    void add(BankManager bankManager);

    /**
     *删除银行网点人员
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改银行网点人员
     * @param bankManager
     */
    void mod(BankManager bankManager);

    /**
     * 动态查询银行网点人员
     * @param param
     * @return
     */
    List<BankManager> qry(Map<String,Object> param);

    /**
     * 根据银行网点人员编号查询银行网点人员
     * @param no
     * @return
     */
    BankManager qryByNo(@Param("no") String no);

    /**
     * 根据机构编号和行网点人员名称查询行网点人员
     * @param name
     * @param orgNo
     * @param no
     * @return
     */
    BankManager qryByName(@Param("name") String name,@Param("orgNo") String orgNo,@Param("no") String no);

    /**
     * 查询最大编号
     * @return
     */
    String qryMaxId();

}
