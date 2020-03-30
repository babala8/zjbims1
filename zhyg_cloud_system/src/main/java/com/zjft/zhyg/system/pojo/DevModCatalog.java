package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:limengrd
 * @Description:设备模块
 */
@Data
public class DevModCatalog implements Serializable {
    private String no;
    private String name;
    public DevModCatalog(){}
}
