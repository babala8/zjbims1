package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author zyq
 * @Description 机构类型信息
 **/
@Data
public class OrgType implements Serializable {
    /**
     * 类型编号
     */
    private String no;
    /**
     * 类型名称
     */
    private String type;
    /**
     * 类型所属级别
     */
    private String grade;
}
