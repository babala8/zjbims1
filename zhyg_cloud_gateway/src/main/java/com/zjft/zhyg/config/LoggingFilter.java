package com.zjft.zhyg.config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;


/**
 * @Author zyq
 * @Description 请求打印过滤器
 **/
@Component
public class LoggingFilter implements GlobalFilter, Ordered {

    private static final Log logger = LogFactory.getLog(LoggingFilter.class);

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        // 设置请求打印格式
        String info = String.format("receive request [ Host:%s Path:%s Method:%s ]",
                request.getURI().getHost(),
                request.getURI().getPath(),
                request.getMethod().name());
        logger.info(info);
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return Ordered.LOWEST_PRECEDENCE;
    }
}