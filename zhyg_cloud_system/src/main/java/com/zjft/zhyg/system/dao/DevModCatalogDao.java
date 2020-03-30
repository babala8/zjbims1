package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.DevModCatalog;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author:limengrd
 * @Description:设备模板
 */
@Repository
public interface DevModCatalogDao {
    /**
     * 查询所有设备模板
     * @return
     */
    List<DevModCatalog> qryAllModCatalog();
}
