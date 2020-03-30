package com.zjft.zhyg.system.dao;

import com.zjft.zhyg.system.pojo.BulletinInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author liurenfei
 * @Description 系统公告
 */
@Mapper
@Repository
public interface BulletinInfoDao {

    /**
     * 添加系统公告
     * 注：可能为null的字段，需要设置jdbyType
     * @param bulletinInfo
     */
    void  add(BulletinInfo bulletinInfo);

    /**
     * 根据编号删除系统公告
     * @param bulletinId
     */
    void del(@Param("bulletinId") String bulletinId);

    /**
     * 修改系统公告
     * @param bulletinInfo
     */
    void mod(BulletinInfo bulletinInfo);

    /**
     * 查询所有系统公告
     * @return
     */
    List<BulletinInfo> qry(Map<String,Object> param);

    /**
     * 查询系统公告最大编号
     * @return
     */
    String qryMaxId();

    /**
     * 根据编号查系统公告
     * @param bulletinId
     * @return
     */
    BulletinInfo qryById(@Param("bulletinId")String bulletinId);

    /**
     * 添加用户未读消息
     * @param bulletNo
     * @param userNos
     */
    void addUnread(@Param("bulletNo") String bulletNo, @Param("userNos") List<String> userNos);

    /**
     * 删除改公告的未读记录
     * @param bulletNo
     */
    void deleteUnread(@Param("bulletNo") String bulletNo);

    /**
     * 删除用户未读的公告
     * @param userNo
     */
    void deleteUserUnread(@Param("userNo") String userNo);

    /**
     * 未读公告数量
     * @param userNo
     * @return
     */
    int unreadCount(@Param("userNo") String userNo);

    /**
     * 根据标题查公告
     * @param title
     * @return
     */
    BulletinInfo qryByTitle(@Param("title") String title);
}
