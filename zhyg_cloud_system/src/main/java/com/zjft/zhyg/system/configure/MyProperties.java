package com.zjft.zhyg.system.configure;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author yqzhao
 * @Description 读取自定义配置
 **/
@Slf4j
@Component
public class MyProperties {
    /**
     * 服务配置项
     */
    private static final Map<String, String> PROPERTIES = new HashMap<>(16);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 启动时加载缓存
     */
    @PostConstruct
    public void init() {
        List<Map<String, Object>> result = jdbcTemplate.queryForList("select * from SERVICE_PROP_SYSTEM");
        for (Map<String, Object> map : result) {
            PROPERTIES.put((String) map.get("key_id"), (String) map.get("value"));
            log.info(map.get("key_id") + "=" + map.get("value"));
        }
    }

    /**
     * 获取配置
     * @param key
     * @return
     */
    public String getProperty(String key) {
        return PROPERTIES.get(key).trim();
    }

}
