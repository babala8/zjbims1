package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: liurenfei
 * @description:设备软件类型表
 */
@Data
public class DevSoftCatalog implements Serializable {
    private String groupId;//编号
    private String groupType;//分组类型
    private String groupName;//分组名称
    private String groupValue;//分组值
}
