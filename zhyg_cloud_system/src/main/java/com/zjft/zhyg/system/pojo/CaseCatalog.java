package com.zjft.zhyg.system.pojo;


import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:CASE故障分类信息表
 */
@Data
public class CaseCatalog implements Serializable {
    /**
     * 所属机构
     */
    private Org org;
    /**
     * 所属机构编号
     */
    private String orgNo;
    /**
     * CASE故障类型号
     */
    private Integer catalogNo;
    /**
     * 分类名称
     */
    private String catalogName;
    /**
     * 负责人类型
     */
    private Integer responsorCatalog;
    /**
     * 要求回复时间
     */
    private Integer replyInterval;
    /**
     * 要求到场时间(在行）
     */
    private Integer onsiteInterval;
    /**
     * 要求到场时间(离行)
     */
    private Integer onsiteInterval1;
    /**
     * 要求关闭时间（在行）
     */
    private Integer closeInterval;
    /**
     * 要求关闭时间（离行）
     */
    private Integer closeInterval1;
    /**
     * 要求挂起时间
     */
    private Integer expireInterval;
    /**
     * 最高升级级别即case升级短信通知最大次数
     */
    private Integer maxGrade;
    /**
     * 响应级别
     */
    private Integer respondGrade;
    /**
     * 通知方式
     */
    private Integer notifyWay;
    /**
     * CASE发送短信方式
     */
    private Integer sendMsgMethod;

}