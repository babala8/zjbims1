package com.zjft.zhyg.fallback;

import com.zjft.zhyg.config.RedisClient;
import com.zjft.zhyg.config.AuthorizeFilter;
import com.zjft.zhyg.config.RedisConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author zyq
 * @Description
 **/
@RestController
@RequestMapping("/token")
public class TokenController {

    private static final Logger logger = LoggerFactory.getLogger(TokenController.class);

    @Autowired
    private RedisClient redisClinet;

    @Value("${spring.redis.token.expire-seconds}")
    private int expireSeconds;

    /**
     * 登录时保存token
     * @param session
     */
    @PostMapping
    public void saveToken(@RequestBody Map<String, String> session) {
        Map<String, String> map = new HashMap<>(4);
        map.put("token", session.get("token"));
        map.put("time", System.currentTimeMillis() + "");
        //有配置redis则使用redis
        if (RedisConfiguration.useRedis) {
            redisClinet.setString(session.get("userNo"), session.get("token"), expireSeconds);
        } else {
            AuthorizeFilter.TOKENS.put(session.get("userNo"), map);
//            AuthorizeFilter.TOKENS.keySet().forEach(System.out::println);
        }
    }

    /**
     * 登出时移除token
     * @param userNo
     */
    @DeleteMapping
    public void removeToken(@RequestParam("userNo") String userNo) {
        if (RedisConfiguration.useRedis) {
            redisClinet.remove(userNo);
        } else {
            AuthorizeFilter.TOKENS.remove(userNo);
        }
    }

}
