package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:limengrd
 * @Description:设备类型表
 */
@Data
public class DevCatalog implements Serializable {
    /**
     * 编号
     */
    private String no;
    /**
     * 设备类型
     */
    private String name;
    /**
     * 监控类型
     */
    private String monitorType;
    /**
     * 描述
     */
    private String enname;

}
