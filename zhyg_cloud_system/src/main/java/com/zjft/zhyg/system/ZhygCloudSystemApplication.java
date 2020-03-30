package com.zjft.zhyg.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringCloudApplication
@EnableTransactionManagement
@EnableFeignClients
@EnableScheduling
@ServletComponentScan
public class ZhygCloudSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZhygCloudSystemApplication.class, args);
    }

}
