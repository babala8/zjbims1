package com.zjft.zhyg.system.dto;

import com.zjft.zhyg.system.pojo.RoleButton;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author zyq
 * @Description 登录返回对象
 **/
@Data
public class SessionDto implements Serializable {
    /**
     * 用户信息
     */
    private UserDto user;
    /**
     * 用户验证标识
     */
    private String token;
    /**
     * 用户权限按钮
     */
    private List<RoleButton> btnList;
    /**
     * 用户权限菜单
     */
    private List<String> menuList;
    /**
     * 数据由现有的数据前端拼接，后端不做处理
     */
    private List<RoleButton> auditFlagList;

    private  int outDate;


}
