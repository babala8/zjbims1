package com.zjft.zhyg.system.pojo;

import lombok.Data;
import java.io.Serializable;

/**
 * @Author zyq
 * @Description
 **/
@Data
public class Log implements Serializable {

    private String userName;
    /**
     * 操作用户
     */
    private String userNo;
    /**
     * 操作时间
     */
    private String operateTime;
    /**
     * 功能模块
     */
    private String menuName;
    /**
     * 操作名称
     */
    private String btnName;
    /**
     * 操作前详细数据
     */
    private byte[] beforeDetail;
    /**
     * 操作后byte[]数据
     */
    private byte[] currentDetail;
    /**
     * 操作后byte[]转obj对象
     */
    private  Object before;
    /**
     * 备注
     */
    private  Object current;

    private String note;

}
