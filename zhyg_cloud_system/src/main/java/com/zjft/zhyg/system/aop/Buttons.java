package com.zjft.zhyg.system.aop;

/**
 * @Author zyq
 * @Description 按钮枚举
 **/
public enum Buttons {

    LOGIN("登录"),
    LOGOUT("登出"),
    ADD("添加"),
    DEL("删除"),
    MOD("修改"),
    UPLOAD("上传"),
    DOWNLOAD("下载"),
    UNLOCK("解锁"),
    MOD_PASSWORD("修改密码"),
    COST_SET("设置/修改成本"),
    UNKNOWN("未知操作");

    private String name;

    Buttons(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
