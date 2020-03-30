package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author liurenfei
 * @Description 系统公告表
 */
@Data
public class BulletinInfo implements Serializable {
    /**
     * 公告编号
     */
    private  String bulletinId;
    /**
     * 公告主题
     */
    private  String title;
    /**
     * 公告内容
     */
    private  String content;
    /**
     * 公告发布日期
     */
    private  String releaseDate;
    /**
     * 公告截止日期
     */
    private  String expireDate;
    /**
     * 发布人
     */
    private  String publisher;
    /**
     * 系统公告附件路径1
     */
    private  String attachment1;
    /**
     * 系统公告附件路径2
     */
    private  String attachment2;
    /**
     * 系统公告附件路径3
     */
    private  String attachment3;
}
