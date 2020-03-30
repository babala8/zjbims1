package com.zjft.zhyg.system.pojo;

import lombok.Data;

/**
 * 标准省市县编码表
 */
@Data
public class ProvinceCityCode {
    private String code;
    private String codeName;
    // 级别 1省级 2市级 3县级
    private String grade;
    // 所属省级编码
    private String provinceCode;
    // 所属市级编码
    private String cityCode;
}
