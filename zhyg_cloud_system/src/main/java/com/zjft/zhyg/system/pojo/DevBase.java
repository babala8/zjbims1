package com.zjft.zhyg.system.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author:xss
 * @Description:设备信息表
 */
@Data
public class DevBase implements Serializable {
    /**
     * 设备号
     */
    private String no;
    /**
     * 设备IP地址
     */
    private String ip;
    /**
     * 所属机构
     */
    private Org org;
    /**
     * 所属机构编号
     */
    private String orgNo;
    /**
     * 离行在行标志
     */
    private String awayFlag;
    /**
     * 设备类型
     */
    private DevCatalog devCatalog;
    /**
     * 设备类型编号x
     */
    private String devCatalogNo;
    /**
     * 设备品牌
     */
    private DevVendor devVendor;
    /**
     * 设备品牌编号
     */
    private String devVendorNo;
    /**
     * 设备型号
     */
    private DevType devType;
    /**
     * 设备型号编号
     */
    private String devTypeNo;
    /**
     * 设备维护商编号
     */
    private String devService;
    /**
     * 设备维护商
     */
    private DevServiceCompany devServiceCompany;
    /**
     * 经营方式
     */
    private String workType;
    /**
     * 终端号
     */
    private String terminalNo;
    /**
     * 设备序列号
     */
    private String serial;
    /**
     * 设备地址
     */
    private String address;
    /**
     * 设备购买日期
     */
    private String buyDate;
    /**
     * 设备安装日期
     */
    private String installDate;
    /**
     * 设备启用日期
     */
    private String startDate;
    /**
     * 设备停用日期
     */
    private String stopDate;
    /**
     * 每日开机时间
     */
    private String openTime;
    /**
     * 每日关机时间
     */
    private String closeTime;
    /**
     * 保修到期日期
     */
    private String expireDate;
    /**
     * 设备巡检周期
     */
    private  String patrolPeriod;
    /**
     * 钱箱报警金额
     */
    private String cashboxLimit;
    /**
     * 操作系统
     */
    private String os;
    /**
     * atmc软件
     */
    private String atmcSoft;
    /**
     * 防病毒软件
     */
    private String antiVirusSoft;
    /**
     * 厂商sp类型
     */
    private String sp;
    /**
     * 虚拟柜员号
     */
    private String virtualTellerNo;
    /**
     * 设备关注程度
     */
    private String careLevel;
    /**
     * v
     */
    private String lastPmDate;
    /**
     * 巡检到期日期
     */
    private String expirePmDate;
    /**
     * 地理位置
     */
    private String locateNo;
    /**
     *备用1
     */
    private String note1;
    /**
     * 备用2
     */
     private String note2;
    /**
     * 备用3
     */
     private String note3;
    /**
     * 备用4
     */
     private String note4;
    /**
     * 备用5
     */
     private String note5;
    /**
     * 运营商
     */
    private String carrier;
    /**
     * 加钞机构
     */
    private String moneyOrg;
    /**
     * 设备状态
     */
    private String devStatus;
    /**
     * 周边环境
     */
    private String environment;
    /**
     * 地点代码
     */
    private String addressCode;
    /**
     * 非现金标志
     */
    private String cashType;
    /**
     * 安装方式
     */
    private String setupType;
    /**
     * 有线无线标志
     */
    private String netType;
    /**
     * 运营状态
     */
    private String operateStatus;
    /**
     * 注册状态
     */
    private String registrationStatus;
    /**
     * 通讯每包传输大小
     */
    private String commPacket;
    /**
     * 通讯传输压缩方式
     */
    private String zipType;
    /**
     * MAK密钥
     */
    private String dekEncoded;
    /**
     * p端区域码
     */
    private String atmpArea;
    /**
     * 日志路径
     */
    private  String devLogPath;
    /**
     * 文件传输速度上限
     */
    private String transRate;

    // 重庆银行需要下面三个字段 制作报表
    /**
     * 是否自助银行
     */
    private String selfBank;
    /**
     * 投入主体
     */
    private String investment;
    /**
     * 每季合作笔数
     */
    private Integer cooperationNumber;
    /**
     * 添加设备人员
     */
    private String addUser;
    /**
     * 季度租赁费用
     */
    private String quarterLeaseAmount;
    /**
     * 核心机构号
     */
    private String accountOrgNo;

    /**
     * 区划：1-主城区；2-非主城区；3-其他地区，默认1-主城区
     */
    private String areaDiv;

    /**
     * 所属区域
     */
    private String belongarea;

    /**
     * 供应商：备选项同现有【设备维护商】字段
     */
    private String cooperation;

    /**
     * 设备换机日期：同设备安装日期一样的日期控件
     */
    private String changeDate;

    /**
     * 使用状态：下拉框，必输备选项：1-在用；2-未用；3-报废，默认：1-在用
     */
    private String useStatus;

    /**
     * 固定资产编号
     */
    private String assetsNo;

    /**
     * 网络运营商
     */
    private String networkOperator;

    /**
     * 备注
     */
    private String remark;
    /**
     * 安装网点
     */
    private String installSite;
    /**
     * 加钞方式  备选项：1-自主；2-外包，默认1-自主
     */
    private String caseWay;
    /**
     * 下拉框，备选项：0-正常；-1-停机，默认：0-正常；P端数据库TERMINALDEF.CURRSTATUS
     */
    private String currstatus;

    private String areaNo;
}
