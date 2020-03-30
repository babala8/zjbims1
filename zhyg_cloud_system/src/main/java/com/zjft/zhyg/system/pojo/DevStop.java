package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Deprecated 设备停机表
 */

@Data
public class DevStop implements Serializable {
    private String logicId;
    private String devNo;
    private String setTime;
    private String stopDevStartTime;
    private String stopDevEndTime;
    private String stopDevType;
    private String stopDevReason;
    private Integer status;
    private String opNo;
    private Integer isAfter;
}
