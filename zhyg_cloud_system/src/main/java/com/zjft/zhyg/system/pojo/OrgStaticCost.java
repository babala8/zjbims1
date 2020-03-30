package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author tps
 * @Description 机构固定成本
 **/
@Data
public class OrgStaticCost implements Serializable {
    /**
     * 机构编号
     */
    private String orgNo;
    /**
     * 场地购置成本
     */
    private Integer place;
    /**
     * 装修成本
     */
    private Integer decoration;
    /**
     * 设备采购成本
     */
    private Integer device;
    /**
     * 其他成本
     */
    private Integer other;
    /**
     * 场地成本期数
     */
    private Integer placeStage;
    /**
     * 装修成本期数
     */
    private Integer decorationStage;
    /**
     * 设备采购成本期数
     */
    private Integer deviceStage;
    /**
     * 其他成本期数
     */
    private Integer otherStage;
}
