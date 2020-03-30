package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: liurenfei
 * @description:系统管理服务配置表
 */
@Data
public class ServicePropSystem implements Serializable {
    /**
     * 参数标识
     */
    private String keyId;
    /**
     * 参数值
     */
    private String value;
    /**
     * 描述
     */
    private String note;
    /**
     * 参数说明
     */
    private String description;
    /**
     * 是否可编辑
     */
    private String isEdit;
}
