package com.zjft.zhyg.system.zjucp;

import com.zjft.zhyg.system.orgtree.OrgNode;
import com.zjft.zhyg.system.pojo.Org;
import org.apache.ibatis.annotations.Param;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author fqz
 * @Description P端机构操作
 **/
@ConditionalOnProperty(prefix = "spring.datasource.zjucp", name = "enable", havingValue = "true")
@Repository
public interface POrgDao {
    /**
     * 根据机构号查询机构
     */
    Map<String,Object> qry(@Param("orgNo") String orgNo);
    /**
     * 添加机构
     * 注：可能为null 的字段，需要设置jdbcType
     *
     * @param org
     */
    void add(Org org);

    /**
     * 更新机构
     *
     * @param org
     */
    void mod(Org org);

    /**
     * 机构删除
     *
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 更新机构树
     * @param nodes
     */
    void updateTree(@Param("nodes") List<OrgNode> nodes);

}
