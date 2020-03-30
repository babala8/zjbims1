package com.zjft.zhyg.system.zjucp;

import com.zjft.zhyg.system.pojo.OrgType;
import com.zjft.zhyg.system.pojo.OrgWorkTime;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@ConditionalOnProperty(prefix = "spring.datasource.zjucp", name = "enable", havingValue = "true")
@Repository
public interface POrgWorkTimeDao {


   /**
    * 批处理机构特殊工作时间设置
    * @param
    * @return
    */
//   int batchSpecialWorkTime(List<OrgWorkTime> params);
//   int batchSpecialWorkTime(@Param("params") List<OrgWorkTime> params);
   int batchSpecialWorkTime(@Param("param") OrgWorkTime param);
   /**
    * 删除数据库与现有数据重复以有的时间数据
    * @param
    * @return
    */
  void delOnceWorkTime(@Param("ids") List<String> ids);


}
