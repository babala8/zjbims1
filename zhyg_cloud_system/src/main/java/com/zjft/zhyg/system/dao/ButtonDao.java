package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.dto.ButtonMenuDto;
import com.zjft.zhyg.system.pojo.Button;
import com.zjft.zhyg.system.pojo.RoleButton;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
 * @Author zyq
 * @Description 按钮操作
 **/
@Repository
public interface ButtonDao {
    /**
     * 根据编号查询按钮
     * @param no
     * @return
     */
    Button qryByNo(@Param("no") String no);

    /**
     * 查询所有按钮信息
     * @param
     * @return
     */
    List<ButtonMenuDto> qryAllButtons();

    /**
     * 根据角色删除其按钮列表
     * @param roleNo
     * @return
     */
    void delButtonsByRoleNo(@Param("roleNo") String roleNo);
}
