package com.zjft.zhyg.system.pojo;


import lombok.Data;

/**
 * @Author:xss
 * @Description:设备工作时间表
 */
@Data
public class OrgWorkTime {
    /**
     * 编号
     */
    private String logicId;
    /**
     * 机构号
     */
    private String OrgNo;
    /**
     * 日期类型
     */
    private String datesType;
    /**
     * 日期类型说明
     */
    private String datesTypeStatement;
    /**
     *如果为空，则日期类型为周末或工作日
     */
    private String dates;
    /**
     * 工作开始时间
     */
    private String startTime;
    /**
     * 工作结束时间
     */
    private String endTime;

/*
* 是否营业
* */
    private String businessFlag;
}
