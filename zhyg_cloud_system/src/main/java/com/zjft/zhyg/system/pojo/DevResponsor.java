package com.zjft.zhyg.system.pojo;


import lombok.Data;

/**
 * @Author:xss
 * @Description:设备责任人表
 */
@Data
public class DevResponsor {
    /**
     * 编号
     */
    private String logicId;
    /**
     * 设备号
     */
    private String devNo;
    /**
     * 责任人分类
     */
    private String catalog;
    /**
     * 责任人级别
     */
    private String grade;
    /**
     * 责任人编号
     */
    private String responserNo;
}
