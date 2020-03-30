package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevSoftCatalog;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author liurenfei
 * @Description 设备软件类型操作
 **/
@Repository
public interface DevSoftCatalogDao {

    /**
     * 查询设备软件类型
     * @param map
     * @return
     */
    List<DevSoftCatalog> qry(Map<String, Object> map);

    /**
     * 获取下拉数据
     * @return
     */
    @Select("select distinct groupType as group_type, groupName as group_name from rvc_project_type")@ResultType(Map.class)
   List<Map<String, Object>> getInitData();

    /**
     * 根据ID查设备软件信息
     * @param groupId
     * @return
     */
    @Select("select * from rvc_project_type where groupId=#{groupId}")
    DevSoftCatalog qryById(@Param("groupId") String groupId);

    /**
     * 根据分组名称和分组值查设备软件类型
     * @param groupName
     * @param groupValue
     * @return
     */
    @Select("select * from rvc_project_type where groupName=#{groupName} and groupValue=#{groupValue}")
    DevSoftCatalog qryByNameAndValue(@Param("groupName") String groupName, @Param("groupValue") String groupValue);

    /**
     * 修改设备软件类型
     * @param newObj
     */
    @Update("update rvc_project_type set groupType=#{groupType},groupName=#{groupName},groupValue=#{groupValue} " +
            "where groupId=#{groupId}")
    void mod(DevSoftCatalog newObj);

    /**
     * 查已有数据中最大的编号
     * @return
     */
    String qryMaxId();

    /**
     * 添加设备软件类型
     * @param devSoftCatalog
     */
    void add(DevSoftCatalog devSoftCatalog);

    /**
     * 删除设备软件类型
     * @param groupId
     */
    void del(String groupId);
}
