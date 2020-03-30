package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Audit implements Serializable {
    private String no;
    private User applyUser;
    private String operateTime;
    private String menuNo;
    private String btnNo;
    private String menuName;
    private String btnName;
    private byte[] currentDetail;
    private byte[] beforeDetail;
    private String commitNote;
    private Org commitOrg;
    private Role commitRole;
    private User commitUser;
    private String commitStatus;
    private User auditUser;
    private String auditResult;
    private String auditTime;
    private String auditNote;
    private String note;

    private Object current;
    private Object before;
}
