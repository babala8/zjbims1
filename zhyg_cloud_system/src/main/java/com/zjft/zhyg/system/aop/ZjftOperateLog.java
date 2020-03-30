package com.zjft.zhyg.system.aop;

import java.lang.annotation.*;

/**
 * @Author zyq
 * @Description 日志注解，用在需要记录日志的方法上
 **/
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ZjftOperateLog {

    Menus menu() default Menus.UNKNOWN;

    Buttons button() default Buttons.UNKNOWN;
}
