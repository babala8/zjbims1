package com.zjft.zhyg.fallback;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 心跳检测
 */
@RestController
@RequestMapping("ZJBIMS")
public class HeardController {
    @RequestMapping(value = "/ZJBIMS", method = RequestMethod.GET)
    public String test( String DETECT){
        if(DETECT.isEmpty() || !DETECT.equals("CONNTEST")){
            return  null;
        }
        return "SUCCESS";
    }
}
