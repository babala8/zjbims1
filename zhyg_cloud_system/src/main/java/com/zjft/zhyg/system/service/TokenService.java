package com.zjft.zhyg.system.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @Author zyq
 * @Description token服务远程调用
 **/
@FeignClient("${zj.gateway-name}")
public interface TokenService {
    /**
     * 保存session
     * @param session
     */
    @PostMapping("/token")
    void saveToken(@RequestBody Map<String, String> session);

    /**
     * 移除token
     * @param userNo
     */
    @DeleteMapping("/token")
    void removeToken(@RequestParam("userNo") String userNo);
}
