create table RVC_PROJECT_TYPE
(
   GROUPID              VARCHAR(10)            not null,
   GROUPTYPE            VARCHAR(3)             not null,
   GROUPNAME            VARCHAR(20)            not null,
   GROUPVALUE           VARCHAR(60)            not null,
   constraint RVC_PROJECT_TYPE primary key (GROUPID)
)  in  ZHYGSPACE;

comment on table RVC_PROJECT_TYPE is
'工程类别表';

comment on column RVC_PROJECT_TYPE.GROUPID is
'101—操作系统102—ATMC软件103—防病毒软件104—厂商SP类型';

comment on column RVC_PROJECT_TYPE.GROUPTYPE is
'分组类型';

comment on column RVC_PROJECT_TYPE.GROUPNAME is
'分组名称';

comment on column RVC_PROJECT_TYPE.GROUPVALUE is
'分组值';
create table ADS_CANCEL_INFO
(
  ADS_ID    VARCHAR(40) not null,
  DEVNO   VARCHAR(20) not null,
  adduser  VARCHAR(20),
  addtime  VARCHAR(20),
  taskflag CHAR(1) not null,
   constraint PK_ADS_CANCEL_INFO primary key (ADS_ID,DEVNO)       
)
in ZHYGSPACE index in ZHYGIDX;
comment on table ADS_CANCEL_INFO
  is '广告撤销记录表';
comment on column ADS_CANCEL_INFO.ADS_ID
  is '广告标识';
comment on column ADS_CANCEL_INFO.DEVNO
  is '设备号';
comment on column ADS_CANCEL_INFO.adduser
  is '添加人员';
comment on column ADS_CANCEL_INFO.addtime
  is '添加时间';
comment on column ADS_CANCEL_INFO.taskflag
  is '任务标识 0：未通知 1：已通知';
create table ADS_INFO_TABLE
(
  ads_id          VARCHAR(40) not null,
  ads_seq_no    VARCHAR(40) not null,
  ads_space_id    VARCHAR(40) not null,
  name        VARCHAR(50) not null,
  resource_id VARCHAR(36) not null,
  ADS_STATUS CHAR(1),
  play_start_time VARCHAR(20),
  play_end_time VARCHAR(20),
  play_time VARCHAR(20),
  adsfilepath VARCHAR(500),
  description VARCHAR(500),
  ADDUSER VARCHAR(20),
  ADDTIME VARCHAR(20),
  VERSIONNOTIFYFLAG     CHAR(1) default '0' not null,
  TAKETIME              VARCHAR(20),
   constraint PK_ADS_INFO_TABLE primary key (ads_id)        
   )
   
in ZHYGSPACE index in ZHYGIDX;

comment on table ADS_INFO_TABLE
  is '广告信息表';
comment on column ADS_INFO_TABLE.ads_id
  is '广告编号';
comment on column ADS_INFO_TABLE.ads_seq_no
  is '广告标识序号 如ADS_ID为：1.0.0，则该值为001000000';
comment on column ADS_INFO_TABLE.ads_space_id
  is '广告位编号';
comment on column ADS_INFO_TABLE.play_start_time
  is '播放开始时间';   
comment on column ADS_INFO_TABLE.play_end_time
  is '播放结束时间';
comment on column ADS_INFO_TABLE.play_time
  is '播放时长'; 
comment on column ADS_INFO_TABLE.adsfilepath
  is '广告包文件路径（绝对路径）';        
comment on column ADS_INFO_TABLE.name
  is '广告名称';
comment on column ADS_INFO_TABLE.resource_id
  is '资源编号';
comment on column ADS_INFO_TABLE.ADS_STATUS
  is '广告状态 1:可用 2:暂停使用 3:已作废 4：已删除';
comment on column ADS_INFO_TABLE.description
  is '广告描述'; 
comment on column ADS_INFO_TABLE.ADDUSER
  is '添加人员';        
comment on column ADS_INFO_TABLE.ADDTIME
  is '添加时间yyyy-MM-dd hh:mm:ss';
comment on column ADS_INFO_TABLE.VERSIONNOTIFYFLAG
  is '版本通知标志 0：未通知/未加载;1：正在通知/已加载;2：已通知成功;3：已通知，版本包非法';
comment on column ADS_INFO_TABLE.TAKETIME
  is '通知任务加载时间 YYYY-MM-DD hh:mm:ss';

create table ADS_REMOTE_TABLE
(
  ads_id       VARCHAR(40) not null,
  remote_range        CHAR(1),
  method       CHAR(1),
  valid_time   VARCHAR(20),
   constraint PK_ADS_REMOTE_TABLE primary key (ADS_ID)
 )
 in ZHYGSPACE index in ZHYGIDX;
comment on table ADS_REMOTE_TABLE
  is '广告投放表';
comment on column ADS_REMOTE_TABLE.ads_id
  is '广告编号';
comment on column ADS_REMOTE_TABLE.remote_range
  is '投放范围（1：投放试运行设备 2：投放所有设备 3：取消投放）';
comment on column ADS_REMOTE_TABLE.method
  is '生效方式（1：立即生效 2：指定时间生效）';
comment on column ADS_REMOTE_TABLE.valid_time
  is '生效时间（立即生效则记录当前时间）';

create table SYS_USER
(
  no                VARCHAR(20) not null,
  passwd            VARCHAR(50) not null,
  name              VARCHAR(40) not null,
  status            VARCHAR(1) not null,
  online_flag       VARCHAR(1) not null,
  role_no           VARCHAR(50) not null,
  org_no            VARCHAR(20) not null,
  phone             VARCHAR(20),
  mobile            VARCHAR(20),
  email             VARCHAR(40),
  login_ip          VARCHAR(30),
  login_time        VARCHAR(20),
  passwd_expiration VARCHAR(10),
  passwd_error      INTEGER default 0,
   constraint PK_SYS_USER primary key (NO)
 )in ZHYGSPACE index in ZHYGIDX;
comment on table SYS_USER
  is '人员表';
comment on column SYS_USER.no
  is '用户账号';
comment on column SYS_USER.passwd
  is '用户密码（MD5加密保存）';
comment on column SYS_USER.name
  is '人员姓名';
comment on column SYS_USER.status
  is '用户状态(1：启用 0：停用)';
comment on column SYS_USER.online_flag
  is '在线状态(1：在线 ；0：离线）';
comment on column SYS_USER.role_no
  is '用户角色';
comment on column SYS_USER.org_no
  is '所属机构';
comment on column SYS_USER.phone
  is '办公电话';
comment on column SYS_USER.mobile
  is '手机号码';
comment on column SYS_USER.email
  is '电子邮件';
comment on column SYS_USER.login_ip
  is '上次登录IP';
comment on column SYS_USER.login_time
  is '上次登录时间（YYYY-MM-DD HH:MM24:SS）';
comment on column SYS_USER.passwd_expiration
  is '密码到期日（YYYY-MM-DD）';
comment on column SYS_USER.passwd_error
  is '密码错误次数';

create table SYS_USER_DEVROLE
(
  USER_NO                VARCHAR(20) not null,
  DEV_CATALOG            VARCHAR(5) not null,
   constraint PK_SYS_USER_DEVROLE primary key (USER_NO,DEV_CATALOG)        
)
in ZHYGSPACE index in ZHYGIDX;
comment on table SYS_USER_DEVROLE
  is '系统用户设备权限表';
comment on column SYS_USER_DEVROLE.USER_NO
  is '用户ID 同SYS_USER.NO';
comment on column SYS_USER_DEVROLE.DEV_CATALOG
  is '设备类型编号 值为all表示所有设备类型，同一个用户all与其他设备类型编号不能同时存在。其他同DEV_CATALOG_TABLE.NO';
  
create table ADS_RESOURCE
(
  no          VARCHAR(36) not null,
  name  VARCHAR(50),
  type        VARCHAR(10) not null,
  path        VARCHAR(200),
  description VARCHAR(100),
  width       INTEGER,
  height      INTEGER,
  duration    INTEGER,
  text        VARCHAR(1024),
  ADDUSER VARCHAR(20),
  ADDTIME VARCHAR(20),
   constraint PK_ADS_RESOURCE primary key (NO)        
  )
  in ZHYGSPACE index in ZHYGIDX;
comment on table ADS_RESOURCE
  is '广告资源表';
comment on column ADS_RESOURCE.no
  is '编号';
comment on column ADS_RESOURCE.name
  is '资源名称';  
comment on column ADS_RESOURCE.type
  is '资源类型（1：图片，2：视频，3：文字）';
comment on column ADS_RESOURCE.path
  is '资源路径';
comment on column ADS_RESOURCE.description
  is '资源描述';
comment on column ADS_RESOURCE.width
  is '宽';
comment on column ADS_RESOURCE.height
  is '高';
comment on column ADS_RESOURCE.duration
  is '（视频广告）时长';
comment on column ADS_RESOURCE.text
  is '（文字广告）内容';
comment on column ADS_RESOURCE.ADDUSER
  is '添加人员';
comment on column ADS_RESOURCE.ADDTIME
  is '添加时间 yyyy-MM-dd hh:mm:ss';

create table ADS_SPACE_TABLE
(
  id      VARCHAR(40) not null,
  name    VARCHAR(50) not null,
  type    VARCHAR(2) not null,
  Play_order VARCHAR(8),
  status  CHAR(1) not null,
  adduser VARCHAR(20),
  addtime VARCHAR(20),
  adstypeurl VARCHAR(60),
   constraint PK_ADS_SPACE_TABLE primary key (ID)
   )
  in ZHYGSPACE index in ZHYGIDX;
comment on table ADS_SPACE_TABLE
  is '广告位信息表';
comment on column ADS_SPACE_TABLE.id
  is '广告位编号';
comment on column ADS_SPACE_TABLE.name
  is '广告位名称';
comment on column ADS_SPACE_TABLE.type
  is '广告类型（1：等待插卡广告 2：交易中广告）';
 comment on column ADS_SPACE_TABLE.Play_order
  is '播放序号'; 
comment on column ADS_SPACE_TABLE.status
  is '广告位状态（1：可用 2：禁用 3：删除）';
comment on column ADS_SPACE_TABLE.adduser
  is '广告位添加人员';
comment on column ADS_SPACE_TABLE.addtime
  is '广告位添加时间（yyyy-MM-dd hh:mm:ss）';
 comment on column ADS_SPACE_TABLE.adstypeurl
  is '终端广告配置节点名'; 

create table CARD_TYPE_TABLE
(
  no        VARCHAR(20) not null,
  card_type VARCHAR(20),
   constraint PK_CARD_TYPE_TABLE primary key (NO)
   )     in ZHYGSPACE index in ZHYGIDX;
comment on table CARD_TYPE_TABLE
  is '卡类型表';
comment on column CARD_TYPE_TABLE.no
  is '卡序号';
comment on column CARD_TYPE_TABLE.card_type
  is '卡类型';

create table ADS_CLICK_DETAIL
(
  dev_no    VARCHAR(20) not null,
  time      VARCHAR(19) not null,
  adv_no    VARCHAR(36) not null,
  card_no   VARCHAR(30) not null,
  card_type VARCHAR(1) not null,
  user_sex  VARCHAR(1),
  user_age  VARCHAR(3),
   constraint PK_ADS_CLICK_DETAIL primary key (DEV_NO, TIME, ADV_NO)
)
in ZHYGSPACE index in ZHYGIDX;
comment on table ADS_CLICK_DETAIL
  is '广告点击详情表';
comment on column ADS_CLICK_DETAIL.dev_no
  is '设备号';
comment on column ADS_CLICK_DETAIL.time
  is '时间';
comment on column ADS_CLICK_DETAIL.adv_no
  is '广告编号';
comment on column ADS_CLICK_DETAIL.card_no
  is '卡号';
comment on column ADS_CLICK_DETAIL.card_type
  is '卡类型编号';
comment on column ADS_CLICK_DETAIL.user_sex
  is '用户性别';
comment on column ADS_CLICK_DETAIL.user_age
  is '用户年龄';

create table APPS_CATALOG_TABLE
(
  logic_id     VARCHAR(5) not null,
  apps_catalog VARCHAR(50) not null,
   constraint PK_APPS_CATALOG_TABLE primary key (LOGIC_ID)      
)
in ZHYGSPACE index in ZHYGIDX;
comment on table APPS_CATALOG_TABLE
  is '业务分类表';
comment on column APPS_CATALOG_TABLE.logic_id
  is '业务编号(从10001开始)';
comment on column APPS_CATALOG_TABLE.apps_catalog
  is '业务名称';


create table APPS_INFO_TABLE
(
  apps_id       VARCHAR(40) not null,
  apps_name     VARCHAR(50) not null,
  apps_type     CHAR(1) not null,
  apps_catalog  VARCHAR(5) not null,
  apps_status   CHAR(1) not null,
  logo_path     VARCHAR(400),
  add_user      VARCHAR(20),
  add_time      VARCHAR(20),
  description   VARCHAR(1000),
   constraint PK_APPS_INFO_TABLE primary key (APPS_ID)       
)
in ZHYGSPACE index in ZHYGIDX;
comment on table APPS_INFO_TABLE
  is '应用市场信息表';
comment on column APPS_INFO_TABLE.apps_id
  is '应用标识';
comment on column APPS_INFO_TABLE.apps_name
  is '应用名称';
comment on column APPS_INFO_TABLE.apps_type
  is '应用类型（1：全渠道统一平台  ，2：应用APP（客户端），3：应用APP（服务端），4：WSAP应用工程）';
comment on column APPS_INFO_TABLE.apps_catalog
  is '业务分类';
comment on column APPS_INFO_TABLE.apps_status
  is '应用状态';
comment on column APPS_INFO_TABLE.logo_path
  is 'logo路径';
comment on column APPS_INFO_TABLE.add_user
  is '添加人员';
comment on column APPS_INFO_TABLE.add_time
  is '添加时间';
comment on column APPS_INFO_TABLE.description
  is '应用描述';


create table APPS_MODEL_RANGE_INFO
(
  logicid VARCHAR(40) not null,
  modelid VARCHAR(40) not null,
  orgno   VARCHAR(40),
  catalog VARCHAR(5),
  vendor  VARCHAR(5),
  type    VARCHAR(5),
  devno   VARCHAR(40),
   constraint PK_APPS_MODEL_RANGE_INFO primary key (LOGICID)
)
in ZHYGSPACE index in ZHYGIDX;

comment on table APPS_MODEL_RANGE_INFO
  is '标杆设备范围表';
comment on column APPS_MODEL_RANGE_INFO.logicid
  is '编号';
comment on column APPS_MODEL_RANGE_INFO.modelid
  is '标杆编号';
comment on column APPS_MODEL_RANGE_INFO.orgno
  is '机构号';
comment on column APPS_MODEL_RANGE_INFO.catalog
  is '设备类型';
comment on column APPS_MODEL_RANGE_INFO.vendor
  is '设备品牌';
comment on column APPS_MODEL_RANGE_INFO.type
  is '设备型号';
comment on column APPS_MODEL_RANGE_INFO.devno
  is '设备号';


create table APPS_MODEL_SYNC_TASK
(
  logicid  VARCHAR(40) not null,
  tasktype VARCHAR(2) not null,
  syncunit VARCHAR(20),
  APPS_ID VARCHAR(40),
  APP_NO VARCHAR(20),
  TASKSTARTTIME  VARCHAR(20),
  adduser  VARCHAR(20),
  addtime  VARCHAR(20),
  taskflag CHAR(1) not null,
  TAKEFLAG  CHAR(1),
  TAKETIME  VARCHAR(20),
  SYNCOUNT  INTEGER,
  FINISHTIME  VARCHAR(20),
   constraint PK_APPS_MODEL_SYNC_TASK primary key (logicid)
)
in ZHYGSPACE index in ZHYGIDX;
comment on table APPS_MODEL_SYNC_TASK
  is '标杆信息同步任务表';
comment on column APPS_MODEL_SYNC_TASK.tasktype
  is '任务类型（1：设备版本 9：广告 10:广告撤销）';
comment on column APPS_MODEL_SYNC_TASK.syncunit
  is '同步设备号';
comment on column APPS_MODEL_SYNC_TASK.APPS_ID
  is '应用标识 工程/广告位';
comment on column APPS_MODEL_SYNC_TASK.APP_NO
  is '版本号 版本号/广告编号';
comment on column APPS_MODEL_SYNC_TASK.TASKSTARTTIME
  is '任务执行开始时间 YYYY-MM-DD hh:mm:ss';
comment on column APPS_MODEL_SYNC_TASK.adduser
  is '添加人员';
comment on column APPS_MODEL_SYNC_TASK.addtime
  is '添加时间';
comment on column APPS_MODEL_SYNC_TASK.taskflag
  is '任务标识';
comment on column APPS_MODEL_SYNC_TASK.TAKEFLAG
  is '默认为0,0：未加载,1：已加载';
comment on column APPS_MODEL_SYNC_TASK.TAKETIME
  is 'YYYY-MM-DD hh:mm:ss';
comment on column APPS_MODEL_SYNC_TASK.SYNCOUNT
  is '默认0';
comment on column APPS_MODEL_SYNC_TASK.FINISHTIME
  is 'YYYY-MM-DD hh:mm:ss';

create table APPS_MODEL_TABLE
(
  logic_id    VARCHAR(40) not null,
  model_name  VARCHAR(20) not null,
  model_upper VARCHAR(40),
  model_type  CHAR(1) not null,
  org_no      VARCHAR(40) not null,
  model_user  VARCHAR(20),
  model_time  VARCHAR(20),
  description VARCHAR(500),
   constraint PK_APPS_MODEL_TABLE primary key (LOGIC_ID)
         
)
in ZHYGSPACE index in ZHYGIDX;

comment on table APPS_MODEL_TABLE
  is '标杆基础信息表';
comment on column APPS_MODEL_TABLE.logic_id
  is '标杆编号';
comment on column APPS_MODEL_TABLE.model_name
  is '标杆名称';
comment on column APPS_MODEL_TABLE.model_upper
  is '上级标杆';
comment on column APPS_MODEL_TABLE.model_type
  is '标杆类型';
comment on column APPS_MODEL_TABLE.org_no
  is '机构号';
comment on column APPS_MODEL_TABLE.model_user
  is '标杆制作人';
comment on column APPS_MODEL_TABLE.model_time
  is '标杆制作时间';
comment on column APPS_MODEL_TABLE.description
  is '标杆描述';


create table APPS_MODEL_VERSION_TABLE
(
  logic_id      VARCHAR(40) not null,
  model_id      VARCHAR(40) not null,
  apps_id       VARCHAR(40) not null,
  version_no    VARCHAR(20) not null,
  update_mode   CHAR(1) not null,
  update_time   VARCHAR(20),
  syn_mode      CHAR(1) not null,
  syn_starttime VARCHAR(20),
   constraint PK_APPS_MODEL_VERSION_TABLE primary key (LOGIC_ID)
   
)
in ZHYGSPACE index in ZHYGIDX;

comment on table APPS_MODEL_VERSION_TABLE
  is '标杆版本信息表';
comment on column APPS_MODEL_VERSION_TABLE.logic_id
  is '编号';
comment on column APPS_MODEL_VERSION_TABLE.model_id
  is '标杆标识';
comment on column APPS_MODEL_VERSION_TABLE.apps_id
  is '应用标识';
comment on column APPS_MODEL_VERSION_TABLE.version_no
  is '应用版本号';
comment on column APPS_MODEL_VERSION_TABLE.update_mode
  is '生效方式（1：立即生效，2：指定时间生效，3：重启生效）';
comment on column APPS_MODEL_VERSION_TABLE.update_time
  is '生效时间';
comment on column APPS_MODEL_VERSION_TABLE.syn_mode
  is '同步方式（1：立即同步 ，2：开机同步，3：闲时同步）';
comment on column APPS_MODEL_VERSION_TABLE.syn_starttime
  is '开始同步时间';


create table APPS_REMOTEVERSIONINFO
(
  devno        VARCHAR(20) not null,
  appsid       VARCHAR(20) not null,
  versionappno VARCHAR(20) not null,
  notifystatus CHAR(1),
  notifytime   VARCHAR(20),
  effectstatus CHAR(1),
  effecttime   VARCHAR(20),
   constraint PK_APPS_REMOTEVERSIONINFO primary key (DEVNO, APPSID, VERSIONAPPNO)
         )
in ZHYGSPACE index in ZHYGIDX;
comment on table APPS_REMOTEVERSIONINFO
  is '版本同步结果表';
comment on column APPS_REMOTEVERSIONINFO.devno
  is '设备号';
comment on column APPS_REMOTEVERSIONINFO.appsid
  is '应用标识';
comment on column APPS_REMOTEVERSIONINFO.versionappno
  is '当前应用版本号';
comment on column APPS_REMOTEVERSIONINFO.notifystatus
  is '通知APPServer状态(1:通知 0：未通知)';
comment on column APPS_REMOTEVERSIONINFO.notifytime
  is '通知APPServer记录修改时间(yyyy-MM-dd hh:mm:ss)';
comment on column APPS_REMOTEVERSIONINFO.effectstatus
  is '生效状态(0:未生效 1：已生效)';
comment on column APPS_REMOTEVERSIONINFO.effecttime
  is '生效状态记录修改时间(yyyy-MM-dd hh:mm:ss)';


create table ADS_REMOTEVERSIONINFO
(
  devno        VARCHAR(20) not null,
  ADS_ID       VARCHAR(40) not null,
  notifystatus CHAR(1),
  notifytime   VARCHAR(20),
  effectstatus CHAR(1),
  effecttime   VARCHAR(20),
   constraint PK_ADS_REMOTEVERSIONINFO primary key (DEVNO, ADS_ID)
      
)
in ZHYGSPACE index in ZHYGIDX;

comment on table ADS_REMOTEVERSIONINFO
  is '广告同步结果表';
comment on column ADS_REMOTEVERSIONINFO.devno
  is '设备号';
comment on column ADS_REMOTEVERSIONINFO.ADS_ID
  is '广告标识';
comment on column ADS_REMOTEVERSIONINFO.notifystatus
  is '通知APPServer状态(1:通知 0：未通知)';
comment on column ADS_REMOTEVERSIONINFO.notifytime
  is '通知APPServer记录修改时间(yyyy-MM-dd hh:mm:ss)';
comment on column ADS_REMOTEVERSIONINFO.effectstatus
  is '生效状态(0:未生效 1：已生效)';
comment on column ADS_REMOTEVERSIONINFO.effecttime
  is '生效状态记录修改时间(yyyy-MM-dd hh:mm:ss)';


create table APPS_VERSION_TABLE
(
  logic_id              VARCHAR(40) not null,
  apps_id               VARCHAR(40) not null,
  version_bus_no        VARCHAR(20) not null,
  version_app_no        VARCHAR(20) not null,
  version_status        CHAR(1) not null,
  version_CLIENT_path   VARCHAR(400),
  add_user              VARCHAR(20),
  add_time              VARCHAR(20),
  version_description   VARCHAR(500),
  version_file_md5      VARCHAR(64),
  version_seq_no        VARCHAR(20),
  versionfilepath       VARCHAR(500),
  VERSIONNOTIFYFLAG     CHAR(1) default '0' not null,
  TAKETIME              VARCHAR(20),
   constraint PK_APPS_VERSION_TABLE primary key (LOGIC_ID)
        
)
in ZHYGSPACE index in ZHYGIDX;

comment on table APPS_VERSION_TABLE
  is '应用版本表';
comment on column APPS_VERSION_TABLE.logic_id
  is '编号';
comment on column APPS_VERSION_TABLE.apps_id
  is '应用标识';
comment on column APPS_VERSION_TABLE.version_bus_no
  is '业务版本号';
comment on column APPS_VERSION_TABLE.version_app_no
  is '应用版本号';
comment on column APPS_VERSION_TABLE.version_status
  is '版本状态（1:可用  ，2:不可用， 3:已作废）';
comment on column APPS_VERSION_TABLE.version_CLIENT_path
  is '版本更新到客户端路径';
comment on column APPS_VERSION_TABLE.add_user
  is '版本上传人';
comment on column APPS_VERSION_TABLE.add_time
  is '版本上传时间';
comment on column APPS_VERSION_TABLE.version_description
  is '版本描述';
comment on column APPS_VERSION_TABLE.version_file_md5
  is '文件md5值';
comment on column APPS_VERSION_TABLE.version_seq_no
  is '应用版本序列号';
comment on column APPS_VERSION_TABLE.versionfilepath
  is '绝对路径形式存储版本对应文件的存放位置';
comment on column APPS_VERSION_TABLE.VERSIONNOTIFYFLAG
  is '版本通知标志 0：未通知/未加载;1：正在通知/已加载;2：已通知成功;3：已通知，版本包非法';
comment on column APPS_VERSION_TABLE.TAKETIME
  is '通知任务加载时间 YYYY-MM-DD hh:mm:ss';

create table BANK_MANAGER_PERSION
(
  no     VARCHAR(20) not null,
  name   VARCHAR(40) not null,
  org_no VARCHAR(20) not null,
  phone  VARCHAR(20),
  mobile VARCHAR(20),
  email  VARCHAR(40),
  is_leader CHAR(1),
  is_lobbymanager CHAR(1),
  is_devmanager CHAR(1),
  is_deskmanager CHAR(1),
   constraint PK_BANK_MANAGER_PERSION primary key (NO)
      )in ZHYGSPACE index in ZHYGIDX;

comment on table BANK_MANAGER_PERSION
  is '银行网点人员表';
comment on column BANK_MANAGER_PERSION.no
  is '用户ID';
comment on column BANK_MANAGER_PERSION.name
  is '用户姓名';
comment on column BANK_MANAGER_PERSION.org_no
  is '所属机构';
comment on column BANK_MANAGER_PERSION.phone
  is '办公电话';
comment on column BANK_MANAGER_PERSION.mobile
  is '手机号码';
comment on column BANK_MANAGER_PERSION.email
  is '电子邮件';
comment on column BANK_MANAGER_PERSION.is_leader
  is '是否是网点经理（1：是 0：不是）';
comment on column BANK_MANAGER_PERSION.is_lobbymanager
  is '是否是大堂经理（1：是 0：不是）';
comment on column BANK_MANAGER_PERSION.is_devmanager
  is '是否是设备管机员（1：是 0：不是）';
comment on column BANK_MANAGER_PERSION.is_deskmanager
  is '是否是柜台人员（1：是 0：不是）'; 
  

create table CASE_CATALOG_TABLE
(
  org_no            VARCHAR(20) not null,
  catalog_no        NUMERIC(30) not null,
  catalog_name      VARCHAR(50) not null,
  responsor_catalog NUMERIC(30) not null,
  reply_interval    NUMERIC(30),
  onsite_interval   NUMERIC(30),
  onsite_interval1  NUMERIC(30),
  close_interval    NUMERIC(30),
  close_interval1   NUMERIC(30),
  expire_interval   NUMERIC(30),
  max_grade         NUMERIC(30),
  respond_grade     NUMERIC(30),
  notify_way        NUMERIC(30),
  sendmsgmethod     NUMERIC(30),
  Task_sheet_flag   VARCHAR(1),
   constraint PK_CASE_CATALOG_TABLE primary key (ORG_NO, CATALOG_NO)
        )in ZHYGSPACE index in ZHYGIDX;

comment on table CASE_CATALOG_TABLE
  is 'CASE分类表';
comment on column CASE_CATALOG_TABLE.org_no
  is '机构号';
comment on column CASE_CATALOG_TABLE.catalog_no
  is 'CASE故障类型号';
comment on column CASE_CATALOG_TABLE.catalog_name
  is '分类名称';
comment on column CASE_CATALOG_TABLE.responsor_catalog
  is '负责人类型
1:管机员
2 :维护人员
3 :维护人员、管机员';
comment on column CASE_CATALOG_TABLE.reply_interval
  is '要求回复时间(在行）单位：分钟';
comment on column CASE_CATALOG_TABLE.onsite_interval
  is '要求到场时间(在行）单位：分钟';
comment on column CASE_CATALOG_TABLE.onsite_interval1
  is '要求到场时间(离行)';
comment on column CASE_CATALOG_TABLE.close_interval
  is '要求关闭时间（在行）';
comment on column CASE_CATALOG_TABLE.close_interval1
  is '要求关闭时间（离行）';
comment on column CASE_CATALOG_TABLE.expire_interval
  is '要求挂起时间';
comment on column CASE_CATALOG_TABLE.max_grade
  is '最高升级级别即case升级短信通知最大次数';
comment on column CASE_CATALOG_TABLE.respond_grade
  is '响应级别
1-工作时间相应
2-7 x24小时响应';
comment on column CASE_CATALOG_TABLE.notify_way
  is '通知方式(1:短信；2：邮件；3：短信和邮件)';
comment on column CASE_CATALOG_TABLE.sendmsgmethod
  is 'CASE发送短信方式( 1.全部发送; 0.逐级发送)';
comment on column CASE_CATALOG_TABLE.Task_sheet_flag
  is '是否生成工单 0：不生成工单 1：生成工单';

create table CASE_GRADE
(
  grade         NUMERIC(30) not null,
  notify_way    NUMERIC(30) default 1 not null,
  notify_times  NUMERIC(30) default 1 not null,
  send_interval NUMERIC(30) default 0 not null,
   constraint PK_CASE_GRADE primary key (GRADE)
        )in ZHYGSPACE index in ZHYGIDX;

comment on table CASE_GRADE
  is 'CASE升级表';
comment on column CASE_GRADE.grade
  is 'CASE级别';
comment on column CASE_GRADE.notify_way
  is '通知方式';
comment on column CASE_GRADE.notify_times
  is '重复通知次数';
comment on column CASE_GRADE.send_interval
  is '重复时间间隔';

create table CASE_NOTIFY
(
  notify_id     VARCHAR(36) not null,
  case_no       VARCHAR(36) not null,
  create_time   TIMESTAMP(6) not null,
  notify_type   NUMERIC(30) not null,
  notify_way    NUMERIC(30) not null,
  receiver      VARCHAR(20) not null,
  mobile        VARCHAR(20) not null,
  email         VARCHAR(40),
  content       VARCHAR(1024) not null,
  notify_times  NUMERIC(30) default 1 not null,
  send_times    NUMERIC(30) default 0 not null,
  send_time     TIMESTAMP(6),
  send_interval NUMERIC(30),
  is_reply      NUMERIC(30) default 0 not null,
  utno          VARCHAR(8),
   constraint PK_CASE_NOTIFY primary key (NOTIFY_ID)
) 
partition by range (CREATE_TIME)
(
STARTING MINVALUE,
STARTING FROM ('2020-12-31 00:00:00') INCLUSIVE ENDING AT ('2021-12-31 00:00:00') INCLUSIVE EVERY (1 MONTHS),
ENDING MAXVALUE
)in ZHYGSPACE index in ZHYGIDX;
comment on table CASE_NOTIFY
  is 'CASE通知表';
comment on column CASE_NOTIFY.notify_id
  is '编号（UUID）';
comment on column CASE_NOTIFY.case_no
  is 'CASE编号';
comment on column CASE_NOTIFY.create_time
  is '生成时间';
comment on column CASE_NOTIFY.notify_type
  is '通知类型（1:创建；2：升级；3：关闭； 4：挂起）';
comment on column CASE_NOTIFY.notify_way
  is '通知方式（1：短信；2：邮件）';
comment on column CASE_NOTIFY.receiver
  is '通知对象';
comment on column CASE_NOTIFY.mobile
  is '通知手机';
comment on column CASE_NOTIFY.email
  is '通知邮箱';
comment on column CASE_NOTIFY.content
  is '通知内容';
comment on column CASE_NOTIFY.notify_times
  is '重复通知次数';
comment on column CASE_NOTIFY.send_times
  is '已通知次数';
comment on column CASE_NOTIFY.send_time
  is '最近通知时间';
comment on column CASE_NOTIFY.send_interval
  is '通知间隔时间';
comment on column CASE_NOTIFY.is_reply
  is '是否回复';
comment on column CASE_NOTIFY.utno
  is '付费机构';

create table CASE_TABLE
(
  case_no         VARCHAR(36) not null,
  dev_no          VARCHAR(20) not null,
  org_no          VARCHAR(20) not null,
  vendor_no       NUMERIC(30),
  dev_module      VARCHAR(3) not null,
  catalog_no      NUMERIC(30),
  create_type     CHAR(1) not null,
  creator         VARCHAR(20),
  Task_sheet_flag  VARCHAR(1),
  upgrade_type    CHAR(1) not null,
  fault_code      VARCHAR(20),
  max_grade       NUMERIC(30) not null,
  grade           NUMERIC(30) not null,
  status          CHAR(1) not null,
  current_status  NUMERIC(30),
  vendor_code     VARCHAR(2048),
  description     VARCHAR(500),
  solution        VARCHAR(500),
  open_time       TIMESTAMP(6),
  notify_time     TIMESTAMP(6),
  onsite_time     TIMESTAMP(6),
  close_time      TIMESTAMP(6),
  expire_time     TIMESTAMP(6),
  update_time     TIMESTAMP(6),
  pre_reply_time  TIMESTAMP(6),
  pre_onsite_time TIMESTAMP(6),
  pre_close_time  TIMESTAMP(6),
  pre_expire_time TIMESTAMP(6),
  use_reply_time  NUMERIC(30),
  use_onsite_time NUMERIC(30),
  use_close_time  NUMERIC(30),
   constraint PK_CASE_TABLE primary key (CASE_NO)       
   )
partition by range (OPEN_TIME)
(
STARTING MINVALUE,
STARTING FROM ('2020-01-01 00:00:00') INCLUSIVE ENDING AT ('2021-12-31 00:00:00') INCLUSIVE EVERY (1 MONTHS),
ENDING MAXVALUE
) in ZHYGSPACE index in ZHYGIDX;
comment on table CASE_TABLE
  is 'CASE表';
comment on column CASE_TABLE.case_no
  is 'CASE编号';
comment on column CASE_TABLE.dev_no
  is '设备号';
comment on column CASE_TABLE.org_no
  is '机构号';
comment on column CASE_TABLE.vendor_no
  is '厂商号';
comment on column CASE_TABLE.dev_module
  is '设备模块';
comment on column CASE_TABLE.catalog_no
  is 'CASE分类即故障级别';
comment on column CASE_TABLE.create_type
  is '生成方式（A：自动；M：手动）';
comment on column CASE_TABLE.creator
  is '生成人员（手动生成CASE使用）';
comment on column CASE_TABLE.Task_sheet_flag
  is '工单标志 0：非工单 1：工单';
comment on column CASE_TABLE.upgrade_type
  is '升级方式（A：自动  M：手动）';
comment on column CASE_TABLE.fault_code
  is '故障代码';
comment on column CASE_TABLE.max_grade
  is '最高升级级别(CASE_CATALOG_TABLE. MAX_GRADE)';
comment on column CASE_TABLE.grade
  is '值域：1一 CASE_CATALOG_TABLE. MAX_GRADE';
comment on column CASE_TABLE.status
  is 'CASE主状态（O：Open；C：Close；W: wait）';
comment on column CASE_TABLE.current_status
  is '1：已创建,2：已通知,3：通知升级(未使用),4：已确认,5：未响应升级,6：已响应,7：故障升级,8:未关闭升级,9:已关闭';
comment on column CASE_TABLE.vendor_code
  is '厂商故障码';
comment on column CASE_TABLE.description
  is 'CASE描述';
comment on column CASE_TABLE.solution
  is '解决办法';
comment on column CASE_TABLE.open_time
  is '生成时间点';
comment on column CASE_TABLE.notify_time
  is '通知时间点';
comment on column CASE_TABLE.onsite_time
  is '到场时间点';
comment on column CASE_TABLE.close_time
  is '关闭时间点';
comment on column CASE_TABLE.expire_time
  is '挂起时间点';
comment on column CASE_TABLE.update_time
  is '升级时间点';
comment on column CASE_TABLE.pre_reply_time
  is '预期回复时间点';
comment on column CASE_TABLE.pre_onsite_time
  is '预期到场时间点';
comment on column CASE_TABLE.pre_close_time
  is '预期关闭时间点';
comment on column CASE_TABLE.pre_expire_time
  is '预期挂起时间点';
comment on column CASE_TABLE.use_reply_time
  is '实际回复时长(单位分钟)';
comment on column CASE_TABLE.use_onsite_time
  is '实际到场时长(单位分钟)';
comment on column CASE_TABLE.use_close_time
  is '实际关闭时长（单位分钟）';

create table CASE_TRACE
(
  trace_id    VARCHAR(36) not null,
  case_no     VARCHAR(36) not null,
  trace_time  VARCHAR(25) not null,
  trace_by    VARCHAR(20),
  case_status VARCHAR(36),
  content     VARCHAR(512),
  fault_code  VARCHAR(20),
  catalog_no  NUMERIC(30),
   constraint PK_CASE_TRACE primary key (TRACE_ID) 
   )
 
partition by range (TRACE_TIME)
(
PART CASE_TRACE_PARTMIN STARTING MINVALUE,
PART CASE_TRACE_PART2012 STARTING ('2020-01-01 00:00:00.000') ENDING ('2020-12-31 23:59:59.999'),
PART CASE_TRACE_PART2112 STARTING ('2021-01-01 00:00:00.000') ENDING ('2021-12-31 23:59:59.999'),
PART CASE_TRACE_PARTMAX ENDING MAXVALUE
)in ZHYGSPACE index in ZHYGIDX;
comment on table CASE_TRACE
  is 'CASE跟踪表';
comment on column CASE_TRACE.trace_id
  is '编号（UUID）';
comment on column CASE_TRACE.case_no
  is 'CASE编号';
comment on column CASE_TRACE.trace_time
  is '记录时间';
comment on column CASE_TRACE.trace_by
  is '记录者';
comment on column CASE_TRACE.case_status
  is 'CASE当前状态';
comment on column CASE_TRACE.content
  is '跟踪信息';
comment on column CASE_TRACE.fault_code
  is 'FAULT_CODE';
comment on column CASE_TRACE.catalog_no
  is 'CATALOG_NO';

create table DEV_ATTRIBUTE_TABLE
(
  dev_no                         VARCHAR(20) not null,
  attribute_last_time            VARCHAR(20),
  idc_exist                      CHAR(1),
  cim_exist                      CHAR(1),
  cdm_exist                      CHAR(1),
  dep_exist                      CHAR(1),
  ups_exist                      CHAR(1),
  spr_exist                      CHAR(1),
  chk_exist                      CHAR(1),
  rpr_exist                      CHAR(1),
  jpr_exist                      CHAR(1),
  ttu_exist                      CHAR(1),
  pbk_exist                      CHAR(1),
  pin_exist                      CHAR(1),
  siu_exist                      CHAR(1),
  cam_exist                      CHAR(1),
  crd_exist                      CHAR(1),
  ccd_exist                      CHAR(1),
  idc_variant                    VARCHAR(20),
  idc_can_eject                  VARCHAR(20),
  idc_can_capture                VARCHAR(20),
  idc_bin_capacity               VARCHAR(20),
  idc_can_dispense               VARCHAR(20),
  idc_security                   VARCHAR(50),
  idc_track_1_read               VARCHAR(20),
  idc_track_1_write              VARCHAR(20),
  idc_track_2_read               VARCHAR(20),
  idc_track_2_write              VARCHAR(20),
  idc_track_3_read               VARCHAR(20),
  idc_track_3_write              VARCHAR(20),
  idc_track_jisii_read           VARCHAR(20),
  idc_track_jisii_write          VARCHAR(20),
  cim_can_escrow                 VARCHAR(20),
  cim_shutter_control_support    VARCHAR(20),
  cim_max_accept_items           VARCHAR(20),
  cim_can_detect_cash_inserted   VARCHAR(20),
  cim_can_detect_cash_taken      VARCHAR(20),
  cim_retract_area               VARCHAR(50),
  cdm_has_stacker                VARCHAR(20),
  cdm_has_shutter                VARCHAR(20),
  cdm_can_retract                VARCHAR(20),
  cdm_can_detect_cash_taken      VARCHAR(20),
  cdm_can_test_phsical_units     VARCHAR(20),
  cdm_max_dispense_bills         VARCHAR(20),
  cdm_num_of_logical_cash_units  VARCHAR(20),
  cdm_num_of_physical_cash_units VARCHAR(20),
  cdm_num_of_currencies          VARCHAR(20),
  cdm_currencies                 VARCHAR(2000),
  cdm_exponents                  VARCHAR(1000),
  dep_deposit_type               VARCHAR(50),
  dep_can_dispense               VARCHAR(20),
  dep_can_print                  VARCHAR(20),
  dep_can_print_on_retracts      VARCHAR(20),
  dep_can_retract                VARCHAR(20),
  dep_max_print_length           VARCHAR(20),
  ups_can_detect_low             VARCHAR(20),
  ups_can_be_engaged             VARCHAR(20),
  ups_can_detect_powing          VARCHAR(20),
  ups_can_detect_recovered       VARCHAR(20),
  ups_can_power_off              VARCHAR(20),
  ups_can_power_cycle            VARCHAR(20),
  spr_variant                    VARCHAR(50),
  spr_can_eject                  VARCHAR(20),
  spr_can_capture                VARCHAR(20),
  spr_can_stack                  VARCHAR(20),
  spr_max_retract                VARCHAR(20),
  spr_max_strack                 VARCHAR(20),
  chk_can_raw_print              VARCHAR(20),
  chk_can_eject                  VARCHAR(20),
  chk_can_stack                  VARCHAR(20),
  chk_can_capture                VARCHAR(20),
  chk_can_stamp                  VARCHAR(20),
  chk_can_detect_media_taken     VARCHAR(20),
  chk_can_read_front_image       VARCHAR(20),
  chk_can_read_back_image        VARCHAR(20),
  chk_can_read_code_line         VARCHAR(20),
  chk_code_line_formats          VARCHAR(60),
  chk_max_retract                VARCHAR(20),
  chk_max_accept_items           VARCHAR(20),
  chk_supported_image_formats    VARCHAR(60),
  rpr_variant                    VARCHAR(50),
  rpr_can_eject                  VARCHAR(20),
  rpr_can_capture                VARCHAR(20),
  rpr_can_stack                  VARCHAR(20),
  rpr_max_retract                VARCHAR(20),
  jpr_variant                    VARCHAR(50),
  jpr_can_eject                  VARCHAR(20),
  jpr_can_capture                VARCHAR(20),
  jpr_can_stack                  VARCHAR(20),
  ttu_alpha_numeric_keys_present VARCHAR(20),
  ttu_hexadecimal_keys_present   VARCHAR(20),
  ttu_numeric_keys_present       VARCHAR(20),
  ttu_keyboard_lock_present      VARCHAR(20),
  ttu_display_light_present      VARCHAR(20),
  ttu_number_of_resolutions      VARCHAR(50),
  ttu_cursor_supported           VARCHAR(20),
  ttu_forms_supported            VARCHAR(20),
  ttu_resolution_x               VARCHAR(20),
  ttu_resolution_y               VARCHAR(20),
  pbk_variant                    VARCHAR(50),
  pbk_can_eject                  VARCHAR(20),
  pbk_can_capture                VARCHAR(20),
  pbk_can_stack                  VARCHAR(20),
  pbk_max_retract                VARCHAR(20),
  pin_can_ebc                    VARCHAR(20),
  pin_can_cbc                    VARCHAR(20),
  pin_can_mac                    VARCHAR(20),
  pin_can_rsa                    VARCHAR(20),
  pin_can_verify_des             VARCHAR(20),
  pin_can_verify_ec              VARCHAR(20),
  pin_can_verify_visa            VARCHAR(20),
  pin_can_des_offset             VARCHAR(20),
  pin_can_triple_ebc             VARCHAR(20),
  pin_can_triple_cbc             VARCHAR(20),
  pin_can_triple_mac             VARCHAR(20),
  pin_can_triple_cfb             VARCHAR(20),
  pin_function_keys_supported    VARCHAR(150),
  siu_cabinet_can_bolt           VARCHAR(20),
  siu_safe_can_bolt              VARCHAR(20),
  siu_shield_can_keyboard        VARCHAR(50),
  siu_shield_can_open            VARCHAR(20),
  siu_shield_can_close           VARCHAR(20),
  siu_shield_can_service         VARCHAR(20),
  cam_max_pictures               VARCHAR(20),
  cam_picture_info               VARCHAR(20),
  cam_max_picture_info_size      VARCHAR(20),
  icc_variant                    VARCHAR(20),
  icc_can_eject                  VARCHAR(20),
  icc_can_capture                VARCHAR(20),
  icc_bin_capacity               VARCHAR(20),
  icc_can_dispense               VARCHAR(20),
  icc_security                   VARCHAR(50),
  icc_track_1_read               VARCHAR(20),
  icc_track_1_write              VARCHAR(20),
  icc_track_2_read               VARCHAR(20),
  icc_track_2_write              VARCHAR(20),
  icc_track_3_read               VARCHAR(20),
  icc_track_3_write              VARCHAR(20),
  icc_track_jisii_read           VARCHAR(20),
  icc_track_jisii_write          VARCHAR(20),
  icc_exist                      CHAR(1),
  isc_variant                    VARCHAR(20),
  isc_can_eject                  VARCHAR(20),
  isc_can_capture                VARCHAR(20),
  isc_bin_capacity               VARCHAR(20),
  isc_can_dispense               VARCHAR(20),
  isc_security                   VARCHAR(50),
  isc_track_1_read               VARCHAR(20),
  isc_track_1_write              VARCHAR(20),
  isc_track_2_read               VARCHAR(20),
  isc_track_2_write              VARCHAR(20),
  isc_track_3_read               VARCHAR(20),
  isc_track_3_write              VARCHAR(20),
  isc_track_jisii_read           VARCHAR(20),
  isc_track_jisii_write          VARCHAR(20),
  isc_exist                      CHAR(1),
  irc_variant                    VARCHAR(20),
  irc_can_eject                  VARCHAR(20),
  irc_can_capture                VARCHAR(20),
  irc_bin_capacity               VARCHAR(20),
  irc_can_dispense               VARCHAR(20),
  irc_security                   VARCHAR(50),
  irc_track_1_read               VARCHAR(20),
  irc_track_1_write              VARCHAR(20),
  irc_track_2_read               VARCHAR(20),
  irc_track_2_write              VARCHAR(20),
  irc_track_3_read               VARCHAR(20),
  irc_track_3_write              VARCHAR(20),
  irc_track_jisii_read           VARCHAR(20),
  irc_track_jisii_write          VARCHAR(20),
  irc_exist                      CHAR(1),
  fpi_load_status                VARCHAR(20),
  fpi_exist                      CHAR(1),
  crd_dispenseto                 VARCHAR(20),
  ccd_dispenseto                 VARCHAR(20),
  dpr_exist                      CHAR(1),
  dpr_variant                    VARCHAR(20),
  dpr_can_eject                  VARCHAR(20),
  dpr_can_capture                VARCHAR(20),
  dpr_can_stack                  VARCHAR(20),
  dpr_max_retract                VARCHAR(20),
  bcr_exist                      CHAR(1),
  bcr_variant                    VARCHAR(20),
  pjc_exist                      CHAR(1),
  pjc_datasource                 VARCHAR(20),
  pjc_vdev                       VARCHAR(1),
  pjc_realjpr                    VARCHAR(20),
  pjc_mac                        VARCHAR(1),
  pjc_ip                         VARCHAR(20),
  pjc_pkt                        VARCHAR(1),
  pjc_ejfile                     VARCHAR(50),
  pjc_spacesize                  VARCHAR(20),
  pjc_version                    VARCHAR(50),
   constraint PK_DEV_ATTRIBUTE_TABLE primary key (DEV_NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_ATTRIBUTE_TABLE
  is '设备模块属性表';
comment on column DEV_ATTRIBUTE_TABLE.dev_no
  is '设备号';
comment on column DEV_ATTRIBUTE_TABLE.attribute_last_time
  is '上次更新属性表时间';
comment on column DEV_ATTRIBUTE_TABLE.idc_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.cim_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.cdm_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.dep_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.ups_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.spr_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.chk_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.rpr_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.jpr_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.ttu_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.pbk_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.pin_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.siu_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.cam_exist
  is 'Y – 存在
N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.crd_exist
  is 'CRD_EXIST';
comment on column DEV_ATTRIBUTE_TABLE.ccd_exist
  is 'CCD_EXIST';
comment on column DEV_ATTRIBUTE_TABLE.idc_variant
  is 'MOTORISED
CHIPIO';
comment on column DEV_ATTRIBUTE_TABLE.idc_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.idc_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.idc_bin_capacity
  is '回收匣容量';
comment on column DEV_ATTRIBUTE_TABLE.idc_can_dispense
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.idc_security
  is '安全类型';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_1_read
  is '1磁道读能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_1_write
  is '1磁道写能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_2_read
  is '2磁道读能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_2_write
  is '2磁道写能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_3_read
  is '3磁道读能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_3_write
  is '3磁道写能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_jisii_read
  is 'jisII磁道读能力';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_jisii_write
  is 'jisii磁道写能力';
comment on column DEV_ATTRIBUTE_TABLE.cim_can_escrow
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_shutter_control_support
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_max_accept_items
  is '一次最大收钞张数';
comment on column DEV_ATTRIBUTE_TABLE.cim_can_detect_cash_inserted
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_can_detect_cash_taken
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_retract_area
  is '回收区名称';
comment on column DEV_ATTRIBUTE_TABLE.cdm_has_stacker
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cdm_has_shutter
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cdm_can_retract
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cdm_can_detect_cash_taken
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cdm_can_test_phsical_units
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cdm_max_dispense_bills
  is '一次最大出钞张数';
comment on column DEV_ATTRIBUTE_TABLE.cdm_num_of_logical_cash_units
  is '逻辑钞箱数';
comment on column DEV_ATTRIBUTE_TABLE.cdm_num_of_physical_cash_units
  is '物理钞箱数';
comment on column DEV_ATTRIBUTE_TABLE.cdm_num_of_currencies
  is '支持币种数';
comment on column DEV_ATTRIBUTE_TABLE.cdm_currencies
  is '币种名称';
comment on column DEV_ATTRIBUTE_TABLE.cdm_exponents
  is '指数';
comment on column DEV_ATTRIBUTE_TABLE.dep_deposit_type
  is '类型';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_dispense
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_print
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_print_on_retracts
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_retract
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_max_print_length
  is '最大打印长度';
comment on column DEV_ATTRIBUTE_TABLE.ups_can_detect_low
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ups_can_be_engaged
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ups_can_detect_powing
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ups_can_detect_recovered
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ups_can_power_off
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ups_can_power_cycle
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_variant
  is 'SPR型别';
comment on column DEV_ATTRIBUTE_TABLE.spr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_max_retract
  is 'SPR最大回收数';
comment on column DEV_ATTRIBUTE_TABLE.spr_max_strack
  is 'SPR最大暂存数';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_raw_print
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_stamp
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_detect_media_taken
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_read_front_image
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_read_back_image
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_can_read_code_line
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.chk_code_line_formats
  is '打码行格式';
comment on column DEV_ATTRIBUTE_TABLE.chk_max_retract
  is 'CHK最大回收数';
comment on column DEV_ATTRIBUTE_TABLE.chk_max_accept_items
  is '一次最大收取支票数';
comment on column DEV_ATTRIBUTE_TABLE.chk_supported_image_formats
  is '支持的图象格式';
comment on column DEV_ATTRIBUTE_TABLE.rpr_variant
  is 'RPR型别';
comment on column DEV_ATTRIBUTE_TABLE.rpr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.rpr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.rpr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.rpr_max_retract
  is 'RPR最大回收张数';
comment on column DEV_ATTRIBUTE_TABLE.jpr_variant
  is 'JPR型别';
comment on column DEV_ATTRIBUTE_TABLE.jpr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.jpr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.jpr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_alpha_numeric_keys_present
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_hexadecimal_keys_present
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_numeric_keys_present
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_keyboard_lock_present
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_display_light_present
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_number_of_resolutions
  is '分辨率';
comment on column DEV_ATTRIBUTE_TABLE.ttu_cursor_supported
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_forms_supported
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_resolution_x
  is 'TTU_RESOLUTION_X';
comment on column DEV_ATTRIBUTE_TABLE.ttu_resolution_y
  is 'TTU_RESOLUTION_Y';
comment on column DEV_ATTRIBUTE_TABLE.pbk_variant
  is 'PBK型别';
comment on column DEV_ATTRIBUTE_TABLE.pbk_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pbk_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pbk_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pbk_max_retract
  is 'PBK最大回收数';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_ebc
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_cbc
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_mac
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_rsa
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_verify_des
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_verify_ec
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_verify_visa
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_des_offset
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_triple_ebc
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_triple_cbc
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_triple_mac
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_can_triple_cfb
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pin_function_keys_supported
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.siu_cabinet_can_bolt
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.siu_safe_can_bolt
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.siu_shield_can_keyboard
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.siu_shield_can_open
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.siu_shield_can_close
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.siu_shield_can_service
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cam_max_pictures
  is '一次最大图片数';
comment on column DEV_ATTRIBUTE_TABLE.cam_picture_info
  is '图片信息';
comment on column DEV_ATTRIBUTE_TABLE.cam_max_picture_info_size
  is '最大图片信息尺寸';
comment on column DEV_ATTRIBUTE_TABLE.icc_variant
  is 'ICC_VARIANT';
comment on column DEV_ATTRIBUTE_TABLE.icc_can_eject
  is 'ICC_CAN_EJECT';
comment on column DEV_ATTRIBUTE_TABLE.icc_can_capture
  is 'ICC_CAN_CAPTURE';
comment on column DEV_ATTRIBUTE_TABLE.icc_bin_capacity
  is 'ICC_BIN_CAPACITY';
comment on column DEV_ATTRIBUTE_TABLE.icc_can_dispense
  is 'ICC_CAN_DISPENSE';
comment on column DEV_ATTRIBUTE_TABLE.icc_security
  is 'ICC_SECURITY';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_1_read
  is 'ICC_TRACK_1_READ';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_1_write
  is 'ICC_TRACK_1_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_2_read
  is 'ICC_TRACK_2_READ';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_2_write
  is 'ICC_TRACK_2_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_3_read
  is 'ICC_TRACK_3_READ';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_3_write
  is 'ICC_TRACK_3_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_jisii_read
  is 'ICC_TRACK_JISII_READ';
comment on column DEV_ATTRIBUTE_TABLE.icc_track_jisii_write
  is 'ICC_TRACK_JISII_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.icc_exist
  is 'ICC_EXIST';
comment on column DEV_ATTRIBUTE_TABLE.isc_variant
  is 'ISC_VARIANT';
comment on column DEV_ATTRIBUTE_TABLE.isc_can_eject
  is 'ISC_CAN_EJECT';
comment on column DEV_ATTRIBUTE_TABLE.isc_can_capture
  is 'ISC_CAN_CAPTURE';
comment on column DEV_ATTRIBUTE_TABLE.isc_bin_capacity
  is 'ISC_BIN_CAPACITY';
comment on column DEV_ATTRIBUTE_TABLE.isc_can_dispense
  is 'ISC_CAN_DISPENSE';
comment on column DEV_ATTRIBUTE_TABLE.isc_security
  is 'ISC_SECURITY';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_1_read
  is 'ISC_TRACK_1_READ';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_1_write
  is 'ISC_TRACK_1_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_2_read
  is 'ISC_TRACK_2_READ';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_2_write
  is 'ISC_TRACK_2_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_3_read
  is 'ISC_TRACK_3_READ';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_3_write
  is 'ISC_TRACK_3_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_jisii_read
  is 'ISC_TRACK_JISII_READ';
comment on column DEV_ATTRIBUTE_TABLE.isc_track_jisii_write
  is 'ISC_TRACK_JISII_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.isc_exist
  is 'ISC_EXIST';
comment on column DEV_ATTRIBUTE_TABLE.irc_variant
  is 'IRC_VARIANT';
comment on column DEV_ATTRIBUTE_TABLE.irc_can_eject
  is 'IRC_CAN_EJECT';
comment on column DEV_ATTRIBUTE_TABLE.irc_can_capture
  is 'IRC_CAN_CAPTURE';
comment on column DEV_ATTRIBUTE_TABLE.irc_bin_capacity
  is 'IRC_BIN_CAPACITY';
comment on column DEV_ATTRIBUTE_TABLE.irc_can_dispense
  is 'IRC_CAN_DISPENSE';
comment on column DEV_ATTRIBUTE_TABLE.irc_security
  is 'IRC_SECURITY';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_1_read
  is 'IRC_TRACK_1_READ';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_1_write
  is 'IRC_TRACK_1_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_2_read
  is 'IRC_TRACK_2_READ';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_2_write
  is 'IRC_TRACK_2_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_3_read
  is 'IRC_TRACK_3_READ';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_3_write
  is 'IRC_TRACK_3_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_jisii_read
  is 'IRC_TRACK_JISII_READ';
comment on column DEV_ATTRIBUTE_TABLE.irc_track_jisii_write
  is 'IRC_TRACK_JISII_WRITE';
comment on column DEV_ATTRIBUTE_TABLE.irc_exist
  is 'IRC_EXIST';
comment on column DEV_ATTRIBUTE_TABLE.fpi_load_status
  is 'FPI_LOAD_STATUS';
comment on column DEV_ATTRIBUTE_TABLE.fpi_exist
  is 'FPI_EXIST';
comment on column DEV_ATTRIBUTE_TABLE.crd_dispenseto
  is 'CRD_DISPENSETO';
comment on column DEV_ATTRIBUTE_TABLE.ccd_dispenseto
  is 'CCD_DISPENSETO';
comment on column DEV_ATTRIBUTE_TABLE.dpr_exist
  is '盖章模块是否存在';
comment on column DEV_ATTRIBUTE_TABLE.dpr_variant
  is '盖章模块型别';
comment on column DEV_ATTRIBUTE_TABLE.dpr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dpr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dpr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dpr_max_retract
  is '盖章模块最大回收数';
comment on column DEV_ATTRIBUTE_TABLE.bcr_exist
  is '二维码扫描仪模块是否存在';
comment on column DEV_ATTRIBUTE_TABLE.bcr_variant
  is '二维码扫描仪模块型别';
comment on column DEV_ATTRIBUTE_TABLE.pjc_exist
  is 'Y – 存在 N – 不存在';
comment on column DEV_ATTRIBUTE_TABLE.pjc_datasource
  is 'sp-SP拦截方式，wsap-跨平台转发方式';
comment on column DEV_ATTRIBUTE_TABLE.pjc_vdev
  is '0-不适用（DataSource= wsap），1-虚拟模式，2-兼容模式';
comment on column DEV_ATTRIBUTE_TABLE.pjc_realjpr
  is 'PJC是否返回物理打印机真是状态';
comment on column DEV_ATTRIBUTE_TABLE.pjc_mac
  is 'PJC流水MAC校验是否开启0-未打开，1-已打开';
comment on column DEV_ATTRIBUTE_TABLE.pjc_ip
  is 'PJC配置的服务端IP地址';
comment on column DEV_ATTRIBUTE_TABLE.pjc_pkt
  is 'PJC使用的报文类型0-域报文，2-Json报文';
comment on column DEV_ATTRIBUTE_TABLE.pjc_ejfile
  is '电子流水缓存路径';
comment on column DEV_ATTRIBUTE_TABLE.pjc_spacesize
  is '无纸化缓存流水所在盘符剩余空间大小，单位：M';
comment on column DEV_ATTRIBUTE_TABLE.pjc_version
  is 'PJC版本号';

create table DEV_BASE_INFO
(
  no                  VARCHAR(20) not null,
  ip                  VARCHAR(20) not null,
  org_no              VARCHAR(20) not null,
  Account_org_no      VARCHAR(20),
  away_flag           VARCHAR(2) not null,
  Self_bank_no        VARCHAR(40),
  dev_catalog         VARCHAR(5) not null,
  dev_vendor          VARCHAR(5) not null,
  dev_type            VARCHAR(5) not null,
  work_type           VARCHAR(2) not null,
  status              VARCHAR(2) not null,
  dev_service         VARCHAR(40) not null,
  terminal_no         VARCHAR(20),
  serial              VARCHAR(40),
  address             VARCHAR(80),
  buy_date            VARCHAR(10),
  install_date        VARCHAR(10),
  start_date          VARCHAR(10),
  stop_date           VARCHAR(10),
  open_time           VARCHAR(10),
  close_time          VARCHAR(10),
  expire_date         VARCHAR(10),
  patrol_period       VARCHAR(20),
  cashbox_limit       VARCHAR(50),
  os                  VARCHAR(50),
  atmc_soft           VARCHAR(50),
  anti_virus_soft     VARCHAR(50),
  sp                  VARCHAR(50),
  virtual_teller_no   VARCHAR(10),
  care_level          VARCHAR(2),
  last_pm_date        VARCHAR(10),
  expire_pm_date      VARCHAR(10),
  locate_no           VARCHAR(10),
  note1               VARCHAR(30),
  note2               VARCHAR(30),
  note3               VARCHAR(30),
  note4               VARCHAR(30),
  note5               VARCHAR(30),
  carrier             VARCHAR(20),
  money_org           VARCHAR(20),
  dev_status          VARCHAR(2),
  environment         VARCHAR(256),
  address_code        VARCHAR(20),
  cash_type           VARCHAR(2),
  setup_type          VARCHAR(2),
  net_type            VARCHAR(2),
  operate_status      VARCHAR(2),
  registration_status VARCHAR(2),
  comm_packet         VARCHAR(20),
  zip_type            VARCHAR(2),
  dek_encoded         VARCHAR(100),
  atmp_area           VARCHAR(10),
  dev_log_path        VARCHAR(200),
  trans_rate          VARCHAR(20),
   constraint PK_DEV_BASE_INFO primary key (NO)
        )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_BASE_INFO
  is '设备基本信息表';
comment on column DEV_BASE_INFO.no
  is '设备号';
comment on column DEV_BASE_INFO.ip
  is '设备IP地址';
comment on column DEV_BASE_INFO.org_no
  is '所属机构（组织机构/管理机构）';
comment on column DEV_BASE_INFO.Account_org_no
  is '账务机构号';
comment on column DEV_BASE_INFO.away_flag
  is '离行在行标志 1：在行；2：离行';
comment on column DEV_BASE_INFO.Self_bank_no
  is '自助银行号，离行设备设置该字段';
comment on column DEV_BASE_INFO.dev_catalog
  is '设备类型';
comment on column DEV_BASE_INFO.dev_vendor
  is '设备品牌';
comment on column DEV_BASE_INFO.dev_type
  is '设备型号';
comment on column DEV_BASE_INFO.work_type
  is '经营方式 1—自营  2—联营';
comment on column DEV_BASE_INFO.status
  is '设备状态 1—正常  2—停机';
comment on column DEV_BASE_INFO.dev_service
  is '设备维护商 ';
comment on column DEV_BASE_INFO.terminal_no
  is '终端号';
comment on column DEV_BASE_INFO.serial
  is '设备序列号 :厂商出厂的序列号';
comment on column DEV_BASE_INFO.address
  is '设备地址';
comment on column DEV_BASE_INFO.buy_date
  is '设备购买日期 yyyy-mm-dd';
comment on column DEV_BASE_INFO.install_date
  is '设备安装日期 yyyy-mm-dd';
comment on column DEV_BASE_INFO.start_date
  is '设备启用日期 yyyy-mm-dd';
comment on column DEV_BASE_INFO.stop_date
  is '设备停用日期 yyyy-mm-dd';
comment on column DEV_BASE_INFO.open_time
  is '每日开机时间 yyyy-mm-dd';
comment on column DEV_BASE_INFO.close_time
  is '每日关机时间 yyyy-mm-dd';
comment on column DEV_BASE_INFO.expire_date
  is '保修到期日期 yyyy-mm-dd';
comment on column DEV_BASE_INFO.patrol_period
  is '设备巡检周期';
comment on column DEV_BASE_INFO.cashbox_limit
  is '钱箱报警金额';
comment on column DEV_BASE_INFO.os
  is '操作系统';
comment on column DEV_BASE_INFO.atmc_soft
  is 'atmc软件 1:wsap ;2:WSAPPlus ;3:ZJUAP;9:其他ATMC';
comment on column DEV_BASE_INFO.anti_virus_soft
  is '防病毒软件';
comment on column DEV_BASE_INFO.sp
  is '厂商sp类型';
comment on column DEV_BASE_INFO.virtual_teller_no
  is '虚拟柜员号';
comment on column DEV_BASE_INFO.care_level
  is '设备关注程度 1-重点 2-中等 3-一般';
comment on column DEV_BASE_INFO.last_pm_date
  is '上次巡检日期';
comment on column DEV_BASE_INFO.expire_pm_date
  is '巡检到期日期';
comment on column DEV_BASE_INFO.locate_no
  is '地理位置';
comment on column DEV_BASE_INFO.note1
  is '备用1:设备营运状态 1启用 2停机';
comment on column DEV_BASE_INFO.note2
  is '备用2:有无盲道 0-无 1-有，默认0';
comment on column DEV_BASE_INFO.note3
  is '备用3:邮政编码';
comment on column DEV_BASE_INFO.note4
  is '备用4';
comment on column DEV_BASE_INFO.note5
  is '备用5';
comment on column DEV_BASE_INFO.carrier
  is '运营商';
comment on column DEV_BASE_INFO.money_org
  is '加钞机构';
comment on column DEV_BASE_INFO.dev_status
  is '设备状态 :1－启用 2－停用 3—审批 4－正常 5－警告 6－故障 7－关机 8－撤销';
comment on column DEV_BASE_INFO.environment
  is '周边环境';
comment on column DEV_BASE_INFO.address_code
  is '地点代码';
comment on column DEV_BASE_INFO.cash_type
  is '非现金标志: 1、现金；2、非现金';
comment on column DEV_BASE_INFO.setup_type
  is '安装方式:0、大堂；1、穿墙 ';
comment on column DEV_BASE_INFO.net_type
  is '有线无线标志:C：cable有线 W：wireless无线';
comment on column DEV_BASE_INFO.operate_status
  is '运营状态:1： 启用 2：停机';
comment on column DEV_BASE_INFO.registration_status
  is '注册状态:0：未注册 1：注册';
comment on column DEV_BASE_INFO.comm_packet
  is '通讯每包传输大小:有线设备初始8000无线设备初始256';
comment on column DEV_BASE_INFO.zip_type
  is '通讯传输压缩方式:0：不压缩;1：未使用；2：zip压缩；3：gzip压缩;有线设备初始:0 无线设备初始:3 ';
comment on column DEV_BASE_INFO.dek_encoded
  is 'MAK密钥';
comment on column DEV_BASE_INFO.atmp_area
  is 'p端区域码';
comment on column DEV_BASE_INFO.dev_log_path
  is '日志路径';
comment on column DEV_BASE_INFO.trans_rate
  is '文件传输速度上限';

  create table DEV_OPERATE_INFO
(
  no                  varchar(20) not null,
  Quarter_Lease_Amount      varchar(20),
  COOPERATION_NUMBER      NUMERIC(10,0),
  SELFBANK      varchar(1),
  INVESTMENT      varchar(1),
   constraint PK_DEV_OPERATE_INFO primary key (NO)        
)
in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_OPERATE_INFO
  is '设备运营信息表';
comment on column DEV_OPERATE_INFO.no
  is '设备号';
comment on column DEV_OPERATE_INFO.Quarter_Lease_Amount
  is '季度租赁费用 单位：元';
comment on column DEV_OPERATE_INFO.COOPERATION_NUMBER
  is '每季合作笔数';
comment on column DEV_OPERATE_INFO.SELFBANK
  is '是否自助银行：0-否；1-是 （重庆银行用）一个点上如果有两台以上的设备，那么这个设备就算是自助银行的设备';
comment on column DEV_OPERATE_INFO.INVESTMENT
  is '投入主体：1-总行；2-分行；3-支行  （重庆银行用）设备的投入方级别';
create table DEV_CASENO_TABLE
(
  dev_no      VARCHAR(20) not null,
  idc_case_no VARCHAR(36),
  cim_case_no VARCHAR(36),
  cdm_case_no VARCHAR(36),
  dep_case_no VARCHAR(36),
  ups_case_no VARCHAR(36),
  spr_case_no VARCHAR(36),
  rpr_case_no VARCHAR(36),
  jpr_case_no VARCHAR(36),
  chk_case_no VARCHAR(36),
  ttu_case_no VARCHAR(36),
  pbk_case_no VARCHAR(36),
  pin_case_no VARCHAR(36),
  siu_case_no VARCHAR(36),
  cam_case_no VARCHAR(36),
  net_case_no VARCHAR(36),
  cny_case_no VARCHAR(36),
  hkd_case_no VARCHAR(36),
  icc_case_no VARCHAR(36),
  isc_case_no VARCHAR(36),
  irc_case_no VARCHAR(36),
  fpi_case_no VARCHAR(36),
  crd_case_no VARCHAR(36),
  ccd_case_no VARCHAR(36),
  dpr_case_no VARCHAR(36),
  bcr_case_no VARCHAR(36),
   constraint PK_DEV_CASENO_TABLE primary key (DEV_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_CASENO_TABLE
  is '设备当前CASE表';
comment on column DEV_CASENO_TABLE.dev_no
  is '设备号';
comment on column DEV_CASENO_TABLE.idc_case_no
  is '读卡器模块对应的CASE号';
comment on column DEV_CASENO_TABLE.cim_case_no
  is '存款模块对应的CASE号';
comment on column DEV_CASENO_TABLE.cdm_case_no
  is '取款模块对应的CASE号';
comment on column DEV_CASENO_TABLE.dep_case_no
  is '信封模块对应的CASE号';
comment on column DEV_CASENO_TABLE.ups_case_no
  is '不间断电源模块对应的CASE号';
comment on column DEV_CASENO_TABLE.spr_case_no
  is '结单打印模块对应的CASE号';
comment on column DEV_CASENO_TABLE.rpr_case_no
  is '凭条打印机模块对应的CASE号';
comment on column DEV_CASENO_TABLE.jpr_case_no
  is '日志打印机模块对应的CASE号';
comment on column DEV_CASENO_TABLE.chk_case_no
  is '支票读扫描模块对应的CASE号';
comment on column DEV_CASENO_TABLE.ttu_case_no
  is '文本终端单元模块对应的CASE号';
comment on column DEV_CASENO_TABLE.pbk_case_no
  is '存折打印机模块对应的CASE号';
comment on column DEV_CASENO_TABLE.pin_case_no
  is '密码键盘模块对应的CASE号';
comment on column DEV_CASENO_TABLE.siu_case_no
  is '传感器模块对应的CASE号';
comment on column DEV_CASENO_TABLE.cam_case_no
  is '照相机模块对应的CASE号';
comment on column DEV_CASENO_TABLE.net_case_no
  is '网络故障对应的CASE号';
comment on column DEV_CASENO_TABLE.cny_case_no
  is '人民币取款模块对应的CASE号（多币种情况下使用）';
comment on column DEV_CASENO_TABLE.hkd_case_no
  is '港币取款模块对应CASE号（多币种情况下使用）';
comment on column DEV_CASENO_TABLE.icc_case_no
  is 'ICC_CASE_NO';
comment on column DEV_CASENO_TABLE.isc_case_no
  is 'ISC_CASE_NO';
comment on column DEV_CASENO_TABLE.irc_case_no
  is 'IRC_CASE_NO';
comment on column DEV_CASENO_TABLE.fpi_case_no
  is 'FPI_CASE_NO';
comment on column DEV_CASENO_TABLE.crd_case_no
  is 'CRD_CASE_NO';
comment on column DEV_CASENO_TABLE.ccd_case_no
  is 'CCD_CASE_NO';
comment on column DEV_CASENO_TABLE.dpr_case_no
  is '盖章模块对应的CASE号';
comment on column DEV_CASENO_TABLE.bcr_case_no
  is '二维码扫描仪模块对应的CASE号';

create table DEV_CATALOG_TABLE
(
  no           VARCHAR(5) not null,
  name         VARCHAR(30) not null,
  enname       VARCHAR(30),
  monitor_type VARCHAR(2),
  channel_type VARCHAR(2),
   constraint PK_DEV_CATALOG_TABLE primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_CATALOG_TABLE
  is '设备类型表';
comment on column DEV_CATALOG_TABLE.no
  is '编号 10001	自动存取款机(CRS) 10002	自动存款机(CDM) 10003	自动取款机(ATM) 10004	BSM/查询机 10005   大额机/智能终端/现钞机 10006   回单机 10007   填单机 10008   发卡机 10009   叫号机 10010   广告屏  ';
comment on column DEV_CATALOG_TABLE.name
  is '设备类型';
comment on column DEV_CATALOG_TABLE.enname
  is '描述';
comment on column DEV_CATALOG_TABLE.monitor_type
  is '监控类型[1:传统现金自助设备][2:发卡机][3:非现金自助设备] [4:多媒体渠道][5:新型现金自助设备][6:回单机][7:填单机][8:叫号机] [其它 不需要监控的设备]';
comment on column DEV_CATALOG_TABLE.channel_type
  is '渠道类型[1:自助渠道][2:柜面渠道][3:多媒体渠道] [4:摄像头] [5:叫号机渠道]';

create table DEV_FAULTNO_TABLE
(
  dev_no       VARCHAR(20) not null,
  idc_fault_no VARCHAR(36),
  cim_fault_no VARCHAR(36),
  cdm_fault_no VARCHAR(36),
  dep_fault_no VARCHAR(36),
  ups_fault_no VARCHAR(36),
  spr_fault_no VARCHAR(36),
  rpr_fault_no VARCHAR(36),
  jpr_fault_no VARCHAR(36),
  chk_fault_no VARCHAR(36),
  ttu_fault_no VARCHAR(36),
  pbk_fault_no VARCHAR(36),
  pin_fault_no VARCHAR(36),
  siu_fault_no VARCHAR(36),
  cam_fault_no VARCHAR(36),
  icc_fault_no VARCHAR(36),
  isc_fault_no VARCHAR(36),
  irc_fault_no VARCHAR(36),
  fpi_fault_no VARCHAR(36),
  crd_fault_no VARCHAR(36),
  ccd_fault_no VARCHAR(36),
  dpr_fault_no VARCHAR(36),
  bcr_fault_no VARCHAR(36),
   constraint PK_DEV_FAULTNO_TABLE primary key (DEV_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_FAULTNO_TABLE
  is '设备当前故障表';
comment on column DEV_FAULTNO_TABLE.dev_no
  is '设备号';
comment on column DEV_FAULTNO_TABLE.idc_fault_no
  is '读卡器模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.cim_fault_no
  is '存款模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.cdm_fault_no
  is '取款模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.dep_fault_no
  is '信封模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.ups_fault_no
  is '不间断电源模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.spr_fault_no
  is '结单打印模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.rpr_fault_no
  is '凭条打印机模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.jpr_fault_no
  is '日志打印机模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.chk_fault_no
  is '支票读扫描模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.ttu_fault_no
  is '文本终端单元模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.pbk_fault_no
  is '存折打印模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.pin_fault_no
  is '密码键盘模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.siu_fault_no
  is '传感器模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.cam_fault_no
  is '照相机模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.icc_fault_no
  is 'ICC_FAULT_NO';
comment on column DEV_FAULTNO_TABLE.isc_fault_no
  is 'ISC_FAULT_NO';
comment on column DEV_FAULTNO_TABLE.irc_fault_no
  is 'IRC_FAULT_NO';
comment on column DEV_FAULTNO_TABLE.fpi_fault_no
  is 'FPI_FAULT_NO';
comment on column DEV_FAULTNO_TABLE.crd_fault_no
  is 'CRD_FAULT_NO';
comment on column DEV_FAULTNO_TABLE.ccd_fault_no
  is 'CCD_FAULT_NO';
comment on column DEV_FAULTNO_TABLE.dpr_fault_no
  is '盖章模块对应的故障号';
comment on column DEV_FAULTNO_TABLE.bcr_fault_no
  is '二维码扫描仪模块对应的故障号';

create table DEV_HARDWARE_INFO
(
  dev_no           VARCHAR(20) not null,
  bios_version     VARCHAR(120),
  hardware_cpu     VARCHAR(50),
  hardware_memory  VARCHAR(40),
  hardware_hardisk VARCHAR(40),
  firmware_idc     VARCHAR(60),
  firmware_cdm     VARCHAR(60),
  firmware_cim     VARCHAR(60),
  firmware_pin     VARCHAR(60),
  firmware_jpr     VARCHAR(60),
  firmware_rpr     VARCHAR(60),
  firmware_siu     VARCHAR(60),
  firmware_ttu     VARCHAR(60),
  firmware_vdm     VARCHAR(60),
  firmware_bv      VARCHAR(60),
  firmware_icc     VARCHAR(60),
  firmware_isc     VARCHAR(60),
  firmware_irc     VARCHAR(60),
  firmware_fpi     VARCHAR(60),
  firmware_crd     VARCHAR(60),
  firmware_ccd     VARCHAR(60),
  firmware_dpr     VARCHAR(60),
  firmware_bcr     VARCHAR(60),
   constraint PK_DEV_HARDWARE_INFO primary key (DEV_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_HARDWARE_INFO
  is '设备硬件信息表';
comment on column DEV_HARDWARE_INFO.dev_no
  is '设备号';
comment on column DEV_HARDWARE_INFO.bios_version
  is 'BIOS版本号';
comment on column DEV_HARDWARE_INFO.hardware_cpu
  is '处理器';
comment on column DEV_HARDWARE_INFO.hardware_memory
  is '内存';
comment on column DEV_HARDWARE_INFO.hardware_hardisk
  is '硬盘';
comment on column DEV_HARDWARE_INFO.firmware_idc
  is 'FIRMWARE_IDC';
comment on column DEV_HARDWARE_INFO.firmware_cdm
  is 'FIRMWARE_CDM';
comment on column DEV_HARDWARE_INFO.firmware_cim
  is 'FIRMWARE_CIM';
comment on column DEV_HARDWARE_INFO.firmware_pin
  is 'FIRMWARE_PIN';
comment on column DEV_HARDWARE_INFO.firmware_jpr
  is 'FIRMWARE_JPR';
comment on column DEV_HARDWARE_INFO.firmware_rpr
  is 'FIRMWARE_RPR';
comment on column DEV_HARDWARE_INFO.firmware_siu
  is 'FIRMWARE_SIU';
comment on column DEV_HARDWARE_INFO.firmware_ttu
  is 'FIRMWARE_TTU';
comment on column DEV_HARDWARE_INFO.firmware_vdm
  is 'FIRMWARE_VDM';
comment on column DEV_HARDWARE_INFO.firmware_bv
  is 'FIRMWARE_BV';
comment on column DEV_HARDWARE_INFO.firmware_icc
  is 'FIRMWARE_ICC';
comment on column DEV_HARDWARE_INFO.firmware_isc
  is 'FIRMWARE_ISC';
comment on column DEV_HARDWARE_INFO.firmware_irc
  is 'FIRMWARE_IRC';
comment on column DEV_HARDWARE_INFO.firmware_fpi
  is 'FIRMWARE_FPI';
comment on column DEV_HARDWARE_INFO.firmware_crd
  is 'FIRMWARE_CRD';
comment on column DEV_HARDWARE_INFO.firmware_ccd
  is 'FIRMWARE_CCD';
comment on column DEV_HARDWARE_INFO.firmware_dpr
  is 'FIRMWARE_DPR(盖章模块)';
comment on column DEV_HARDWARE_INFO.firmware_bcr
  is 'FIRMWARE_BCR(二维码扫描仪模块)';


create table DEV_RESPONSOR_TABLE
(
  logic_id     VARCHAR(36) not null,
  dev_no       VARCHAR(20) not null,
  catalog      VARCHAR(2) not null,
  grade        VARCHAR(2) not null,
  responser_no VARCHAR(40) not null,
   constraint PK_DEV_RESPONSOR_TABLE primary key (LOGIC_ID)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_RESPONSOR_TABLE
  is '设备责任人表';
comment on column DEV_RESPONSOR_TABLE.logic_id
  is '编号';
comment on column DEV_RESPONSOR_TABLE.dev_no
  is '设备号';
comment on column DEV_RESPONSOR_TABLE.catalog
  is '责任人分类：1 – 管机员 2 – 维护人员';
comment on column DEV_RESPONSOR_TABLE.grade
  is '责任人级别：1,2,3,4与case级别对等,(数字越大级别越高)';
comment on column DEV_RESPONSOR_TABLE.responser_no
  is '责任人编号';

create table DEV_SERVICE_COMPANY
(
  no      VARCHAR(40) not null,
  name    VARCHAR(80) not null,
  linkman VARCHAR(30),
  address VARCHAR(80),
  phone   VARCHAR(30),
  mobile  VARCHAR(30),
  fax     VARCHAR(30),
  email   VARCHAR(40),
  infofilepath   VARCHAR(100),
  infofilename   VARCHAR(50),
   constraint PK_DEV_SERVICE_COMPANY primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_SERVICE_COMPANY
  is '设备维护商表';
comment on column DEV_SERVICE_COMPANY.no
  is '编号 UUID';
comment on column DEV_SERVICE_COMPANY.name
  is '服务商名称';
comment on column DEV_SERVICE_COMPANY.linkman
  is '联系人';
comment on column DEV_SERVICE_COMPANY.address
  is '地址';
comment on column DEV_SERVICE_COMPANY.phone
  is '固定电话';
comment on column DEV_SERVICE_COMPANY.mobile
  is '手机';
comment on column DEV_SERVICE_COMPANY.fax
  is '传真';
comment on column DEV_SERVICE_COMPANY.email
  is '电子邮箱';
comment on column DEV_SERVICE_COMPANY.infofilepath
  is '维护商相关信息文件存放路径，绝对路径';
comment on column DEV_SERVICE_COMPANY.infofilename
  is '维护商相关信息文件名称，带后缀';

create table DEV_SERVICE_PERSON
(
  no       VARCHAR(40) not null,
  name     VARCHAR(20) not null,
  belongto VARCHAR(40) not null,
  status   VARCHAR(2) not null,
  phone    VARCHAR(20),
  mobile   VARCHAR(20),
  email    VARCHAR(40),
  leader   VARCHAR(20),
   constraint PK_DEV_SERVICE_PERSON primary key (NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_SERVICE_PERSON
  is '设备维护员表';
comment on column DEV_SERVICE_PERSON.no
  is '编号 uuid';
comment on column DEV_SERVICE_PERSON.name
  is '姓名';
comment on column DEV_SERVICE_PERSON.belongto
  is '所属维护商 uuid';
comment on column DEV_SERVICE_PERSON.status
  is '状态：1—启用  2—停用  ';
comment on column DEV_SERVICE_PERSON.phone
  is '固定电话';
comment on column DEV_SERVICE_PERSON.mobile
  is '手机';
comment on column DEV_SERVICE_PERSON.email
  is '电子邮箱';
comment on column DEV_SERVICE_PERSON.leader
  is '维护员上级';

create table DEV_SOFTWARE_INFO
(
  dev_no                     VARCHAR(20) not null,
  operating_sys              VARCHAR(40),
  operating_version          VARCHAR(40),
  operating_patch_version    VARCHAR(40),
  antivirus_system           VARCHAR(100),
  antivirus_version          VARCHAR(40),
  antivirus_definition       VARCHAR(100),
  sp_version                 VARCHAR(40),
  app_version                VARCHAR(40),
  chk_cash_data              VARCHAR(40),
  software_list              VARCHAR(2000),
  sp_idc                     VARCHAR(60),
  sp_cdm                     VARCHAR(60),
  sp_cim                     VARCHAR(60),
  sp_pin                     VARCHAR(60),
  sp_jpr                     VARCHAR(60),
  sp_rpr                     VARCHAR(60),
  sp_siu                     VARCHAR(60),
  sp_ttu                     VARCHAR(60),
  sp_vdm                     VARCHAR(60),
  setupflag                  VARCHAR(10),
  takeeffectflag             VARCHAR(10),
  version                    VARCHAR(10),
  sp_icc                     VARCHAR(60),
  sp_isc                     VARCHAR(60),
  sp_irc                     VARCHAR(60),
  sp_fpi                     VARCHAR(60),
  sp_crd                     VARCHAR(60),
  sp_ccd                     VARCHAR(60),
  sp_dpr                     VARCHAR(60),
  sp_bcr                     VARCHAR(60),
  serial_no_info_status      VARCHAR(2),
  txt_info_status            VARCHAR(2),
  cimsrp_flag                VARCHAR(2),
  cdmsrp_flag                VARCHAR(2),
  nts_support_snr            VARCHAR(2),
  nts_snr_flag               VARCHAR(2),
  nts_support_serial_numbers VARCHAR(2),
  nts_open_serial_numbers_jp VARCHAR(2),
  nts_open_serial_numbers_rp VARCHAR(2),
   constraint PK_DEV_SOFTWARE_INFO primary key (DEV_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_SOFTWARE_INFO
  is '设备软件信息表 ';
comment on column DEV_SOFTWARE_INFO.dev_no
  is '设备号';
comment on column DEV_SOFTWARE_INFO.operating_sys
  is '操作系统';
comment on column DEV_SOFTWARE_INFO.operating_version
  is '操作系统版本号';
comment on column DEV_SOFTWARE_INFO.operating_patch_version
  is '操作系统补丁版本';
comment on column DEV_SOFTWARE_INFO.antivirus_system
  is '病毒软件';
comment on column DEV_SOFTWARE_INFO.antivirus_version
  is '病毒软件版本';
comment on column DEV_SOFTWARE_INFO.antivirus_definition
  is '病毒定义';
comment on column DEV_SOFTWARE_INFO.sp_version
  is '硬件SP';
comment on column DEV_SOFTWARE_INFO.app_version
  is '应用版本';
comment on column DEV_SOFTWARE_INFO.chk_cash_data
  is '验钞数据版本';
comment on column DEV_SOFTWARE_INFO.software_list
  is '安装软件列表';
comment on column DEV_SOFTWARE_INFO.sp_idc
  is 'SP_IDC';
comment on column DEV_SOFTWARE_INFO.sp_cdm
  is 'SP_CDM';
comment on column DEV_SOFTWARE_INFO.sp_cim
  is 'SP_CIM';
comment on column DEV_SOFTWARE_INFO.sp_pin
  is 'SP_PIN';
comment on column DEV_SOFTWARE_INFO.sp_jpr
  is 'SP_JPR';
comment on column DEV_SOFTWARE_INFO.sp_rpr
  is 'SP_RPR';
comment on column DEV_SOFTWARE_INFO.sp_siu
  is 'SP_SIU';
comment on column DEV_SOFTWARE_INFO.sp_ttu
  is 'SP_TTU';
comment on column DEV_SOFTWARE_INFO.sp_vdm
  is 'SP_VDM';
comment on column DEV_SOFTWARE_INFO.setupflag
  is '安装标志 TRUE：安装，FALSE，未安装';
comment on column DEV_SOFTWARE_INFO.takeeffectflag
  is '使用标志TRUE：使用，FALSE，未使用';
comment on column DEV_SOFTWARE_INFO.version
  is '无纸化版本号';
comment on column DEV_SOFTWARE_INFO.sp_icc
  is 'SP_ICC';
comment on column DEV_SOFTWARE_INFO.sp_isc
  is 'SP_ISC';
comment on column DEV_SOFTWARE_INFO.sp_irc
  is 'SP_IRC';
comment on column DEV_SOFTWARE_INFO.sp_fpi
  is 'SP_FPI';
comment on column DEV_SOFTWARE_INFO.sp_crd
  is 'SP_CRD';
comment on column DEV_SOFTWARE_INFO.sp_ccd
  is 'SP_CCD';
comment on column DEV_SOFTWARE_INFO.sp_dpr
  is 'SP_DPR(盖章模块)';
comment on column DEV_SOFTWARE_INFO.sp_bcr
  is 'SP_BCR(二维码扫描仪模块)';
comment on column DEV_SOFTWARE_INFO.serial_no_info_status
  is '冠字号缓存开关状态（1:开启，0:关闭，  其它：未知）';
comment on column DEV_SOFTWARE_INFO.txt_info_status
  is '现金缓存开关状态（1:开启，0:关闭，  其它：未知）';
comment on column DEV_SOFTWARE_INFO.cimsrp_flag
  is '存款冠字号凭条打印开关状态（1:开启，0:关闭， 其它：未知）';
comment on column DEV_SOFTWARE_INFO.cdmsrp_flag
  is '取款冠字号凭条打印开关状态（1:开启，0:关闭，其它：未知）';
comment on column DEV_SOFTWARE_INFO.nts_support_snr
  is '是否支持冠字号功能 1:支持 0: 不支持';
comment on column DEV_SOFTWARE_INFO.nts_snr_flag
  is '冠字号功能是否已开通 1:已开通 0:未开通';
comment on column DEV_SOFTWARE_INFO.nts_support_serial_numbers
  is '应用是否支持冠字号 1:支持 0:不支持';
comment on column DEV_SOFTWARE_INFO.nts_open_serial_numbers_jp
  is '应用是否开放冠字号日志打印功能，2-只打印真钞，1-真钞拒钞全部打印,0：不开通';
comment on column DEV_SOFTWARE_INFO.nts_open_serial_numbers_rp
  is '应用是否开通冠字号凭条打印，2-只打印真钞，1-真钞拒钞全部打印,0：不开通';

create table DEV_STATUS_CODE
(
  dev_no   VARCHAR(20) not null,
  idc_code VARCHAR(15),
  cim_code VARCHAR(15),
  cdm_code VARCHAR(15),
  dep_code VARCHAR(15),
  ups_code VARCHAR(15),
  spr_code VARCHAR(15),
  rpr_code VARCHAR(15),
  jpr_code VARCHAR(15),
  chk_code VARCHAR(15),
  ttu_code VARCHAR(15),
  pbk_code VARCHAR(15),
  pin_code VARCHAR(15),
  siu_code VARCHAR(15),
  cam_code VARCHAR(15),
  icc_code VARCHAR(15),
  isc_code VARCHAR(15),
  irc_code VARCHAR(15),
  fpi_code VARCHAR(15),
  crd_code VARCHAR(15),
  ccd_code VARCHAR(15),
  dpr_code VARCHAR(15),
  bcr_code VARCHAR(15),
   constraint PK_DEV_STATUS_CODE primary key (DEV_NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_STATUS_CODE
  is '设备当前状态表';
comment on column DEV_STATUS_CODE.dev_no
  is '设备号';
comment on column DEV_STATUS_CODE.idc_code
  is '读卡器模块对应故障码';
comment on column DEV_STATUS_CODE.cim_code
  is '存款模块对应故障码';
comment on column DEV_STATUS_CODE.cdm_code
  is '取款模块对应故障码';
comment on column DEV_STATUS_CODE.dep_code
  is '信封模块对应故障码';
comment on column DEV_STATUS_CODE.ups_code
  is '不间断电源模块对应故障码';
comment on column DEV_STATUS_CODE.spr_code
  is '结单打印模块对应故障码';
comment on column DEV_STATUS_CODE.rpr_code
  is '凭条打印机模块对应故障码';
comment on column DEV_STATUS_CODE.jpr_code
  is '日志打印机模块对应故障码';
comment on column DEV_STATUS_CODE.chk_code
  is '支票读扫描模块对应故障码';
comment on column DEV_STATUS_CODE.ttu_code
  is '文本终端单元模块对应故障码';
comment on column DEV_STATUS_CODE.pbk_code
  is '存折打印机模块对应故障码';
comment on column DEV_STATUS_CODE.pin_code
  is '密码键盘模块对应故障码';
comment on column DEV_STATUS_CODE.siu_code
  is '传感器模块对应故障码';
comment on column DEV_STATUS_CODE.cam_code
  is '照相机模块对应故障码';
comment on column DEV_STATUS_CODE.icc_code
  is 'ICC_CODE';
comment on column DEV_STATUS_CODE.isc_code
  is 'ISC_CODE';
comment on column DEV_STATUS_CODE.irc_code
  is 'IRC_CODE';
comment on column DEV_STATUS_CODE.fpi_code
  is 'FPI_CODE';
comment on column DEV_STATUS_CODE.crd_code
  is 'CRD_CODE';
comment on column DEV_STATUS_CODE.ccd_code
  is 'CCD_CODE';
comment on column DEV_STATUS_CODE.dpr_code
  is '盖章模块对应故障码';
comment on column DEV_STATUS_CODE.bcr_code
  is '二维码扫描仪模块对应故障码';

create table DEV_STATUS_TABLE
(
  dev_no                        VARCHAR(20) not null,
  dev_status                    VARCHAR(20) not null,
  dev_tx_status                 VARCHAR(20) not null,
  dev_net_status                VARCHAR(20) not null,
  dev_run_status                VARCHAR(20) not null,
  dev_cash_status               CHAR(1),
  dev_crs_status                CHAR(1),
  action_type                   VARCHAR(2),
  action_note                   VARCHAR(2),
  dev_cashbox_status            VARCHAR(20) not null,
  dev_mod_status                VARCHAR(20) not null,
  dev_potential_fault           VARCHAR(20),
  status_last_time              CHAR(14),
  status_expire_time            CHAR(14),
  tx_type                       VARCHAR(15),
  tx_time                       CHAR(14),
  atm_type                      CHAR(1),
  cash_unit_type                CHAR(1),
  status_info_type              CHAR(1),
  combin_unit_type              CHAR(1),
  idc_device_status             VARCHAR(15),
  cim_device_status             VARCHAR(15),
  cdm_device_status             VARCHAR(15),
  dep_device_status             VARCHAR(15),
  ups_device_status             VARCHAR(15),
  spr_device_status             VARCHAR(15),
  rpr_device_status             VARCHAR(15),
  jpr_device_status             VARCHAR(15),
  chk_device_status             VARCHAR(15),
  ttu_device_status             VARCHAR(15),
  pbk_device_status             VARCHAR(15),
  pin_device_status             VARCHAR(15),
  siu_device_status             VARCHAR(15),
  cam_device_status             VARCHAR(15),
  crd_device_status             VARCHAR(15),
  ccd_device_status             VARCHAR(15),
  idc_media_status              VARCHAR(20),
  idc_capture_bin_status        VARCHAR(20),
  idc_capture_bin_count         VARCHAR(10),
  cim_accept_or_status          VARCHAR(20),
  cim_escrow_status             VARCHAR(20),
  cim_cash_units                VARCHAR(20),
  cim_shutter_status            VARCHAR(40),
  cim_transport_status          VARCHAR(40),
  cim_inout_position            VARCHAR(40),
  cim_input_output_status       VARCHAR(100),
  cim_pu_id                     VARCHAR(100),
  cim_pu_count                  VARCHAR(100),
  cim_pu_cash_in_count          VARCHAR(100),
  cim_pu_status                 VARCHAR(100),
  cim_pupos_name                VARCHAR(200),
  cim_cu_id                     VARCHAR(100),
  cim_pcu_id                    VARCHAR(100),
  cim_cu_note_value             VARCHAR(100),
  cim_cu_currency               VARCHAR(100),
  cim_cu_count                  VARCHAR(100),
  cim_cu_cash_in_count          VARCHAR(100),
  cim_cu_type                   VARCHAR(500),
  cim_cu_status                 VARCHAR(100),
  cdm_shutter_status            VARCHAR(20),
  cdm_dispenser_status          VARCHAR(20),
  cdm_safe_door_status          VARCHAR(20),
  cdm_stacker_status            VARCHAR(20),
  cdm_cash_units                VARCHAR(20),
  cdm_transport_status          VARCHAR(40),
  cdm_out_position              VARCHAR(40),
  cdm_input_output_status       VARCHAR(20),
  cdm_pu_status                 VARCHAR(100),
  cdm_pu_id                     VARCHAR(100),
  cdm_pu_initial_count          VARCHAR(100),
  cdm_pu_current_count          VARCHAR(100),
  cdm_pu_reject_count           VARCHAR(100),
  cdm_pupos_name                VARCHAR(200),
  cdm_cu_id                     VARCHAR(100),
  cdm_pcu_id                    VARCHAR(100),
  cdm_cu_note_value             VARCHAR(100),
  cdm_cu_currency               VARCHAR(100),
  cdm_cu_current_count          VARCHAR(100),
  cdm_cu_initial_count          VARCHAR(100),
  cdm_cu_reject_count           VARCHAR(100),
  cdm_cu_type                   VARCHAR(500),
  cdm_cu_status                 VARCHAR(100),
  dep_deposit_status            VARCHAR(20),
  dep_deposit_container_status  VARCHAR(20),
  dep_envelope_supply_status    VARCHAR(20),
  dep_envelope_status           VARCHAR(20),
  dep_printer_status            VARCHAR(20),
  dep_printer_ink               VARCHAR(20),
  dep_deposited_items           VARCHAR(10),
  dep_transport_status          VARCHAR(20),
  dep_shutter_status            VARCHAR(20),
  ups_low                       VARCHAR(20),
  ups_engaged                   VARCHAR(20),
  ups_powering                  VARCHAR(20),
  ups_recovered                 VARCHAR(20),
  spr_media_status              VARCHAR(20),
  spr_paper_status              VARCHAR(20),
  spr_retract_bin_status        VARCHAR(20),
  spr_ink_status                VARCHAR(20),
  spr_toner_status              VARCHAR(20),
  spr_stack_count               VARCHAR(10),
  chk_media_status              VARCHAR(20),
  chk_ink_status                VARCHAR(20),
  rpr_media_status              VARCHAR(20),
  rpr_paper_status              VARCHAR(20),
  rpr_retract_bin_status        VARCHAR(20),
  rpr_ink_status                VARCHAR(20),
  rpr_toner_status              VARCHAR(20),
  jpr_media_status              VARCHAR(20),
  jpr_paper_status              VARCHAR(20),
  jpr_ink_status                VARCHAR(20),
  jpr_toner_status              VARCHAR(20),
  pbk_media_status              VARCHAR(20),
  pbk_ink_status                VARCHAR(20),
  pbk_toner_status              VARCHAR(20),
  pbk_retract_bin_status        VARCHAR(20),
  pbk_retract_bin_count         VARCHAR(10),
  siu_operator_switch           VARCHAR(20),
  siu_terminal_tamper           VARCHAR(20),
  siu_alarm_tamper              VARCHAR(20),
  siu_seismic                   VARCHAR(20),
  siu_proximity_detector        VARCHAR(20),
  siu_heat                      VARCHAR(20),
  siu_ambient_light             VARCHAR(20),
  siu_cabinet_state             VARCHAR(20),
  siu_safe_state                VARCHAR(20),
  siu_shield_state              VARCHAR(20),
  siu_bill_acceptor_light       VARCHAR(20),
  siu_card_reader_light         VARCHAR(20),
  siu_cheque_unit_light         VARCHAR(20),
  siu_coin_dispenser_light      VARCHAR(20),
  siu_note_dispenser_light      VARCHAR(20),
  siu_envelope_depository_light VARCHAR(20),
  siu_passbook_printer_light    VARCHAR(20),
  siu_pinpad_light              VARCHAR(20),
  siu_receipt_printer_light     VARCHAR(20),
  siu_envelope_dispenser_light  VARCHAR(20),
  cam_camera_area               VARCHAR(40),
  cam_camera_area_status        VARCHAR(40),
  cam_media_status              VARCHAR(40),
  cam_picture_staken            VARCHAR(10),
  icc_device_status             VARCHAR(15),
  icc_media_status              VARCHAR(20),
  isc_device_status             VARCHAR(15),
  isc_media_status              VARCHAR(20),
  irc_device_status             VARCHAR(15),
  irc_media_status              VARCHAR(20),
  fpi_device_status             VARCHAR(15),
  dpr_device_status             VARCHAR(15),
  bcr_device_status             VARCHAR(15),
  pjc_ret_code                  VARCHAR(20),
  pjc_cru_status                VARCHAR(20),
  pjc_ej_sendtime               VARCHAR(20),
  pjc_ej_date                   VARCHAR(20),
  pjc_ej_nsend                  VARCHAR(20),
  cdm_cu_number                 VARCHAR(100),
  cim_cu_number                 VARCHAR(100),
   constraint PK_DEV_STATUS_TABLE primary key (DEV_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_STATUS_TABLE
  is '设备模块状态表 ';
comment on column DEV_STATUS_TABLE.dev_no
  is '设备号';
comment on column DEV_STATUS_TABLE.dev_status
  is 'HEALTHY(正常)
FATAL（故障）
WARNING（警告）
UNKNOWN（未知）';
comment on column DEV_STATUS_TABLE.dev_tx_status
  is 'HEALTHY（正常）
PARTSERVICE（部分服务）
NOSERVICE（停止服务）
UNKNOWN（未知）';
comment on column DEV_STATUS_TABLE.dev_net_status
  is 'HEALTHY（正常）
FATAL（故障，即离线）
WARNING（警告）
UNKNOW（未知）';
comment on column DEV_STATUS_TABLE.dev_run_status
  is 'HEALTHY(正常)
CLOSE（关机）
MAINTAIN（维护）
NETFATAL（P通讯故障）
PARTSERVICE（部分服务）
NOSERVICE（停止服务）
STOP（停用）
UNKNOWN（未知）';
comment on column DEV_STATUS_TABLE.dev_cash_status
  is '0：正常1：无法取款2：无法存款3：无法存取款';
comment on column DEV_STATUS_TABLE.dev_crs_status
  is '0：正常1：无法取款2：无法存款3：无法存取款';
comment on column DEV_STATUS_TABLE.action_type
  is '运行状态';
comment on column DEV_STATUS_TABLE.action_note
  is '运行子状态';
comment on column DEV_STATUS_TABLE.dev_cashbox_status
  is 'OK（充足）
LOW（不足）
EMPTY（缺炒）
FULL（钞满）
UNKNOWN（未知）';
comment on column DEV_STATUS_TABLE.dev_mod_status
  is 'HEALTHY(正常)
FATAL（故障）
WARNING（警告）
UNKNOWN（未知）';
comment on column DEV_STATUS_TABLE.dev_potential_fault
  is '设备是否存在潜在故障（未使用）';
comment on column DEV_STATUS_TABLE.status_last_time
  is '上次更新时间（yyyymmddhhmmss）';
comment on column DEV_STATUS_TABLE.status_expire_time
  is '状态超时时间（yyyymmddhhmmss）';
comment on column DEV_STATUS_TABLE.tx_type
  is 'CWD-取款
DET-存款';
comment on column DEV_STATUS_TABLE.tx_time
  is '交易时间（yyyymmddhhmmss）';
comment on column DEV_STATUS_TABLE.atm_type
  is '1 --自动取款机(ATM)
2--自动存款机(CDM)
3--自动存取款机(CRS)
4--多媒体查询机(BSM)';
comment on column DEV_STATUS_TABLE.cash_unit_type
  is 'P--Physical,L--Logical';
comment on column DEV_STATUS_TABLE.status_info_type
  is '1--定时状态报文
2--强制发送状态报文';
comment on column DEV_STATUS_TABLE.combin_unit_type
  is '0--按默认方式合并
1--按PUPosName合并
2--按DevCdmCUID合并
3--按PUPosName和DevCdmCUID合并';
comment on column DEV_STATUS_TABLE.idc_device_status
  is 'HEALTHY
FATAL
WARNING
NODEVICE
UNKNOWN';
comment on column DEV_STATUS_TABLE.cim_device_status
  is 'CIM模块状态';
comment on column DEV_STATUS_TABLE.cdm_device_status
  is 'CMD模块状态';
comment on column DEV_STATUS_TABLE.dep_device_status
  is 'DEP模块状态';
comment on column DEV_STATUS_TABLE.ups_device_status
  is 'UPS模块状态';
comment on column DEV_STATUS_TABLE.spr_device_status
  is 'SPR模块状态';
comment on column DEV_STATUS_TABLE.rpr_device_status
  is 'RPR模块状态';
comment on column DEV_STATUS_TABLE.jpr_device_status
  is 'JPR模块状态';
comment on column DEV_STATUS_TABLE.chk_device_status
  is 'CHK模块状态';
comment on column DEV_STATUS_TABLE.ttu_device_status
  is 'TTU模块状态';
comment on column DEV_STATUS_TABLE.pbk_device_status
  is 'PBK模块状态';
comment on column DEV_STATUS_TABLE.pin_device_status
  is 'PIN模块状态';
comment on column DEV_STATUS_TABLE.siu_device_status
  is 'SIU模块状态';
comment on column DEV_STATUS_TABLE.cam_device_status
  is 'CAM模块状态';
comment on column DEV_STATUS_TABLE.crd_device_status
  is 'CRD_DEVICE_STATUS';
comment on column DEV_STATUS_TABLE.ccd_device_status
  is 'CCD_DEVICE_STATUS';
comment on column DEV_STATUS_TABLE.idc_media_status
  is 'PRESENT NOTPRESENT
INJAWS
JAMMED';
comment on column DEV_STATUS_TABLE.idc_capture_bin_status
  is 'NOBIN
BINOK
BINHIGH
BINFULL';
comment on column DEV_STATUS_TABLE.idc_capture_bin_count
  is '回收箱数量';
comment on column DEV_STATUS_TABLE.cim_accept_or_status
  is 'HEALTHY
FATAL
UNKNOWN';
comment on column DEV_STATUS_TABLE.cim_escrow_status
  is 'EMPTY
NOEMPTY
FULL
NOESCROW
UNKNOWN';
comment on column DEV_STATUS_TABLE.cim_cash_units
  is 'OK, Warning, Fatal, Unknown';
comment on column DEV_STATUS_TABLE.cim_shutter_status
  is 'Closed, Open, Jammed, Unknown, NotSupported';
comment on column DEV_STATUS_TABLE.cim_transport_status
  is 'OK, Inoperable, Unknown, NotSupported';
comment on column DEV_STATUS_TABLE.cim_inout_position
  is 'InLeft,InRight,InCenter,InTop,InBottom,InFront,InRear,OutLeft,OutRight, OutCenter, OutTop, OutBottom, OutFront, OutRear';
comment on column DEV_STATUS_TABLE.cim_input_output_status
  is 'EMPTY
NOEMPTY
UNKNOWN';
comment on column DEV_STATUS_TABLE.cim_pu_id
  is '物理单元标识（数组）';
comment on column DEV_STATUS_TABLE.cim_pu_count
  is '当前物理单元纸币数（数组）';
comment on column DEV_STATUS_TABLE.cim_pu_cash_in_count
  is '物理单元废钞数（数组）';
comment on column DEV_STATUS_TABLE.cim_pu_status
  is '逻辑单元状态';
comment on column DEV_STATUS_TABLE.cim_pupos_name
  is 'CIM物理钞箱物理位置名集合';
comment on column DEV_STATUS_TABLE.cim_cu_id
  is '逻辑单元标识（数组）';
comment on column DEV_STATUS_TABLE.cim_pcu_id
  is '物理单元与逻辑单元对应关系（数组）';
comment on column DEV_STATUS_TABLE.cim_cu_note_value
  is '逻辑单元纸币面值（数组）';
comment on column DEV_STATUS_TABLE.cim_cu_currency
  is '逻辑单元币种（数组）';
comment on column DEV_STATUS_TABLE.cim_cu_count
  is '当前逻辑单元纸币数（数组）';
comment on column DEV_STATUS_TABLE.cim_cu_cash_in_count
  is '逻辑单元废钞数（数组）';
comment on column DEV_STATUS_TABLE.cim_cu_type
  is '逻辑单元类型';
comment on column DEV_STATUS_TABLE.cim_cu_status
  is 'CIM逻辑单元状态';
comment on column DEV_STATUS_TABLE.cdm_shutter_status
  is 'Closed, Open, Jammed, Unknown, NotSupported';
comment on column DEV_STATUS_TABLE.cdm_dispenser_status
  is '退钞状态';
comment on column DEV_STATUS_TABLE.cdm_safe_door_status
  is 'OPEN
FATAL
CLOSED
LOCKED
NOTSUPPORTED';
comment on column DEV_STATUS_TABLE.cdm_stacker_status
  is 'CDM暂存器状态';
comment on column DEV_STATUS_TABLE.cdm_cash_units
  is 'OK, Warning, Fatal, Unknown';
comment on column DEV_STATUS_TABLE.cdm_transport_status
  is 'OK, Inoperable, Unknown, NotSupported';
comment on column DEV_STATUS_TABLE.cdm_out_position
  is 'Left,Right,Center,Top,Bottom,Front,Rear';
comment on column DEV_STATUS_TABLE.cdm_input_output_status
  is 'EMPTY
NOTEMPTY
UNKNOWN
NOTSUPPORTED';
comment on column DEV_STATUS_TABLE.cdm_pu_status
  is '物理单元状态(数组)';
comment on column DEV_STATUS_TABLE.cdm_pu_id
  is 'CDM物理单元标识（数组）';
comment on column DEV_STATUS_TABLE.cdm_pu_initial_count
  is 'CDM当前物理单元纸币数（数组）';
comment on column DEV_STATUS_TABLE.cdm_pu_current_count
  is '当前物理单元初始币数';
comment on column DEV_STATUS_TABLE.cdm_pu_reject_count
  is 'CDM物理单元废钞数（数组）';
comment on column DEV_STATUS_TABLE.cdm_pupos_name
  is 'CDM物理钞箱物理位置名集合';
comment on column DEV_STATUS_TABLE.cdm_cu_id
  is 'CDM逻辑单元标识（数组）';
comment on column DEV_STATUS_TABLE.cdm_pcu_id
  is 'CDM物理单元与逻辑单元对应关系（数组）';
comment on column DEV_STATUS_TABLE.cdm_cu_note_value
  is 'CDM逻辑单元纸币面值（数组）';
comment on column DEV_STATUS_TABLE.cdm_cu_currency
  is 'CDM逻辑单元币种（数组）';
comment on column DEV_STATUS_TABLE.cdm_cu_current_count
  is 'CDM当前逻辑单元纸币数（数组）';
comment on column DEV_STATUS_TABLE.cdm_cu_initial_count
  is '当前逻辑单元初始币数';
comment on column DEV_STATUS_TABLE.cdm_cu_reject_count
  is 'CDM逻辑单元废钞数（数组）';
comment on column DEV_STATUS_TABLE.cdm_cu_type
  is 'CDM逻辑单元类型';
comment on column DEV_STATUS_TABLE.cdm_cu_status
  is 'CDM逻辑单元状态';
comment on column DEV_STATUS_TABLE.dep_deposit_status
  is 'OK
NOTPRESENT
DEPOSITJAMMED
SHUTTERJAMMED';
comment on column DEV_STATUS_TABLE.dep_deposit_container_status
  is 'OK
HIGH
FULL
NOTPRESENT';
comment on column DEV_STATUS_TABLE.dep_envelope_supply_status
  is 'OK
LOW
EMPTY';
comment on column DEV_STATUS_TABLE.dep_envelope_status
  is 'READY
NOTREADY';
comment on column DEV_STATUS_TABLE.dep_printer_status
  is 'READY
NOTREADY';
comment on column DEV_STATUS_TABLE.dep_printer_ink
  is 'OK
LOW
EMPTY';
comment on column DEV_STATUS_TABLE.dep_deposited_items
  is '已存信封数量';
comment on column DEV_STATUS_TABLE.dep_transport_status
  is '传送部件状态';
comment on column DEV_STATUS_TABLE.dep_shutter_status
  is '挡板状态';
comment on column DEV_STATUS_TABLE.ups_low
  is 'TRUE
FALSE';
comment on column DEV_STATUS_TABLE.ups_engaged
  is 'TRUE
FALSE';
comment on column DEV_STATUS_TABLE.ups_powering
  is 'TRUE
FALSE';
comment on column DEV_STATUS_TABLE.ups_recovered
  is 'TRUE
FALSE';
comment on column DEV_STATUS_TABLE.spr_media_status
  is 'NOPRESENT
PRESENT
INJAMS
JAMMED';
comment on column DEV_STATUS_TABLE.spr_paper_status
  is 'FULL
LOW
OUT
UNKNOWN';
comment on column DEV_STATUS_TABLE.spr_retract_bin_status
  is 'NOBIN
OK
BINHIGH
BINFULL
BINUNKNOWN';
comment on column DEV_STATUS_TABLE.spr_ink_status
  is '墨水状态';
comment on column DEV_STATUS_TABLE.spr_toner_status
  is '色带状态';
comment on column DEV_STATUS_TABLE.spr_stack_count
  is '暂存数量';
comment on column DEV_STATUS_TABLE.chk_media_status
  is 'NOPRESENT
PRESENT
INJAMS
JAMMED';
comment on column DEV_STATUS_TABLE.chk_ink_status
  is 'NOBIN
OK
BINHIGH
BINFULL
BINUNKNOWN';
comment on column DEV_STATUS_TABLE.rpr_media_status
  is 'NOPRESENT
PRESENT
INJAMS
JAMMED';
comment on column DEV_STATUS_TABLE.rpr_paper_status
  is 'FULL
LOW
OUT
UNKNOWN';
comment on column DEV_STATUS_TABLE.rpr_retract_bin_status
  is 'NOBIN
OK
BINHIGH
BINFULL
BINUNKNOWN';
comment on column DEV_STATUS_TABLE.rpr_ink_status
  is 'RPR墨水状态';
comment on column DEV_STATUS_TABLE.rpr_toner_status
  is 'RPR色带状态';
comment on column DEV_STATUS_TABLE.jpr_media_status
  is 'NOPRESENT
PRESENT
INJAMS
JAMMED';
comment on column DEV_STATUS_TABLE.jpr_paper_status
  is 'FULL
LOW
OUT
UNKNOWN';
comment on column DEV_STATUS_TABLE.jpr_ink_status
  is 'JPR墨水状态';
comment on column DEV_STATUS_TABLE.jpr_toner_status
  is 'JPR色带状态';
comment on column DEV_STATUS_TABLE.pbk_media_status
  is 'NOPRESENT
PRESENT
INJAMS
JAMMED';
comment on column DEV_STATUS_TABLE.pbk_ink_status
  is 'FULL
LOW
OUT
UNKNOWN';
comment on column DEV_STATUS_TABLE.pbk_toner_status
  is 'FULL
LOW
OUT
UNKNOWN';
comment on column DEV_STATUS_TABLE.pbk_retract_bin_status
  is 'NOBIN
OK
BINHIGH
BINFULL
BINUNKNOWN';
comment on column DEV_STATUS_TABLE.pbk_retract_bin_count
  is 'PBK回收单元数量';
comment on column DEV_STATUS_TABLE.siu_operator_switch
  is 'NOSENSOR
ERROR
RUN
MAINTENANCE
SUPERVISOR';
comment on column DEV_STATUS_TABLE.siu_terminal_tamper
  is 'NOSENSOR
ERROR
ON
OFF';
comment on column DEV_STATUS_TABLE.siu_alarm_tamper
  is 'NOSENSOR
ERROR
ON
OFF';
comment on column DEV_STATUS_TABLE.siu_seismic
  is 'NOSENSOR
ERROR
ON
OFF';
comment on column DEV_STATUS_TABLE.siu_proximity_detector
  is 'NOSENSOR
ERROR
ON
OFF';
comment on column DEV_STATUS_TABLE.siu_heat
  is 'NOSENSOR
ERROR
ON
OFF';
comment on column DEV_STATUS_TABLE.siu_ambient_light
  is 'NOSENSOR
ERROR
VERYLIGHT
LIGHT
MEDIUMLIGHT
DARK
VERYDARK';
comment on column DEV_STATUS_TABLE.siu_cabinet_state
  is '机箱状态';
comment on column DEV_STATUS_TABLE.siu_safe_state
  is 'SIU安全门状态';
comment on column DEV_STATUS_TABLE.siu_shield_state
  is 'SIU档板状态';
comment on column DEV_STATUS_TABLE.siu_bill_acceptor_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_card_reader_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_cheque_unit_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_coin_dispenser_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_note_dispenser_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_envelope_depository_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_passbook_printer_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_pinpad_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_receipt_printer_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.siu_envelope_dispenser_light
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.cam_camera_area
  is 'room,person,exit_slot';
comment on column DEV_STATUS_TABLE.cam_camera_area_status
  is 'HEALTHY
FATAL
NODEVICE';
comment on column DEV_STATUS_TABLE.cam_media_status
  is 'LOW
HIGH
FULL';
comment on column DEV_STATUS_TABLE.cam_picture_staken
  is '已获取图像';
comment on column DEV_STATUS_TABLE.icc_device_status
  is 'ICC_DEVICE_STATUS';
comment on column DEV_STATUS_TABLE.icc_media_status
  is 'ICC_MEDIA_STATUS';
comment on column DEV_STATUS_TABLE.isc_device_status
  is 'ISC_DEVICE_STATUS';
comment on column DEV_STATUS_TABLE.isc_media_status
  is 'ISC_MEDIA_STATUS';
comment on column DEV_STATUS_TABLE.irc_device_status
  is 'IRC_DEVICE_STATUS';
comment on column DEV_STATUS_TABLE.irc_media_status
  is 'IRC_MEDIA_STATUS';
comment on column DEV_STATUS_TABLE.fpi_device_status
  is 'FPI_DEVICE_STATUS';
comment on column DEV_STATUS_TABLE.dpr_device_status
  is '盖章模块状态';
comment on column DEV_STATUS_TABLE.bcr_device_status
  is '二维码扫描仪模块状态';
comment on column DEV_STATUS_TABLE.pjc_ret_code
  is 'PJC故障码';
comment on column DEV_STATUS_TABLE.pjc_cru_status
  is 'PJC模块主状态，Healthy-正常（进程存在），Fatal-失败';
comment on column DEV_STATUS_TABLE.pjc_ej_sendtime
  is 'PJC流水上传时间';
comment on column DEV_STATUS_TABLE.pjc_ej_date
  is 'PJC上传流水日期';
comment on column DEV_STATUS_TABLE.pjc_ej_nsend
  is '剩余未发送缓存流水情况，Without-未采集到流水，Ok-未发送流水数据为0，High-未发送流水数据未达到阀值，Full-未发送流水数据大于等于阀值';
comment on column DEV_STATUS_TABLE.cdm_cu_number
  is '取款箱逻辑钞箱索引号';
comment on column DEV_STATUS_TABLE.cim_cu_number
  is '存款箱逻辑钞箱索引号';

create table DEV_STATUS_TABLE_EXPAND
(
  dev_no                     VARCHAR(20) not null,
  crd_dispenser              VARCHAR(20),
  crd_transport              VARCHAR(20),
  crd_media                  VARCHAR(20),
  crd_shutter                VARCHAR(20),
  crd_supplybin_status       VARCHAR(20),
  crd_retainbin_status       VARCHAR(20),
  crd_cu_id                  VARCHAR(100),
  crd_cu_name                VARCHAR(200),
  crd_cu_status              VARCHAR(200),
  crd_cu_type                VARCHAR(200),
  crd_cu_count               VARCHAR(100),
  crd_cu_initial_count       VARCHAR(100),
  crd_cu_retain_count        VARCHAR(100),
  ccd_dispenser              VARCHAR(20),
  ccd_transport              VARCHAR(20),
  ccd_media                  VARCHAR(20),
  ccd_shutter                VARCHAR(20),
  ccd_supplybin_status       VARCHAR(20),
  ccd_retainbin_status       VARCHAR(20),
  ccd_cu_id                  VARCHAR(100),
  ccd_cu_name                VARCHAR(200),
  ccd_cu_status              VARCHAR(200),
  ccd_cu_type                VARCHAR(200),
  ccd_cu_count               VARCHAR(100),
  ccd_cu_initial_count       VARCHAR(100),
  ccd_cu_retain_count        VARCHAR(100),
  dpr_media_status           VARCHAR(15),
  dpr_supply_level_status    VARCHAR(15),
  dpr_supply_lower_status    VARCHAR(15),
  dpr_supply_external_status VARCHAR(15),
  dpr_supply_aux_status      VARCHAR(15),
  dpr_retract_bin_status     VARCHAR(15),
  dpr_toner_status           VARCHAR(15),
  dpr_ink_status             VARCHAR(15),
  bcr_scanner_status         VARCHAR(15),
  nts_cache_count            VARCHAR(10),
  nts_last_build_time        VARCHAR(20),
   constraint PK_DEV_STATUS_TABLE_EXPAND primary key (DEV_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_STATUS_TABLE_EXPAND
  is '设备模块状态扩展表';
comment on column DEV_STATUS_TABLE_EXPAND.dev_no
  is '设备号';
comment on column DEV_STATUS_TABLE_EXPAND.crd_dispenser
  is 'OK
State
Stop
Unknown';
comment on column DEV_STATUS_TABLE_EXPAND.crd_transport
  is 'OK
Inop
Unknown
NotSupported';
comment on column DEV_STATUS_TABLE_EXPAND.crd_media
  is 'Present
NotPresent
Jammed
NotSupported
Unknown
Exiting';
comment on column DEV_STATUS_TABLE_EXPAND.crd_shutter
  is 'Closed
Open
Jammed
Unknown
NotSupported';
comment on column DEV_STATUS_TABLE_EXPAND.crd_supplybin_status
  is '0-ok;1-low;2-empty;3-inoperable 不可用;4-missing;5-unknown';
comment on column DEV_STATUS_TABLE_EXPAND.crd_retainbin_status
  is '0-ok;1-high;2-full;3-inoperable 不可用;4-missing;5-unknown';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_id
  is '卡单元ID集合';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_name
  is '卡单元名集合';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_status
  is 'OK
Low
Empty
Inop
Missing
High
Full
Unknown';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_type
  is 'SupplyBin
RetainBin';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_count
  is '卡单元当前消耗卡张数集合';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_initial_count
  is '卡单元初始张数集合';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_retain_count
  is '回收匣卡张数的集合';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_dispenser
  is 'CCD_DISPENSER';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_transport
  is 'CCD_TRANSPORT';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_media
  is 'CCD_MEDIA';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_shutter
  is 'CCD_SHUTTER';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_supplybin_status
  is 'CCD_SUPPLYBIN_STATUS';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_retainbin_status
  is 'CCD_RETAINBIN_STATUS';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_id
  is 'CCD_CU_ID';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_name
  is 'CCD_CU_NAME';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_status
  is 'CCD_CU_STATUS';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_type
  is 'CCD_CU_TYPE';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_count
  is 'CCD_CU_COUNT';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_initial_count
  is 'CCD_CU_INITIAL_COUNT';
comment on column DEV_STATUS_TABLE_EXPAND.ccd_cu_retain_count
  is 'CCD_CU_RETAIN_COUNT';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_media_status
  is '盖章模块media状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_level_status
  is '上位纸张供应的状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_lower_status
  is '下位纸张供应量状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_external_status
  is '外部纸张供应的状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_aux_status
  is '备用纸张供应状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_retract_bin_status
  is '回收箱状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_toner_status
  is '色带状态';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_ink_status
  is '墨水状态';
comment on column DEV_STATUS_TABLE_EXPAND.bcr_scanner_status
  is '二维码扫描仪的media状态';
comment on column DEV_STATUS_TABLE_EXPAND.nts_cache_count
  is '冠字号缓存记录数';
comment on column DEV_STATUS_TABLE_EXPAND.nts_last_build_time
  is 'Agent收到的最近一条冠字号报文的时间';

create table DEV_TYPE_TABLE
(
  no          VARCHAR(5) not null,
  name        VARCHAR(60) not null,
  dev_vendor  VARCHAR(5) not null,
  dev_catalog VARCHAR(5) not null,
  spec        VARCHAR(20),
  weight      VARCHAR(10),
  watt        VARCHAR(10),
  cash_type   VARCHAR(2),
   constraint PK_DEV_TYPE_TABLE primary key (NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_TYPE_TABLE
  is '设备型号表';
comment on column DEV_TYPE_TABLE.no
  is '编号';
comment on column DEV_TYPE_TABLE.name
  is '设备型号';
comment on column DEV_TYPE_TABLE.dev_vendor
  is '所属品牌 来自设备品牌表';
comment on column DEV_TYPE_TABLE.dev_catalog
  is '所属类型 来自设备类型表';
comment on column DEV_TYPE_TABLE.spec
  is '设备规格';
comment on column DEV_TYPE_TABLE.weight
  is '设备重量';
comment on column DEV_TYPE_TABLE.watt
  is '平均功率';
comment on column DEV_TYPE_TABLE.cash_type
  is '非现金标志 1、现金；2、非现金';

create table DEV_VENDOR_TABLE
(
  no       VARCHAR(5) not null,
  name     VARCHAR(80) not null,
  address  VARCHAR(80),
  hotline1 VARCHAR(20),
  status   VARCHAR(2),
   constraint PK_DEV_VENDOR_TABLE primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_VENDOR_TABLE
  is '设备品牌表';
comment on column DEV_VENDOR_TABLE.no
  is '编号';
comment on column DEV_VENDOR_TABLE.name
  is '品牌名称';
comment on column DEV_VENDOR_TABLE.address
  is '生产商地址';
comment on column DEV_VENDOR_TABLE.hotline1
  is '生产商热线';
comment on column DEV_VENDOR_TABLE.status
  is '生产商状态1 –设备供应 2 –设备服役 3 –设备退役';

/*==============================================================*/
/* Table: DEV_WORK_TIME_TABLE                                   */
/*==============================================================*/
create table DEV_WORK_TIME_TABLE 
(
   LOGIC_ID             VARCHAR(36)         not null,
   DEV_NO               VARCHAR(20)         not null,
   DATES_TYPE           VARCHAR(20)         not null,
   DATES_TYPE_STATEMENT VARCHAR(80),
   DATES                VARCHAR(8),
   Businessflag         VARCHAR(1),
   START_TIME           VARCHAR(24),
   END_TIME             VARCHAR(24),
   constraint PK_DEV_WORK_TIME_TABLE primary key (LOGIC_ID)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_WORK_TIME_TABLE is
'设备工作时间表';

comment on column DEV_WORK_TIME_TABLE.LOGIC_ID is
'编号（UUID）';

comment on column DEV_WORK_TIME_TABLE.DEV_NO is
'设备号';

comment on column DEV_WORK_TIME_TABLE.DATES_TYPE is
'日期类型
Special
Monday
Tuesday
Wednesday
Thursday
Friday
Staturday
Sunday';

comment on column DEV_WORK_TIME_TABLE.DATES_TYPE_STATEMENT is
'日期类型说明
Special – 特殊日期（需要特别指定工作日的，包括假日）
Monday 星期一
Tuesday 星期二
Wednesday 星期三
Thursday 星期四
Friday 星期五
Staturday 星期六
Sunday 星期天';

comment on column DEV_WORK_TIME_TABLE.DATES is
'如果为空，则为日期类型为周末或者工作日';

comment on column DEV_WORK_TIME_TABLE.Businessflag is
'是否营业标志 Y:营业 N:不营业';

comment on column DEV_WORK_TIME_TABLE.START_TIME is
'工作开始时间,以|分割，精确到分，最多五个时间点';

comment on column DEV_WORK_TIME_TABLE.END_TIME is
'工作结束时间，以|分割，精确到分，最多五个时间点';

/*==============================================================*/
/* Table: ORG_WORK_TIME_TABLE                                   */
/*==============================================================*/
create table ORG_WORK_TIME_TABLE 
(
   LOGIC_ID             VARCHAR(36)         not null,
   org_no               VARCHAR(20)         not null,
   DATES_TYPE           VARCHAR(20)         not null,
   DATES_TYPE_STATEMENT VARCHAR(80),
   DATES                VARCHAR(8),
   Businessflag         VARCHAR(1),
   START_TIME           VARCHAR(24),
   END_TIME             VARCHAR(24),
   constraint PK_ORG_WORK_TIME_TABLE primary key (LOGIC_ID)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table ORG_WORK_TIME_TABLE is
'设备工作时间表';

comment on column ORG_WORK_TIME_TABLE.LOGIC_ID is
'编号（UUID）';

comment on column ORG_WORK_TIME_TABLE.org_no is
'机构号';

comment on column ORG_WORK_TIME_TABLE.DATES_TYPE is
'日期类型
Special
Monday
Tuesday
Wednesday
Thursday
Friday
Staturday
Sunday';

comment on column ORG_WORK_TIME_TABLE.DATES_TYPE_STATEMENT is
'日期类型说明
Special – 特殊日期（需要特别指定工作日的，包括假日）
Monday 星期一
Tuesday 星期二
Wednesday 星期三
Thursday 星期四
Friday 星期五
Staturday 星期六
Sunday 星期天';

comment on column ORG_WORK_TIME_TABLE.DATES is
'如果为空，则为日期类型为周末或者工作日';

comment on column ORG_WORK_TIME_TABLE.Businessflag is
'是否营业标志 Y:营业 N:不营业';

comment on column ORG_WORK_TIME_TABLE.START_TIME is
'工作开始时间,以|分割，精确到分，最多五个时间点';

comment on column ORG_WORK_TIME_TABLE.END_TIME is
'工作结束时间，以|分割，精确到分，最多五个时间点';


create table FAULT_CODE
(
  code        VARCHAR(10) not null,
  fault_level NUMERIC(30) not null,
  description VARCHAR(100) not null,
  solution    VARCHAR(100),
   constraint PK_FAULT_CODE primary key (CODE)
          )in ZHYGSPACE index in ZHYGIDX;
comment on table FAULT_CODE
  is '故障代码表';
comment on column FAULT_CODE.code
  is '故障简码';
comment on column FAULT_CODE.fault_level
  is '故障级别';
comment on column FAULT_CODE.description
  is '故障描述';
comment on column FAULT_CODE.solution
  is '解决办法';

create table FAULT_CODE_USED
(
  code        VARCHAR(30) not null,
  fault_level NUMERIC(30) not null,
  description VARCHAR(1024),
  solution    VARCHAR(1024),
  filter_flag CHAR(1),
  note1       VARCHAR(100),
  note2       VARCHAR(100),
   constraint PK_FAULT_CODE_USED primary key (CODE)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table FAULT_CODE_USED
  is '已使用故障码表 ';
comment on column FAULT_CODE_USED.code
  is '故障码';
comment on column FAULT_CODE_USED.fault_level
  is '故障级别';
comment on column FAULT_CODE_USED.description
  is '故障描述';
comment on column FAULT_CODE_USED.solution
  is '解决方法';
comment on column FAULT_CODE_USED.filter_flag
  is '过滤标志';
comment on column FAULT_CODE_USED.note1
  is '备注1';
comment on column FAULT_CODE_USED.note2
  is '备注2';

create table FAULT_FILTER
(
  logic_id      VARCHAR(36) not null,
  fault_code    VARCHAR(20) not null,
  dev_type_name VARCHAR(60),
  dev_type      NUMERIC(30),
  dev_no        VARCHAR(20),
  filter_by     CHAR(1) not null,
  filter_flag   CHAR(1) default '0' not null,
  op_no         VARCHAR(20),
  op_time       VARCHAR(20),
   constraint PK_FAULT_FILTER primary key (LOGIC_ID)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table FAULT_FILTER
  is '故障过滤表';
comment on column FAULT_FILTER.logic_id
  is '编号（UUID）';
comment on column FAULT_FILTER.fault_code
  is '故障代码';
comment on column FAULT_FILTER.dev_type_name
  is '设备类型名';
comment on column FAULT_FILTER.dev_type
  is '设备类型';
comment on column FAULT_FILTER.dev_no
  is '设备号';
comment on column FAULT_FILTER.filter_by
  is '过滤范围（0 全部(all)  ；1 按机型(dev_type) ；2 按设备号(dev_no)）';
comment on column FAULT_FILTER.filter_flag
  is '过滤方式（0:按错误码 ;1：按模块）';
comment on column FAULT_FILTER.op_no
  is 'OP_NO';
comment on column FAULT_FILTER.op_time
  is 'OP_TIME';

create table FAULT_TABLE
(
  fault_no    VARCHAR(36) not null,
  dev_no      VARCHAR(20) not null,
  dev_module  VARCHAR(10) not null,
  fault_level NUMERIC(30) not null,
  fault_code  VARCHAR(20),
  vendor_code VARCHAR(2048),
  fault_time  VARCHAR(20) not null,
  description VARCHAR(500),
  solution    VARCHAR(500),
   constraint PK_FAULT_TABLE primary key (FAULT_NO)       
)
partition by range (FAULT_TIME)
(
PART FAULT_TABLE_PARTMIN STARTING MINVALUE,
PART FAULT_TABLE_PART164 STARTING ('2020-01-01 00:00:00') ENDING ('2020-12-31 23:59:59'),
PART FAULT_TABLE_PART174 STARTING ('2021-01-01 00:00:00') ENDING ('2021-12-31 23:59:59'),
PART FAULT_TABLE_PARTMAX ENDING MAXVALUE
)in ZHYGSPACE INDEX IN ZHYGIDX;
comment on table FAULT_TABLE
  is '故障表';
comment on column FAULT_TABLE.fault_no
  is '故障号';
comment on column FAULT_TABLE.dev_no
  is '设备号';
comment on column FAULT_TABLE.dev_module
  is '设备模块';
comment on column FAULT_TABLE.fault_level
  is '故障级别';
comment on column FAULT_TABLE.fault_code
  is '故障代码';
comment on column FAULT_TABLE.vendor_code
  is '厂商故障码';
comment on column FAULT_TABLE.fault_time
  is '故障时间（YYYY-MM-DD HH:mm24:ss）';
comment on column FAULT_TABLE.description
  is '故障描述';
comment on column FAULT_TABLE.solution
  is '解决方法';


create table MOD_CATALOG_TABLE
(
  no   VARCHAR(5) not null,
  name VARCHAR(50) not null,
   constraint PK_MOD_CATALOG_TABLE primary key (NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table MOD_CATALOG_TABLE
  is '模块分类表';
comment on column MOD_CATALOG_TABLE.no
  is '编号';
comment on column MOD_CATALOG_TABLE.name
  is '模块名称';


create table REMOTE_TRACE
(
  logic_id       VARCHAR(36) not null,
  command_id     VARCHAR(10) not null,
  dev_no         VARCHAR(20) not null,
  op_no          VARCHAR(20) not null,
  op_time        VARCHAR(20) not null,
  status         VARCHAR(50) not null,
  content        VARCHAR(800) not null,
  check_type     VARCHAR(2),
  cache_falg     VARCHAR(2),
  count_all_flag VARCHAR(2),
  cashunit_count NUMERIC(30),
  cashunit_list  VARCHAR(100),
   constraint PK_REMOTE_TRACE primary key (LOGIC_ID)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table REMOTE_TRACE
  is '远程控制结果记录表 ';
comment on column REMOTE_TRACE.logic_id
  is '编号';
comment on column REMOTE_TRACE.command_id
  is '命令ID';
comment on column REMOTE_TRACE.dev_no
  is '设备号';
comment on column REMOTE_TRACE.op_no
  is '操作员编号';
comment on column REMOTE_TRACE.op_time
  is '操作时间';
comment on column REMOTE_TRACE.status
  is '操作状态';
comment on column REMOTE_TRACE.content
  is '操作内容';
comment on column REMOTE_TRACE.check_type
  is '精查方式，0-立即执行（默认），1-定时执行';
comment on column REMOTE_TRACE.cache_falg
  is '是否需要C端进行缓存处理';
comment on column REMOTE_TRACE.count_all_flag
  is '是否精查所有钞箱';
comment on column REMOTE_TRACE.cashunit_count
  is '需要精查的钞箱数目';
comment on column REMOTE_TRACE.cashunit_list
  is '逻辑钞箱索引号列表';

create table REMOTE_FILE_DOWN_INFO
(
  logic_id           VARCHAR(36) not null,
  trace_logic_id     VARCHAR(36) not null,
  remote_file        VARCHAR(800) not null,
  local_file         VARCHAR(800) not null,
  remote_handle_file VARCHAR(800),
  progress           NUMERIC(20,2) not null,
   constraint PK_REMOTE_FILE_DOWN_INFO primary key (LOGIC_ID)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table REMOTE_FILE_DOWN_INFO
  is '文件下载信息表';
comment on column REMOTE_FILE_DOWN_INFO.logic_id
  is '编号';
comment on column REMOTE_FILE_DOWN_INFO.trace_logic_id
  is '远程控制结果编号';
comment on column REMOTE_FILE_DOWN_INFO.remote_file
  is '远程文件路径及文件名';
comment on column REMOTE_FILE_DOWN_INFO.local_file
  is '本地文件路径及文件名';
comment on column REMOTE_FILE_DOWN_INFO.remote_handle_file
  is '处理后的远程文件路径及文件名（压缩下载）';
comment on column REMOTE_FILE_DOWN_INFO.progress
  is '文件下载进度';

create table RPT_OPEN_RATE_DEV_DATE
(
  dev_no               VARCHAR(20) not null,
  date_time            VARCHAR(10) not null,
  full_fun_time        NUMERIC(20,2),
  full_rate            NUMERIC(20,2),
  half_fun_time        NUMERIC(20,2),
  half_rate            NUMERIC(20,2),
  hard_fault_time      NUMERIC(20,2),
  soft_fault_time      NUMERIC(20,2),
  maintenance_time     NUMERIC(20,2),
  comm_failure_time    NUMERIC(20,2),
  close_time           NUMERIC(20,2),
  other_reason_time    NUMERIC(20,2),
  work_time            NUMERIC(20,2),
  perfect_rate         NUMERIC(20,2),
  service_rate         NUMERIC(20,2),
  comm_rate            NUMERIC(20,2),
  stop_time            NUMERIC(20,2),
  vcomm_failure_time   NUMERIC(20,2),
  suspected_crash_time NUMERIC(20,2),
   constraint PK_RPT_OPEN_RATE_DEV_DATE primary key (dev_no,date_time)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_OPEN_RATE_DEV_DATE
  is '开机率统计表（每台每天）';
comment on column RPT_OPEN_RATE_DEV_DATE.dev_no
  is '设备号';
comment on column RPT_OPEN_RATE_DEV_DATE.date_time
  is '日期 yyyyMMdd';
comment on column RPT_OPEN_RATE_DEV_DATE.full_fun_time
  is '全功能开机时间';
comment on column RPT_OPEN_RATE_DEV_DATE.full_rate
  is '全功能开机率';
comment on column RPT_OPEN_RATE_DEV_DATE.half_fun_time
  is '半功能开机时间';
comment on column RPT_OPEN_RATE_DEV_DATE.half_rate
  is '半功能开机率';
comment on column RPT_OPEN_RATE_DEV_DATE.hard_fault_time
  is '硬故障停机时间';
comment on column RPT_OPEN_RATE_DEV_DATE.soft_fault_time
  is '软故障停机时间';
comment on column RPT_OPEN_RATE_DEV_DATE.maintenance_time
  is '维护时间';
comment on column RPT_OPEN_RATE_DEV_DATE.comm_failure_time
  is 'P通讯中断时间';
comment on column RPT_OPEN_RATE_DEV_DATE.close_time
  is '关机时间';
comment on column RPT_OPEN_RATE_DEV_DATE.other_reason_time
  is '其他原因时间';
comment on column RPT_OPEN_RATE_DEV_DATE.work_time
  is '规定工作时间';
comment on column RPT_OPEN_RATE_DEV_DATE.perfect_rate
  is '设备完好率(未使用）';
comment on column RPT_OPEN_RATE_DEV_DATE.service_rate
  is '正常服务率（未使用）';
comment on column RPT_OPEN_RATE_DEV_DATE.comm_rate
  is '通讯完好率（未使用）';
comment on column RPT_OPEN_RATE_DEV_DATE.stop_time
  is '停机时间';
comment on column RPT_OPEN_RATE_DEV_DATE.vcomm_failure_time
  is 'V通讯故障时间';
comment on column RPT_OPEN_RATE_DEV_DATE.suspected_crash_time
  is '疑似死机时间';

create table RPT_OPEN_RATE_DEV_MONTH
(
  dev_no               VARCHAR(20) not null,
  date_time            VARCHAR(10) not null,
  full_fun_time        NUMERIC(20,2),
  full_rate            NUMERIC(20,2),
  half_fun_time        NUMERIC(20,2),
  half_rate            NUMERIC(20,2),
  hard_fault_time      NUMERIC(20,2),
  soft_fault_time      NUMERIC(20,2),
  maintenance_time     NUMERIC(20,2),
  comm_failure_time    NUMERIC(20,2),
  close_time           NUMERIC(20,2),
  other_reason_time    NUMERIC(20,2),
  work_time            NUMERIC(20,2),
  perfect_rate         NUMERIC(20,2),
  service_rate         NUMERIC(20,2),
  comm_rate            NUMERIC(20,2),
  stop_time            NUMERIC(20,2),
  vcomm_failure_time   NUMERIC(20,2),
  suspected_crash_time NUMERIC(20,2),
   constraint PK_RPT_OPEN_RATE_DEV_MONTH primary key (dev_no,date_time)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_OPEN_RATE_DEV_MONTH
  is '开机率统计表（每台每月）';
comment on column RPT_OPEN_RATE_DEV_MONTH.dev_no
  is '设备号';
comment on column RPT_OPEN_RATE_DEV_MONTH.date_time
  is '日期 yyyyMM';
comment on column RPT_OPEN_RATE_DEV_MONTH.full_fun_time
  is '全功能开机时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.full_rate
  is '全功能开机率';
comment on column RPT_OPEN_RATE_DEV_MONTH.half_fun_time
  is '半功能开机时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.half_rate
  is '半功能开机率';
comment on column RPT_OPEN_RATE_DEV_MONTH.hard_fault_time
  is '硬故障停机时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.soft_fault_time
  is '软故障停机时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.maintenance_time
  is '维护时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.comm_failure_time
  is 'P通讯中断时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.close_time
  is '关机时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.other_reason_time
  is '其他原因时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.work_time
  is '规定工作时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.perfect_rate
  is '设备完好率(未使用）';
comment on column RPT_OPEN_RATE_DEV_MONTH.service_rate
  is '正常服务率（未使用）';
comment on column RPT_OPEN_RATE_DEV_MONTH.comm_rate
  is '通讯完好率（未使用）';
comment on column RPT_OPEN_RATE_DEV_MONTH.stop_time
  is '停机时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.vcomm_failure_time
  is 'V通讯故障时间';
comment on column RPT_OPEN_RATE_DEV_MONTH.suspected_crash_time
  is '疑似死机时间';

create table RPT_OPEN_RATE_DEV_YEAR
(
  dev_no               VARCHAR(20) not null,
  date_time            VARCHAR(10) not null,
  full_fun_time        NUMERIC(20,2),
  full_rate            NUMERIC(20,2),
  half_fun_time        NUMERIC(20,2),
  half_rate            NUMERIC(20,2),
  hard_fault_time      NUMERIC(20,2),
  soft_fault_time      NUMERIC(20,2),
  maintenance_time     NUMERIC(20,2),
  comm_failure_time    NUMERIC(20,2),
  close_time           NUMERIC(20,2),
  other_reason_time    NUMERIC(20,2),
  work_time            NUMERIC(20,2),
  perfect_rate         NUMERIC(20,2),
  service_rate         NUMERIC(20,2),
  comm_rate            NUMERIC(20,2),
  stop_time            NUMERIC(20,2),
  vcomm_failure_time   NUMERIC(20,2),
  suspected_crash_time NUMERIC(20,2),
   constraint PK_RPT_OPEN_RATE_DEV_YEAR primary key (dev_no,date_time)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_OPEN_RATE_DEV_YEAR
  is '开机率统计表（每台每年）';
comment on column RPT_OPEN_RATE_DEV_YEAR.dev_no
  is '设备号';
comment on column RPT_OPEN_RATE_DEV_YEAR.date_time
  is '日期 yyyy';
comment on column RPT_OPEN_RATE_DEV_YEAR.full_fun_time
  is '全功能开机时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.full_rate
  is '全功能开机率';
comment on column RPT_OPEN_RATE_DEV_YEAR.half_fun_time
  is '半功能开机时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.half_rate
  is '半功能开机率';
comment on column RPT_OPEN_RATE_DEV_YEAR.hard_fault_time
  is '硬故障停机时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.soft_fault_time
  is '软故障停机时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.maintenance_time
  is '维护时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.comm_failure_time
  is 'P通讯中断时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.close_time
  is '关机时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.other_reason_time
  is '其他原因时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.work_time
  is '规定工作时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.perfect_rate
  is '设备完好率(未使用）';
comment on column RPT_OPEN_RATE_DEV_YEAR.service_rate
  is '正常服务率（未使用）';
comment on column RPT_OPEN_RATE_DEV_YEAR.comm_rate
  is '通讯完好率（未使用）';
comment on column RPT_OPEN_RATE_DEV_YEAR.stop_time
  is '停机时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.vcomm_failure_time
  is 'V通讯故障时间';
comment on column RPT_OPEN_RATE_DEV_YEAR.suspected_crash_time
  is '疑似死机时间';


create table RPT_BATCH_TASK
(
  logicid  VARCHAR(40) not null,
  tasktype VARCHAR(2) not null,
  task_year     VARCHAR(4),
  task_month    VARCHAR(2),
  task_day      VARCHAR(2),
  task_hour     VARCHAR(2),
  addtime  VARCHAR(20),
  taskflag CHAR(1) not null,
  TAKEFLAG  CHAR(1),
  TAKETIME  VARCHAR(20),
  SYNCOUNT  INTEGER,
  FINISHTIME  VARCHAR(20),
   constraint PK_RPT_BATCH_TASK primary key (logicid)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_BATCH_TASK
  is '标杆信息同步任务表';
comment on column RPT_BATCH_TASK.tasktype
  is '任务类型（1:每台每小时各交易类型交易统计2:每台每天各交易类型交易统计3:每台每天交易统计4:网点每天交易统计5:网点每月交易统计6:网点每年交易统计）';
comment on column RPT_BATCH_TASK.addtime
  is '添加时间YYYY-MM-DD hh:mm:ss';
comment on column RPT_BATCH_TASK.taskflag
  is '任务标志 0：未完成 1：已成功 2：已结束（未成功）';
comment on column RPT_BATCH_TASK.TAKEFLAG
  is '加载标志 默认为0,0：未加载,1：已加载';
comment on column RPT_BATCH_TASK.TAKETIME
  is 'YYYY-MM-DD hh:mm:ss';
comment on column RPT_BATCH_TASK.SYNCOUNT
  is '默认0';
comment on column RPT_BATCH_TASK.FINISHTIME
  is 'YYYY-MM-DD hh:mm:ss';
comment on column RPT_BATCH_TASK.task_year
  is '交易年份';
comment on column RPT_BATCH_TASK.task_month
  is '交易月份';
comment on column RPT_BATCH_TASK.task_day
  is '交易日';
comment on column RPT_BATCH_TASK.task_hour
  is '交易小时，00~23';

create table RPT_TRANS_DEV_HOUR_TYPE
(
  dev_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_hour     VARCHAR(2) not null,
  trans_type     VARCHAR(20) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
  trans_month    VARCHAR(2),
  trans_day      VARCHAR(2),
  org_no         VARCHAR(20),
   constraint PK_RPT_TRANS_DEV_HOUR_TYPE primary key (DEV_NO, DATE_TIME,trans_hour, TRANS_TYPE)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_DEV_HOUR_TYPE
  is '交易统计表（每台每小时各交易类型）';
comment on column RPT_TRANS_DEV_HOUR_TYPE.dev_no
  is '设备号';
comment on column RPT_TRANS_DEV_HOUR_TYPE.date_time
  is '交易时间yyyyMMdd';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_hour
  is '交易小时，00~23';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_type
  is '交易类型';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_amount
  is '交易金额';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_count
  is '交易总数';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_year
  is '交易年份';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_month
  is '交易月份';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_day
  is '交易日';
comment on column RPT_TRANS_DEV_HOUR_TYPE.org_no
  is '机构号';

create table RPT_TRANS_DEV_DAY_TYPE_CFLAG
(
  dev_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_type     VARCHAR(20) not null,
  cardflag     VARCHAR(3) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
  trans_month    VARCHAR(2),
  trans_day      VARCHAR(2),
  org_no         VARCHAR(20),
   constraint PK_TRANS_DEV_DAY_TYPE_CFLAG primary key (DEV_NO, DATE_TIME, TRANS_TYPE,cardflag)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_DEV_DAY_TYPE_CFLAG
  is '交易统计表（每台每天各交易类型各卡种）';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.dev_no
  is '设备号';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.date_time
  is '交易时间yyyyMMdd';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_type
  is '交易类型';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.cardflag
  is '卡种';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_amount
  is '交易金额';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_count
  is '交易总数';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_year
  is '交易年份';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_month
  is '交易月份';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_day
  is '交易日';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.org_no
  is '机构号';
  
create table RPT_TRANS_DEV_DAY_TYPE
(
  dev_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_type     VARCHAR(20) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
  trans_month    VARCHAR(2),
  trans_day      VARCHAR(2),
  org_no         VARCHAR(20),
   constraint PK_RPT_TRANS_DEV_DAY_TYPE primary key (DEV_NO, DATE_TIME, TRANS_TYPE)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_DEV_DAY_TYPE
  is '交易统计表（每台每天各交易类型）';
comment on column RPT_TRANS_DEV_DAY_TYPE.dev_no
  is '设备号';
comment on column RPT_TRANS_DEV_DAY_TYPE.date_time
  is '交易时间yyyyMMdd';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_type
  is '交易类型';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_amount
  is '交易金额';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_count
  is '交易总数';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_year
  is '交易年份';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_month
  is '交易月份';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_day
  is '交易日';
comment on column RPT_TRANS_DEV_DAY_TYPE.org_no
  is '机构号';

create table RPT_TRANS_DEV_DAY
(
  dev_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
  trans_month    VARCHAR(2),
  trans_day      VARCHAR(2),
  org_no         VARCHAR(20),
   constraint PK_RPT_TRANS_DEV_DAY primary key (DEV_NO, DATE_TIME)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_DEV_DAY
  is '交易统计表（每台每天）';
comment on column RPT_TRANS_DEV_DAY.dev_no
  is '设备号';
comment on column RPT_TRANS_DEV_DAY.date_time
  is '交易时间yyyyMMdd';
comment on column RPT_TRANS_DEV_DAY.trans_amount
  is '交易金额';
comment on column RPT_TRANS_DEV_DAY.trans_count
  is '交易总数';
comment on column RPT_TRANS_DEV_DAY.trans_year
  is '交易年份';
comment on column RPT_TRANS_DEV_DAY.trans_month
  is '交易月份';
comment on column RPT_TRANS_DEV_DAY.trans_day
  is '交易日';
comment on column RPT_TRANS_DEV_DAY.org_no
  is '机构号';

create table RPT_TRANS_ORG_DAY
(
  org_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
  trans_month    VARCHAR(2),
  trans_day      VARCHAR(2),
   constraint PK_RPT_TRANS_ORG_DAY primary key (org_no, DATE_TIME)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_ORG_DAY
  is '交易统计表（机构每天）';
comment on column RPT_TRANS_ORG_DAY.date_time
  is '交易时间yyyyMMdd';
comment on column RPT_TRANS_ORG_DAY.trans_amount
  is '交易金额';
comment on column RPT_TRANS_ORG_DAY.trans_count
  is '交易总数';
comment on column RPT_TRANS_ORG_DAY.trans_year
  is '交易年份';
comment on column RPT_TRANS_ORG_DAY.trans_month
  is '交易月份';
comment on column RPT_TRANS_ORG_DAY.trans_day
  is '交易日';
comment on column RPT_TRANS_ORG_DAY.org_no
  is '机构号';
  
create table RPT_TRANS_ORG_MONTH
(
  org_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
  trans_month    VARCHAR(2),
   constraint PK_RPT_TRANS_ORG_MONTH primary key (org_no, DATE_TIME)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_ORG_MONTH
  is '交易统计表（机构每月）';
comment on column RPT_TRANS_ORG_MONTH.date_time
  is '交易时间yyyyMM';
comment on column RPT_TRANS_ORG_MONTH.trans_amount
  is '交易金额';
comment on column RPT_TRANS_ORG_MONTH.trans_count
  is '交易总数';
comment on column RPT_TRANS_ORG_MONTH.trans_year
  is '交易年份';
comment on column RPT_TRANS_ORG_MONTH.trans_month
  is '交易月份';
comment on column RPT_TRANS_ORG_MONTH.org_no
  is '机构号';
  
create table RPT_TRANS_ORG_YEAR
(
  org_no         VARCHAR(20) not null,
  date_time      VARCHAR(10) not null,
  trans_amount   NUMERIC(20,2),
  trans_count    NUMERIC(30),
  trans_year     VARCHAR(4),
   constraint PK_RPT_TRANS_ORG_YEAR primary key (org_no, DATE_TIME)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_TRANS_ORG_YEAR
  is '交易统计表（机构每天）';
comment on column RPT_TRANS_ORG_YEAR.date_time
  is '交易时间yyyy';
comment on column RPT_TRANS_ORG_YEAR.trans_amount
  is '交易金额';
comment on column RPT_TRANS_ORG_YEAR.trans_count
  is '交易总数';
comment on column RPT_TRANS_ORG_YEAR.trans_year
  is '交易年份';
comment on column RPT_TRANS_ORG_YEAR.org_no
  is '机构号';
  
/*==============================================================*/
/* Table: RPT_FAULT_DEV_DATE                                  */
/*==============================================================*/
create table RPT_FAULT_DEV_DATE 
(
   DEV_NO               VARCHAR(20)          not null,
   DATE_TIME            VARCHAR(10)          not null,
   FAULT_TIMES          NUMERIC(20),
   IDC_FAULT_TIMES      NUMERIC(20),
   PIN_FAULT_TIMES      NUMERIC(20),
   CDM_FAULT_TIMES      NUMERIC(20),
   CIM_FAULT_TIMES      NUMERIC(20),
   JPR_FAULT_TIMES      NUMERIC(20),
   RPR_FAULT_TIMES      NUMERIC(20),
   SIU_FAULT_TIMES      NUMERIC(20),
   DEP_FAULT_TIMES      NUMERIC(20),
   UPS_FAULT_TIMES      NUMERIC(20),
   SPR_FAULT_TIMES      NUMERIC(20),
   CHK_FAULT_TIMES      NUMERIC(20),
   TTU_FAULT_TIMES      NUMERIC(20),
   PBK_FAULT_TIMES      NUMERIC(20),
   CAM_FAULT_TIMES      NUMERIC(20),
   FAULT_TIME           NUMERIC(20),
   IDC_FAULT_TIME       NUMERIC(20),
   PIN_FAULT_TIME       NUMERIC(20),
   CDM_FAULT_TIME       NUMERIC(20),
   CIM_FAULT_TIME       NUMERIC(20),
   JPR_FAULT_TIME       NUMERIC(20),
   RPR_FAULT_TIME       NUMERIC(20),
   SIU_FAULT_TIME       NUMERIC(20),
   DEP_FAULT_TIME       NUMERIC(20),
   UPS_FAULT_TIME       NUMERIC(20),
   SPR_FAULT_TIME       NUMERIC(20),
   CHK_FAULT_TIME       NUMERIC(20),
   TTU_FAULT_TIME       NUMERIC(20),
   PBK_FAULT_TIME       NUMERIC(20),
   CAM_FAULT_TIME       NUMERIC(20),
   constraint PK_RPT_FAULT_DEV_DATE primary key (DEV_NO,DATE_TIME)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_FAULT_DEV_DATE is
'故障统计表（每台每天）';

comment on column RPT_FAULT_DEV_DATE.DEV_NO is
'设备号';

comment on column RPT_FAULT_DEV_DATE.DATE_TIME is
'日期yyyyMMdd';

comment on column RPT_FAULT_DEV_DATE.FAULT_TIMES is
'故障次数';

comment on column RPT_FAULT_DEV_DATE.IDC_FAULT_TIMES is
'读卡器故障次数';

comment on column RPT_FAULT_DEV_DATE.PIN_FAULT_TIMES is
'密码键盘故障次数';

comment on column RPT_FAULT_DEV_DATE.CDM_FAULT_TIMES is
'取款模块故障次数';

comment on column RPT_FAULT_DEV_DATE.CIM_FAULT_TIMES is
'存款模块故障次数';

comment on column RPT_FAULT_DEV_DATE.JPR_FAULT_TIMES is
'日志打印机故障次数';

comment on column RPT_FAULT_DEV_DATE.RPR_FAULT_TIMES is
'凭票打印机故障次数';

comment on column RPT_FAULT_DEV_DATE.SIU_FAULT_TIMES is
'传感器故障次数';

comment on column RPT_FAULT_DEV_DATE.DEP_FAULT_TIMES is
'信封故障次数';

comment on column RPT_FAULT_DEV_DATE.UPS_FAULT_TIMES is
'不间断电源故障次数';

comment on column RPT_FAULT_DEV_DATE.SPR_FAULT_TIMES is
'结单打印故障次数';

comment on column RPT_FAULT_DEV_DATE.CHK_FAULT_TIMES is
'支票读扫描故障次数';

comment on column RPT_FAULT_DEV_DATE.TTU_FAULT_TIMES is
'文本终端单元故障次数';

comment on column RPT_FAULT_DEV_DATE.PBK_FAULT_TIMES is
'存在打印故障模块';

comment on column RPT_FAULT_DEV_DATE.CAM_FAULT_TIMES is
'照相机故障次数';

comment on column RPT_FAULT_DEV_DATE.FAULT_TIME is
'故障总时长';

comment on column RPT_FAULT_DEV_DATE.IDC_FAULT_TIME is
'读卡器故障总时间';

comment on column RPT_FAULT_DEV_DATE.PIN_FAULT_TIME is
'密码键盘故障总时间';

comment on column RPT_FAULT_DEV_DATE.CDM_FAULT_TIME is
'取款模块故障总时间';

comment on column RPT_FAULT_DEV_DATE.CIM_FAULT_TIME is
'存款模块故障总时间';

comment on column RPT_FAULT_DEV_DATE.JPR_FAULT_TIME is
'日志打印机故障总时间';

comment on column RPT_FAULT_DEV_DATE.RPR_FAULT_TIME is
'凭票打印机故障总时间';

comment on column RPT_FAULT_DEV_DATE.SIU_FAULT_TIME is
'传感器故障总时间';

comment on column RPT_FAULT_DEV_DATE.DEP_FAULT_TIME is
'信封故障总时间';

comment on column RPT_FAULT_DEV_DATE.UPS_FAULT_TIME is
'不间断电源故障总时间';

comment on column RPT_FAULT_DEV_DATE.SPR_FAULT_TIME is
'结单打印故障总时间';

comment on column RPT_FAULT_DEV_DATE.CHK_FAULT_TIME is
'支票读扫描故障总时间';

comment on column RPT_FAULT_DEV_DATE.TTU_FAULT_TIME is
'文本终端单元故障总时间';

comment on column RPT_FAULT_DEV_DATE.PBK_FAULT_TIME is
'存在打印故障模块总时间';

comment on column RPT_FAULT_DEV_DATE.CAM_FAULT_TIME is
'照相机故障总时间';

/*==============================================================*/
/* Table: RPT_FAULT_DEV_MONTH                                 */
/*==============================================================*/
create table RPT_FAULT_DEV_MONTH 
(
   DEV_NO               VARCHAR(20)          not null,
   DATE_TIME            VARCHAR(10)          not null,
   FAULT_TIMES          NUMERIC(20),
   IDC_FAULT_TIMES      NUMERIC(20),
   PIN_FAULT_TIMES      NUMERIC(20),
   CDM_FAULT_TIMES      NUMERIC(20),
   CIM_FAULT_TIMES      NUMERIC(20),
   JPR_FAULT_TIMES      NUMERIC(20),
   RPR_FAULT_TIMES      NUMERIC(20),
   SIU_FAULT_TIMES      NUMERIC(20),
   DEP_FAULT_TIMES      NUMERIC(20),
   UPS_FAULT_TIMES      NUMERIC(20),
   SPR_FAULT_TIMES      NUMERIC(20),
   CHK_FAULT_TIMES      NUMERIC(20),
   TTU_FAULT_TIMES      NUMERIC(20),
   PBK_FAULT_TIMES      NUMERIC(20),
   CAM_FAULT_TIMES      NUMERIC(20),
   FAULT_TIME           NUMERIC(20),
   IDC_FAULT_TIME       NUMERIC(20),
   PIN_FAULT_TIME       NUMERIC(20),
   CDM_FAULT_TIME       NUMERIC(20),
   CIM_FAULT_TIME       NUMERIC(20),
   JPR_FAULT_TIME       NUMERIC(20),
   RPR_FAULT_TIME       NUMERIC(20),
   SIU_FAULT_TIME       NUMERIC(20),
   DEP_FAULT_TIME       NUMERIC(20),
   UPS_FAULT_TIME       NUMERIC(20),
   SPR_FAULT_TIME       NUMERIC(20),
   CHK_FAULT_TIME       NUMERIC(20),
   TTU_FAULT_TIME       NUMERIC(20),
   PBK_FAULT_TIME       NUMERIC(20),
   CAM_FAULT_TIME       NUMERIC(20),
   constraint PK_RPT_FAULT_DEV_MONTH primary key (DEV_NO,DATE_TIME)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_FAULT_DEV_MONTH is
'故障统计表（每台每月）';

comment on column RPT_FAULT_DEV_MONTH.DEV_NO is
'设备号';

comment on column RPT_FAULT_DEV_MONTH.DATE_TIME is
'日期yyyyMM';

comment on column RPT_FAULT_DEV_MONTH.FAULT_TIMES is
'故障次数';

comment on column RPT_FAULT_DEV_MONTH.IDC_FAULT_TIMES is
'读卡器故障次数';

comment on column RPT_FAULT_DEV_MONTH.PIN_FAULT_TIMES is
'密码键盘故障次数';

comment on column RPT_FAULT_DEV_MONTH.CDM_FAULT_TIMES is
'取款模块故障次数';

comment on column RPT_FAULT_DEV_MONTH.CIM_FAULT_TIMES is
'存款模块故障次数';

comment on column RPT_FAULT_DEV_MONTH.JPR_FAULT_TIMES is
'日志打印机故障次数';

comment on column RPT_FAULT_DEV_MONTH.RPR_FAULT_TIMES is
'凭票打印机故障次数';

comment on column RPT_FAULT_DEV_MONTH.SIU_FAULT_TIMES is
'传感器故障次数';

comment on column RPT_FAULT_DEV_MONTH.DEP_FAULT_TIMES is
'信封故障次数';

comment on column RPT_FAULT_DEV_MONTH.UPS_FAULT_TIMES is
'不间断电源故障次数';

comment on column RPT_FAULT_DEV_MONTH.SPR_FAULT_TIMES is
'结单打印故障次数';

comment on column RPT_FAULT_DEV_MONTH.CHK_FAULT_TIMES is
'支票读扫描故障次数';

comment on column RPT_FAULT_DEV_MONTH.TTU_FAULT_TIMES is
'文本终端单元故障次数';

comment on column RPT_FAULT_DEV_MONTH.PBK_FAULT_TIMES is
'存在打印故障模块';

comment on column RPT_FAULT_DEV_MONTH.CAM_FAULT_TIMES is
'照相机故障次数';

comment on column RPT_FAULT_DEV_MONTH.FAULT_TIME is
'故障总时长';

comment on column RPT_FAULT_DEV_MONTH.IDC_FAULT_TIME is
'读卡器故障总时间';

comment on column RPT_FAULT_DEV_MONTH.PIN_FAULT_TIME is
'密码键盘故障总时间';

comment on column RPT_FAULT_DEV_MONTH.CDM_FAULT_TIME is
'取款模块故障总时间';

comment on column RPT_FAULT_DEV_MONTH.CIM_FAULT_TIME is
'存款模块故障总时间';

comment on column RPT_FAULT_DEV_MONTH.JPR_FAULT_TIME is
'日志打印机故障总时间';

comment on column RPT_FAULT_DEV_MONTH.RPR_FAULT_TIME is
'凭票打印机故障总时间';

comment on column RPT_FAULT_DEV_MONTH.SIU_FAULT_TIME is
'传感器故障总时间';

comment on column RPT_FAULT_DEV_MONTH.DEP_FAULT_TIME is
'信封故障总时间';

comment on column RPT_FAULT_DEV_MONTH.UPS_FAULT_TIME is
'不间断电源故障总时间';

comment on column RPT_FAULT_DEV_MONTH.SPR_FAULT_TIME is
'结单打印故障总时间';

comment on column RPT_FAULT_DEV_MONTH.CHK_FAULT_TIME is
'支票读扫描故障总时间';

comment on column RPT_FAULT_DEV_MONTH.TTU_FAULT_TIME is
'文本终端单元故障总时间';

comment on column RPT_FAULT_DEV_MONTH.PBK_FAULT_TIME is
'存在打印故障模块总时间';

comment on column RPT_FAULT_DEV_MONTH.CAM_FAULT_TIME is
'照相机故障总时间';

/*==============================================================*/
/* Table: RPT_FAULT_DEV_YEAR                                  */
/*==============================================================*/
create table RPT_FAULT_DEV_YEAR 
(
   DEV_NO               VARCHAR(20)          not null,
   DATE_TIME            VARCHAR(10)          not null,
   FAULT_TIMES          NUMERIC(20),
   IDC_FAULT_TIMES      NUMERIC(20),
   PIN_FAULT_TIMES      NUMERIC(20),
   CDM_FAULT_TIMES      NUMERIC(20),
   CIM_FAULT_TIMES      NUMERIC(20),
   JPR_FAULT_TIMES      NUMERIC(20),
   RPR_FAULT_TIMES      NUMERIC(20),
   SIU_FAULT_TIMES      NUMERIC(20),
   DEP_FAULT_TIMES      NUMERIC(20),
   UPS_FAULT_TIMES      NUMERIC(20),
   SPR_FAULT_TIMES      NUMERIC(20),
   CHK_FAULT_TIMES      NUMERIC(20),
   TTU_FAULT_TIMES      NUMERIC(20),
   PBK_FAULT_TIMES      NUMERIC(20),
   CAM_FAULT_TIMES      NUMERIC(20),
   FAULT_TIME           NUMERIC(20),
   IDC_FAULT_TIME       NUMERIC(20),
   PIN_FAULT_TIME       NUMERIC(20),
   CDM_FAULT_TIME       NUMERIC(20),
   CIM_FAULT_TIME       NUMERIC(20),
   JPR_FAULT_TIME       NUMERIC(20),
   RPR_FAULT_TIME       NUMERIC(20),
   SIU_FAULT_TIME       NUMERIC(20),
   DEP_FAULT_TIME       NUMERIC(20),
   UPS_FAULT_TIME       NUMERIC(20),
   SPR_FAULT_TIME       NUMERIC(20),
   CHK_FAULT_TIME       NUMERIC(20),
   TTU_FAULT_TIME       NUMERIC(20),
   PBK_FAULT_TIME       NUMERIC(20),
   CAM_FAULT_TIME       NUMERIC(20),
   constraint PK_RPT_FAULT_DEV_YEAR primary key (DEV_NO,DATE_TIME)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_FAULT_DEV_YEAR is
'故障统计表（每台每年）';

comment on column RPT_FAULT_DEV_YEAR.DEV_NO is
'设备号';

comment on column RPT_FAULT_DEV_YEAR.DATE_TIME is
'日期yyyy';

comment on column RPT_FAULT_DEV_YEAR.FAULT_TIMES is
'故障次数';

comment on column RPT_FAULT_DEV_YEAR.IDC_FAULT_TIMES is
'读卡器故障次数';

comment on column RPT_FAULT_DEV_YEAR.PIN_FAULT_TIMES is
'密码键盘故障次数';

comment on column RPT_FAULT_DEV_YEAR.CDM_FAULT_TIMES is
'取款模块故障次数';

comment on column RPT_FAULT_DEV_YEAR.CIM_FAULT_TIMES is
'存款模块故障次数';

comment on column RPT_FAULT_DEV_YEAR.JPR_FAULT_TIMES is
'日志打印机故障次数';

comment on column RPT_FAULT_DEV_YEAR.RPR_FAULT_TIMES is
'凭票打印机故障次数';

comment on column RPT_FAULT_DEV_YEAR.SIU_FAULT_TIMES is
'传感器故障次数';

comment on column RPT_FAULT_DEV_YEAR.DEP_FAULT_TIMES is
'信封故障次数';

comment on column RPT_FAULT_DEV_YEAR.UPS_FAULT_TIMES is
'不间断电源故障次数';

comment on column RPT_FAULT_DEV_YEAR.SPR_FAULT_TIMES is
'结单打印故障次数';

comment on column RPT_FAULT_DEV_YEAR.CHK_FAULT_TIMES is
'支票读扫描故障次数';

comment on column RPT_FAULT_DEV_YEAR.TTU_FAULT_TIMES is
'文本终端单元故障次数';

comment on column RPT_FAULT_DEV_YEAR.PBK_FAULT_TIMES is
'存在打印故障模块';

comment on column RPT_FAULT_DEV_YEAR.CAM_FAULT_TIMES is
'照相机故障次数';

comment on column RPT_FAULT_DEV_YEAR.FAULT_TIME is
'故障总时长';

comment on column RPT_FAULT_DEV_YEAR.IDC_FAULT_TIME is
'读卡器故障总时间';

comment on column RPT_FAULT_DEV_YEAR.PIN_FAULT_TIME is
'密码键盘故障总时间';

comment on column RPT_FAULT_DEV_YEAR.CDM_FAULT_TIME is
'取款模块故障总时间';

comment on column RPT_FAULT_DEV_YEAR.CIM_FAULT_TIME is
'存款模块故障总时间';

comment on column RPT_FAULT_DEV_YEAR.JPR_FAULT_TIME is
'日志打印机故障总时间';

comment on column RPT_FAULT_DEV_YEAR.RPR_FAULT_TIME is
'凭票打印机故障总时间';

comment on column RPT_FAULT_DEV_YEAR.SIU_FAULT_TIME is
'传感器故障总时间';

comment on column RPT_FAULT_DEV_YEAR.DEP_FAULT_TIME is
'信封故障总时间';

comment on column RPT_FAULT_DEV_YEAR.UPS_FAULT_TIME is
'不间断电源故障总时间';

comment on column RPT_FAULT_DEV_YEAR.SPR_FAULT_TIME is
'结单打印故障总时间';

comment on column RPT_FAULT_DEV_YEAR.CHK_FAULT_TIME is
'支票读扫描故障总时间';

comment on column RPT_FAULT_DEV_YEAR.TTU_FAULT_TIME is
'文本终端单元故障总时间';

comment on column RPT_FAULT_DEV_YEAR.PBK_FAULT_TIME is
'存在打印故障模块总时间';

comment on column RPT_FAULT_DEV_YEAR.CAM_FAULT_TIME is
'照相机故障总时间';

create table RUN_STATUS_TABLE
(
  logic_id    VARCHAR(36) not null,
  dev_no      VARCHAR(20) not null,
  date_time   VARCHAR(20) not null,
  run_status  VARCHAR(2),
  action_note VARCHAR(2),
   constraint PK_RUN_STATUS_TABLE primary key (LOGIC_ID)         
)
partition by range (DATE_TIME)
(
PART RUN_STATUS_TABLE_PARTMIN STARTING MINVALUE,
PART SHORTEN_TABLE_PART20 STARTING ('2020-01-01 00:00:00') ENDING ('2020-12-31 23:59:59'),
PART SHORTEN_TABLE_PART21 STARTING ('2021-01-01 00:00:00') ENDING ('2021-12-31 23:59:59'),
PART SHORTEN_TABLE_PARTMAX ENDING MAXVALUE
)in ZHYGSPACE index in ZHYGIDX;
comment on table RUN_STATUS_TABLE
  is '运行状态记录表';
comment on column RUN_STATUS_TABLE.logic_id
  is '编号';
comment on column RUN_STATUS_TABLE.dev_no
  is '设备号';
comment on column RUN_STATUS_TABLE.date_time
  is '状态改变时间';
comment on column RUN_STATUS_TABLE.run_status
  is '运行状态';
comment on column RUN_STATUS_TABLE.action_note
  is '运行子状态';

  
  create table SYS_MENU
(
  no          VARCHAR(5) not null,
  name        VARCHAR(40) not null,
  note        VARCHAR(30),
  BG_COLOR        VARCHAR(20),
  TILE_IMAGE        VARCHAR(100),
  LINK        VARCHAR(100),
  ICON        VARCHAR(100),
  MENU_ORDER     NUMERIC(5),
   constraint PK_SYS_MENU primary key (NO)        
)in ZHYGSPACE index in ZHYGIDX;
comment on table SYS_MENU
  is '菜单表';
comment on column SYS_MENU.no
  is '编号';
comment on column SYS_MENU.name
  is '顺序';
comment on column SYS_MENU.note
  is '备注';
comment on column SYS_MENU.BG_COLOR
  is '背景颜色';
comment on column SYS_MENU.TILE_IMAGE
  is '图片';
comment on column SYS_MENU.LINK
  is '链接';
comment on column SYS_MENU.ICON
  is '图标名称';
comment on column SYS_MENU.MENU_ORDER
  is '顺序编号，从1开始';


create table SYS_BUTTON
(
  no           VARCHAR(20) not null,
  name         VARCHAR(40),
  menu         VARCHAR(5),
  note         VARCHAR(30),
  button_order VARCHAR(5),
  url          VARCHAR(10),
  AUDIT_FLAG  VARCHAR(1) not null,
   constraint PK_SYS_BUTTON primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_BUTTON
  is '按钮表';
comment on column SYS_BUTTON.no
  is '编号';
comment on column SYS_BUTTON.name
  is '名称';
comment on column SYS_BUTTON.menu
  is '所属菜单';
comment on column SYS_BUTTON.note
  is '备注';
comment on column SYS_BUTTON.AUDIT_FLAG
  is '是否开启审核 Y:审核 N:不审核';
alter table SYS_BUTTON
  add constraint FK_BUTTON_R_MENU foreign key (MENU)
  references SYS_MENU (NO)
  on delete restrict on update restrict;

create table SYS_JOB
(
  job       VARCHAR(100) not null,
  date_time VARCHAR(10) not null,
  status    NUMERIC(30),
  note      VARCHAR(200),
   constraint PK_SYS_JOB primary key (JOB, DATE_TIME)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_JOB
  is '定时任务执行结果表';
comment on column SYS_JOB.job
  is '任务编号';
comment on column SYS_JOB.date_time
  is '执行时间';
comment on column SYS_JOB.status
  is '0：失败；1：成功';
comment on column SYS_JOB.note
  is '备注';


create table SYS_ORG_TYPE
(
  no    VARCHAR(40) not null,
  type  VARCHAR(50) not null,
  grade VARCHAR(2) not null,
   constraint PK_SYS_ORG_TYPE primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_ORG_TYPE
  is '机构类型表';
comment on column SYS_ORG_TYPE.no
  is '机构类型编号';
comment on column SYS_ORG_TYPE.type
  is '机构类型';
comment on column SYS_ORG_TYPE.grade
  is '机构级别';

create table SYS_ORG
(
  no                  VARCHAR(20) not null,
  name                VARCHAR(160) not null,
  parent_org          VARCHAR(20),
  left_no                NUMERIC(30),
  right_no               NUMERIC(30),
  org_type            VARCHAR(40),
  moneyorg_flag       VARCHAR(1),
  x                   VARCHAR(20),
  y                   VARCHAR(20),
  address             VARCHAR(200),
  linkman             VARCHAR(30),
  telephone           VARCHAR(30),
  mobile              VARCHAR(30),
  fax                 VARCHAR(30),
  email               VARCHAR(40),
  business_range      VARCHAR(256),
  cup_area_code       VARCHAR(8),
  address_code        VARCHAR(15),
  AREA_NO_PROVINCE             VARCHAR(10),
  AREA_NO_CITY             VARCHAR(10),
  AREA_NO_COUNTY             VARCHAR(10),
  area_type           VARCHAR(3),
  org_physics_catalog VARCHAR(3),
  note                VARCHAR(100),
  IS_SELFHELP   NUMERIC(5,0),
  IS_BANKOUTLET  NUMERIC(5,0),
  AREA_NO    Varchar(10),
  ORG_STATUS   NUMERIC(5,0),
   constraint PK_SYS_ORG primary key (NO)
          )
in ZHYGSPACE index in ZHYGIDX;
comment on table SYS_ORG
  is '组织机构表';
comment on column SYS_ORG.no
  is '机构编号';
comment on column SYS_ORG.name
  is '机构名称';
comment on column SYS_ORG.parent_org
  is '直接上级';
comment on column SYS_ORG.left_no
  is '预排序左序号';
comment on column SYS_ORG.right_no
  is '预排序右序号';
comment on column SYS_ORG.org_type
  is '机构类型）';
comment on column SYS_ORG.moneyorg_flag
  is '是否是加钞机构（1：是 2：否）';
comment on column SYS_ORG.x
  is '横坐标（经度）';
comment on column SYS_ORG.y
  is '纵坐标（纬度）';
comment on column SYS_ORG.address
  is '地址';
comment on column SYS_ORG.linkman
  is '联系人';
comment on column SYS_ORG.telephone
  is '电话';
comment on column SYS_ORG.mobile
  is '手机';
comment on column SYS_ORG.fax
  is '传真';
comment on column SYS_ORG.email
  is '电子邮件';
comment on column SYS_ORG.business_range
  is '业务范围';
comment on column SYS_ORG.cup_area_code
  is '银联标准地区代码';
comment on column SYS_ORG.address_code
  is '地点代码';
comment on column SYS_ORG.AREA_NO_PROVINCE
  is '所属省级区域编码';
comment on column SYS_ORG.AREA_NO_CITY
  is '所属地市级区域编码';
comment on column SYS_ORG.AREA_NO_COUNTY
  is '所属县级区域编码';
comment on column SYS_ORG.area_type
  is '所处区域类型（1、中央商务区 2、市级商业中心 3、政府机关集中区 4、工业园区 5、区县商业中心 6、休闲购物娱乐区 7、工作区 8、居住区）';
comment on column SYS_ORG.org_physics_catalog
  is '物理网点类型（1、全面商务型网点 2、全面社区型网点 3、基本商务型网点 4、基本社区型网点 5、财富中心）';
comment on column SYS_ORG.note
  is '备注';
comment on column SYS_ORG.IS_SELFHELP
  is '是否是自助银行 1：是 0：不是';
comment on column SYS_ORG.IS_BANKOUTLET
  is '是否是网点  1：是 0：不是';
comment on column SYS_ORG.AREA_NO
  is '区域编码';
comment on column SYS_ORG.ORG_STATUS
  is '机构状态';
alter table SYS_ORG
  add constraint FK_SYS_ORG_R_PARENT_ORG foreign key (PARENT_ORG)
  references SYS_ORG (NO);
alter table SYS_ORG
  add constraint FK_SYS_ORG_R_TYPE foreign key (ORG_TYPE)
  references SYS_ORG_TYPE (NO);


create table SYS_ROLE
(
  no       VARCHAR(50) not null,
  name     VARCHAR(50) not null,
  org_type VARCHAR(50),
  note     VARCHAR(200),
   constraint PK_SYS_ROLE primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_ROLE
  is '角色表';
comment on column SYS_ROLE.no
  is '角色编号';
comment on column SYS_ROLE.name
  is '角色名称';
comment on column SYS_ROLE.org_type
  is '角色所属机构类型';
comment on column SYS_ROLE.note
  is '备注';

create table SYS_ROLE_BUTTON
(
  role_no   VARCHAR(50) not null,
  button_no VARCHAR(20) not null,
   constraint PK_SYS_ROLE_BUTTON primary key (ROLE_NO, BUTTON_NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_ROLE_BUTTON
  is '角色按钮权限表 ';
comment on column SYS_ROLE_BUTTON.role_no
  is '角色编号';
comment on column SYS_ROLE_BUTTON.button_no
  is '按钮编号';
alter table SYS_ROLE_BUTTON
  add constraint FK_ROLE_BUTTON_R_BUTTON foreign key (BUTTON_NO)
  references SYS_BUTTON (NO)
  on delete restrict on update restrict;
alter table SYS_ROLE_BUTTON
  add constraint FK_ROLE_BUTTON_R_ROLE foreign key (ROLE_NO)
  references SYS_ROLE (NO)
  on delete restrict on update restrict;

create table SYS_ROLE_MENU
(
  role_no VARCHAR(50) not null,
  menu_no VARCHAR(5) not null,
   constraint PK_SYS_ROLE_MENU primary key (ROLE_NO, MENU_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_ROLE_MENU
  is '角色菜单权限表 ';
comment on column SYS_ROLE_MENU.role_no
  is '角色编号';
comment on column SYS_ROLE_MENU.menu_no
  is '菜单编号';
alter table SYS_ROLE_MENU
  add constraint FK_ROLE_MENU_R_MENU foreign key (MENU_NO)
  references SYS_MENU (NO)
  on delete restrict on update restrict;
alter table SYS_ROLE_MENU
  add constraint FK_ROLE_MENU_R_ROLE foreign key (ROLE_NO)
  references SYS_ROLE (NO)
  on delete restrict on update restrict;


create table TRANS_VALUE_ITEM
(
  no   VARCHAR(10) not null,
  name VARCHAR(20) not null,
  type INTEGER default 0 not null,
   constraint PK_TRANS_VALUE_ITEM primary key (NO)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table TRANS_VALUE_ITEM
  is '交易价值指标';
comment on column TRANS_VALUE_ITEM.no
  is '编号';
comment on column TRANS_VALUE_ITEM.name
  is '指标名称';
comment on column TRANS_VALUE_ITEM.type
  is '0表示静态指标，1表示动态指标';

create table TRANS_INFO
(
  transserialnum          VARCHAR(20) not null,
  transtime               VARCHAR(14) not null,
  devno                   VARCHAR(20) not null,
  transtype               VARCHAR(10) not null,
  transamount             NUMERIC(30),
  transcurrent            VARCHAR(3),
  cardno                  VARCHAR(25),
  cardtype                VARCHAR(2),
  payintoaccount          VARCHAR(20),
  payintoaccounttype      VARCHAR(2),
  hostserialno            VARCHAR(12),
  additionalinf           VARCHAR(20),
  retcode                 VARCHAR(6),
  transstatus             VARCHAR(4),
  cardflag                NUMERIC(30),
  original_local_serialno VARCHAR(6),
  charge                  VARCHAR(12),
  examine_teller_no       VARCHAR(10),
  ushield_certificate_no  VARCHAR(50),
  token_no                VARCHAR(50),
  card_business_type      VARCHAR(10),
  signing_info            VARCHAR(20),
  hostinfo                VARCHAR(200),
  cost_time               NUMERIC,
   constraint PK_TRANS_INFO primary key (TRANSSERIALNUM, TRANSTIME, DEVNO)        
 )
partition by range (TRANSTIME)
(
PART TRANS_INFO_PARTMIN STARTING MINVALUE,
PART TRANS_INFO_PART2012 STARTING ('20200101000000') ENDING ('20201231235959'),
PART TRANS_INFO_PART2112 STARTING ('20210101000000') ENDING ('20211231235959'),
PART TRANS_INFO_PARTMAX ENDING MAXVALUE
) in ZHYGSPACE index in ZHYGIDX;
comment on table TRANS_INFO
  is '交易信息表';
comment on column TRANS_INFO.cost_time
  is '交易耗时';

create table TRANS_RET_CODE
(
  ret_code        VARCHAR(10) not null,
  detail_explain  VARCHAR(300) not null,
  briefly_explain VARCHAR(150),
  trans_status    CHAR(1),
   constraint PK_TRANS_RET_CODE primary key (RET_CODE)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table TRANS_RET_CODE
  is '本地错误码对照表';
comment on column TRANS_RET_CODE.ret_code
  is '本地拒绝码';
comment on column TRANS_RET_CODE.detail_explain
  is '说明';
comment on column TRANS_RET_CODE.briefly_explain
  is '简要说明';
comment on column TRANS_RET_CODE.trans_status
  is '1：成功；2：失败；3：超时';

create table TRANS_TYPE
(
  no                  VARCHAR(20) not null,
  name                VARCHAR(50),
  note                VARCHAR(80),
  accounts_check_flag NUMERIC(30) default 0,
  cashflag            NUMERIC(30),
  trans_value         INTEGER default 0 not null,
  CATEGORY            VARCHAR(2),
   constraint PK_TRANS_TYPE primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table TRANS_TYPE
  is '交易类型表';
comment on column TRANS_TYPE.no
  is '交易类型号';
comment on column TRANS_TYPE.name
  is '交易名称';
comment on column TRANS_TYPE.note
  is '备注说明';
comment on column TRANS_TYPE.accounts_check_flag
  is '对账标志';
comment on column TRANS_TYPE.cashflag
  is '现金标识 1:现金 0:非现金';
comment on column TRANS_TYPE.trans_value
  is '交易价值';
comment on column TRANS_TYPE.CATEGORY
  is '交易所属类别';


create table USR_MONITOR_SELECT
(
  user_no                VARCHAR(20) not null,
  monitor_type           VARCHAR(2) not null,
  org_no                 VARCHAR(20) not null,
  monitor_status         VARCHAR(30) not null,
  sort                   VARCHAR(2) not null,
  dev_no                 VARCHAR(20),
  dev_catalog            VARCHAR(5) not null,
  dev_vendor             VARCHAR(5) not null,
  dev_work_type          NUMERIC(30) not null,
  dev_away_flag          NUMERIC(30) not null,
  dev_atmc               VARCHAR(50) not null,
  dev_os                 VARCHAR(50) not null,
  care_level             CHAR(1),
  dev_location           VARCHAR(10),
  monitor_interval       VARCHAR(3),
  row_select             VARCHAR(200),
  row_unselect           VARCHAR(200),
  note                   VARCHAR(10),
  group_method           NUMERIC(30),
  status_relationship    NUMERIC(30),
  monitor_status_type    NUMERIC(30),
  defined_monitor_status VARCHAR(30),
  dev_cash_flag          VARCHAR(10),
   constraint PK_USR_MONITOR_SELECT primary key (USER_NO, MONITOR_TYPE)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table USR_MONITOR_SELECT
  is '远程监控条件表';
comment on column USR_MONITOR_SELECT.user_no
  is '人员编号';
comment on column USR_MONITOR_SELECT.monitor_type
  is '监控类型';
comment on column USR_MONITOR_SELECT.org_no
  is '选择监控机构';
comment on column USR_MONITOR_SELECT.monitor_status
  is '8位—运行状态
5位－模块状态
5位－钞箱状态
5位－网络状态';
comment on column USR_MONITOR_SELECT.sort
  is '0－升序
 1－降序';
comment on column USR_MONITOR_SELECT.dev_no
  is '机构号查询条件，单条件模糊查询，可以多条件查询(条件为设备号,设备号,...),有个数限制';
comment on column USR_MONITOR_SELECT.dev_catalog
  is '0－全部';
comment on column USR_MONITOR_SELECT.dev_vendor
  is '0－全部';
comment on column USR_MONITOR_SELECT.dev_work_type
  is '0－全部';
comment on column USR_MONITOR_SELECT.dev_away_flag
  is '0－全部';
comment on column USR_MONITOR_SELECT.dev_atmc
  is '0－全部';
comment on column USR_MONITOR_SELECT.dev_os
  is '0－全部';
comment on column USR_MONITOR_SELECT.care_level
  is '1-重点2-中等3-一般';
comment on column USR_MONITOR_SELECT.dev_location
  is '设备位置';
comment on column USR_MONITOR_SELECT.monitor_interval
  is '刷新频率';
comment on column USR_MONITOR_SELECT.row_select
  is '显示的列';
comment on column USR_MONITOR_SELECT.row_unselect
  is '不显示的列';
comment on column USR_MONITOR_SELECT.note
  is '|分割现在存放0全部1现金2非现金设备';
comment on column USR_MONITOR_SELECT.group_method
  is '分组方式';
comment on column USR_MONITOR_SELECT.status_relationship
  is '运行状态、模块状态、钞箱状态、网络状态之间的关系  0-全部满足 1-满足其一';
comment on column USR_MONITOR_SELECT.monitor_status_type
  is '监控状态类型 0-自定义模式 1-标准模式';
comment on column USR_MONITOR_SELECT.defined_monitor_status
  is '自定义监控状态 前0-8位为监控状态9-17位为不监控状态';
comment on column USR_MONITOR_SELECT.dev_cash_flag
  is 'DEV_CASH_FLAG';


--DB_LOCKS表结构
CREATE TABLE DB_LOCKS (
  LOCKNAME  VARCHAR(40) not null,
  TAKEFLAG   VARCHAR(1) default 0,
  TAKEUPTIME TIMESTAMP,
  TAKEUSER   VARCHAR(60),
   constraint PK_DB_LOCKS primary key (LOCKNAME)
         )in ZHYGSPACE index in ZHYGIDX;

comment on column DB_LOCKS.LOCKNAME
  is '锁名';
comment on column DB_LOCKS.TAKEFLAG
  is '0：未占用；1：占用';
comment on column DB_LOCKS.TAKEUPTIME
  is '占用时间';
comment on column DB_LOCKS.TAKEUSER
  is '占用者';

--DB_SERVERS_STATE表结构
CREATE TABLE DB_SERVERS_STATE
  (
    SERVERNAME     VARCHAR(200) NOT NULL,
    LASTCHECKINTIME INT NOT NULL,
    CHECKININTERVAL INT NOT NULL,
    SERVERIP       VARCHAR(30) not null,
    SERVERSTATE     VARCHAR(2) NOT NULL,
   constraint PK_DB_SERVERS_STATE primary key (SERVERNAME,SERVERIP)
         )in ZHYGSPACE index in ZHYGIDX;

comment on column DB_SERVERS_STATE.SERVERNAME
  is '服务器名';
comment on column DB_SERVERS_STATE.LASTCHECKINTIME
  is '上一次检测时间';
comment on column DB_SERVERS_STATE.CHECKININTERVAL
  is '检测时间间隔';
comment on column DB_SERVERS_STATE.SERVERIP
  is '服务器IP';
comment on column DB_SERVERS_STATE.SERVERSTATE
  is '服务器状态：1:正常；-1：异常';

create table SYS_LOG
(
  user_no VARCHAR(20) not null,
  operate_time    VARCHAR(20) not null,
  MENU_NO VARCHAR(100) not null,
  BTN_NO VARCHAR(30) not null,
  no      VARCHAR(20) not null,
  Current_detail   blob,
  Before_detail  blob,
  note      VARCHAR(100),
   constraint PK_SYS_LOG primary key (NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_LOG
  is '操作日志';
comment on column SYS_LOG.user_no
  is '操作用户';
comment on column SYS_LOG.operate_time
  is '操作时间 YYYY-MM-DD hh:mi:ss';
comment on column SYS_LOG.MENU_NO
  is '功能模块编号 同SYS_OPERATE.MENU_NO';
comment on column SYS_LOG.BTN_NO
  is '操作编号 同SYS_OPERATE.BTN_NO';
comment on column SYS_LOG.no
  is '记录编号 yyyymmddhhmissSSS';
comment on column SYS_LOG.Current_detail
  is '操作后详细数据';
comment on column SYS_LOG.Before_detail
  is '操作前详细数据';
comment on column SYS_LOG.note
  is '备注';

create table SYS_OPERATE
(
  MENU_NO   VARCHAR(100) not null,
  BTN_NO        VARCHAR(30) not null,
  MENU_NAME VARCHAR(60) not null,
  BTN_NAME  VARCHAR(30) not null,
   constraint PK_SYS_OPERATE primary key (MENU_NO,BTN_NO)
          )in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_OPERATE
  is '操作表';
comment on column SYS_OPERATE.menu_name
  is '功能模块名称';
comment on column SYS_OPERATE.btn_name
  is '操作名称';
comment on column SYS_OPERATE.BTN_NO
  is '操作编号 方法名';
comment on column SYS_OPERATE.MENU_NO
  is '功能模块编号 类名';


/*==============================================================*/
/* Table: SHORTEN_TABLE                                         */
/*==============================================================*/
create table SHORTEN_TABLE 
(
   LOGIC_ID             VARCHAR(36)          not null,
   DEV_NO               VARCHAR(20)          not null,
   LACK_TYPE            INTEGER              not null,
   LACK_DATE            VARCHAR(10)          not null,
   LACK_TIME            VARCHAR(10)          not null,
   PERIOD               VARCHAR(10),
   UNLACK_DATE          VARCHAR(10),
   UNLACK_TIME          VARCHAR(10),
   STATUS               VARCHAR(1),
   constraint PK_SHORTEN_TABLE primary key (LOGIC_ID)       
   )
PARTITION BY RANGE (LACK_DATE) (
PART SHORTEN_TABLE_PARTMIN STARTING MINVALUE,
PART SHORTEN_TABLE_PART2012 STARTING ('2020-01-01') ENDING ('2020-12-31'),
PART SHORTEN_TABLE_PART2112 STARTING ('2021-01-01') ENDING ('2021-12-31'),
PART SHORTEN_TABLE_PARTMAX ENDING MAXVALUE 
)in ZHYGSPACE index in ZHYGIDX;

comment on table SHORTEN_TABLE is
'缺钞缺纸流水表';

comment on column SHORTEN_TABLE.LOGIC_ID is
'编号';

comment on column SHORTEN_TABLE.DEV_NO is
'设备号';

comment on column SHORTEN_TABLE.LACK_TYPE is
'1 – 缺钞（少钞）
2 – 凭条打印机缺纸（少纸）
3 – 日志打印机缺纸（少纸）';

comment on column SHORTEN_TABLE.LACK_DATE is
'发生日期';

comment on column SHORTEN_TABLE.LACK_TIME is
'发生时间';

comment on column SHORTEN_TABLE.PERIOD is
'会计周期号';

comment on column SHORTEN_TABLE.UNLACK_DATE is
'结束日期';

comment on column SHORTEN_TABLE.UNLACK_TIME is
'结束时间';

comment on column SHORTEN_TABLE.STATUS is
'状态';


/*==============================================================*/
/* Table: CLEAR_TABLE                                           */
/*==============================================================*/
create table CLEAR_TABLE 
(
   LOGIC_ID             VARCHAR(36)          not null,
   DEV_NO               VARCHAR(20)          not null,
   CLEAR_TIME           TIMESTAMP            not null,
   DEPOSIT_COUNT        INTEGER,
   DEPOSIT_AMOUNT       NUMERIC(20,2),
   WITHDRAW_COUNT       INTEGER,
   WITHDRAW_AMOUNT      NUMERIC(20,2),
   TRANSFER_COUNT       INTEGER,
   TRANSFER_AMOUNT      NUMERIC(20,2),
   constraint PK_CLEAR_TABLE primary key (LOGIC_ID)        
)

PARTITION BY RANGE (CLEAR_TIME) (
STARTING MINVALUE,
STARTING FROM ('2020-01-01 00:00:00') INCLUSIVE ENDING AT ('2023-12-31 00:00:00') INCLUSIVE EVERY (3 MONTHS),
ENDING MAXVALUE
)index  in ZHYGIDX in ZHYGSPACE;

comment on table CLEAR_TABLE is
'清机报文表';

comment on column CLEAR_TABLE.LOGIC_ID is
'编号';

comment on column CLEAR_TABLE.DEV_NO is
'设备号';

comment on column CLEAR_TABLE.CLEAR_TIME is
'清机时间';

comment on column CLEAR_TABLE.DEPOSIT_COUNT is
'存款笔数';

comment on column CLEAR_TABLE.DEPOSIT_AMOUNT is
'存款金额';

comment on column CLEAR_TABLE.WITHDRAW_COUNT is
'取款笔数';

comment on column CLEAR_TABLE.WITHDRAW_AMOUNT is
'取款金额';

comment on column CLEAR_TABLE.TRANSFER_COUNT is
'转帐笔数';

comment on column CLEAR_TABLE.TRANSFER_AMOUNT is
'转帐金额';


/*==============================================================*/
/* Table: RETAIN_CARD_TRACE                                     */
/*==============================================================*/
create table RETAIN_CARD_TRACE 
(
   LOGIC_ID             VARCHAR(36)         not null,
   DEV_NO               VARCHAR(20)         not null,
   STATUS_CHANGE_DATE   VARCHAR(10)             not null,
   STATUS_CHANGE_TIME   VARCHAR(10)             not null,
   ACCOUNT              VARCHAR(25),
   STATUS               VARCHAR(2),
   NOTE                 VARCHAR(200),
   CARD_INFO_LOGIC_ID   VARCHAR(36)         not null,
   constraint PK_RETAIN_CARD_TRACE primary key (LOGIC_ID)
         )in ZHYGSPACE index in ZHYGIDX;

comment on table RETAIN_CARD_TRACE is
'吞卡处理过程表';

comment on column RETAIN_CARD_TRACE.LOGIC_ID is
'编号';

comment on column RETAIN_CARD_TRACE.DEV_NO is
'设备号';

comment on column RETAIN_CARD_TRACE.STATUS_CHANGE_DATE is
'状态改变日期';

comment on column RETAIN_CARD_TRACE.STATUS_CHANGE_TIME is
'状态改变时间';

comment on column RETAIN_CARD_TRACE.ACCOUNT is
'卡号';

comment on column RETAIN_CARD_TRACE.STATUS is
'0 留机
1 待领
3 已移交，待领
20 领取
21 销毁';

comment on column RETAIN_CARD_TRACE.NOTE is
'备注';

comment on column RETAIN_CARD_TRACE.CARD_INFO_LOGIC_ID is
'吞卡信息ID';


/*==============================================================*/
/* Table: DEV_CASH_CLEAR                                        */
/*==============================================================*/
create table DEV_CASH_CLEAR 
(
   DEV_NO               VARCHAR(20)          not null,
   ADDCASH_ID           CHAR(10)             not null,
   ADDCASH_DATETIME     CHAR(19),
   ADDCASH_AMOUNT       INTEGER,
   ADDCASH_TYPE         VARCHAR(60),
   ADDCASH_COUNT        VARCHAR(60),
   CLEAR_DATETIME       CHAR(19),
   ADDCASH_LEFT         INTEGER,
   ADDCASH_LASTAMOUNT   INTEGER,
   ADDCASH_RETRACTCOUNT INTEGER,
   DEPOSIT_COUNT        INTEGER,
   DEPOSIT_AMOUNT       INTEGER,
   WITHDRAW_COUNT       INTEGER,
   WITHDRAW_AMOUNT      INTEGER,
   CLEAR_ID             VARCHAR(30),
   CASHUTIL_AMOUNT      VARCHAR(100),
   CASHBY_HANDCOUNT     VARCHAR(100),
   ADD_ID               VARCHAR(30),
   ADD_CASH_METHOD		VARCHAR(2),
   constraint PK_DEV_CASH_CLEAR primary key (DEV_NO, ADDCASH_ID)
        )in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_CASH_CLEAR is
'设备清加钞信息表';

comment on column DEV_CASH_CLEAR.DEV_NO is
'设备号';

comment on column DEV_CASH_CLEAR.ADDCASH_ID is
'加钞标识（当前日期+编号，编号为两位，从00~99）';

comment on column DEV_CASH_CLEAR.ADDCASH_DATETIME is
'加钞时间';

comment on column DEV_CASH_CLEAR.ADDCASH_AMOUNT is
'加钞金额';

comment on column DEV_CASH_CLEAR.ADDCASH_TYPE is
'加钞面值集合 如50,100多种面值以逗号分割';

comment on column DEV_CASH_CLEAR.ADDCASH_COUNT is
'加钞张数 如 1000,2000 多种面值与AddCashType的面值对应，同样以逗号分割';

comment on column DEV_CASH_CLEAR.CLEAR_DATETIME is
'清机时间';

comment on column DEV_CASH_CLEAR.ADDCASH_LEFT is
'主机尾箱余额';

comment on column DEV_CASH_CLEAR.ADDCASH_LASTAMOUNT is
'钞箱剩余金额（不包括回收箱）';

comment on column DEV_CASH_CLEAR.ADDCASH_RETRACTCOUNT is
'回收箱张数';

comment on column DEV_CASH_CLEAR.DEPOSIT_COUNT is
'存款总笔数';

comment on column DEV_CASH_CLEAR.DEPOSIT_AMOUNT is
'存款总金额';

comment on column DEV_CASH_CLEAR.WITHDRAW_COUNT is
'取款总笔数';

comment on column DEV_CASH_CLEAR.WITHDRAW_AMOUNT is
'取款总金额';

comment on column DEV_CASH_CLEAR.CLEAR_ID is
'CLEAR_ID';

comment on column DEV_CASH_CLEAR.CASHUTIL_AMOUNT is
'CASHUTIL_AMOUNT';

comment on column DEV_CASH_CLEAR.CASHBY_HANDCOUNT is
'CASHBY_HANDCOUNT';

comment on column DEV_CASH_CLEAR.ADD_ID is
'ADD_ID';

comment on column DEV_CASH_CLEAR.ADD_CASH_METHOD is 
'加钞方式（0-本地加钞，1-联动加钞）';


/*==============================================================*/
/* Table: RUN_STATUS_DEV_TABLE                                  */
/*==============================================================*/
create table RUN_STATUS_DEV_TABLE
(
  DEV_NO     VARCHAR(20) not null,
  DATE_TIME  VARCHAR(20) not null,
  RUN_STATUS VARCHAR(2),
  STATUS_NO  VARCHAR(10),
  DATE_YMD   VARCHAR(10) not null,
   constraint PK_RUN_STATUS_DEV_TABLE primary key (DEV_NO, DATE_TIME)
       ) in ZHYGSPACE index in ZHYGIDX;
-- Add comments to the table 
comment on table RUN_STATUS_DEV_TABLE
  is '开机率报文设备运行状态表';
-- Add comments to the columns 
comment on column RUN_STATUS_DEV_TABLE.DEV_NO
  is '设备号';
comment on column RUN_STATUS_DEV_TABLE.DATE_TIME
  is '日期时间';
comment on column RUN_STATUS_DEV_TABLE.RUN_STATUS
  is '状态';
comment on column RUN_STATUS_DEV_TABLE.STATUS_NO
  is '状态序号';
comment on column RUN_STATUS_DEV_TABLE.DATE_YMD
  is '日期yyyy-MM-dd';

 
/*==============================================================*/
/* Table: DEV_STOP_TABLE                                        */
/*==============================================================*/
create table DEV_STOP_TABLE 
(
   LOGIC_ID             VARCHAR(36)          not null,
   DEV_NO               VARCHAR(20)          not null,
   SET_TIME             CHAR(19)             not null,
   STOPDEV_START_TIME   CHAR(16)             not null,
   STOPDEV_END_TIME     CHAR(16)             not null,
   STOPDEV_TYPE         INTEGER              not null,
   STOPDEV_REASON       VARCHAR(200)         not null,
   STATUS               INTEGER              not null,
   OP_NO                VARCHAR(20),
   ISAFTER              INTEGER              default 0 not null,
   constraint PK_DEV_STOP_TABLE primary key (LOGIC_ID)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table DEV_STOP_TABLE is
'设备停机表';

comment on column DEV_STOP_TABLE.LOGIC_ID is
'逻辑主键';

comment on column DEV_STOP_TABLE.DEV_NO is
'设备号';

comment on column DEV_STOP_TABLE.SET_TIME is
'设置停机时间';

comment on column DEV_STOP_TABLE.STOPDEV_START_TIME is
'停机开始时间(yyyy-mm-dd HH:MM）';

comment on column DEV_STOP_TABLE.STOPDEV_END_TIME is
'停机结束时间(YYYY-MM-DD HH:MM)';

comment on column DEV_STOP_TABLE.STOPDEV_TYPE is
'停机原因种类
(0:放假
1:装修
2:停电
3:设备故障未修复
4:其他
)';

comment on column DEV_STOP_TABLE.STOPDEV_REASON is
'停机原因';

comment on column DEV_STOP_TABLE.STATUS is
'停机状态
(0：停机未开始　
1：正在停机
2：停机结束
)';

comment on column DEV_STOP_TABLE.OP_NO is
'操作员';

comment on column DEV_STOP_TABLE.ISAFTER is
'事前或事后停机(0：事前停机  1：事后停机)';


create table NOTIFY_MODEL
(
  model_id    NUMERIC(30) not null,
  notify_type NUMERIC(30) not null,
  notify_way  NUMERIC(30) not null,
  model_by    NUMERIC(30) not null,
  info_set    VARCHAR(1024) not null
)
in ZHYGSPACE index in ZHYGIDX;
-- Add comments to the table 
comment on table NOTIFY_MODEL
  is 'CASE通知内容模板表';
-- Add comments to the columns 
comment on column NOTIFY_MODEL.model_id
  is '编号（UUID）';
comment on column NOTIFY_MODEL.notify_type
  is '通知类型
1CASE生成通知
2CASE升级通知
3CASE关闭通知
4CASE挂起通知';
comment on column NOTIFY_MODEL.notify_way
  is '通知方式（未使用）';
comment on column NOTIFY_MODEL.model_by
  is '模板来源（0：默认；1：定制）';
comment on column NOTIFY_MODEL.info_set
  is '短信格式';
-- Create/Recreate primary, unique and foreign key constraints 
alter table NOTIFY_MODEL
  add constraint PK_NOTIFY_MODEL primary key (MODEL_ID);
  


create table SERVICE_PROP_CONTENT
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_CONTENT
  is '内容管理服务配置项';
alter table SERVICE_PROP_CONTENT
  add constraint SERVICE_PROP_CONTENT_PK primary key (key_id);

create table SERVICE_PROP_CONTROL
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_CONTROL
  is '远程控制服务配置';
alter table SERVICE_PROP_CONTROL
  add constraint SERVICE_PROP_CONTROL_PK primary key (key_id);

create table SERVICE_PROP_DEVRMTSERVER
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_DEVRMTSERVER
  is '报文服务参数配置';
alter table SERVICE_PROP_DEVRMTSERVER
  add constraint SERVICE_PROP_DEVRMTSERVER_PK primary key (key_id);

create table SERVICE_PROP_RVCSERVER
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_RVCSERVER
  is '内容管理后台服务配置';
alter table SERVICE_PROP_RVCSERVER
  add constraint SERVICE_PROP_RVCSERVER_PK primary key (key_id);

create table SERVICE_PROP_MONITOR
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_MONITOR
  is '监控服务配置表';
alter table SERVICE_PROP_MONITOR
  add constraint SERVICE_PROP_MONITOR_PK primary key (key_id);


create table SERVICE_PROP_REPORTS
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_REPORTS
  is '报表服务配置表';
alter table SERVICE_PROP_REPORTS
  add constraint SERVICE_PROP_REPORTS_PK primary key (key_id);

create table SERVICE_PROP_SYSTEM
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_SYSTEM
  is '系统管理服务配置表';
alter table SERVICE_PROP_SYSTEM
  add constraint SERVICE_PROP_SYSTEM_PK primary key (key_id);

create table SERVICE_PROP_BUSINESS
(
  key_id   VARCHAR(30) not null,
  value VARCHAR(100),
  note VARCHAR(500)
);
comment on table SERVICE_PROP_BUSINESS
  is '监控服务配置表';
alter table SERVICE_PROP_BUSINESS
  add constraint SERVICE_PROP_BUSINESS_PK primary key (key_id);


create table SYS_BULLETIN_INFO 
(
   BULLETIN_ID          VARCHAR(36)         not null,
   TITLE                VARCHAR(300)        not null,
   CONTENT              VARCHAR(900)        not null,
   RELEASE_DATE         VARCHAR(10)         not null,
   EXPIRE_DATE          VARCHAR(10)         not null,
   PUBLISHER            VARCHAR(30)         not null,
   ATTACHMENT1          VARCHAR(100),
   ATTACHMENT2          VARCHAR(100),
   ATTACHMENT3          VARCHAR(100),
   constraint PK_SYS_BULLETIN_INFO primary key (BULLETIN_ID)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_BULLETIN_INFO is
'系统公告表';

comment on column SYS_BULLETIN_INFO.BULLETIN_ID is
'公告编号';

comment on column SYS_BULLETIN_INFO.TITLE is
'公告主题';

comment on column SYS_BULLETIN_INFO.CONTENT is
'公告内容';

comment on column SYS_BULLETIN_INFO.RELEASE_DATE is
'公告发布日期';

comment on column SYS_BULLETIN_INFO.EXPIRE_DATE is
'公告截止日期';

comment on column SYS_BULLETIN_INFO.PUBLISHER is
'发布人';

comment on column SYS_BULLETIN_INFO.ATTACHMENT1 is
'系统公告附件路径1';

comment on column SYS_BULLETIN_INFO.ATTACHMENT2 is
'系统公告附件路径2';

comment on column SYS_BULLETIN_INFO.ATTACHMENT3 is
'系统公告附件路径3';


create table RETAIN_CARD_TABLE 
(
   LOGIC_ID             VARCHAR(36)         not null,
   DEV_NO               VARCHAR(20)         not null,
   RETAIN_DATE          VARCHAR(10)             not null,
   RETAIN_TIME          VARCHAR(10)             not null,
   ACCOUNT              VARCHAR(25)         not null,
   REASON               VARCHAR(200),
   PERIOD               VARCHAR(10),
   CARD_STUCK_ORG       VARCHAR(20),
   CARD_HANDLE_ORG      VARCHAR(20),
   AUTO_FLAG            CHAR(1)              default '1',
   CHECK_OP             VARCHAR(20),
   CHECK_DATE           VARCHAR(10),
   CHECK_TIME           VARCHAR(10),
   OP_NO                VARCHAR(20),
   OP_DATE              VARCHAR(10),
   OP_TIME              VARCHAR(10),
   OP_ADDRESS           VARCHAR(200),
   ACCOUNT_NAME         VARCHAR(20),
   ACCOUNT_ID           VARCHAR(20),
   ACCOUNT_PHONE        VARCHAR(15),
   CERT_TYPE            VARCHAR(2),
   TYPE_FLAG            VARCHAR(1)          default '0' not null,
   STATUS               VARCHAR(2)           not null,
   CARD_RETAIN_TYPE		VARCHAR(1),
   constraint PK_RETAIN_CARD_TABLE primary key (LOGIC_ID)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table RETAIN_CARD_TABLE is
'吞卡信息表';

comment on column RETAIN_CARD_TABLE.LOGIC_ID is
'编号';

comment on column RETAIN_CARD_TABLE.DEV_NO is
'设备号';

comment on column RETAIN_CARD_TABLE.RETAIN_DATE is
'吞卡日期';

comment on column RETAIN_CARD_TABLE.RETAIN_TIME is
'吞卡时间';

comment on column RETAIN_CARD_TABLE.ACCOUNT is
'卡号';

comment on column RETAIN_CARD_TABLE.REASON is
'原因';

comment on column RETAIN_CARD_TABLE.PERIOD is
'会计周期号';

comment on column RETAIN_CARD_TABLE.CARD_STUCK_ORG is
'吞卡机构';

comment on column RETAIN_CARD_TABLE.CARD_HANDLE_ORG is
'处理机构';

comment on column RETAIN_CARD_TABLE.AUTO_FLAG is
'自动录入标志，1表示自动，0表示手动';

comment on column RETAIN_CARD_TABLE.CHECK_OP is
'登记人';

comment on column RETAIN_CARD_TABLE.CHECK_DATE is
'登记日期';

comment on column RETAIN_CARD_TABLE.CHECK_TIME is
'登记时间';

comment on column RETAIN_CARD_TABLE.OP_NO is
'处理人';

comment on column RETAIN_CARD_TABLE.OP_DATE is
'处理日期';

comment on column RETAIN_CARD_TABLE.OP_TIME is
'处理时间';

comment on column RETAIN_CARD_TABLE.OP_ADDRESS is
'处理地点';

comment on column RETAIN_CARD_TABLE.ACCOUNT_NAME is
'客户姓名';

comment on column RETAIN_CARD_TABLE.ACCOUNT_ID is
'客户证件号';

comment on column RETAIN_CARD_TABLE.ACCOUNT_PHONE is
'客户电话';

comment on column RETAIN_CARD_TABLE.CERT_TYPE is
'证件类型';

comment on column RETAIN_CARD_TABLE.TYPE_FLAG is
'新吞类型（0——吞卡，1——吞钞）';

comment on column RETAIN_CARD_TABLE.STATUS is
'0 留机
1 待领
3 已移交，待领
20 领取
21 销毁';

comment on column RETAIN_CARD_TABLE.CARD_RETAIN_TYPE is
'吞卡类型，1-已吞卡到回收箱；2-已吞卡到退卡器；3-吞卡被取走（读卡器）；4-吞卡被取走（退卡器）';


/*==============================================================*/
/* Table: UNIONPAY_AREACODE_TABLE                                   */
/*==============================================================*/
create table UNIONPAY_AREACODE_TABLE 
(
   code_id             VARCHAR(30)         not null,
   Area_name           VARCHAR(50)         not null,
   constraint PK_UNIONPAY_AREACODE_TABLE primary key (code_id)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table UNIONPAY_AREACODE_TABLE is
'银联地区码表';

comment on column UNIONPAY_AREACODE_TABLE.code_id is
'银联地区码编号';

comment on column UNIONPAY_AREACODE_TABLE.Area_name is
'地区名称';


/*==============================================================*/
/* Table: SELFHELP_BANK_TABLE                                   */
/*==============================================================*/
create table SELFHELP_BANK_TABLE 
(
   logic_id             VARCHAR(40)         not null,
   bank_name           VARCHAR(50)         not null,
   Bank_area           VARCHAR(80),
  x                   VARCHAR(20),
  y                   VARCHAR(20),
   FHorgno           VARCHAR(20),
   AREA_NO_PROVINCE           VARCHAR(10),
   AREA_NO_CITY           VARCHAR(10),
   AREA_NO_COUNTY           VARCHAR(10),
   constraint PK_SELFHELP_BANK_TABLE primary key (logic_id)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table SELFHELP_BANK_TABLE is
'离行设备自助银行表';

comment on column SELFHELP_BANK_TABLE.bank_name is
'自助银行名称';

comment on column SELFHELP_BANK_TABLE.Bank_area is
'所属地址';

comment on column SELFHELP_BANK_TABLE.x
  is '横坐标（经度）';
comment on column SELFHELP_BANK_TABLE.y
  is '纵坐标（纬度）';
  
comment on column SELFHELP_BANK_TABLE.FHorgno is
'所属分行（2级机构）编号';

comment on column SELFHELP_BANK_TABLE.AREA_NO_PROVINCE is
'所属省级区域编码';

comment on column SELFHELP_BANK_TABLE.AREA_NO_CITY is
'所属地市级区域编码';

comment on column SELFHELP_BANK_TABLE.AREA_NO_COUNTY is
'所属县级区域编码';


/*==============================================================*/
/* Table: PROVINCE_CITY_CODE                                   */
/*==============================================================*/
create table PROVINCE_CITY_CODE 
(
   code             VARCHAR(40)         not null,
   Code_name           VARCHAR(50)         not null,
   GRADE           VARCHAR(1),
   Province_code           VARCHAR(10),
   City_code           VARCHAR(10),
   constraint PK_PROVINCE_CITY_CODE primary key (code)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table PROVINCE_CITY_CODE is
'标准省市县编码表';

comment on column PROVINCE_CITY_CODE.code is
'编号';

comment on column PROVINCE_CITY_CODE.Code_name is
'名称';

comment on column PROVINCE_CITY_CODE.GRADE is
'级别 1：省级2：地市级3：县级
';

comment on column PROVINCE_CITY_CODE.Province_code is
'所属省级区域编码';

comment on column PROVINCE_CITY_CODE.City_code is
'所属地市级区域编码';

create table APPS_PROJ_APPLY_RANGE
(
  LOGICID       VARCHAR(40) not null,
  APPSID        VARCHAR(40),
  LIMIT_CATALOG       VARCHAR(5),
   constraint PK_APPS_PROJ_APPLY_RANGE primary key (LOGICID)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table APPS_PROJ_APPLY_RANGE
  is '工程广告适用范围表';
comment on column APPS_PROJ_APPLY_RANGE.APPSID
  is '工程，广告编号';
comment on column APPS_PROJ_APPLY_RANGE.LIMIT_CATALOG
  is '适用设备类型';

create table APPS_VER_APPLY_DEPEND
(
  LOGICID       VARCHAR(40) not null,
  APPSID        VARCHAR(40),
  VERSIONAPPNO        VARCHAR(12),
  RANGETYPE       VARCHAR(1),
  PERVERAPPNO        VARCHAR(12),
  PERVERSEQNO        VARCHAR(12),
  PEROTHERAPPSID        VARCHAR(40),
  PERMINOTHERVERAPPNO        VARCHAR(12),
  PERMINOTHERVERSEQNO        VARCHAR(12),
  constraint PK_APPS_VER_APPLY_DEPEND primary key (LOGICID)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table APPS_VER_APPLY_DEPEND
  is '工程广告适用范围表';
comment on column APPS_VER_APPLY_DEPEND.APPSID
  is '工程标识 工程，广告编号';
comment on column APPS_VER_APPLY_DEPEND.VERSIONAPPNO
  is '应用版本号';
comment on column APPS_VER_APPLY_DEPEND.RANGETYPE
  is '范围类型 1:依赖自身版本号；2:依赖其他工程和版本号';
comment on column APPS_VER_APPLY_DEPEND.PERVERAPPNO
  is '依赖自身工程版本号';
comment on column APPS_VER_APPLY_DEPEND.PERVERSEQNO
  is '依赖自身工程版本序列号';
comment on column APPS_VER_APPLY_DEPEND.PEROTHERAPPSID
  is '依赖其他工程标识';
comment on column APPS_VER_APPLY_DEPEND.PERMINOTHERVERAPPNO
  is '依赖其他工程最小版本号';
comment on column APPS_VER_APPLY_DEPEND.PERMINOTHERVERSEQNO
  is '依赖其他工程最小版本序列号';
  
create table ADS_RANGE_INFO
(
  LOGICID   VARCHAR(40) not null,
  ADS_ID    VARCHAR(40) not null,
  ORGNO     VARCHAR(20),
  CATALOG   VARCHAR(5),
  DEVNO   VARCHAR(20),
   constraint PK_ADS_RANGE_INFO primary key (LOGICID)
        ) in ZHYGSPACE index in ZHYGIDX;

comment on table ADS_RANGE_INFO
  is '广告适用范围表';
comment on column ADS_RANGE_INFO.ADS_ID
  is '广告标识';
comment on column ADS_RANGE_INFO.ORGNO
  is '机构号';
comment on column ADS_RANGE_INFO.CATALOG
  is '设备类型';
comment on column ADS_RANGE_INFO.DEVNO
  is '设备号';

create table TASK_LABEL_CATALOG
(
  no         VARCHAR(5) not null,
  catalog    VARCHAR(2),
  Label_Name  VARCHAR(40),
   constraint PK_TASK_LABEL_CATALOG primary key (no)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table TASK_LABEL_CATALOG
  is '运维标签类别表';
comment on column TASK_LABEL_CATALOG.no
  is '标签编号';
comment on column TASK_LABEL_CATALOG.catalog
  is '标签类型 1：问题原因（工单） 2：解决方案（工单） 3：评价（工单）';
comment on column TASK_LABEL_CATALOG.Label_Name
  is '标签描述';

create table TASK_SHEET_TRACE
(
  trace_id         VARCHAR(36) not null,
  case_no    VARCHAR(36),
  case_trace_id  VARCHAR(36),
  Trace_time  VARCHAR(26),
  trace_by  VARCHAR(20),
  SERVICE_COMPANY  VARCHAR(40),
  SERVICE_PERSON  VARCHAR(40),
  otherReason  VARCHAR(100),
  otherSolution  VARCHAR(100),
  replacemod  VARCHAR(20),
  Service_score  VARCHAR(1),
  Service_remark  VARCHAR(100),
   constraint PK_TASK_SHEET_TRACE primary key (trace_id)
        ) in ZHYGSPACE index in ZHYGIDX;

comment on table TASK_SHEET_TRACE
  is '工单处理明细表';
comment on column TASK_SHEET_TRACE.case_no
  is '对应的CASE编号';
comment on column TASK_SHEET_TRACE.case_trace_id
  is '对应case trace编号';
comment on column TASK_SHEET_TRACE.Trace_time
  is '记录时间 Yyyy-mm-dd hh:mi:ss';
comment on column TASK_SHEET_TRACE.trace_by
  is '记录者';
comment on column TASK_SHEET_TRACE.SERVICE_COMPANY
  is '服务维护商编号';
comment on column TASK_SHEET_TRACE.SERVICE_PERSON
  is '服务维护员编号';
comment on column TASK_SHEET_TRACE.otherReason
  is '其他原因描述';
comment on column TASK_SHEET_TRACE.otherSolution
  is '其他解决方案描述';
comment on column TASK_SHEET_TRACE.replacemod
  is '替换模块';
comment on column TASK_SHEET_TRACE.Service_score
  is '服务评分';
comment on column TASK_SHEET_TRACE.Service_remark
  is '其他服务评语';

create table TASK_SHEET_LABEL
(
  trace_id         VARCHAR(36) not null,
  Label_no    VARCHAR(5) not null,
  Label_catalog  VARCHAR(2),
   constraint PK_TASK_SHEET_LABEL primary key (Label_no,trace_id)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table TASK_SHEET_LABEL
  is '工单处理标签表';
comment on column TASK_SHEET_LABEL.trace_id
  is '编号 同TASK_SHEET_TRACE. trace_id';
comment on column TASK_SHEET_LABEL.Label_no
  is '标签编号';
comment on column TASK_SHEET_LABEL.Label_catalog
  is '标签类型 1：问题原因（工单）2：解决方案（工单）3：评价（工单）';
  

create table PARAM_BUSINESS_TEMPLATE
(
  PARAMKEY         VARCHAR(50) not null,
  PARAMNAME    VARCHAR(100) not null,
  PARAMVALUE  VARCHAR(500),
  REMARK  VARCHAR(500),
  REGEX  VARCHAR(500),
   constraint PK_PARAM_BUSINESS_TEMPLATE primary key (PARAMKEY)
        ) in ZHYGSPACE index in ZHYGIDX;

comment on table PARAM_BUSINESS_TEMPLATE
  is '业务参数模板表';
comment on column PARAM_BUSINESS_TEMPLATE.PARAMKEY
  is '参数唯一英文标识';
comment on column PARAM_BUSINESS_TEMPLATE.PARAMNAME
  is '参数中文名称';
comment on column PARAM_BUSINESS_TEMPLATE.PARAMVALUE
  is '参数默认值';
comment on column PARAM_BUSINESS_TEMPLATE.REMARK
  is '参数描述';
comment on column PARAM_BUSINESS_TEMPLATE.REGEX
  is '正则表达式，用于校验设置是否合法';
  

create table PARAM_BUSINESS_CONFIG
(
  DEVNO    VARCHAR(20) not null,
  PARAMKEY         VARCHAR(50) not null,
  PARAMVALUE  VARCHAR(500),
  ADDUSER  VARCHAR(20),
  ADDTIME  VARCHAR(20),
  TASKFLAG  CHAR(1),
  TAKEFLAG  CHAR(1),
  TAKETIME  VARCHAR(20),
   constraint PK_PARAM_BUSINESS_CONFIG primary key (DEVNO,PARAMKEY)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table PARAM_BUSINESS_CONFIG
  is '业务参数模板表';
comment on column PARAM_BUSINESS_CONFIG.DEVNO
  is '设备号';
comment on column PARAM_BUSINESS_CONFIG.PARAMKEY
  is '参数唯一英文标识';
comment on column PARAM_BUSINESS_CONFIG.PARAMVALUE
  is '参数值';
comment on column PARAM_BUSINESS_CONFIG.ADDUSER
  is '添加人员';
comment on column PARAM_BUSINESS_CONFIG.ADDTIME
  is '该记录增加的时间，YYYY-MM-DD hh:mm:ss';
comment on column PARAM_BUSINESS_CONFIG.TASKFLAG
  is '任务标志 0：未完成 1：已成功 2：已结束（未成功）';
comment on column PARAM_BUSINESS_CONFIG.TAKEFLAG
  is '加载标志 默认为0  0：未加载  1：已加载';
comment on column PARAM_BUSINESS_CONFIG.TAKETIME
  is '加载时间 YYYY-MM-DD hh:mm:ss';
  
/*==============================================================*/
/* Table: ATMC_FUNCTION_TABLE                                   */
/*==============================================================*/
create table ATMC_FUNCTION_TABLE 
(
   DEV_NO               VARCHAR(20)          not null,
   TRANS_LIST           VARCHAR(500),
   ATM_LOG              VARCHAR(7),
   NOTE1                VARCHAR(32),
   NOTE2                VARCHAR(32),
   NOTE3                VARCHAR(32),
   constraint PK_ATMC_FUNCTION_TABLE primary key (DEV_NO)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table ATMC_FUNCTION_TABLE is
'ATMC功能定义表';

comment on column ATMC_FUNCTION_TABLE.DEV_NO is
'设备号';

comment on column ATMC_FUNCTION_TABLE.TRANS_LIST is
'功能列表';

comment on column ATMC_FUNCTION_TABLE.ATM_LOG is
'日志补打池缓存大小（100至200000）';

comment on column ATMC_FUNCTION_TABLE.NOTE1 is
'预留1（未使用）';

comment on column ATMC_FUNCTION_TABLE.NOTE2 is
'预留2（未使用）';

comment on column ATMC_FUNCTION_TABLE.NOTE3 is
'预留3（未使用）';

/*==============================================================*/
/* Table: ATMC_FUNCTION_DEF                                     */
/*==============================================================*/
create table ATMC_FUNCTION_DEF 
(
   	ID           		VARCHAR(36)			not null,
	TRANS_NO			VARCHAR(5)				not null,
   	TRANS_NAME          VARCHAR(20),
   	TRANS_CODE			VARCHAR(100),
	TRANS_TYPE			VARCHAR(50),
	TRANS_TYPE_LEVEL	VARCHAR(5),	
	DEV_CATALOG			VARCHAR(5),
   constraint PK_ATMC_FUNCTION_DEF primary key (ID)
        ) in ZHYGSPACE index in ZHYGIDX;

comment on table ATMC_FUNCTION_DEF is 
'ATMC功能定义默认表';

comment on column ATMC_FUNCTION_DEF.ID is 
'编号(UUID)';

comment on column ATMC_FUNCTION_DEF.TRANS_NO is  
'交易编号(对应于ATMC上的交易编码位数)';

comment on column ATMC_FUNCTION_DEF.TRANS_NAME is 
'交易中文名称';

comment on column ATMC_FUNCTION_DEF.TRANS_CODE is  
'交易英文名称(用于WSAPPlus,WSAP时不能为空)';

comment on column ATMC_FUNCTION_DEF.TRANS_TYPE is  
'交易类别名称(如：基础交易类、IC卡交易类等等)';

comment on column ATMC_FUNCTION_DEF.TRANS_TYPE_LEVEL is  
'交易类别(从0开始，0排在最前面)';

comment on column ATMC_FUNCTION_DEF.DEV_CATALOG is 
'设备类型(同DEV_CATALOG_TABLE.NO)';

create table SYS_AUDIT
(
  no      VARCHAR(20) not null,
  user_no VARCHAR(20) not null,
  operate_time    VARCHAR(20) not null,
  MENU_NO VARCHAR(100) not null,
  BTN_NO VARCHAR(30) not null,
  Current_detail   blob,
  Before_detail  blob,
  COMMIT_NOTE Varchar(100),
  COMMIT_ORG Varchar(20),
  COMMIT_ROLE Varchar(50),
  COMMIT_USER Varchar(20),
  COMMIT_STATUS Varchar(1),
  AUDIT_USER Varchar(20),
  AUDIT_RESULT Varchar(1),
  AUDIT_TIME Varchar(20),
  AUDIT_NOTE Varchar(100),
  note      VARCHAR(100),
   constraint PK_SYS_AUDIT primary key (NO)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table SYS_AUDIT
  is '操作日志';
comment on column SYS_AUDIT.user_no
  is '操作用户';
comment on column SYS_AUDIT.operate_time
  is '操作时间 YYYY-MM-DD hh:mi:ss';
comment on column SYS_AUDIT.MENU_NO
  is '功能模块编号 同SYS_OPERATE.MENU_NO';
comment on column SYS_AUDIT.BTN_NO
  is '操作编号 同SYS_OPERATE.BTN_NO';
comment on column SYS_AUDIT.no
  is '记录编号 yyyymmddhhmissSSS';
comment on column SYS_AUDIT.Current_detail
  is '操作后详细数据';
comment on column SYS_AUDIT.Before_detail
  is '操作前详细数据';
comment on column SYS_AUDIT.COMMIT_NOTE
  is '提交审核备注';
comment on column SYS_AUDIT.COMMIT_ORG
  is '提交审核机构编号';
comment on column SYS_AUDIT.COMMIT_ROLE
  is '提交审核角色编号';
comment on column SYS_AUDIT.COMMIT_USER
  is '提交审核人员编号';
comment on column SYS_AUDIT.COMMIT_STATUS
  is '提交状态 1:提交审核 9：撤销，不提交审核（审核拒绝后允许撤销）';
comment on column SYS_AUDIT.AUDIT_USER
  is '实际审核人员编号';
comment on column SYS_AUDIT.AUDIT_RESULT
  is '审核结果 Y：已审核，通过 N：已审核，拒绝';
comment on column SYS_AUDIT.AUDIT_TIME
  is '审核时间';
comment on column SYS_AUDIT.AUDIT_NOTE
  is '审核备注';
comment on column SYS_AUDIT.note
  is '备注';
  
create table UNREAD_BULLET_INFO
(
user_no VARCHAR(20) not null,
bullet_no VARCHAR(36) not null
)
in ZHYGSPACE index in ZHYGIDX;
comment on table UNREAD_BULLET_INFO
is '系统公告用户访问表';
comment on column UNREAD_BULLET_INFO.user_no
is '用户编号';
comment on column UNREAD_BULLET_INFO.bullet_no
is '公告编号';
alter table UNREAD_BULLET_INFO
add constraint UNREAD_BULLET_INFO_PK primary key (USER_NO, BULLET_NO);



/*==============================================================*/
/* Table: DOUBTFUL_TABLE                                        */
/*==============================================================*/
create table DOUBTFUL_TABLE 
(
   LOGIC_ID             VARCHAR(36)          not null,
   DEV_NO               VARCHAR(20)          not null,
   DATETIME             CHAR(19)             not null,
   CARDINFO             VARCHAR(25)          not null,
   TRANSACCOUNT         VARCHAR(21),
   AMOUNT               NUMERIC(20,2),
   TXTYPE               VARCHAR(20)          not null,
   TRNS                 VARCHAR(25)          not null,
   RTPOS                VARCHAR(14),
   HOSTCODE             VARCHAR(10),
   LOCALCODE            VARCHAR(6),
   constraint PK_DOUBTFUL_TABLE primary key (LOGIC_ID)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table DOUBTFUL_TABLE is
'可疑交易记录表';

comment on column DOUBTFUL_TABLE.LOGIC_ID is
'记录流水号';

comment on column DOUBTFUL_TABLE.DEV_NO is
'设备号';

comment on column DOUBTFUL_TABLE.DATETIME is
'交易时间(YYYY-MM-DD HH:mm:ss)';

comment on column DOUBTFUL_TABLE.CARDINFO is
'卡号';

comment on column DOUBTFUL_TABLE.TRANSACCOUNT is
'转账账号';

comment on column DOUBTFUL_TABLE.AMOUNT is
'金额';

comment on column DOUBTFUL_TABLE.TXTYPE is
'交易类型';

comment on column DOUBTFUL_TABLE.TRNS is
'交易流水号';

comment on column DOUBTFUL_TABLE.RTPOS is
'回收位置';

comment on column DOUBTFUL_TABLE.HOSTCODE is
'主机返回码';

comment on column DOUBTFUL_TABLE.LOCALCODE is
'本地拒绝码';


create table RPT_FAULT_DEV_MONTH_MOD
(
  DEV_NO          VARCHAR(20) not null,
  DATE_TIME    VARCHAR(10) not null,
  MOD_NO        VARCHAR(5) not null,
  lv3_number  NUMERIC(30),
  lv3_onsite_time  NUMERIC(30),
  lv3_close_time  NUMERIC(30),
  lv4_number  NUMERIC(30),
  lv4_onsite_time  NUMERIC(30),
  lv4_close_time  NUMERIC(30),
  lv5_number  NUMERIC(30),
  lv5_onsite_time  NUMERIC(30),
  lv5_close_time  NUMERIC(30),
  lv6_number  NUMERIC(30),
  lv6_onsite_time  NUMERIC(30),
  lv6_close_time  NUMERIC(30),
  lv7_number  NUMERIC(30),
  lv7_onsite_time  NUMERIC(30),
  lv7_close_time  NUMERIC(30),
  lv8_number  NUMERIC(30),
  lv8_onsite_time  NUMERIC(30),
  lv8_close_time  NUMERIC(30),
  lv9_number  NUMERIC(30),
  lv9_onsite_time  NUMERIC(30),
  lv9_close_time  NUMERIC(30),
  lv10_number  NUMERIC(30),
  lv10_onsite_time  NUMERIC(30),
  lv10_close_time  NUMERIC(30),
  lv11_number  NUMERIC(30),
  lv11_onsite_time  NUMERIC(30),
  lv11_close_time  NUMERIC(30),
  lv12_number  NUMERIC(30),
  lv12_onsite_time  NUMERIC(30),
  lv12_close_time  NUMERIC(30),
  lv13_number  NUMERIC(30),
  lv13_onsite_time  NUMERIC(30),
  lv13_close_time  NUMERIC(30),
  lv14_number  NUMERIC(30),
  lv14_onsite_time  NUMERIC(30),
  lv14_close_time  NUMERIC(30),
  lv15_number  NUMERIC(30),
  lv15_onsite_time  NUMERIC(30),
  lv15_close_time  NUMERIC(30),
   constraint PK_RPT_FAULT_DEV_MONTH_MOD primary key (DEV_NO,DATE_TIME,MOD_NO)
         ) in ZHYGSPACE index in ZHYGIDX;

comment on table RPT_FAULT_DEV_MONTH_MOD
  is '故障统计表（每台每月每个模块）';
comment on column RPT_FAULT_DEV_MONTH_MOD.DEV_NO
  is '设备号';
comment on column RPT_FAULT_DEV_MONTH_MOD.DATE_TIME
  is '日期 yyyyMM';
comment on column RPT_FAULT_DEV_MONTH_MOD.MOD_NO
  is '模块编号';   
comment on column RPT_FAULT_DEV_MONTH_MOD.lv3_number is '资源预警次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv3_onsite_time is '资源预警响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv3_close_time is '资源预警关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv4_number is '资源耗尽次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv4_onsite_time is '资源耗尽响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv4_close_time is '资源耗尽关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv5_number is '清机通知次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv5_onsite_time is '清机通知响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv5_close_time is '清机通知关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv6_number is '营业故障次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv6_onsite_time is '营业故障响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv6_close_time is '营业故障关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv7_number is '纸少次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv7_onsite_time is '纸少响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv7_close_time is '纸少关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv8_number is '纸空次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv8_onsite_time is '纸空响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv8_close_time is '纸空关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv9_number is '钞少次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv9_onsite_time is '钞少响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv9_close_time is '钞少关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv10_number is '钞空次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv10_onsite_time is '钞空响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv10_close_time is '钞空关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv11_number is '存款箱满次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv11_onsite_time is '存款箱满响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv11_close_time is '存款箱满关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv12_number is '一般硬件故障次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv12_onsite_time is '一般硬件故障响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv12_close_time is '一般硬件故障关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv13_number is '严重硬件故障次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv13_onsite_time is '严重硬件故障响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv13_close_time is '严重硬件故障关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv14_number is '钞箱故障次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv14_onsite_time is '钞箱故障响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv14_close_time is '钞箱故障关闭时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv15_number is '通讯故障次数';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv15_onsite_time is '通讯故障响应时长';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv15_close_time is '通讯故障关闭时长';