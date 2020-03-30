package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.Org;
import com.zjft.zhyg.system.pojo.OrgType;
import com.zjft.zhyg.system.pojo.OrgWorkTime;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrgWorkTimeSetDao {

   /**
    * 查询机构类型
    * @param
    * @return
    */
   List<OrgType> qryorgType();

   /**
    * 批处理机构特殊工作时间设置
    * @param
    * @return
    */
//   int batchSpecialWorkTime(List<OrgWorkTime> params);
//   int batchSpecialWorkTime(@Param("params") List<OrgWorkTime> params);
   int batchSpecialWorkTime(@Param("param") OrgWorkTime param);
   /**
    * 获取数据库以有的时间数据
    * @param
    * @return
    */
   List<OrgWorkTime> onceWorkTime(@Param("nos") List<String> nos);

    /**
     * 获取数据库相应的特殊日期数据
     * @param nos
     * @return
     */
   List<OrgWorkTime> specialDate(@Param("nos") List<String> nos);
   /**
    * 删除数据库与现有数据重复以有的时间数据
    * @param
    * @return
    */
  void delOnceWorkTime(@Param("ids") List<String> ids);

  List<Map<String,String>> qryOrgWorkTimes(Map<String,Object> map);

  List<Map<String,String>> qrySpecialDate(@Param("orgNo") String orgNo);

    @Select("SELECT d.name cooperation from (select cooperation from DEV_OPERATE_INFO where COOPERATION is not null  group by cooperation ) t LEFT JOIN DEV_SERVICE_COMPANY  d on  t.COOPERATION=d.NO")
    List<Object> qryCooperationInfo();


}
