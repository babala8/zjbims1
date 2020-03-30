package com.zjft.zhyg.system.aop;

/**
 * @Author zyq
 * @Description 菜单枚举
 **/
public enum Menus {

    HOMEPAGE("000", "主页"),
    ORG("F01", "机构管理"),
    USER("F02", "用户管理"),
    ROLE("F03", "角色管理"),
    DEV("F04", "设备管理"),
    DEV_RESPONSER("F05", "设备责任人"),
    FAULT_RESPONSE("F06", "故障响应设定"),
    ORG_STAFF("F07", "网点人员管理"),
    COMPANY_MAINTAIN("F08", "厂商维护商管理"),
    DEV_MAINTAIN("F09", "设备维护商管理"),
    DEV_VENDOR("F10", "设备品牌管理"),
    DEV_TYPE("F11", "设备型号管理"),
    DEV_CATALOG("F12", "设备类型管理"),
    BULLETIN("F18", "公告管理"),
    DEV_STOP("F20", "设备停机管理"),
    SEIF_HELP_BANK("F21","自助银行管理"),
    RUN_PARAM("F28","系统运行参数"),
    UNKNOWN("111", "未知模块");

    private String no;
    private String name;

    public String getNo() {
        return no;
    }

    public String getName() {
        return name;
    }

    Menus(String no, String name) {
        this.no = no;
        this.name = name;
    }
}
