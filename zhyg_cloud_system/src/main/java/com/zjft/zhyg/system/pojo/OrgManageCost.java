package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author tps
 * @Description 机构经营成本
 **/
@Data
public class OrgManageCost implements Serializable {
    /**
     * 机构编号
     */
    private String orgNo;
    /**
     * 年份
     */
    private String year;
    /**
     * 月份
     */
    private String month;
    /**
     * 人员工资
     */
    private Integer wage;
    /**
     * 场地租金
     */
    private Integer rent;
    /**
     * 水电费用
     */
    private Integer resourceFee;
    /**
     * 促销活动费用
     */
    private Integer promotion;
    /**
     * 物资成本
     */
    private Integer material;
    /**
     * 其他成本
     */
    private Integer other;
    /**
     * 员工人数
     */
    private Integer staffCount;
}
