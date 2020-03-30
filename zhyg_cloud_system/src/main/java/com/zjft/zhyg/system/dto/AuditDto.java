package com.zjft.zhyg.system.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class AuditDto implements Serializable {
    private String no;
    private String applyUserNo;
    private String applyUserOrgName;
    private String applyUserName;
    private String applyUsermobile;
    private String operateTime;
    private String menuNo;
    private String btnNo;
    private String menuName;
    private String btnName;
    private byte[] currentDetail;
    private byte[] beforeDetail;
    private String commitNote;
    private String commitOrgNo;
    private String commitOrgName;
    private String commitRoleNo;
    private String commitRoleName;
    private String commitUserNo;
    private String commitUserName;
    private String commitStatus;
    private String auditUserNo;
    private String auditUserName;
    private String auditResult;
    private String auditTime;
    private String auditNote;
    private String note;

    private Object current;
    private Object before;
}
