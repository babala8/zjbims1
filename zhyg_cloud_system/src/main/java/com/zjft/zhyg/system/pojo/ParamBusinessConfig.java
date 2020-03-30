package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: liurenfei
 * @description:业务参数配置表
 */
@Data
public class ParamBusinessConfig implements Serializable {
    private String devNo;// 设备号
    private String paramKey; // 节点标识
    private String paramValue; // 参数值
    private String addUser; // 添加人员
    private String addTime; // 添加时间
    private String taskFlag; // 任务标志
    private String takeFlag; // 加载标志
    private String takeTime; // 加载时间
}
