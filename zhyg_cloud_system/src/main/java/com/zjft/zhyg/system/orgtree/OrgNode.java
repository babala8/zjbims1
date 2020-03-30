package com.zjft.zhyg.system.orgtree;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author zyq
 * @Description 机构树节点
 **/
@Data
public class OrgNode implements Serializable {
    private String no;
    private String name;
    private String parentOrgNo;
    private int left;
    private int right;
    private int treeLevel;
    private List<OrgNode> childNodes;

}
