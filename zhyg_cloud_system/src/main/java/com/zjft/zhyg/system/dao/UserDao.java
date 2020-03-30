package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * @Author zyq
 * @Description 用户操作
 **/
@Repository
public interface UserDao {


    /**
     * 根据用户名查询用户
     *
     * @param no
     * @return
     */
    User findByNo(@Param("no") String no);

    /**
     * 密码输入错误次数+1
     *
     * @param passwdError
     * @param no
     * @return
     */
    void updatePasswdError(@Param("passwdError") int passwdError, @Param("no") String no);

    /**
     * 修改用户在线状态
     *
     * @param onlineFlag
     * @param onlineFlag
     * @return
     */
    void updateOnlineFlag(@Param("onlineFlag") String onlineFlag, @Param("no") String no);

    /**
     * 修改用户登录时间
     *
     * @param loginTime
     * @param no
     * @return
     */
    void updateLoginTime(@Param("loginTime") String loginTime, @Param("no") String no);

    /**
     * 动态查询用户列表
     * @param param
     * @return
     */
    List<User> qry(Map<String, Object> param);

    /**
     * 添加用户
     * 注：可能为null 的字段，需要设置jdbcType
     *
     * @param user
     */
    void add(User user);


    /**
     * 根据用户名查询用户是否重复
     *
     * @param no
     * @param name
     * @return
     */
    User qryByNo(@Param("name") String name, @Param("no") String no);

    /**
     * 修改用户
     *
     * @param user
     */
    void mod(User user);

    /**
     * 用户删除
     *
     * @param no
     */
    void del(@Param("no") String no);

    /**
     * 修改密码
     * @param passwd
     * @param no
     */
    void modPasswd(@Param("passwd") String passwd, @Param("no") String no,@Param("passwdExpiration") String passwdExpiration);
    /**
     *
     * @param loginTime
     * @param onlineFlag
     * @param no
     */
    void updateUser(@Param("loginTime") String loginTime, @Param("onlineFlag") String onlineFlag, @Param("no") String no);

    /**
     * 修改用户状态
     * @param status
     * @param no
     */
    void updateUserStatus(@Param("status") String status, @Param("no") String no);
    /**
     * 修改用户密码次数和帐号状态
     */
    void updatePasswdErrorAndStatus(Map<String, Object> map);

    /**
     * 根据角色编号查询用户
     */
    List<User> qryByRoleNo(@Param("roleNo") String roleNo);
    /**
     * 获取所有用户ID
     * @return
     */
    List<String> getAllNo();
    /**
     * 查询用户设备类型权限
     * @param no
     */
    String qryDevRole(@Param("no") String no);
    /**
     * 添加用户设备类型权限
     * @param devCatalog
     * @param no
     */
    void addDevRole(@Param("devCatalog") String devCatalog, @Param("no") String no);

    /**
     *修改用户设备类型权限
     * @param devCatalog
     * @param no
     */
    void modDevRole(@Param("devCatalog") String devCatalog, @Param("no") String no);

    /**
     * 删除用户设备类型权限
     * @param no
     */
    void delDevRole(@Param("no") String no);

    /**
     * 获取在线用户总数
     * @return
     */
    int getOnlineCount();
}
