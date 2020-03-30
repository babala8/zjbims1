package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: liurenfei
 * @description:业务参数模板表
 */
@Data
public class ParamBusinessTemplate implements Serializable {
    private String paramKey; // 节点标识
    private String paramName; // 参数中文名称
    private String paramValue; // 参数默认值
    private String remark; // 参数描述
    private String regex; // 正则表达式
}
