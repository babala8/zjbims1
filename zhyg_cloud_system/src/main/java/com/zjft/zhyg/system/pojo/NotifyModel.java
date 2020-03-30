package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class NotifyModel implements Serializable {
    /**
     * 编号
     */
    private String modelIb;
    /**
     * 通知类型
     */
    private  Integer notifyType;
    /**
     * 通知方式
     */
    private Integer notifyWay;
    /**
     * 模板来源
     */
    private  Integer modelBy;
    /**
     * 信息格式
     */
    private  String infoSet;
}
