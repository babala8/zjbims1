package com.zjft.zhyg.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author zyq
 * @Description 权限校验过滤器
 **/
@Component
public class AuthorizeFilter implements GlobalFilter, Ordered {
    public static final Map<String, Map<String, String>> TOKENS = new ConcurrentHashMap<>(128);
    private static final Logger logger = LoggerFactory.getLogger(AuthorizeFilter.class);
    private static final String USER_NO = "userNo";
    private static final String TOKEN = "token";
    private static final List<String> WHITE_LIST = new ArrayList<>();

    static {
        WHITE_LIST.add("/system/user/modPasswd");
        WHITE_LIST.add("/system/login");
        WHITE_LIST.add("/system/menu");
        WHITE_LIST.add("/business/reconcile/qryReconcile");
        WHITE_LIST.add("/business/cashForcast/qryCashForcast");
    }

    @Autowired
    private RedisClient redisClinet;

    @Value("${spring.redis.token.expire-seconds}")
    private int expireSeconds;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        try {
            String url = request.getURI().getPath();
            logger.info(url);
            // 白名单中的请求不校验
            if (WHITE_LIST.contains(url)) {
                return chain.filter(exchange);
            }
            // 从请求头获取token
            HttpHeaders headers = request.getHeaders();
            String token = headers.getFirst(TOKEN);
            String userNo = headers.getFirst(USER_NO);
            // header中没有就从url中取
            if (StringUtils.isEmpty(token) && StringUtils.isEmpty(userNo)) {
                token = request.getQueryParams().getFirst("token");
                userNo = request.getQueryParams().getFirst("userNo");
            }
            // token为空则返回401
            if (StringUtils.isEmpty(token) || StringUtils.isEmpty(userNo)) {
                response.setStatusCode(HttpStatus.UNAUTHORIZED);
                return response.setComplete();
            }
            // 开启redis
            if (RedisConfiguration.useRedis) {
                String authToken = redisClinet.getString(userNo);
                if (StringUtils.isEmpty(authToken)) {
                    // token过期或未登录
                    logger.info("用户[" + userNo + "]连接会话超时超时或未登录");
                    response.setStatusCode(HttpStatus.UNAUTHORIZED);
                    return response.setComplete();
                } else if (!authToken.equals(token)) {
                    // token错误
                    logger.info("用户[" + userNo + "]权限验证未通过");
                    response.setStatusCode(HttpStatus.UNAUTHORIZED);
                    return response.setComplete();
                } else {
                    // token正确，刷新token生效时间
                    logger.info("用户[" + userNo + "]权限验证通过");
                    redisClinet.expire(userNo, expireSeconds);
                }
            } else {
                // 获取用户登录token和上次请求时间
                Map<String, String> map = TOKENS.get(userNo);
                if (map == null) {
                    logger.info("用户[" + userNo + "]连接会话超时超时或未登录");
                    response.setStatusCode(HttpStatus.UNAUTHORIZED);
                    return response.setComplete();
                } else {
                    String authTime = map.get("time");
                    if (System.currentTimeMillis() - Long.parseLong(authTime) > expireSeconds * 1000) {
                        logger.info("用户[" + userNo + "]连接会话超时超时");
                        response.setStatusCode(HttpStatus.UNAUTHORIZED);
                        TOKENS.remove(userNo);
                        return response.setComplete();
                    }
                    String authToken = map.get("token");
                    if (authToken == null || !authToken.equals(token)) {
                        logger.info("用户[" + userNo + "]权限验证未通过");
                        response.setStatusCode(HttpStatus.UNAUTHORIZED);
                        return response.setComplete();
                    }
                }
                // 刷新用户请求时间
                logger.info("用户[" + userNo + "]权限验证通过");
                map.put("time", System.currentTimeMillis() + "");
                TOKENS.put(userNo, map);
            }
        } catch (Exception e) {
            logger.error("登录认证异常", e);
            response.setStatusCode(HttpStatus.BAD_GATEWAY);
            return response.setComplete();
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }

}
