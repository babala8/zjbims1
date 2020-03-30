package com.zjft.zhyg.system;


import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @author: zyq
 * @description: 获取spring 注册的bean，用于在普通类中注入bean
 **/
@Component
public class SpringContextHolder implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    /**
     * 注入上下文
     */
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        SpringContextHolder.applicationContext = applicationContext;
    }

//    public static ApplicationContext getApplicationContext() {
//        checkApplicationContext();
//        return applicationContext;
//    }

    /**
     * 从上下文获取Bean，根据名称获取
     */
    public static <T> T getBean(String name) {
        checkApplicationContext();
        return (T) applicationContext.getBean(name);
    }

    /**
     * 从上下文获取Bean, 根据类型获取
     */
    public static <T> T getBean(Class<T> clazz) {
        checkApplicationContext();
        return (T) applicationContext.getBeansOfType(clazz);
    }

//    public static void cleanApplicationContext() {
//        applicationContext = null;
//    }

    private static void checkApplicationContext() {
        if (applicationContext == null) {
            throw new IllegalStateException("SpringContextHolder未初始化");
        }
    }
}