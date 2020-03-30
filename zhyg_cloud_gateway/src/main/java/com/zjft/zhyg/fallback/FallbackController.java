package com.zjft.zhyg.fallback;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author zyq
 * @Description 服务降级
 **/
@RestController
public class FallbackController {
    @RequestMapping("/fallback")
    public Map<String, String> fallback() {
        Map<String, String> map = new HashMap<>(4);
        map.put("retMsg", "服务不可用");
        map.put("retCode", "fail");
        return map;
    }
}
