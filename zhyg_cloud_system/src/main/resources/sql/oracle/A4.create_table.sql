create table ADS_INFO_TABLE
(
  ads_id          VARCHAR2(40) not null,
  ads_seq_no    VARCHAR2(40) not null,
  ads_space_id    VARCHAR2(40) not null,
  name        VARCHAR2(50) not null,
  resource_id VARCHAR2(36) not null,
  ADS_STATUS CHAR(1),
  play_start_time VARCHAR2(20),
  play_end_time VARCHAR2(20),
  play_time VARCHAR2(20),
  adsfilepath VARCHAR2(500),
  description VARCHAR2(500),
  ADDUSER VARCHAR2(20),
  ADDTIME VARCHAR2(20),
  VERSIONNOTIFYFLAG     CHAR(1) default '0' not null,
  TAKETIME              VARCHAR2(20),
   constraint PK_ADS_INFO_TABLE primary key (ads_id)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_INFO_TABLE
  is '�����Ϣ��';
comment on column ADS_INFO_TABLE.ads_id
  is '�����';
comment on column ADS_INFO_TABLE.ads_seq_no
  is '����ʶ��� ��ADS_IDΪ��1.0.0�����ֵΪ001000000';
comment on column ADS_INFO_TABLE.ads_space_id
  is '���λ���';
comment on column ADS_INFO_TABLE.play_start_time
  is '���ſ�ʼʱ��';   
comment on column ADS_INFO_TABLE.play_end_time
  is '���Ž���ʱ��';
comment on column ADS_INFO_TABLE.play_time
  is '����ʱ��'; 
comment on column ADS_INFO_TABLE.adsfilepath
  is '�����ļ�·��������·����';        
comment on column ADS_INFO_TABLE.name
  is '�������';
comment on column ADS_INFO_TABLE.resource_id
  is '��Դ���';
comment on column ADS_INFO_TABLE.ADS_STATUS
  is '���״̬ 1:���� 2:��ͣʹ�� 3:������ 4����ɾ��';
comment on column ADS_INFO_TABLE.description
  is '�������'; 
comment on column ADS_INFO_TABLE.ADDUSER
  is '������Ա';        
comment on column ADS_INFO_TABLE.ADDTIME
  is '����ʱ��yyyy-MM-dd hh:mm:ss';
comment on column ADS_INFO_TABLE.VERSIONNOTIFYFLAG
  is '�汾֪ͨ��־ 0��δ֪ͨ/δ����;1������֪ͨ/�Ѽ���;2����֪ͨ�ɹ�;3����֪ͨ���汾���Ƿ�';
comment on column ADS_INFO_TABLE.TAKETIME
  is '֪ͨ�������ʱ�� YYYY-MM-DD hh:mm:ss';

create table ADS_REMOTE_TABLE
(
  ads_id       VARCHAR2(40) not null,
  remote_range        CHAR(1),
  method       CHAR(1),
  valid_time   VARCHAR2(20),
   constraint PK_ADS_REMOTE_TABLE primary key (ADS_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_REMOTE_TABLE
  is '���Ͷ�ű�';
comment on column ADS_REMOTE_TABLE.ads_id
  is '�����';
comment on column ADS_REMOTE_TABLE.remote_range
  is 'Ͷ�ŷ�Χ��1��Ͷ���������豸 2��Ͷ�������豸 3��ȡ��Ͷ�ţ�';
comment on column ADS_REMOTE_TABLE.method
  is '��Ч��ʽ��1��������Ч 2��ָ��ʱ����Ч��';
comment on column ADS_REMOTE_TABLE.valid_time
  is '��Чʱ�䣨������Ч���¼��ǰʱ�䣩';

create table SYS_USER
(
  no                VARCHAR2(20) not null,
  passwd            VARCHAR2(50) not null,
  name              VARCHAR2(40) not null,
  status            VARCHAR2(1) not null,
  online_flag       VARCHAR2(1) not null,
  role_no           VARCHAR2(50) not null,
  org_no            VARCHAR2(20) not null,
  phone             VARCHAR2(20),
  mobile            VARCHAR2(20),
  email             VARCHAR2(40),
  login_ip          VARCHAR2(30),
  login_time        VARCHAR2(20),
  passwd_expiration VARCHAR2(10),
  passwd_error      INTEGER default 0,
   constraint PK_SYS_USER primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_USER
  is '��Ա��';
comment on column SYS_USER.no
  is '�û��˺�';
comment on column SYS_USER.passwd
  is '�û����루MD5���ܱ��棩';
comment on column SYS_USER.name
  is '��Ա����';
comment on column SYS_USER.status
  is '�û�״̬(1������ 0��ͣ��)';
comment on column SYS_USER.online_flag
  is '����״̬(1������ ��0�����ߣ�';
comment on column SYS_USER.role_no
  is '�û���ɫ';
comment on column SYS_USER.org_no
  is '��������';
comment on column SYS_USER.phone
  is '�칫�绰';
comment on column SYS_USER.mobile
  is '�ֻ�����';
comment on column SYS_USER.email
  is '�����ʼ�';
comment on column SYS_USER.login_ip
  is '�ϴε�¼IP';
comment on column SYS_USER.login_time
  is '�ϴε�¼ʱ�䣨YYYY-MM-DD HH:MM24:SS��';
comment on column SYS_USER.passwd_expiration
  is '���뵽���գ�YYYY-MM-DD��';
comment on column SYS_USER.passwd_error
  is '����������';

create table SYS_USER_DEVROLE
(
  USER_NO                VARCHAR2(20) not null,
  DEV_CATALOG            VARCHAR2(5) not null,
   constraint PK_SYS_USER_DEVROLE primary key (USER_NO,DEV_CATALOG)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_USER_DEVROLE
  is 'ϵͳ�û��豸Ȩ�ޱ�';
comment on column SYS_USER_DEVROLE.USER_NO
  is '�û�ID ͬSYS_USER.NO';
comment on column SYS_USER_DEVROLE.DEV_CATALOG
  is '�豸���ͱ�� ֵΪall��ʾ�����豸���ͣ�ͬһ���û�all�������豸���ͱ�Ų���ͬʱ���ڡ�����ͬDEV_CATALOG_TABLE.NO';
  
create table ADS_RESOURCE
(
  no          VARCHAR2(36) not null,
  name  VARCHAR2(50),
  type        VARCHAR2(10) not null,
  path        VARCHAR2(200),
  description VARCHAR2(100),
  width       INTEGER,
  height      INTEGER,
  duration    INTEGER,
  text        VARCHAR2(1024),
  ADDUSER VARCHAR2(20),
  ADDTIME VARCHAR2(20),
   constraint PK_ADS_RESOURCE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_RESOURCE
  is '�����Դ��';
comment on column ADS_RESOURCE.no
  is '���';
comment on column ADS_RESOURCE.name
  is '��Դ����';  
comment on column ADS_RESOURCE.type
  is '��Դ���ͣ�1��ͼƬ��2����Ƶ��3�����֣�';
comment on column ADS_RESOURCE.path
  is '��Դ·��';
comment on column ADS_RESOURCE.description
  is '��Դ����';
comment on column ADS_RESOURCE.width
  is '��';
comment on column ADS_RESOURCE.height
  is '��';
comment on column ADS_RESOURCE.duration
  is '����Ƶ��棩ʱ��';
comment on column ADS_RESOURCE.text
  is '�����ֹ�棩����';
comment on column ADS_RESOURCE.ADDUSER
  is '������Ա';
comment on column ADS_RESOURCE.ADDTIME
  is '����ʱ�� yyyy-MM-dd hh:mm:ss';

create table ADS_SPACE_TABLE
(
  id      VARCHAR2(40) not null,
  name    VARCHAR2(50) not null,
  type    VARCHAR2(2) not null,
  Play_order VARCHAR2(8),
  status  CHAR(1) not null,
  adduser VARCHAR2(20),
  addtime VARCHAR2(20),
  adstypeurl VARCHAR2(60),
   constraint PK_ADS_SPACE_TABLE primary key (ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_SPACE_TABLE
  is '���λ��Ϣ��';
comment on column ADS_SPACE_TABLE.id
  is '���λ���';
comment on column ADS_SPACE_TABLE.name
  is '���λ����';
comment on column ADS_SPACE_TABLE.type
  is '������ͣ�1���ȴ��忨��� 2�������й�棩';
 comment on column ADS_SPACE_TABLE.Play_order
  is '�������'; 
comment on column ADS_SPACE_TABLE.status
  is '���λ״̬��1������ 2������ 3��ɾ����';
comment on column ADS_SPACE_TABLE.adduser
  is '���λ������Ա';
comment on column ADS_SPACE_TABLE.addtime
  is '���λ����ʱ�䣨yyyy-MM-dd hh:mm:ss��';
 comment on column ADS_SPACE_TABLE.adstypeurl
  is '�ն˹�����ýڵ���'; 

create table CARD_TYPE_TABLE
(
  no        VARCHAR2(3) not null,
  card_type VARCHAR2(40),
   constraint PK_CARD_TYPE_TABLE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CARD_TYPE_TABLE
  is '�����ͱ�';
comment on column CARD_TYPE_TABLE.no
  is '�����ͱ��';
comment on column CARD_TYPE_TABLE.card_type
  is '����������';

create table ADS_CLICK_DETAIL
(
  dev_no    VARCHAR2(20) not null,
  time      VARCHAR2(19) not null,
  adv_no    VARCHAR2(36) not null,
  card_no   VARCHAR2(30) not null,
  card_type VARCHAR2(1) not null,
  user_sex  VARCHAR2(1),
  user_age  VARCHAR2(3),
   constraint PK_ADS_CLICK_DETAIL primary key (DEV_NO, TIME, ADV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_CLICK_DETAIL
  is '����������';
comment on column ADS_CLICK_DETAIL.dev_no
  is '�豸��';
comment on column ADS_CLICK_DETAIL.time
  is 'ʱ��';
comment on column ADS_CLICK_DETAIL.adv_no
  is '�����';
comment on column ADS_CLICK_DETAIL.card_no
  is '����';
comment on column ADS_CLICK_DETAIL.card_type
  is '�����ͱ��';
comment on column ADS_CLICK_DETAIL.user_sex
  is '�û��Ա�';
comment on column ADS_CLICK_DETAIL.user_age
  is '�û�����';

create table APPS_CATALOG_TABLE
(
  logic_id     VARCHAR2(5) not null,
  apps_catalog VARCHAR2(50) not null,
   constraint PK_APPS_CATALOG_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_CATALOG_TABLE
  is 'ҵ������';
comment on column APPS_CATALOG_TABLE.logic_id
  is 'ҵ����(��10001��ʼ)';
comment on column APPS_CATALOG_TABLE.apps_catalog
  is 'ҵ������';


create table APPS_INFO_TABLE
(
  apps_id       VARCHAR2(40) not null,
  apps_name     VARCHAR2(50) not null,
  apps_type     CHAR(1) not null,
  apps_catalog  VARCHAR2(5) not null,
  apps_status   CHAR(1) not null,
  logo_path     VARCHAR2(400),
  add_user      VARCHAR2(20),
  add_time      VARCHAR2(20),
  description   VARCHAR2(1000),
   constraint PK_APPS_INFO_TABLE primary key (APPS_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_INFO_TABLE
  is 'Ӧ���г���Ϣ��';
comment on column APPS_INFO_TABLE.apps_id
  is 'Ӧ�ñ�ʶ';
comment on column APPS_INFO_TABLE.apps_name
  is 'Ӧ������';
comment on column APPS_INFO_TABLE.apps_type
  is 'Ӧ�����ͣ�1��ȫ����ͳһƽ̨  ��2��Ӧ��APP���ͻ��ˣ���3��Ӧ��APP������ˣ���4��WSAPӦ�ù��̣�';
comment on column APPS_INFO_TABLE.apps_catalog
  is 'ҵ�����';
comment on column APPS_INFO_TABLE.apps_status
  is 'Ӧ��״̬';
comment on column APPS_INFO_TABLE.logo_path
  is 'logo·��';
comment on column APPS_INFO_TABLE.add_user
  is '������Ա';
comment on column APPS_INFO_TABLE.add_time
  is '����ʱ��';
comment on column APPS_INFO_TABLE.description
  is 'Ӧ������';


create table APPS_MODEL_RANGE_INFO
(
  logicid VARCHAR2(40),
  modelid VARCHAR2(40),
  orgno   VARCHAR2(40),
  catalog VARCHAR2(5),
  vendor  VARCHAR2(5),
  type    VARCHAR2(5),
  devno   VARCHAR2(40),
   constraint PK_APPS_MODEL_RANGE_INFO primary key (LOGICID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_MODEL_RANGE_INFO
  is '����豸��Χ��';
comment on column APPS_MODEL_RANGE_INFO.logicid
  is '���';
comment on column APPS_MODEL_RANGE_INFO.modelid
  is '��˱��';
comment on column APPS_MODEL_RANGE_INFO.orgno
  is '������';
comment on column APPS_MODEL_RANGE_INFO.catalog
  is '�豸����';
comment on column APPS_MODEL_RANGE_INFO.vendor
  is '�豸Ʒ��';
comment on column APPS_MODEL_RANGE_INFO.type
  is '�豸�ͺ�';
comment on column APPS_MODEL_RANGE_INFO.devno
  is '�豸��';


create table APPS_MODEL_SYNC_TASK
(
  logicid  VARCHAR2(40) not null,
  tasktype VARCHAR2(2) not null,
  syncunit VARCHAR2(20),
  TASKSTARTTIME  Varchar2(20),
  adduser  VARCHAR2(20),
  addtime  VARCHAR2(20),
  taskflag CHAR(1) not null,
  TAKEFLAG  CHAR(1),
  TAKETIME  VARCHAR2(20),
  SYNCOUNT  INTEGER,
  FINISHTIME  VARCHAR2(20),
   constraint PK_APPS_MODEL_SYNC_TASK primary key (logicid)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_MODEL_SYNC_TASK
  is '�����Ϣͬ�������';
comment on column APPS_MODEL_SYNC_TASK.tasktype
  is '�������ͣ�1���豸�汾 9����棩';
comment on column APPS_MODEL_SYNC_TASK.syncunit
  is 'ͬ���豸��';
comment on column APPS_MODEL_SYNC_TASK.TASKSTARTTIME
  is '����ִ�п�ʼʱ�� YYYY-MM-DD hh:mm:ss';
comment on column APPS_MODEL_SYNC_TASK.adduser
  is '������Ա';
comment on column APPS_MODEL_SYNC_TASK.addtime
  is '����ʱ��';
comment on column APPS_MODEL_SYNC_TASK.taskflag
  is '�����ʶ';
comment on column APPS_MODEL_SYNC_TASK.TAKEFLAG
  is 'Ĭ��Ϊ0,0��δ����,1���Ѽ���';
comment on column APPS_MODEL_SYNC_TASK.TAKETIME
  is 'YYYY-MM-DD hh:mm:ss';
comment on column APPS_MODEL_SYNC_TASK.SYNCOUNT
  is 'Ĭ��0';
comment on column APPS_MODEL_SYNC_TASK.FINISHTIME
  is 'YYYY-MM-DD hh:mm:ss';

create table APPS_MODEL_TABLE
(
  logic_id    VARCHAR2(40) not null,
  model_name  VARCHAR2(20) not null,
  model_upper VARCHAR2(40),
  model_type  CHAR(1) not null,
  org_no      VARCHAR2(40) not null,
  model_user  VARCHAR2(20),
  model_time  VARCHAR2(20),
  description VARCHAR2(500),
   constraint PK_APPS_MODEL_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_MODEL_TABLE
  is '��˻�����Ϣ��';
comment on column APPS_MODEL_TABLE.logic_id
  is '��˱��';
comment on column APPS_MODEL_TABLE.model_name
  is '�������';
comment on column APPS_MODEL_TABLE.model_upper
  is '�ϼ����';
comment on column APPS_MODEL_TABLE.model_type
  is '�������';
comment on column APPS_MODEL_TABLE.org_no
  is '������';
comment on column APPS_MODEL_TABLE.model_user
  is '���������';
comment on column APPS_MODEL_TABLE.model_time
  is '�������ʱ��';
comment on column APPS_MODEL_TABLE.description
  is '�������';


create table APPS_MODEL_VERSION_TABLE
(
  logic_id      VARCHAR2(40) not null,
  model_id      VARCHAR2(40) not null,
  apps_id       VARCHAR2(40) not null,
  version_no    VARCHAR2(20) not null,
  update_mode   CHAR(1) not null,
  update_time   VARCHAR2(20),
  syn_mode      CHAR(1) not null,
  syn_starttime VARCHAR2(20),
   constraint PK_APPS_MODEL_VERSION_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_MODEL_VERSION_TABLE
  is '��˰汾��Ϣ��';
comment on column APPS_MODEL_VERSION_TABLE.logic_id
  is '���';
comment on column APPS_MODEL_VERSION_TABLE.model_id
  is '��˱�ʶ';
comment on column APPS_MODEL_VERSION_TABLE.apps_id
  is 'Ӧ�ñ�ʶ';
comment on column APPS_MODEL_VERSION_TABLE.version_no
  is 'Ӧ�ð汾��';
comment on column APPS_MODEL_VERSION_TABLE.update_mode
  is '��Ч��ʽ��1��������Ч��2��ָ��ʱ����Ч��3��������Ч��';
comment on column APPS_MODEL_VERSION_TABLE.update_time
  is '��Чʱ��';
comment on column APPS_MODEL_VERSION_TABLE.syn_mode
  is 'ͬ����ʽ��1������ͬ�� ��2������ͬ����3����ʱͬ����';
comment on column APPS_MODEL_VERSION_TABLE.syn_starttime
  is '��ʼͬ��ʱ��';


create table APPS_REMOTEVERSIONINFO
(
  devno        VARCHAR2(20) not null,
  appsid       VARCHAR2(40) not null,
  versionappno VARCHAR2(20) not null,
  notifystatus CHAR(1),
  notifytime   VARCHAR2(20),
  effectstatus CHAR(1),
  effecttime   VARCHAR2(20),
   constraint PK_APPS_REMOTEVERSIONINFO primary key (DEVNO, APPSID, VERSIONAPPNO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_REMOTEVERSIONINFO
  is '�汾ͬ�������';
comment on column APPS_REMOTEVERSIONINFO.devno
  is '�豸��';
comment on column APPS_REMOTEVERSIONINFO.appsid
  is 'Ӧ�ñ�ʶ';
comment on column APPS_REMOTEVERSIONINFO.versionappno
  is '��ǰӦ�ð汾��';
comment on column APPS_REMOTEVERSIONINFO.notifystatus
  is '֪ͨAPPServer״̬(1:֪ͨ 0��δ֪ͨ)';
comment on column APPS_REMOTEVERSIONINFO.notifytime
  is '֪ͨAPPServer��¼�޸�ʱ��(yyyy-MM-dd hh:mm:ss)';
comment on column APPS_REMOTEVERSIONINFO.effectstatus
  is '��Ч״̬(0:δ��Ч 1������Ч)';
comment on column APPS_REMOTEVERSIONINFO.effecttime
  is '��Ч״̬��¼�޸�ʱ��(yyyy-MM-dd hh:mm:ss)';


create table ADS_REMOTEVERSIONINFO
(
  devno        VARCHAR2(20) not null,
  ADS_ID       VARCHAR2(40) not null,
  notifystatus CHAR(1),
  notifytime   VARCHAR2(20),
  effectstatus CHAR(1),
  effecttime   VARCHAR2(20),
   constraint PK_ADS_REMOTEVERSIONINFO primary key (DEVNO, ADS_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_REMOTEVERSIONINFO
  is '���ͬ�������';
comment on column ADS_REMOTEVERSIONINFO.devno
  is '�豸��';
comment on column ADS_REMOTEVERSIONINFO.ADS_ID
  is '����ʶ';
comment on column ADS_REMOTEVERSIONINFO.notifystatus
  is '֪ͨAPPServer״̬(1:֪ͨ 0��δ֪ͨ)';
comment on column ADS_REMOTEVERSIONINFO.notifytime
  is '֪ͨAPPServer��¼�޸�ʱ��(yyyy-MM-dd hh:mm:ss)';
comment on column ADS_REMOTEVERSIONINFO.effectstatus
  is '��Ч״̬(0:δ��Ч 1������Ч)';
comment on column ADS_REMOTEVERSIONINFO.effecttime
  is '��Ч״̬��¼�޸�ʱ��(yyyy-MM-dd hh:mm:ss)';


create table APPS_VERSION_TABLE
(
  logic_id              VARCHAR2(40) not null,
  apps_id               VARCHAR2(40) not null,
  version_bus_no        VARCHAR2(20) not null,
  version_app_no        VARCHAR2(20) not null,
  version_status        CHAR(1) not null,
  version_CLIENT_path   VARCHAR2(400),
  add_user              VARCHAR2(20),
  add_time              VARCHAR2(20),
  version_description   VARCHAR2(500),
  version_file_md5      VARCHAR2(64),
  version_seq_no        VARCHAR2(20),
  versionfilepath       VARCHAR2(500),
  VERSIONNOTIFYFLAG     CHAR(1) default '0' not null,
  TAKETIME              VARCHAR2(20),
   constraint PK_APPS_VERSION_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_VERSION_TABLE
  is 'Ӧ�ð汾��';
comment on column APPS_VERSION_TABLE.logic_id
  is '���';
comment on column APPS_VERSION_TABLE.apps_id
  is 'Ӧ�ñ�ʶ';
comment on column APPS_VERSION_TABLE.version_bus_no
  is 'ҵ��汾��';
comment on column APPS_VERSION_TABLE.version_app_no
  is 'Ӧ�ð汾��';
comment on column APPS_VERSION_TABLE.version_status
  is '�汾״̬��1:����  ��2:�����ã� 3:�����ϣ�';
comment on column APPS_VERSION_TABLE.version_CLIENT_path
  is '�汾���µ��ͻ���·��';
comment on column APPS_VERSION_TABLE.add_user
  is '�汾�ϴ���';
comment on column APPS_VERSION_TABLE.add_time
  is '�汾�ϴ�ʱ��';
comment on column APPS_VERSION_TABLE.version_description
  is '�汾����';
comment on column APPS_VERSION_TABLE.version_file_md5
  is '�ļ�md5ֵ';
comment on column APPS_VERSION_TABLE.version_seq_no
  is 'Ӧ�ð汾���к�';
comment on column APPS_VERSION_TABLE.versionfilepath
  is '����·����ʽ�洢�汾��Ӧ�ļ��Ĵ��λ��';
comment on column APPS_VERSION_TABLE.VERSIONNOTIFYFLAG
  is '�汾֪ͨ��־ 0��δ֪ͨ/δ����;1������֪ͨ/�Ѽ���;2����֪ͨ�ɹ�;3����֪ͨ���汾���Ƿ�';
comment on column APPS_VERSION_TABLE.TAKETIME
  is '֪ͨ�������ʱ�� YYYY-MM-DD hh:mm:ss';

create table BANK_MANAGER_PERSION
(
  no     VARCHAR2(20) not null,
  name   VARCHAR2(40) not null,
  org_no VARCHAR2(20) not null,
  phone  VARCHAR2(20),
  mobile VARCHAR2(20),
  email  VARCHAR2(40),
  is_leader CHAR(1),
  is_lobbymanager CHAR(1),
  is_devmanager CHAR(1),
  is_deskmanager CHAR(1),
   constraint PK_BANK_MANAGER_PERSION primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table BANK_MANAGER_PERSION
  is '����������Ա��';
comment on column BANK_MANAGER_PERSION.no
  is '�û�ID';
comment on column BANK_MANAGER_PERSION.name
  is '�û�����';
comment on column BANK_MANAGER_PERSION.org_no
  is '��������';
comment on column BANK_MANAGER_PERSION.phone
  is '�칫�绰';
comment on column BANK_MANAGER_PERSION.mobile
  is '�ֻ�����';
comment on column BANK_MANAGER_PERSION.email
  is '�����ʼ�';
comment on column BANK_MANAGER_PERSION.is_leader
  is '�Ƿ������㾭����1���� 0�����ǣ�';
comment on column BANK_MANAGER_PERSION.is_lobbymanager
  is '�Ƿ��Ǵ��þ�����1���� 0�����ǣ�';
comment on column BANK_MANAGER_PERSION.is_devmanager
  is '�Ƿ����豸�ܻ�Ա��1���� 0�����ǣ�';
comment on column BANK_MANAGER_PERSION.is_deskmanager
  is '�Ƿ��ǹ�̨��Ա��1���� 0�����ǣ�'; 
  

create table CASE_CATALOG_TABLE
(
  org_no            VARCHAR2(20) not null,
  catalog_no        NUMBER(38) not null,
  catalog_name      VARCHAR2(50) not null,
  responsor_catalog NUMBER(38) not null,
  reply_interval    NUMBER(38),
  onsite_interval   NUMBER(38),
  onsite_interval1  NUMBER(38),
  close_interval    NUMBER(38),
  close_interval1   NUMBER(38),
  expire_interval   NUMBER(38),
  max_grade         NUMBER(38),
  respond_grade     NUMBER(38),
  notify_way        NUMBER(38),
  sendmsgmethod     NUMBER(38),
  Task_sheet_flag   VARCHAR2(1),
   constraint PK_CASE_CATALOG_TABLE primary key (ORG_NO, CATALOG_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CASE_CATALOG_TABLE
  is 'CASE�����';
comment on column CASE_CATALOG_TABLE.org_no
  is '������';
comment on column CASE_CATALOG_TABLE.catalog_no
  is 'CASE�������ͺ�';
comment on column CASE_CATALOG_TABLE.catalog_name
  is '��������';
comment on column CASE_CATALOG_TABLE.responsor_catalog
  is '����������
1:�ܻ�Ա
2 :ά����Ա
3 :ά����Ա���ܻ�Ա';
comment on column CASE_CATALOG_TABLE.reply_interval
  is 'Ҫ��ظ�ʱ��(���У���λ������';
comment on column CASE_CATALOG_TABLE.onsite_interval
  is 'Ҫ�󵽳�ʱ��(���У���λ������';
comment on column CASE_CATALOG_TABLE.onsite_interval1
  is 'Ҫ�󵽳�ʱ��(����)';
comment on column CASE_CATALOG_TABLE.close_interval
  is 'Ҫ��ر�ʱ�䣨���У�';
comment on column CASE_CATALOG_TABLE.close_interval1
  is 'Ҫ��ر�ʱ�䣨���У�';
comment on column CASE_CATALOG_TABLE.expire_interval
  is 'Ҫ�����ʱ��';
comment on column CASE_CATALOG_TABLE.max_grade
  is '�����������case��������֪ͨ������';
comment on column CASE_CATALOG_TABLE.respond_grade
  is '��Ӧ����
1-����ʱ����Ӧ
2-7 x24Сʱ��Ӧ';
comment on column CASE_CATALOG_TABLE.notify_way
  is '֪ͨ��ʽ(1:���ţ�2���ʼ���3�����ź��ʼ�)';
comment on column CASE_CATALOG_TABLE.sendmsgmethod
  is 'CASE���Ͷ��ŷ�ʽ( 1.ȫ������; 0.�𼶷���)';
comment on column CASE_CATALOG_TABLE.Task_sheet_flag
  is '�Ƿ����ɹ��� 0�������ɹ��� 1�����ɹ���';

create table CASE_GRADE
(
  grade         NUMBER(38) not null,
  notify_way    NUMBER(38) default 1 not null,
  notify_times  NUMBER(38) default 1 not null,
  send_interval NUMBER(38) default 0 not null,
   constraint PK_CASE_GRADE primary key (GRADE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CASE_GRADE
  is 'CASE������';
comment on column CASE_GRADE.grade
  is 'CASE����';
comment on column CASE_GRADE.notify_way
  is '֪ͨ��ʽ';
comment on column CASE_GRADE.notify_times
  is '�ظ�֪ͨ����';
comment on column CASE_GRADE.send_interval
  is '�ظ�ʱ����';

create table CASE_NOTIFY
(
  notify_id     VARCHAR2(36) not null,
  case_no       VARCHAR2(36) not null,
  create_time   TIMESTAMP(6) not null,
  notify_type   NUMBER(38) not null,
  notify_way    NUMBER(38) not null,
  receiver      VARCHAR2(20) not null,
  mobile        VARCHAR2(20) not null,
  email         VARCHAR2(40),
  content       VARCHAR2(1024) not null,
  notify_times  NUMBER(38) default 1 not null,
  send_times    NUMBER(38) default 0 not null,
  send_time     TIMESTAMP(6),
  send_interval NUMBER(38),
  is_reply      NUMBER(38) default 0 not null,
  utno          VARCHAR2(8),
   constraint PK_CASE_NOTIFY primary key (NOTIFY_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
partition by range (CREATE_TIME)
(
  partition CASE_NOTIFY_PART1912 values less than (TIMESTAMP'2019-12-31 00:00:00')
    tablespace ZHYGSPACE,
  partition CASE_NOTIFY_PART2012 values less than (TIMESTAMP'2020-12-31 00:00:00')
    tablespace ZHYGSPACE,
  partition CASE_NOTIFY_MAXPART values less than (MAXVALUE)
    tablespace ZHYGSPACE
);
comment on table CASE_NOTIFY
  is 'CASE֪ͨ��';
comment on column CASE_NOTIFY.notify_id
  is '��ţ�UUID��';
comment on column CASE_NOTIFY.case_no
  is 'CASE���';
comment on column CASE_NOTIFY.create_time
  is '����ʱ��';
comment on column CASE_NOTIFY.notify_type
  is '֪ͨ���ͣ�1:������2��������3���رգ� 4������';
comment on column CASE_NOTIFY.notify_way
  is '֪ͨ��ʽ��1�����ţ�2���ʼ���';
comment on column CASE_NOTIFY.receiver
  is '֪ͨ����';
comment on column CASE_NOTIFY.mobile
  is '֪ͨ�ֻ�';
comment on column CASE_NOTIFY.email
  is '֪ͨ����';
comment on column CASE_NOTIFY.content
  is '֪ͨ����';
comment on column CASE_NOTIFY.notify_times
  is '�ظ�֪ͨ����';
comment on column CASE_NOTIFY.send_times
  is '��֪ͨ����';
comment on column CASE_NOTIFY.send_time
  is '���֪ͨʱ��';
comment on column CASE_NOTIFY.send_interval
  is '֪ͨ���ʱ��';
comment on column CASE_NOTIFY.is_reply
  is '�Ƿ�ظ�';
comment on column CASE_NOTIFY.utno
  is '���ѻ���';

create table CASE_TABLE
(
  case_no         VARCHAR2(36) not null,
  dev_no          VARCHAR2(20) not null,
  org_no          VARCHAR2(20) not null,
  vendor_no       NUMBER(38),
  dev_module      VARCHAR2(3) not null,
  catalog_no      NUMBER(38),
  create_type     CHAR(1) not null,
  creator         VARCHAR2(20),
  Task_sheet_flag  VARCHAR2(1),
  upgrade_type    CHAR(1) not null,
  fault_code      VARCHAR2(20),
  max_grade       NUMBER(38) not null,
  grade           NUMBER(38) not null,
  status          CHAR(1) not null,
  current_status  NUMBER(38),
  vendor_code     VARCHAR2(2048),
  description     VARCHAR2(500),
  solution        VARCHAR2(500),
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
  use_reply_time  NUMBER(38),
  use_onsite_time NUMBER(38),
  use_close_time  NUMBER(38),
   constraint PK_CASE_TABLE primary key (CASE_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
partition by range (OPEN_TIME)
(
  partition CASE_TABLE_PART1912 values less than (TIMESTAMP'2019-12-31 00:00:00')
    tablespace ZHYGSPACE,
  partition CASE_TABLE_PART2012 values less than (TIMESTAMP'2020-12-31 00:00:00')
    tablespace ZHYGSPACE,
  partition CASE_TABLE_MAXPART values less than (MAXVALUE)
    tablespace ZHYGSPACE
);
comment on table CASE_TABLE
  is 'CASE��';
comment on column CASE_TABLE.case_no
  is 'CASE���';
comment on column CASE_TABLE.dev_no
  is '�豸��';
comment on column CASE_TABLE.org_no
  is '������';
comment on column CASE_TABLE.vendor_no
  is '���̺�';
comment on column CASE_TABLE.dev_module
  is '�豸ģ��';
comment on column CASE_TABLE.catalog_no
  is 'CASE���༴���ϼ���';
comment on column CASE_TABLE.create_type
  is '���ɷ�ʽ��A���Զ���M���ֶ���';
comment on column CASE_TABLE.creator
  is '������Ա���ֶ�����CASEʹ�ã�';
comment on column CASE_TABLE.Task_sheet_flag
  is '������־ 0���ǹ��� 1������';
comment on column CASE_TABLE.upgrade_type
  is '������ʽ��A���Զ�  M���ֶ���';
comment on column CASE_TABLE.fault_code
  is '���ϴ���';
comment on column CASE_TABLE.max_grade
  is '�����������(CASE_CATALOG_TABLE. MAX_GRADE)';
comment on column CASE_TABLE.grade
  is 'ֵ��1һ CASE_CATALOG_TABLE. MAX_GRADE';
comment on column CASE_TABLE.status
  is 'CASE��״̬��O��Open��C��Close��W: wait��';
comment on column CASE_TABLE.current_status
  is '1���Ѵ���,2����֪ͨ,3��֪ͨ����(δʹ��),4����ȷ��,5��δ��Ӧ����,6������Ӧ,7����������,8:δ�ر�����,9:�ѹر�';
comment on column CASE_TABLE.vendor_code
  is '���̹�����';
comment on column CASE_TABLE.description
  is 'CASE����';
comment on column CASE_TABLE.solution
  is '����취';
comment on column CASE_TABLE.open_time
  is '����ʱ���';
comment on column CASE_TABLE.notify_time
  is '֪ͨʱ���';
comment on column CASE_TABLE.onsite_time
  is '����ʱ���';
comment on column CASE_TABLE.close_time
  is '�ر�ʱ���';
comment on column CASE_TABLE.expire_time
  is '����ʱ���';
comment on column CASE_TABLE.update_time
  is '����ʱ���';
comment on column CASE_TABLE.pre_reply_time
  is 'Ԥ�ڻظ�ʱ���';
comment on column CASE_TABLE.pre_onsite_time
  is 'Ԥ�ڵ���ʱ���';
comment on column CASE_TABLE.pre_close_time
  is 'Ԥ�ڹر�ʱ���';
comment on column CASE_TABLE.pre_expire_time
  is 'Ԥ�ڹ���ʱ���';
comment on column CASE_TABLE.use_reply_time
  is 'ʵ�ʻظ�ʱ��(��λ����)';
comment on column CASE_TABLE.use_onsite_time
  is 'ʵ�ʵ���ʱ��(��λ����)';
comment on column CASE_TABLE.use_close_time
  is 'ʵ�ʹر�ʱ������λ���ӣ�';

create table CASE_TRACE
(
  trace_id    VARCHAR2(36) not null,
  case_no     VARCHAR2(36) not null,
  trace_time  VARCHAR2(25) not null,
  trace_by    VARCHAR2(20),
  case_status VARCHAR2(36),
  content     VARCHAR2(512),
  fault_code  VARCHAR2(20),
  catalog_no  NUMBER(38),
   constraint PK_CASE_TRACE primary key (TRACE_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
partition by range (TRACE_TIME)
(
  partition CASE_TRACE_PART1912 values less than ('2019-12-32 23:59:59.999')
    tablespace ZHYGSPACE,
  partition CASE_TRACE_PART2012 values less than ('2020-12-32 23:59:59.999')
    tablespace ZHYGSPACE,
  partition CASE_TRACE_MAXPART values less than (MAXVALUE)
    tablespace ZHYGSPACE
);
comment on table CASE_TRACE
  is 'CASE���ٱ�';
comment on column CASE_TRACE.trace_id
  is '��ţ�UUID��';
comment on column CASE_TRACE.case_no
  is 'CASE���';
comment on column CASE_TRACE.trace_time
  is '��¼ʱ��';
comment on column CASE_TRACE.trace_by
  is '��¼��';
comment on column CASE_TRACE.case_status
  is 'CASE��ǰ״̬';
comment on column CASE_TRACE.content
  is '������Ϣ';
comment on column CASE_TRACE.fault_code
  is 'FAULT_CODE';
comment on column CASE_TRACE.catalog_no
  is 'CATALOG_NO';

create table DEV_ATTRIBUTE_TABLE
(
  dev_no                         VARCHAR2(20) not null,
  attribute_last_time            VARCHAR2(20),
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
  idc_variant                    VARCHAR2(20),
  idc_can_eject                  VARCHAR2(20),
  idc_can_capture                VARCHAR2(20),
  idc_bin_capacity               VARCHAR2(20),
  idc_can_dispense               VARCHAR2(20),
  idc_security                   VARCHAR2(50),
  idc_track_1_read               VARCHAR2(20),
  idc_track_1_write              VARCHAR2(20),
  idc_track_2_read               VARCHAR2(20),
  idc_track_2_write              VARCHAR2(20),
  idc_track_3_read               VARCHAR2(20),
  idc_track_3_write              VARCHAR2(20),
  idc_track_jisii_read           VARCHAR2(20),
  idc_track_jisii_write          VARCHAR2(20),
  cim_can_escrow                 VARCHAR2(20),
  cim_shutter_control_support    VARCHAR2(20),
  cim_max_accept_items           VARCHAR2(20),
  cim_can_detect_cash_inserted   VARCHAR2(20),
  cim_can_detect_cash_taken      VARCHAR2(20),
  cim_retract_area               VARCHAR2(50),
  cdm_has_stacker                VARCHAR2(20),
  cdm_has_shutter                VARCHAR2(20),
  cdm_can_retract                VARCHAR2(20),
  cdm_can_detect_cash_taken      VARCHAR2(20),
  cdm_can_test_phsical_units     VARCHAR2(20),
  cdm_max_dispense_bills         VARCHAR2(20),
  cdm_num_of_logical_cash_units  VARCHAR2(20),
  cdm_num_of_physical_cash_units VARCHAR2(20),
  cdm_num_of_currencies          VARCHAR2(20),
  cdm_currencies                 VARCHAR2(2000),
  cdm_exponents                  VARCHAR2(1000),
  dep_deposit_type               VARCHAR2(50),
  dep_can_dispense               VARCHAR2(20),
  dep_can_print                  VARCHAR2(20),
  dep_can_print_on_retracts      VARCHAR2(20),
  dep_can_retract                VARCHAR2(20),
  dep_max_print_length           VARCHAR2(20),
  ups_can_detect_low             VARCHAR2(20),
  ups_can_be_engaged             VARCHAR2(20),
  ups_can_detect_powing          VARCHAR2(20),
  ups_can_detect_recovered       VARCHAR2(20),
  ups_can_power_off              VARCHAR2(20),
  ups_can_power_cycle            VARCHAR2(20),
  spr_variant                    VARCHAR2(50),
  spr_can_eject                  VARCHAR2(20),
  spr_can_capture                VARCHAR2(20),
  spr_can_stack                  VARCHAR2(20),
  spr_max_retract                VARCHAR2(20),
  spr_max_strack                 VARCHAR2(20),
  chk_can_raw_print              VARCHAR2(20),
  chk_can_eject                  VARCHAR2(20),
  chk_can_stack                  VARCHAR2(20),
  chk_can_capture                VARCHAR2(20),
  chk_can_stamp                  VARCHAR2(20),
  chk_can_detect_media_taken     VARCHAR2(20),
  chk_can_read_front_image       VARCHAR2(20),
  chk_can_read_back_image        VARCHAR2(20),
  chk_can_read_code_line         VARCHAR2(20),
  chk_code_line_formats          VARCHAR2(60),
  chk_max_retract                VARCHAR2(20),
  chk_max_accept_items           VARCHAR2(20),
  chk_supported_image_formats    VARCHAR2(60),
  rpr_variant                    VARCHAR2(50),
  rpr_can_eject                  VARCHAR2(20),
  rpr_can_capture                VARCHAR2(20),
  rpr_can_stack                  VARCHAR2(20),
  rpr_max_retract                VARCHAR2(20),
  jpr_variant                    VARCHAR2(50),
  jpr_can_eject                  VARCHAR2(20),
  jpr_can_capture                VARCHAR2(20),
  jpr_can_stack                  VARCHAR2(20),
  ttu_alpha_numeric_keys_present VARCHAR2(20),
  ttu_hexadecimal_keys_present   VARCHAR2(20),
  ttu_numeric_keys_present       VARCHAR2(20),
  ttu_keyboard_lock_present      VARCHAR2(20),
  ttu_display_light_present      VARCHAR2(20),
  ttu_number_of_resolutions      VARCHAR2(50),
  ttu_cursor_supported           VARCHAR2(20),
  ttu_forms_supported            VARCHAR2(20),
  ttu_resolution_x               VARCHAR2(20),
  ttu_resolution_y               VARCHAR2(20),
  pbk_variant                    VARCHAR2(50),
  pbk_can_eject                  VARCHAR2(20),
  pbk_can_capture                VARCHAR2(20),
  pbk_can_stack                  VARCHAR2(20),
  pbk_max_retract                VARCHAR2(20),
  pin_can_ebc                    VARCHAR2(20),
  pin_can_cbc                    VARCHAR2(20),
  pin_can_mac                    VARCHAR2(20),
  pin_can_rsa                    VARCHAR2(20),
  pin_can_verify_des             VARCHAR2(20),
  pin_can_verify_ec              VARCHAR2(20),
  pin_can_verify_visa            VARCHAR2(20),
  pin_can_des_offset             VARCHAR2(20),
  pin_can_triple_ebc             VARCHAR2(20),
  pin_can_triple_cbc             VARCHAR2(20),
  pin_can_triple_mac             VARCHAR2(20),
  pin_can_triple_cfb             VARCHAR2(20),
  pin_function_keys_supported    VARCHAR2(150),
  siu_cabinet_can_bolt           VARCHAR2(20),
  siu_safe_can_bolt              VARCHAR2(20),
  siu_shield_can_keyboard        VARCHAR2(50),
  siu_shield_can_open            VARCHAR2(20),
  siu_shield_can_close           VARCHAR2(20),
  siu_shield_can_service         VARCHAR2(20),
  cam_max_pictures               VARCHAR2(20),
  cam_picture_info               VARCHAR2(20),
  cam_max_picture_info_size      VARCHAR2(20),
  icc_variant                    VARCHAR2(20),
  icc_can_eject                  VARCHAR2(20),
  icc_can_capture                VARCHAR2(20),
  icc_bin_capacity               VARCHAR2(20),
  icc_can_dispense               VARCHAR2(20),
  icc_security                   VARCHAR2(50),
  icc_track_1_read               VARCHAR2(20),
  icc_track_1_write              VARCHAR2(20),
  icc_track_2_read               VARCHAR2(20),
  icc_track_2_write              VARCHAR2(20),
  icc_track_3_read               VARCHAR2(20),
  icc_track_3_write              VARCHAR2(20),
  icc_track_jisii_read           VARCHAR2(20),
  icc_track_jisii_write          VARCHAR2(20),
  icc_exist                      CHAR(1),
  isc_variant                    VARCHAR2(20),
  isc_can_eject                  VARCHAR2(20),
  isc_can_capture                VARCHAR2(20),
  isc_bin_capacity               VARCHAR2(20),
  isc_can_dispense               VARCHAR2(20),
  isc_security                   VARCHAR2(50),
  isc_track_1_read               VARCHAR2(20),
  isc_track_1_write              VARCHAR2(20),
  isc_track_2_read               VARCHAR2(20),
  isc_track_2_write              VARCHAR2(20),
  isc_track_3_read               VARCHAR2(20),
  isc_track_3_write              VARCHAR2(20),
  isc_track_jisii_read           VARCHAR2(20),
  isc_track_jisii_write          VARCHAR2(20),
  isc_exist                      CHAR(1),
  irc_variant                    VARCHAR2(20),
  irc_can_eject                  VARCHAR2(20),
  irc_can_capture                VARCHAR2(20),
  irc_bin_capacity               VARCHAR2(20),
  irc_can_dispense               VARCHAR2(20),
  irc_security                   VARCHAR2(50),
  irc_track_1_read               VARCHAR2(20),
  irc_track_1_write              VARCHAR2(20),
  irc_track_2_read               VARCHAR2(20),
  irc_track_2_write              VARCHAR2(20),
  irc_track_3_read               VARCHAR2(20),
  irc_track_3_write              VARCHAR2(20),
  irc_track_jisii_read           VARCHAR2(20),
  irc_track_jisii_write          VARCHAR2(20),
  irc_exist                      CHAR(1),
  fpi_load_status                VARCHAR2(20),
  fpi_exist                      CHAR(1),
  crd_dispenseto                 VARCHAR2(20),
  ccd_dispenseto                 VARCHAR2(20),
  dpr_exist                      CHAR(1),
  dpr_variant                    VARCHAR2(20),
  dpr_can_eject                  VARCHAR2(20),
  dpr_can_capture                VARCHAR2(20),
  dpr_can_stack                  VARCHAR2(20),
  dpr_max_retract                VARCHAR2(20),
  bcr_exist                      CHAR(1),
  bcr_variant                    VARCHAR2(20),
  pjc_exist                      CHAR(1),
  pjc_datasource                 VARCHAR2(20),
  pjc_vdev                       VARCHAR2(1),
  pjc_realjpr                    VARCHAR2(20),
  pjc_mac                        VARCHAR2(1),
  pjc_ip                         VARCHAR2(20),
  pjc_pkt                        VARCHAR2(1),
  pjc_ejfile                     VARCHAR2(50),
  pjc_spacesize                  VARCHAR2(20),
  pjc_version                    VARCHAR2(50),
   constraint PK_DEV_ATTRIBUTE_TABLE primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_ATTRIBUTE_TABLE
  is '�豸ģ�����Ա�';
comment on column DEV_ATTRIBUTE_TABLE.dev_no
  is '�豸��';
comment on column DEV_ATTRIBUTE_TABLE.attribute_last_time
  is '�ϴθ������Ա�ʱ��';
comment on column DEV_ATTRIBUTE_TABLE.idc_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.cim_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.cdm_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.dep_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.ups_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.spr_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.chk_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.rpr_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.jpr_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.ttu_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.pbk_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.pin_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.siu_exist
  is 'Y �C ����
N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.cam_exist
  is 'Y �C ����
N �C ������';
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
  is '����ϻ����';
comment on column DEV_ATTRIBUTE_TABLE.idc_can_dispense
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.idc_security
  is '��ȫ����';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_1_read
  is '1�ŵ�������';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_1_write
  is '1�ŵ�д����';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_2_read
  is '2�ŵ�������';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_2_write
  is '2�ŵ�д����';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_3_read
  is '3�ŵ�������';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_3_write
  is '3�ŵ�д����';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_jisii_read
  is 'jisII�ŵ�������';
comment on column DEV_ATTRIBUTE_TABLE.idc_track_jisii_write
  is 'jisii�ŵ�д����';
comment on column DEV_ATTRIBUTE_TABLE.cim_can_escrow
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_shutter_control_support
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_max_accept_items
  is 'һ������ճ�����';
comment on column DEV_ATTRIBUTE_TABLE.cim_can_detect_cash_inserted
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_can_detect_cash_taken
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.cim_retract_area
  is '����������';
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
  is 'һ������������';
comment on column DEV_ATTRIBUTE_TABLE.cdm_num_of_logical_cash_units
  is '�߼�������';
comment on column DEV_ATTRIBUTE_TABLE.cdm_num_of_physical_cash_units
  is '����������';
comment on column DEV_ATTRIBUTE_TABLE.cdm_num_of_currencies
  is '֧�ֱ�����';
comment on column DEV_ATTRIBUTE_TABLE.cdm_currencies
  is '��������';
comment on column DEV_ATTRIBUTE_TABLE.cdm_exponents
  is 'ָ��';
comment on column DEV_ATTRIBUTE_TABLE.dep_deposit_type
  is '����';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_dispense
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_print
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_print_on_retracts
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_can_retract
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dep_max_print_length
  is '����ӡ����';
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
  is 'SPR�ͱ�';
comment on column DEV_ATTRIBUTE_TABLE.spr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.spr_max_retract
  is 'SPR��������';
comment on column DEV_ATTRIBUTE_TABLE.spr_max_strack
  is 'SPR����ݴ���';
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
  is '�����и�ʽ';
comment on column DEV_ATTRIBUTE_TABLE.chk_max_retract
  is 'CHK��������';
comment on column DEV_ATTRIBUTE_TABLE.chk_max_accept_items
  is 'һ�������ȡ֧Ʊ��';
comment on column DEV_ATTRIBUTE_TABLE.chk_supported_image_formats
  is '֧�ֵ�ͼ���ʽ';
comment on column DEV_ATTRIBUTE_TABLE.rpr_variant
  is 'RPR�ͱ�';
comment on column DEV_ATTRIBUTE_TABLE.rpr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.rpr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.rpr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.rpr_max_retract
  is 'RPR����������';
comment on column DEV_ATTRIBUTE_TABLE.jpr_variant
  is 'JPR�ͱ�';
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
  is '�ֱ���';
comment on column DEV_ATTRIBUTE_TABLE.ttu_cursor_supported
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_forms_supported
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.ttu_resolution_x
  is 'TTU_RESOLUTION_X';
comment on column DEV_ATTRIBUTE_TABLE.ttu_resolution_y
  is 'TTU_RESOLUTION_Y';
comment on column DEV_ATTRIBUTE_TABLE.pbk_variant
  is 'PBK�ͱ�';
comment on column DEV_ATTRIBUTE_TABLE.pbk_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pbk_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pbk_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.pbk_max_retract
  is 'PBK��������';
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
  is 'һ�����ͼƬ��';
comment on column DEV_ATTRIBUTE_TABLE.cam_picture_info
  is 'ͼƬ��Ϣ';
comment on column DEV_ATTRIBUTE_TABLE.cam_max_picture_info_size
  is '���ͼƬ��Ϣ�ߴ�';
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
  is '����ģ���Ƿ����';
comment on column DEV_ATTRIBUTE_TABLE.dpr_variant
  is '����ģ���ͱ�';
comment on column DEV_ATTRIBUTE_TABLE.dpr_can_eject
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dpr_can_capture
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dpr_can_stack
  is 'TRUE/FALSE';
comment on column DEV_ATTRIBUTE_TABLE.dpr_max_retract
  is '����ģ����������';
comment on column DEV_ATTRIBUTE_TABLE.bcr_exist
  is '��ά��ɨ����ģ���Ƿ����';
comment on column DEV_ATTRIBUTE_TABLE.bcr_variant
  is '��ά��ɨ����ģ���ͱ�';
comment on column DEV_ATTRIBUTE_TABLE.pjc_exist
  is 'Y �C ���� N �C ������';
comment on column DEV_ATTRIBUTE_TABLE.pjc_datasource
  is 'sp-SP���ط�ʽ��wsap-��ƽ̨ת����ʽ';
comment on column DEV_ATTRIBUTE_TABLE.pjc_vdev
  is '0-�����ã�DataSource= wsap����1-����ģʽ��2-����ģʽ';
comment on column DEV_ATTRIBUTE_TABLE.pjc_realjpr
  is 'PJC�Ƿ񷵻�������ӡ������״̬';
comment on column DEV_ATTRIBUTE_TABLE.pjc_mac
  is 'PJC��ˮMACУ���Ƿ���0-δ�򿪣�1-�Ѵ�';
comment on column DEV_ATTRIBUTE_TABLE.pjc_ip
  is 'PJC���õķ����IP��ַ';
comment on column DEV_ATTRIBUTE_TABLE.pjc_pkt
  is 'PJCʹ�õı�������0-���ģ�2-Json����';
comment on column DEV_ATTRIBUTE_TABLE.pjc_ejfile
  is '������ˮ����·��';
comment on column DEV_ATTRIBUTE_TABLE.pjc_spacesize
  is '��ֽ��������ˮ�����̷�ʣ��ռ��С����λ��M';
comment on column DEV_ATTRIBUTE_TABLE.pjc_version
  is 'PJC�汾��';

create table DEV_BASE_INFO
(
  no                  VARCHAR2(20) not null,
  ip                  VARCHAR2(20) not null,
  org_no              VARCHAR2(20) not null,
  Account_org_no      VARCHAR2(20),
  away_flag           VARCHAR2(2) not null,
  Self_bank_no        VARCHAR2(40),
  dev_catalog         VARCHAR2(5) not null,
  dev_vendor          VARCHAR2(5) not null,
  dev_type            VARCHAR2(5) not null,
  work_type           VARCHAR2(2) not null,
  status              VARCHAR2(2) not null,
  dev_service         VARCHAR2(40) not null,
  terminal_no         VARCHAR2(20),
  serial              VARCHAR2(40),
  address             VARCHAR2(80),
  buy_date            VARCHAR2(10),
  install_date        VARCHAR2(10),
  start_date          VARCHAR2(10),
  stop_date           VARCHAR2(10),
  open_time           VARCHAR2(10),
  close_time          VARCHAR2(10),
  expire_date         VARCHAR2(10),
  patrol_period       VARCHAR2(20),
  cashbox_limit       VARCHAR2(50),
  os                  VARCHAR2(50),
  atmc_soft           VARCHAR2(50),
  anti_virus_soft     VARCHAR2(50),
  sp                  VARCHAR2(50),
  virtual_teller_no   VARCHAR2(10),
  care_level          VARCHAR2(2),
  last_pm_date        VARCHAR2(10),
  expire_pm_date      VARCHAR2(10),
  locate_no           VARCHAR2(10),
  note1               VARCHAR2(30),
  note2               VARCHAR2(30),
  note3               VARCHAR2(30),
  note4               VARCHAR2(30),
  note5               VARCHAR2(30),
  carrier             VARCHAR2(20),
  money_org           VARCHAR2(20),
  dev_status          VARCHAR2(2),
  environment         VARCHAR2(256),
  address_code        VARCHAR2(20),
  cash_type           VARCHAR2(2),
  setup_type          VARCHAR2(2),
  net_type            VARCHAR2(2),
  operate_status      VARCHAR2(2),
  registration_status VARCHAR2(2),
  comm_packet         VARCHAR2(20),
  zip_type            VARCHAR2(2),
  dek_encoded         VARCHAR2(100),
  atmp_area           VARCHAR2(10),
  dev_log_path        VARCHAR2(200),
  trans_rate          VARCHAR2(20),
  x                   VARCHAR2(20),
  y                   VARCHAR2(20),
  comm_cst_no         VARCHAR2(100),
  area_no             VARCHAR2(10),
  term_account_no     VARCHAR2(22),
  management_name     VARCHAR2(60),
  account_type        Number(5,0),
  card_flag           Number(5,0),
  check_org           VARCHAR2(20),
  tradingvolume       Number(5,0),
  encryptmode         VARCHAR2(10),
  cycle_flag          Number(5,0),
  region              VARCHAR2(30),
  city                VARCHAR2(30),
  manage_org_no       VARCHAR2(20),
  route               VARCHAR2(32),
   constraint PK_DEV_BASE_INFO primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_BASE_INFO
  is '�豸������Ϣ��';
comment on column DEV_BASE_INFO.no
  is '�豸��';
comment on column DEV_BASE_INFO.ip
  is '�豸IP��ַ';
comment on column DEV_BASE_INFO.org_no
  is '������������֯����/����������';
comment on column DEV_BASE_INFO.Account_org_no
  is '���������';
comment on column DEV_BASE_INFO.away_flag
  is '�������б�־ 1�����У�2������';
comment on column DEV_BASE_INFO.Self_bank_no
  is '�������кţ������豸���ø��ֶ�';
comment on column DEV_BASE_INFO.dev_catalog
  is '�豸����';
comment on column DEV_BASE_INFO.dev_vendor
  is '�豸Ʒ��';
comment on column DEV_BASE_INFO.dev_type
  is '�豸�ͺ�';
comment on column DEV_BASE_INFO.work_type
  is '��Ӫ��ʽ 1����Ӫ  2����Ӫ';
comment on column DEV_BASE_INFO.status
  is '�����ֶν�ֹʹ�ã��豸״̬ 1������  2��ͣ��';
comment on column DEV_BASE_INFO.dev_service
  is '�豸ά���� ';
comment on column DEV_BASE_INFO.terminal_no
  is '�ն˺�';
comment on column DEV_BASE_INFO.serial
  is '�豸���к� :���̳��������к�';
comment on column DEV_BASE_INFO.address
  is '�豸��ַ';
comment on column DEV_BASE_INFO.buy_date
  is '�豸�������� yyyy-mm-dd';
comment on column DEV_BASE_INFO.install_date
  is '�豸��װ���� yyyy-mm-dd';
comment on column DEV_BASE_INFO.start_date
  is '�豸�������� yyyy-mm-dd';
comment on column DEV_BASE_INFO.stop_date
  is '�豸ͣ������ yyyy-mm-dd';
comment on column DEV_BASE_INFO.open_time
  is 'ÿ�տ���ʱ�� yyyy-mm-dd';
comment on column DEV_BASE_INFO.close_time
  is 'ÿ�չػ�ʱ�� yyyy-mm-dd';
comment on column DEV_BASE_INFO.expire_date
  is '���޵������� yyyy-mm-dd';
comment on column DEV_BASE_INFO.patrol_period
  is '�豸Ѳ������';
comment on column DEV_BASE_INFO.cashbox_limit
  is 'Ǯ�䱨�����';
comment on column DEV_BASE_INFO.os
  is '����ϵͳ';
comment on column DEV_BASE_INFO.atmc_soft
  is 'atmc���� 1:wsap ;2:WSAPPlus ;3:ZJUAP;9:����ATMC';
comment on column DEV_BASE_INFO.anti_virus_soft
  is '����������';
comment on column DEV_BASE_INFO.sp
  is '����sp����';
comment on column DEV_BASE_INFO.virtual_teller_no
  is '�����Ա��';
comment on column DEV_BASE_INFO.care_level
  is '�豸��ע�̶� 1-�ص� 2-�е� 3-һ��';
comment on column DEV_BASE_INFO.last_pm_date
  is '�ϴ�Ѳ������';
comment on column DEV_BASE_INFO.expire_pm_date
  is 'Ѳ�쵽������';
comment on column DEV_BASE_INFO.locate_no
  is '����λ��';
comment on column DEV_BASE_INFO.note1
  is '����1:�豸Ӫ��״̬ 1���� 2ͣ��';
comment on column DEV_BASE_INFO.note2
  is '����2:����ä�� 0-�� 1-�У�Ĭ��0';
comment on column DEV_BASE_INFO.note3
  is '����3:��������';
comment on column DEV_BASE_INFO.note4
  is '����4';
comment on column DEV_BASE_INFO.note5
  is '����5';
comment on column DEV_BASE_INFO.carrier
  is '��Ӫ��';
comment on column DEV_BASE_INFO.money_org
  is '�ӳ�����';
comment on column DEV_BASE_INFO.dev_status
  is '�豸״̬ :1������ 2��ͣ�� 3������ 4������ 5������ 6������ 7���ػ� 8������';
comment on column DEV_BASE_INFO.environment
  is '�ܱ߻���';
comment on column DEV_BASE_INFO.address_code
  is '�ص����';
comment on column DEV_BASE_INFO.cash_type
  is '���ֽ��־: 1���ֽ�2�����ֽ�';
comment on column DEV_BASE_INFO.setup_type
  is '��װ��ʽ:0�����ã�1����ǽ ';
comment on column DEV_BASE_INFO.net_type
  is '�������߱�־:C��cable���� W��wireless����';
comment on column DEV_BASE_INFO.operate_status
  is '���豸ͣ������ʹ�ã���Ӫ״̬:1�� ���� 2��ͣ��';
comment on column DEV_BASE_INFO.registration_status
  is 'ע��״̬:0��δע�� 1��ע��';
comment on column DEV_BASE_INFO.comm_packet
  is 'ͨѶÿ�������С:�����豸��ʼ8000�����豸��ʼ256';
comment on column DEV_BASE_INFO.zip_type
  is 'ͨѶ����ѹ����ʽ:0����ѹ��;1��δʹ�ã�2��zipѹ����3��gzipѹ��;�����豸��ʼ:0 �����豸��ʼ:3 ';
comment on column DEV_BASE_INFO.dek_encoded
  is 'MAK��Կ';
comment on column DEV_BASE_INFO.atmp_area
  is 'p��������';
comment on column DEV_BASE_INFO.dev_log_path
  is '��־·��';
comment on column DEV_BASE_INFO.trans_rate
  is '�ļ������ٶ�����';
comment on column DEV_BASE_INFO.x
  is '�����꣨���ȣ�';
comment on column DEV_BASE_INFO.y
  is '�����꣨γ�ȣ�';
comment on column DEV_BASE_INFO.area_no
  is '������';
comment on column DEV_BASE_INFO.term_account_no
  is '�ն��˻��˺�';
comment on column DEV_BASE_INFO.management_name
  is '����Ա����';
comment on column DEV_BASE_INFO.account_type
  is '�ʻ�����';
comment on column DEV_BASE_INFO.card_flag
  is '���۱�־';
comment on column DEV_BASE_INFO.check_org
  is '�������';
comment on column DEV_BASE_INFO.tradingvolume
  is 'ҵ����Ŀ��ֵ';
comment on column DEV_BASE_INFO.encryptmode
  is '�ն����ݼ���ģʽ';
comment on column DEV_BASE_INFO.cycle_flag
  is '�Ƿ�ͨѭ����CRS�豸����0-δ��ͨ��1-��ͨ';
comment on column DEV_BASE_INFO.region
  is 'ʡ';
comment on column DEV_BASE_INFO.city
  is '��';
comment on column DEV_BASE_INFO.manage_org_no
  is '����������';
comment on column DEV_BASE_INFO.route
  is '����ӳ���·';
comment on column DEV_BASE_INFO.comm_cst_no
  is '�徭�ú�����ͻ���';

-- ----------------------------
-- Table structure for DEV_OPERATE_INFO
-- ----------------------------
create table DEV_OPERATE_INFO
(
  no                   VARCHAR2(20) not null,
  quarter_lease_amount VARCHAR2(20),
  cooperation_number   NUMBER(10) not null,
  selfbank             VARCHAR2(1),
  investment           VARCHAR2(1),
  area_div             CHAR(1) not null,
  belongarea           VARCHAR2(50) not null,
  cooperation          VARCHAR2(255),
  change_date          VARCHAR2(10),
  use_status           CHAR(1) not null,
  assets_no            VARCHAR2(20),
  network_operator     VARCHAR2(20) not null,
  remark               VARCHAR2(200),
  install_site         VARCHAR2(120),
  case_way             CHAR(1)
)
tablespace ZHYGSPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DEV_OPERATE_INFO
  is '�豸��Ӫ��Ϣ��';
comment on column DEV_OPERATE_INFO.no
  is '�豸��';
comment on column DEV_OPERATE_INFO.quarter_lease_amount
  is '�������޷��� ��λ��Ԫ';
comment on column DEV_OPERATE_INFO.cooperation_number
  is 'ÿ����������';
comment on column DEV_OPERATE_INFO.selfbank
  is '�Ƿ��������У�0-��1-�� �����������ã�һ�������������̨���ϵ��豸����ô����豸�������������е��豸';
comment on column DEV_OPERATE_INFO.investment
  is 'Ͷ�����壺1-���У�2-���У�3-֧��  �����������ã��豸��Ͷ�뷽����';
comment on column DEV_OPERATE_INFO.area_div
  is '������1-��������2-����������3-����������Ĭ��1-������';
comment on column DEV_OPERATE_INFO.belongarea
  is '��������';
comment on column DEV_OPERATE_INFO.cooperation
  is '��Ӧ�̣���ѡ��ͬ���С��豸ά���̡��ֶ�';
comment on column DEV_OPERATE_INFO.change_date
  is '�豸�������ڣ�ͬ�豸��װ����һ�������ڿؼ�';
comment on column DEV_OPERATE_INFO.use_status
  is 'ʹ��״̬�������򣬱��䱸ѡ�1-���ã�2-δ�ã�3-���ϣ�Ĭ�ϣ�1-����';
comment on column DEV_OPERATE_INFO.assets_no
  is '�̶��ʲ����';
comment on column DEV_OPERATE_INFO.network_operator
  is '������Ӫ��';
comment on column DEV_OPERATE_INFO.remark
  is '��ע��TextArae���Ǳ���';
comment on column DEV_OPERATE_INFO.install_site
  is '��װ����';
comment on column DEV_OPERATE_INFO.case_way
  is '�ӳ���ʽ:1-������2-�����Ĭ��1-����';


create table DEV_CASENO_TABLE
(
  dev_no      VARCHAR2(20) not null,
  idc_case_no VARCHAR2(36),
  cim_case_no VARCHAR2(36),
  cdm_case_no VARCHAR2(36),
  dep_case_no VARCHAR2(36),
  ups_case_no VARCHAR2(36),
  spr_case_no VARCHAR2(36),
  rpr_case_no VARCHAR2(36),
  jpr_case_no VARCHAR2(36),
  chk_case_no VARCHAR2(36),
  ttu_case_no VARCHAR2(36),
  pbk_case_no VARCHAR2(36),
  pin_case_no VARCHAR2(36),
  siu_case_no VARCHAR2(36),
  cam_case_no VARCHAR2(36),
  net_case_no VARCHAR2(36),
  cny_case_no VARCHAR2(36),
  hkd_case_no VARCHAR2(36),
  icc_case_no VARCHAR2(36),
  isc_case_no VARCHAR2(36),
  irc_case_no VARCHAR2(36),
  fpi_case_no VARCHAR2(36),
  crd_case_no VARCHAR2(36),
  ccd_case_no VARCHAR2(36),
  dpr_case_no VARCHAR2(36),
  bcr_case_no VARCHAR2(36),
   constraint PK_DEV_CASENO_TABLE primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_CASENO_TABLE
  is '�豸��ǰCASE��';
comment on column DEV_CASENO_TABLE.dev_no
  is '�豸��';
comment on column DEV_CASENO_TABLE.idc_case_no
  is '������ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.cim_case_no
  is '���ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.cdm_case_no
  is 'ȡ��ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.dep_case_no
  is '�ŷ�ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.ups_case_no
  is '����ϵ�Դģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.spr_case_no
  is '�ᵥ��ӡģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.rpr_case_no
  is 'ƾ����ӡ��ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.jpr_case_no
  is '��־��ӡ��ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.chk_case_no
  is '֧Ʊ��ɨ��ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.ttu_case_no
  is '�ı��ն˵�Ԫģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.pbk_case_no
  is '���۴�ӡ��ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.pin_case_no
  is '�������ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.siu_case_no
  is '������ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.cam_case_no
  is '�����ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.net_case_no
  is '������϶�Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.cny_case_no
  is '�����ȡ��ģ���Ӧ��CASE�ţ�����������ʹ�ã�';
comment on column DEV_CASENO_TABLE.hkd_case_no
  is '�۱�ȡ��ģ���ӦCASE�ţ�����������ʹ�ã�';
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
  is '����ģ���Ӧ��CASE��';
comment on column DEV_CASENO_TABLE.bcr_case_no
  is '��ά��ɨ����ģ���Ӧ��CASE��';

create table DEV_CATALOG_TABLE
(
  no           VARCHAR2(5) not null,
  name         VARCHAR2(30) not null,
  enname       VARCHAR2(30),
  monitor_type VARCHAR2(2),
  channel_type VARCHAR2(2),
   constraint PK_DEV_CATALOG_TABLE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_CATALOG_TABLE
  is '�豸���ͱ�';
comment on column DEV_CATALOG_TABLE.no
  is '��� 10001	�Զ���ȡ���(CRS) 10002	�Զ�����(CDM) 10003	�Զ�ȡ���(ATM) 10004	BSM/��ѯ�� 10005   ����/�����ն�/�ֳ��� 10006   �ص��� 10007   ��� 10008   ������ 10009   �кŻ� 10010   �����  ';
comment on column DEV_CATALOG_TABLE.name
  is '�豸����';
comment on column DEV_CATALOG_TABLE.enname
  is '����';
comment on column DEV_CATALOG_TABLE.monitor_type
  is '�������[1:��ͳ�ֽ������豸][2:������][3:���ֽ������豸] [4:��ý������][5:�����ֽ������豸][6:�ص���][7:���][8:�кŻ�] [���� ����Ҫ��ص��豸]';
comment on column DEV_CATALOG_TABLE.channel_type
  is '��������[1:��������][2:��������][3:��ý������] [4:����ͷ] [5:�кŻ�����]';

create table DEV_FAULTNO_TABLE
(
  dev_no       VARCHAR2(20) not null,
  idc_fault_no VARCHAR2(36),
  cim_fault_no VARCHAR2(36),
  cdm_fault_no VARCHAR2(36),
  dep_fault_no VARCHAR2(36),
  ups_fault_no VARCHAR2(36),
  spr_fault_no VARCHAR2(36),
  rpr_fault_no VARCHAR2(36),
  jpr_fault_no VARCHAR2(36),
  chk_fault_no VARCHAR2(36),
  ttu_fault_no VARCHAR2(36),
  pbk_fault_no VARCHAR2(36),
  pin_fault_no VARCHAR2(36),
  siu_fault_no VARCHAR2(36),
  cam_fault_no VARCHAR2(36),
  icc_fault_no VARCHAR2(36),
  isc_fault_no VARCHAR2(36),
  irc_fault_no VARCHAR2(36),
  fpi_fault_no VARCHAR2(36),
  crd_fault_no VARCHAR2(36),
  ccd_fault_no VARCHAR2(36),
  dpr_fault_no VARCHAR2(36),
  bcr_fault_no VARCHAR2(36),
   constraint PK_DEV_FAULTNO_TABLE primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_FAULTNO_TABLE
  is '�豸��ǰ���ϱ�';
comment on column DEV_FAULTNO_TABLE.dev_no
  is '�豸��';
comment on column DEV_FAULTNO_TABLE.idc_fault_no
  is '������ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.cim_fault_no
  is '���ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.cdm_fault_no
  is 'ȡ��ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.dep_fault_no
  is '�ŷ�ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.ups_fault_no
  is '����ϵ�Դģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.spr_fault_no
  is '�ᵥ��ӡģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.rpr_fault_no
  is 'ƾ����ӡ��ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.jpr_fault_no
  is '��־��ӡ��ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.chk_fault_no
  is '֧Ʊ��ɨ��ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.ttu_fault_no
  is '�ı��ն˵�Ԫģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.pbk_fault_no
  is '���۴�ӡģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.pin_fault_no
  is '�������ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.siu_fault_no
  is '������ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.cam_fault_no
  is '�����ģ���Ӧ�Ĺ��Ϻ�';
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
  is '����ģ���Ӧ�Ĺ��Ϻ�';
comment on column DEV_FAULTNO_TABLE.bcr_fault_no
  is '��ά��ɨ����ģ���Ӧ�Ĺ��Ϻ�';

create table DEV_HARDWARE_INFO
(
  dev_no           VARCHAR2(20) not null,
  bios_version     VARCHAR2(120),
  hardware_cpu     VARCHAR2(50),
  hardware_memory  VARCHAR2(40),
  hardware_hardisk VARCHAR2(40),
  firmware_idc     VARCHAR2(60),
  firmware_cdm     VARCHAR2(60),
  firmware_cim     VARCHAR2(60),
  firmware_pin     VARCHAR2(60),
  firmware_jpr     VARCHAR2(60),
  firmware_rpr     VARCHAR2(60),
  firmware_siu     VARCHAR2(60),
  firmware_ttu     VARCHAR2(60),
  firmware_vdm     VARCHAR2(60),
  firmware_bv      VARCHAR2(60),
  firmware_icc     VARCHAR2(60),
  firmware_isc     VARCHAR2(60),
  firmware_irc     VARCHAR2(60),
  firmware_fpi     VARCHAR2(60),
  firmware_crd     VARCHAR2(60),
  firmware_ccd     VARCHAR2(60),
  firmware_dpr     VARCHAR2(60),
  firmware_bcr     VARCHAR2(60),
   constraint PK_DEV_HARDWARE_INFO primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_HARDWARE_INFO
  is '�豸Ӳ����Ϣ��';
comment on column DEV_HARDWARE_INFO.dev_no
  is '�豸��';
comment on column DEV_HARDWARE_INFO.bios_version
  is 'BIOS�汾��';
comment on column DEV_HARDWARE_INFO.hardware_cpu
  is '������';
comment on column DEV_HARDWARE_INFO.hardware_memory
  is '�ڴ�';
comment on column DEV_HARDWARE_INFO.hardware_hardisk
  is 'Ӳ��';
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
  is 'FIRMWARE_DPR(����ģ��)';
comment on column DEV_HARDWARE_INFO.firmware_bcr
  is 'FIRMWARE_BCR(��ά��ɨ����ģ��)';


create table DEV_RESPONSOR_TABLE
(
  logic_id     VARCHAR2(36) not null,
  dev_no       VARCHAR2(20) not null,
  catalog      VARCHAR2(2) not null,
  grade        VARCHAR2(2) not null,
  responser_no VARCHAR2(40) not null,
   constraint PK_DEV_RESPONSOR_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_RESPONSOR_TABLE
  is '�豸�����˱�';
comment on column DEV_RESPONSOR_TABLE.logic_id
  is '���';
comment on column DEV_RESPONSOR_TABLE.dev_no
  is '�豸��';
comment on column DEV_RESPONSOR_TABLE.catalog
  is '�����˷��ࣺ1 �C �ܻ�Ա 2 �C ά����Ա';
comment on column DEV_RESPONSOR_TABLE.grade
  is '�����˼���1,2,3,4��case����Ե�,(����Խ�󼶱�Խ��)';
comment on column DEV_RESPONSOR_TABLE.responser_no
  is '�����˱��';

create table DEV_SERVICE_COMPANY
(
  no      VARCHAR2(40) not null,
  name    VARCHAR2(80) not null,
  linkman VARCHAR2(30),
  address VARCHAR2(80),
  phone   VARCHAR2(30),
  mobile  VARCHAR2(30),
  fax     VARCHAR2(30),
  email   VARCHAR2(40),
  infofilepath   VARCHAR2(500),
  infofilename   VARCHAR2(50),
   constraint PK_DEV_SERVICE_COMPANY primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_SERVICE_COMPANY
  is '�豸ά���̱�';
comment on column DEV_SERVICE_COMPANY.no
  is '��� UUID';
comment on column DEV_SERVICE_COMPANY.name
  is '����������';
comment on column DEV_SERVICE_COMPANY.linkman
  is '��ϵ��';
comment on column DEV_SERVICE_COMPANY.address
  is '��ַ';
comment on column DEV_SERVICE_COMPANY.phone
  is '�̶��绰';
comment on column DEV_SERVICE_COMPANY.mobile
  is '�ֻ�';
comment on column DEV_SERVICE_COMPANY.fax
  is '����';
comment on column DEV_SERVICE_COMPANY.email
  is '��������';
comment on column DEV_SERVICE_COMPANY.infofilepath
  is 'ά���������Ϣ�ļ����·��������·��';
comment on column DEV_SERVICE_COMPANY.infofilename
  is 'ά���������Ϣ�ļ����ƣ�����׺';

create table DEV_SERVICE_PERSON
(
  no       VARCHAR2(40) not null,
  name     VARCHAR2(20) not null,
  belongto VARCHAR2(40) not null,
  status   VARCHAR2(2) not null,
  phone    VARCHAR2(20),
  mobile   VARCHAR2(20),
  email    VARCHAR2(40),
  leader   VARCHAR2(20),
   constraint PK_DEV_SERVICE_PERSON primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_SERVICE_PERSON
  is '�豸ά��Ա��';
comment on column DEV_SERVICE_PERSON.no
  is '��� uuid';
comment on column DEV_SERVICE_PERSON.name
  is '����';
comment on column DEV_SERVICE_PERSON.belongto
  is '����ά���� uuid';
comment on column DEV_SERVICE_PERSON.status
  is '״̬��1������  2��ͣ��  ';
comment on column DEV_SERVICE_PERSON.phone
  is '�̶��绰';
comment on column DEV_SERVICE_PERSON.mobile
  is '�ֻ�';
comment on column DEV_SERVICE_PERSON.email
  is '��������';
comment on column DEV_SERVICE_PERSON.leader
  is 'ά��Ա�ϼ�';

create table DEV_SOFTWARE_INFO
(
  dev_no                     VARCHAR2(20) not null,
  operating_sys              VARCHAR2(40),
  operating_version          VARCHAR2(40),
  operating_patch_version    VARCHAR2(40),
  antivirus_system           VARCHAR2(100),
  antivirus_version          VARCHAR2(40),
  antivirus_definition       VARCHAR2(100),
  sp_version                 VARCHAR2(40),
  app_version                VARCHAR2(40),
  chk_cash_data              VARCHAR2(40),
  software_list              VARCHAR2(2000),
  sp_idc                     VARCHAR2(60),
  sp_cdm                     VARCHAR2(60),
  sp_cim                     VARCHAR2(60),
  sp_pin                     VARCHAR2(60),
  sp_jpr                     VARCHAR2(60),
  sp_rpr                     VARCHAR2(60),
  sp_siu                     VARCHAR2(60),
  sp_ttu                     VARCHAR2(60),
  sp_vdm                     VARCHAR2(60),
  setupflag                  VARCHAR2(10),
  takeeffectflag             VARCHAR2(10),
  version                    VARCHAR2(10),
  sp_icc                     VARCHAR2(60),
  sp_isc                     VARCHAR2(60),
  sp_irc                     VARCHAR2(60),
  sp_fpi                     VARCHAR2(60),
  sp_crd                     VARCHAR2(60),
  sp_ccd                     VARCHAR2(60),
  sp_dpr                     VARCHAR2(60),
  sp_bcr                     VARCHAR2(60),
  serial_no_info_status      VARCHAR2(2),
  txt_info_status            VARCHAR2(2),
  cimsrp_flag                VARCHAR2(2),
  cdmsrp_flag                VARCHAR2(2),
  nts_support_snr            VARCHAR2(2),
  nts_snr_flag               VARCHAR2(2),
  nts_support_serial_numbers VARCHAR2(2),
  nts_open_serial_numbers_jp VARCHAR2(2),
  nts_open_serial_numbers_rp VARCHAR2(2),
   constraint PK_DEV_SOFTWARE_INFO primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_SOFTWARE_INFO
  is '�豸������Ϣ�� ';
comment on column DEV_SOFTWARE_INFO.dev_no
  is '�豸��';
comment on column DEV_SOFTWARE_INFO.operating_sys
  is '����ϵͳ';
comment on column DEV_SOFTWARE_INFO.operating_version
  is '����ϵͳ�汾��';
comment on column DEV_SOFTWARE_INFO.operating_patch_version
  is '����ϵͳ�����汾';
comment on column DEV_SOFTWARE_INFO.antivirus_system
  is '��������';
comment on column DEV_SOFTWARE_INFO.antivirus_version
  is '���������汾';
comment on column DEV_SOFTWARE_INFO.antivirus_definition
  is '��������';
comment on column DEV_SOFTWARE_INFO.sp_version
  is 'Ӳ��SP';
comment on column DEV_SOFTWARE_INFO.app_version
  is 'Ӧ�ð汾';
comment on column DEV_SOFTWARE_INFO.chk_cash_data
  is '�鳮���ݰ汾';
comment on column DEV_SOFTWARE_INFO.software_list
  is '��װ�����б�';
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
  is '��װ��־ TRUE����װ��FALSE��δ��װ';
comment on column DEV_SOFTWARE_INFO.takeeffectflag
  is 'ʹ�ñ�־TRUE��ʹ�ã�FALSE��δʹ��';
comment on column DEV_SOFTWARE_INFO.version
  is '��ֽ���汾��';
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
  is 'SP_DPR(����ģ��)';
comment on column DEV_SOFTWARE_INFO.sp_bcr
  is 'SP_BCR(��ά��ɨ����ģ��)';
comment on column DEV_SOFTWARE_INFO.serial_no_info_status
  is '���ֺŻ��濪��״̬��1:������0:�رգ�  ������δ֪��';
comment on column DEV_SOFTWARE_INFO.txt_info_status
  is '�ֽ𻺴濪��״̬��1:������0:�رգ�  ������δ֪��';
comment on column DEV_SOFTWARE_INFO.cimsrp_flag
  is '�����ֺ�ƾ����ӡ����״̬��1:������0:�رգ� ������δ֪��';
comment on column DEV_SOFTWARE_INFO.cdmsrp_flag
  is 'ȡ����ֺ�ƾ����ӡ����״̬��1:������0:�رգ�������δ֪��';
comment on column DEV_SOFTWARE_INFO.nts_support_snr
  is '�Ƿ�֧�ֹ��ֺŹ��� 1:֧�� 0: ��֧��';
comment on column DEV_SOFTWARE_INFO.nts_snr_flag
  is '���ֺŹ����Ƿ��ѿ�ͨ 1:�ѿ�ͨ 0:δ��ͨ';
comment on column DEV_SOFTWARE_INFO.nts_support_serial_numbers
  is 'Ӧ���Ƿ�֧�ֹ��ֺ� 1:֧�� 0:��֧��';
comment on column DEV_SOFTWARE_INFO.nts_open_serial_numbers_jp
  is 'Ӧ���Ƿ񿪷Ź��ֺ���־��ӡ���ܣ�2-ֻ��ӡ�泮��1-�泮�ܳ�ȫ����ӡ,0������ͨ';
comment on column DEV_SOFTWARE_INFO.nts_open_serial_numbers_rp
  is 'Ӧ���Ƿ�ͨ���ֺ�ƾ����ӡ��2-ֻ��ӡ�泮��1-�泮�ܳ�ȫ����ӡ,0������ͨ';

create table DEV_STATUS_CODE
(
  dev_no   VARCHAR2(20) not null,
  idc_code VARCHAR2(15),
  cim_code VARCHAR2(15),
  cdm_code VARCHAR2(15),
  dep_code VARCHAR2(15),
  ups_code VARCHAR2(15),
  spr_code VARCHAR2(15),
  rpr_code VARCHAR2(15),
  jpr_code VARCHAR2(15),
  chk_code VARCHAR2(15),
  ttu_code VARCHAR2(15),
  pbk_code VARCHAR2(15),
  pin_code VARCHAR2(15),
  siu_code VARCHAR2(15),
  cam_code VARCHAR2(15),
  icc_code VARCHAR2(15),
  isc_code VARCHAR2(15),
  irc_code VARCHAR2(15),
  fpi_code VARCHAR2(15),
  crd_code VARCHAR2(15),
  ccd_code VARCHAR2(15),
  dpr_code VARCHAR2(15),
  bcr_code VARCHAR2(15),
   constraint PK_DEV_STATUS_CODE primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_STATUS_CODE
  is '�豸��ǰ״̬��';
comment on column DEV_STATUS_CODE.dev_no
  is '�豸��';
comment on column DEV_STATUS_CODE.idc_code
  is '������ģ���Ӧ������';
comment on column DEV_STATUS_CODE.cim_code
  is '���ģ���Ӧ������';
comment on column DEV_STATUS_CODE.cdm_code
  is 'ȡ��ģ���Ӧ������';
comment on column DEV_STATUS_CODE.dep_code
  is '�ŷ�ģ���Ӧ������';
comment on column DEV_STATUS_CODE.ups_code
  is '����ϵ�Դģ���Ӧ������';
comment on column DEV_STATUS_CODE.spr_code
  is '�ᵥ��ӡģ���Ӧ������';
comment on column DEV_STATUS_CODE.rpr_code
  is 'ƾ����ӡ��ģ���Ӧ������';
comment on column DEV_STATUS_CODE.jpr_code
  is '��־��ӡ��ģ���Ӧ������';
comment on column DEV_STATUS_CODE.chk_code
  is '֧Ʊ��ɨ��ģ���Ӧ������';
comment on column DEV_STATUS_CODE.ttu_code
  is '�ı��ն˵�Ԫģ���Ӧ������';
comment on column DEV_STATUS_CODE.pbk_code
  is '���۴�ӡ��ģ���Ӧ������';
comment on column DEV_STATUS_CODE.pin_code
  is '�������ģ���Ӧ������';
comment on column DEV_STATUS_CODE.siu_code
  is '������ģ���Ӧ������';
comment on column DEV_STATUS_CODE.cam_code
  is '�����ģ���Ӧ������';
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
  is '����ģ���Ӧ������';
comment on column DEV_STATUS_CODE.bcr_code
  is '��ά��ɨ����ģ���Ӧ������';

create table DEV_STATUS_TABLE
(
  dev_no                        VARCHAR2(20) not null,
  dev_status                    VARCHAR2(20) not null,
  dev_tx_status                 VARCHAR2(20) not null,
  dev_net_status                VARCHAR2(20) not null,
  dev_run_status                VARCHAR2(20) not null,
  dev_cash_status               CHAR(1),
  dev_crs_status                CHAR(1),
  action_type                   VARCHAR2(2),
  action_note                   VARCHAR2(2),
  dev_cashbox_status            VARCHAR2(20) not null,
  dev_mod_status                VARCHAR2(20) not null,
  dev_potential_fault           VARCHAR2(20),
  status_last_time              CHAR(14),
  status_expire_time            CHAR(14),
  tx_type                       VARCHAR2(15),
  tx_time                       CHAR(14),
  atm_type                      CHAR(1),
  cash_unit_type                CHAR(1),
  status_info_type              CHAR(1),
  combin_unit_type              CHAR(1),
  idc_device_status             VARCHAR2(15),
  cim_device_status             VARCHAR2(15),
  cdm_device_status             VARCHAR2(15),
  dep_device_status             VARCHAR2(15),
  ups_device_status             VARCHAR2(15),
  spr_device_status             VARCHAR2(15),
  rpr_device_status             VARCHAR2(15),
  jpr_device_status             VARCHAR2(15),
  chk_device_status             VARCHAR2(15),
  ttu_device_status             VARCHAR2(15),
  pbk_device_status             VARCHAR2(15),
  pin_device_status             VARCHAR2(15),
  siu_device_status             VARCHAR2(15),
  cam_device_status             VARCHAR2(15),
  crd_device_status             VARCHAR2(15),
  ccd_device_status             VARCHAR2(15),
  idc_media_status              VARCHAR2(20),
  idc_capture_bin_status        VARCHAR2(20),
  idc_capture_bin_count         VARCHAR2(10),
  cim_accept_or_status          VARCHAR2(20),
  cim_escrow_status             VARCHAR2(20),
  cim_cash_units                VARCHAR2(20),
  cim_shutter_status            VARCHAR2(40),
  cim_transport_status          VARCHAR2(40),
  cim_inout_position            VARCHAR2(40),
  cim_input_output_status       VARCHAR2(100),
  cim_pu_id                     VARCHAR2(100),
  cim_pu_count                  VARCHAR2(100),
  cim_pu_cash_in_count          VARCHAR2(100),
  cim_pu_status                 VARCHAR2(100),
  cim_pupos_name                VARCHAR2(200),
  cim_cu_id                     VARCHAR2(100),
  cim_pcu_id                    VARCHAR2(100),
  cim_cu_note_value             VARCHAR2(100),
  cim_cu_currency               VARCHAR2(100),
  cim_cu_count                  VARCHAR2(100),
  cim_cu_cash_in_count          VARCHAR2(100),
  cim_cu_type                   VARCHAR2(500),
  cim_cu_status                 VARCHAR2(100),
  cdm_shutter_status            VARCHAR2(20),
  cdm_dispenser_status          VARCHAR2(20),
  cdm_safe_door_status          VARCHAR2(20),
  cdm_stacker_status            VARCHAR2(20),
  cdm_cash_units                VARCHAR2(20),
  cdm_transport_status          VARCHAR2(40),
  cdm_out_position              VARCHAR2(40),
  cdm_input_output_status       VARCHAR2(20),
  cdm_pu_status                 VARCHAR2(100),
  cdm_pu_id                     VARCHAR2(100),
  cdm_pu_initial_count          VARCHAR2(100),
  cdm_pu_current_count          VARCHAR2(100),
  cdm_pu_reject_count           VARCHAR2(100),
  cdm_pupos_name                VARCHAR2(200),
  cdm_cu_id                     VARCHAR2(100),
  cdm_pcu_id                    VARCHAR2(100),
  cdm_cu_note_value             VARCHAR2(100),
  cdm_cu_currency               VARCHAR2(100),
  cdm_cu_current_count          VARCHAR2(100),
  cdm_cu_initial_count          VARCHAR2(100),
  cdm_cu_reject_count           VARCHAR2(100),
  cdm_cu_type                   VARCHAR2(500),
  cdm_cu_status                 VARCHAR2(100),
  dep_deposit_status            VARCHAR2(20),
  dep_deposit_container_status  VARCHAR2(20),
  dep_envelope_supply_status    VARCHAR2(20),
  dep_envelope_status           VARCHAR2(20),
  dep_printer_status            VARCHAR2(20),
  dep_printer_ink               VARCHAR2(20),
  dep_deposited_items           VARCHAR2(10),
  dep_transport_status          VARCHAR2(20),
  dep_shutter_status            VARCHAR2(20),
  ups_low                       VARCHAR2(20),
  ups_engaged                   VARCHAR2(20),
  ups_powering                  VARCHAR2(20),
  ups_recovered                 VARCHAR2(20),
  spr_media_status              VARCHAR2(20),
  spr_paper_status              VARCHAR2(20),
  spr_retract_bin_status        VARCHAR2(20),
  spr_ink_status                VARCHAR2(20),
  spr_toner_status              VARCHAR2(20),
  spr_stack_count               VARCHAR2(10),
  chk_media_status              VARCHAR2(20),
  chk_ink_status                VARCHAR2(20),
  rpr_media_status              VARCHAR2(20),
  rpr_paper_status              VARCHAR2(20),
  rpr_retract_bin_status        VARCHAR2(20),
  rpr_ink_status                VARCHAR2(20),
  rpr_toner_status              VARCHAR2(20),
  jpr_media_status              VARCHAR2(20),
  jpr_paper_status              VARCHAR2(20),
  jpr_ink_status                VARCHAR2(20),
  jpr_toner_status              VARCHAR2(20),
  pbk_media_status              VARCHAR2(20),
  pbk_ink_status                VARCHAR2(20),
  pbk_toner_status              VARCHAR2(20),
  pbk_retract_bin_status        VARCHAR2(20),
  pbk_retract_bin_count         VARCHAR2(10),
  siu_operator_switch           VARCHAR2(20),
  siu_terminal_tamper           VARCHAR2(20),
  siu_alarm_tamper              VARCHAR2(20),
  siu_seismic                   VARCHAR2(20),
  siu_proximity_detector        VARCHAR2(20),
  siu_heat                      VARCHAR2(20),
  siu_ambient_light             VARCHAR2(20),
  siu_cabinet_state             VARCHAR2(20),
  siu_safe_state                VARCHAR2(20),
  siu_shield_state              VARCHAR2(20),
  siu_bill_acceptor_light       VARCHAR2(20),
  siu_card_reader_light         VARCHAR2(20),
  siu_cheque_unit_light         VARCHAR2(20),
  siu_coin_dispenser_light      VARCHAR2(20),
  siu_note_dispenser_light      VARCHAR2(20),
  siu_envelope_depository_light VARCHAR2(20),
  siu_passbook_printer_light    VARCHAR2(20),
  siu_pinpad_light              VARCHAR2(20),
  siu_receipt_printer_light     VARCHAR2(20),
  siu_envelope_dispenser_light  VARCHAR2(20),
  cam_camera_area               VARCHAR2(40),
  cam_camera_area_status        VARCHAR2(40),
  cam_media_status              VARCHAR2(40),
  cam_picture_staken            VARCHAR2(10),
  icc_device_status             VARCHAR2(15),
  icc_media_status              VARCHAR2(20),
  isc_device_status             VARCHAR2(15),
  isc_media_status              VARCHAR2(20),
  irc_device_status             VARCHAR2(15),
  irc_media_status              VARCHAR2(20),
  fpi_device_status             VARCHAR2(15),
  dpr_device_status             VARCHAR2(15),
  bcr_device_status             VARCHAR2(15),
  pjc_ret_code                  VARCHAR2(20),
  pjc_cru_status                VARCHAR2(20),
  pjc_ej_sendtime               VARCHAR2(20),
  pjc_ej_date                   VARCHAR2(20),
  pjc_ej_nsend                  VARCHAR2(20),
  cdm_cu_number                 VARCHAR2(100),
  cim_cu_number                 VARCHAR2(100),
   constraint PK_DEV_STATUS_TABLE primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_STATUS_TABLE
  is '�豸ģ��״̬�� ';
comment on column DEV_STATUS_TABLE.dev_no
  is '�豸��';
comment on column DEV_STATUS_TABLE.dev_status
  is 'HEALTHY(����)
FATAL�����ϣ�
WARNING�����棩
UNKNOWN��δ֪��';
comment on column DEV_STATUS_TABLE.dev_tx_status
  is 'HEALTHY��������
PARTSERVICE�����ַ���
NOSERVICE��ֹͣ����
UNKNOWN��δ֪��';
comment on column DEV_STATUS_TABLE.dev_net_status
  is 'HEALTHY��������
FATAL�����ϣ������ߣ�
WARNING�����棩
UNKNOW��δ֪��';
comment on column DEV_STATUS_TABLE.dev_run_status
  is 'HEALTHY(����)
CLOSE���ػ���
MAINTAIN��ά����
NETFATAL��PͨѶ���ϣ�
PARTSERVICE�����ַ���
NOSERVICE��ֹͣ����
STOP��ͣ�ã�
UNKNOWN��δ֪��';
comment on column DEV_STATUS_TABLE.dev_cash_status
  is '0������1���޷�ȡ��2���޷����3���޷���ȡ��';
comment on column DEV_STATUS_TABLE.dev_crs_status
  is '0������1���޷�ȡ��2���޷����3���޷���ȡ��';
comment on column DEV_STATUS_TABLE.action_type
  is '����״̬';
comment on column DEV_STATUS_TABLE.action_note
  is '������״̬';
comment on column DEV_STATUS_TABLE.dev_cashbox_status
  is 'OK�����㣩
LOW�����㣩
EMPTY��ȱ����
FULL��������
UNKNOWN��δ֪��';
comment on column DEV_STATUS_TABLE.dev_mod_status
  is 'HEALTHY(����)
FATAL�����ϣ�
WARNING�����棩
UNKNOWN��δ֪��';
comment on column DEV_STATUS_TABLE.dev_potential_fault
  is '�豸�Ƿ����Ǳ�ڹ��ϣ�δʹ�ã�';
comment on column DEV_STATUS_TABLE.status_last_time
  is '�ϴθ���ʱ�䣨yyyymmddhhmmss��';
comment on column DEV_STATUS_TABLE.status_expire_time
  is '״̬��ʱʱ�䣨yyyymmddhhmmss��';
comment on column DEV_STATUS_TABLE.tx_type
  is 'CWD-ȡ��
DET-���';
comment on column DEV_STATUS_TABLE.tx_time
  is '����ʱ�䣨yyyymmddhhmmss��';
comment on column DEV_STATUS_TABLE.atm_type
  is '1 --�Զ�ȡ���(ATM)
2--�Զ�����(CDM)
3--�Զ���ȡ���(CRS)
4--��ý���ѯ��(BSM)';
comment on column DEV_STATUS_TABLE.cash_unit_type
  is 'P--Physical,L--Logical';
comment on column DEV_STATUS_TABLE.status_info_type
  is '1--��ʱ״̬����
2--ǿ�Ʒ���״̬����';
comment on column DEV_STATUS_TABLE.combin_unit_type
  is '0--��Ĭ�Ϸ�ʽ�ϲ�
1--��PUPosName�ϲ�
2--��DevCdmCUID�ϲ�
3--��PUPosName��DevCdmCUID�ϲ�';
comment on column DEV_STATUS_TABLE.idc_device_status
  is 'HEALTHY
FATAL
WARNING
NODEVICE
UNKNOWN';
comment on column DEV_STATUS_TABLE.cim_device_status
  is 'CIMģ��״̬';
comment on column DEV_STATUS_TABLE.cdm_device_status
  is 'CMDģ��״̬';
comment on column DEV_STATUS_TABLE.dep_device_status
  is 'DEPģ��״̬';
comment on column DEV_STATUS_TABLE.ups_device_status
  is 'UPSģ��״̬';
comment on column DEV_STATUS_TABLE.spr_device_status
  is 'SPRģ��״̬';
comment on column DEV_STATUS_TABLE.rpr_device_status
  is 'RPRģ��״̬';
comment on column DEV_STATUS_TABLE.jpr_device_status
  is 'JPRģ��״̬';
comment on column DEV_STATUS_TABLE.chk_device_status
  is 'CHKģ��״̬';
comment on column DEV_STATUS_TABLE.ttu_device_status
  is 'TTUģ��״̬';
comment on column DEV_STATUS_TABLE.pbk_device_status
  is 'PBKģ��״̬';
comment on column DEV_STATUS_TABLE.pin_device_status
  is 'PINģ��״̬';
comment on column DEV_STATUS_TABLE.siu_device_status
  is 'SIUģ��״̬';
comment on column DEV_STATUS_TABLE.cam_device_status
  is 'CAMģ��״̬';
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
  is '����������';
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
  is '������Ԫ��ʶ�����飩';
comment on column DEV_STATUS_TABLE.cim_pu_count
  is '��ǰ������Ԫֽ���������飩';
comment on column DEV_STATUS_TABLE.cim_pu_cash_in_count
  is '������Ԫ�ϳ��������飩';
comment on column DEV_STATUS_TABLE.cim_pu_status
  is '�߼���Ԫ״̬';
comment on column DEV_STATUS_TABLE.cim_pupos_name
  is 'CIM������������λ��������';
comment on column DEV_STATUS_TABLE.cim_cu_id
  is '�߼���Ԫ��ʶ�����飩';
comment on column DEV_STATUS_TABLE.cim_pcu_id
  is '������Ԫ���߼���Ԫ��Ӧ��ϵ�����飩';
comment on column DEV_STATUS_TABLE.cim_cu_note_value
  is '�߼���Ԫֽ����ֵ�����飩';
comment on column DEV_STATUS_TABLE.cim_cu_currency
  is '�߼���Ԫ���֣����飩';
comment on column DEV_STATUS_TABLE.cim_cu_count
  is '��ǰ�߼���Ԫֽ���������飩';
comment on column DEV_STATUS_TABLE.cim_cu_cash_in_count
  is '�߼���Ԫ�ϳ��������飩';
comment on column DEV_STATUS_TABLE.cim_cu_type
  is '�߼���Ԫ����';
comment on column DEV_STATUS_TABLE.cim_cu_status
  is 'CIM�߼���Ԫ״̬';
comment on column DEV_STATUS_TABLE.cdm_shutter_status
  is 'Closed, Open, Jammed, Unknown, NotSupported';
comment on column DEV_STATUS_TABLE.cdm_dispenser_status
  is '�˳�״̬';
comment on column DEV_STATUS_TABLE.cdm_safe_door_status
  is 'OPEN
FATAL
CLOSED
LOCKED
NOTSUPPORTED';
comment on column DEV_STATUS_TABLE.cdm_stacker_status
  is 'CDM�ݴ���״̬';
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
  is '������Ԫ״̬(����)';
comment on column DEV_STATUS_TABLE.cdm_pu_id
  is 'CDM������Ԫ��ʶ�����飩';
comment on column DEV_STATUS_TABLE.cdm_pu_initial_count
  is 'CDM��ǰ������Ԫֽ���������飩';
comment on column DEV_STATUS_TABLE.cdm_pu_current_count
  is '��ǰ������Ԫ��ʼ����';
comment on column DEV_STATUS_TABLE.cdm_pu_reject_count
  is 'CDM������Ԫ�ϳ��������飩';
comment on column DEV_STATUS_TABLE.cdm_pupos_name
  is 'CDM������������λ��������';
comment on column DEV_STATUS_TABLE.cdm_cu_id
  is 'CDM�߼���Ԫ��ʶ�����飩';
comment on column DEV_STATUS_TABLE.cdm_pcu_id
  is 'CDM������Ԫ���߼���Ԫ��Ӧ��ϵ�����飩';
comment on column DEV_STATUS_TABLE.cdm_cu_note_value
  is 'CDM�߼���Ԫֽ����ֵ�����飩';
comment on column DEV_STATUS_TABLE.cdm_cu_currency
  is 'CDM�߼���Ԫ���֣����飩';
comment on column DEV_STATUS_TABLE.cdm_cu_current_count
  is 'CDM��ǰ�߼���Ԫֽ���������飩';
comment on column DEV_STATUS_TABLE.cdm_cu_initial_count
  is '��ǰ�߼���Ԫ��ʼ����';
comment on column DEV_STATUS_TABLE.cdm_cu_reject_count
  is 'CDM�߼���Ԫ�ϳ��������飩';
comment on column DEV_STATUS_TABLE.cdm_cu_type
  is 'CDM�߼���Ԫ����';
comment on column DEV_STATUS_TABLE.cdm_cu_status
  is 'CDM�߼���Ԫ״̬';
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
  is '�Ѵ��ŷ�����';
comment on column DEV_STATUS_TABLE.dep_transport_status
  is '���Ͳ���״̬';
comment on column DEV_STATUS_TABLE.dep_shutter_status
  is '����״̬';
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
  is 'īˮ״̬';
comment on column DEV_STATUS_TABLE.spr_toner_status
  is 'ɫ��״̬';
comment on column DEV_STATUS_TABLE.spr_stack_count
  is '�ݴ�����';
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
  is 'RPRīˮ״̬';
comment on column DEV_STATUS_TABLE.rpr_toner_status
  is 'RPRɫ��״̬';
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
  is 'JPRīˮ״̬';
comment on column DEV_STATUS_TABLE.jpr_toner_status
  is 'JPRɫ��״̬';
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
  is 'PBK���յ�Ԫ����';
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
  is '����״̬';
comment on column DEV_STATUS_TABLE.siu_safe_state
  is 'SIU��ȫ��״̬';
comment on column DEV_STATUS_TABLE.siu_shield_state
  is 'SIU����״̬';
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
  is '�ѻ�ȡͼ��';
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
  is '����ģ��״̬';
comment on column DEV_STATUS_TABLE.bcr_device_status
  is '��ά��ɨ����ģ��״̬';
comment on column DEV_STATUS_TABLE.pjc_ret_code
  is 'PJC������';
comment on column DEV_STATUS_TABLE.pjc_cru_status
  is 'PJCģ����״̬��Healthy-���������̴��ڣ���Fatal-ʧ��';
comment on column DEV_STATUS_TABLE.pjc_ej_sendtime
  is 'PJC��ˮ�ϴ�ʱ��';
comment on column DEV_STATUS_TABLE.pjc_ej_date
  is 'PJC�ϴ���ˮ����';
comment on column DEV_STATUS_TABLE.pjc_ej_nsend
  is 'ʣ��δ���ͻ�����ˮ�����Without-δ�ɼ�����ˮ��Ok-δ������ˮ����Ϊ0��High-δ������ˮ����δ�ﵽ��ֵ��Full-δ������ˮ���ݴ��ڵ��ڷ�ֵ';
comment on column DEV_STATUS_TABLE.cdm_cu_number
  is 'ȡ�����߼�����������';
comment on column DEV_STATUS_TABLE.cim_cu_number
  is '������߼�����������';

create table DEV_STATUS_TABLE_EXPAND
(
  dev_no                     VARCHAR2(20) not null,
  crd_dispenser              VARCHAR2(20),
  crd_transport              VARCHAR2(20),
  crd_media                  VARCHAR2(20),
  crd_shutter                VARCHAR2(20),
  crd_supplybin_status       VARCHAR2(20),
  crd_retainbin_status       VARCHAR2(20),
  crd_cu_id                  VARCHAR2(100),
  crd_cu_name                VARCHAR2(200),
  crd_cu_status              VARCHAR2(200),
  crd_cu_type                VARCHAR2(200),
  crd_cu_count               VARCHAR2(100),
  crd_cu_initial_count       VARCHAR2(100),
  crd_cu_retain_count        VARCHAR2(100),
  ccd_dispenser              VARCHAR2(20),
  ccd_transport              VARCHAR2(20),
  ccd_media                  VARCHAR2(20),
  ccd_shutter                VARCHAR2(20),
  ccd_supplybin_status       VARCHAR2(20),
  ccd_retainbin_status       VARCHAR2(20),
  ccd_cu_id                  VARCHAR2(100),
  ccd_cu_name                VARCHAR2(200),
  ccd_cu_status              VARCHAR2(200),
  ccd_cu_type                VARCHAR2(200),
  ccd_cu_count               VARCHAR2(100),
  ccd_cu_initial_count       VARCHAR2(100),
  ccd_cu_retain_count        VARCHAR2(100),
  dpr_media_status           VARCHAR2(15),
  dpr_supply_level_status    VARCHAR2(15),
  dpr_supply_lower_status    VARCHAR2(15),
  dpr_supply_external_status VARCHAR2(15),
  dpr_supply_aux_status      VARCHAR2(15),
  dpr_retract_bin_status     VARCHAR2(15),
  dpr_toner_status           VARCHAR2(15),
  dpr_ink_status             VARCHAR2(15),
  bcr_scanner_status         VARCHAR2(15),
  nts_cache_count            VARCHAR2(10),
  nts_last_build_time        VARCHAR2(20),
   constraint PK_DEV_STATUS_TABLE_EXPAND primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_STATUS_TABLE_EXPAND
  is '�豸ģ��״̬��չ��';
comment on column DEV_STATUS_TABLE_EXPAND.dev_no
  is '�豸��';
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
  is '0-ok;1-low;2-empty;3-inoperable ������;4-missing;5-unknown';
comment on column DEV_STATUS_TABLE_EXPAND.crd_retainbin_status
  is '0-ok;1-high;2-full;3-inoperable ������;4-missing;5-unknown';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_id
  is '����ԪID����';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_name
  is '����Ԫ������';
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
  is '����Ԫ��ǰ���Ŀ���������';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_initial_count
  is '����Ԫ��ʼ��������';
comment on column DEV_STATUS_TABLE_EXPAND.crd_cu_retain_count
  is '����ϻ�������ļ���';
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
  is '����ģ��media״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_level_status
  is '��λֽ�Ź�Ӧ��״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_lower_status
  is '��λֽ�Ź�Ӧ��״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_external_status
  is '�ⲿֽ�Ź�Ӧ��״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_supply_aux_status
  is '����ֽ�Ź�Ӧ״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_retract_bin_status
  is '������״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_toner_status
  is 'ɫ��״̬';
comment on column DEV_STATUS_TABLE_EXPAND.dpr_ink_status
  is 'īˮ״̬';
comment on column DEV_STATUS_TABLE_EXPAND.bcr_scanner_status
  is '��ά��ɨ���ǵ�media״̬';
comment on column DEV_STATUS_TABLE_EXPAND.nts_cache_count
  is '���ֺŻ����¼��';
comment on column DEV_STATUS_TABLE_EXPAND.nts_last_build_time
  is 'Agent�յ������һ�����ֺű��ĵ�ʱ��';

create table DEV_TYPE_TABLE
(
  no          VARCHAR2(5) not null,
  name        VARCHAR2(60) not null,
  dev_vendor  VARCHAR2(5) not null,
  dev_catalog VARCHAR2(5) not null,
  spec        VARCHAR2(20),
  weight      VARCHAR2(10),
  watt        VARCHAR2(10),
  cash_type   VARCHAR2(2),
   constraint PK_DEV_TYPE_TABLE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_TYPE_TABLE
  is '�豸�ͺű�';
comment on column DEV_TYPE_TABLE.no
  is '���';
comment on column DEV_TYPE_TABLE.name
  is '�豸�ͺ�';
comment on column DEV_TYPE_TABLE.dev_vendor
  is '����Ʒ�� �����豸Ʒ�Ʊ�';
comment on column DEV_TYPE_TABLE.dev_catalog
  is '�������� �����豸���ͱ�';
comment on column DEV_TYPE_TABLE.spec
  is '�豸���';
comment on column DEV_TYPE_TABLE.weight
  is '�豸����';
comment on column DEV_TYPE_TABLE.watt
  is 'ƽ������';
comment on column DEV_TYPE_TABLE.cash_type
  is '���ֽ��־ 1���ֽ�2�����ֽ�';

create table DEV_VENDOR_TABLE
(
  no       VARCHAR2(5) not null,
  name     VARCHAR2(80) not null,
  address  VARCHAR2(80),
  hotline1 VARCHAR2(20),
  status   VARCHAR2(2),
   constraint PK_DEV_VENDOR_TABLE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_VENDOR_TABLE
  is '�豸Ʒ�Ʊ�';
comment on column DEV_VENDOR_TABLE.no
  is '���';
comment on column DEV_VENDOR_TABLE.name
  is 'Ʒ������';
comment on column DEV_VENDOR_TABLE.address
  is '�����̵�ַ';
comment on column DEV_VENDOR_TABLE.hotline1
  is '����������';
comment on column DEV_VENDOR_TABLE.status
  is '������״̬1 �C�豸��Ӧ 2 �C�豸���� 3 �C�豸����';

/*==============================================================*/
/* Table: DEV_WORK_TIME_TABLE                                   */
/*==============================================================*/
create table DEV_WORK_TIME_TABLE 
(
   LOGIC_ID             VARCHAR2(36)         not null,
   DEV_NO               VARCHAR2(20)         not null,
   DATES_TYPE           VARCHAR2(20)         not null,
   DATES_TYPE_STATEMENT VARCHAR2(80),
   DATES                VARCHAR2(8),
   Businessflag         VARCHAR2(1),
   START_TIME           VARCHAR2(24),
   END_TIME             VARCHAR2(24),
   constraint PK_DEV_WORK_TIME_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_WORK_TIME_TABLE is
'�豸����ʱ���';

comment on column DEV_WORK_TIME_TABLE.LOGIC_ID is
'��ţ�UUID��';

comment on column DEV_WORK_TIME_TABLE.DEV_NO is
'�豸��';

comment on column DEV_WORK_TIME_TABLE.DATES_TYPE is
'��������
Special
Monday
Tuesday
Wednesday
Thursday
Friday
Staturday
Sunday';

comment on column DEV_WORK_TIME_TABLE.DATES_TYPE_STATEMENT is
'��������˵��
Special �C �������ڣ���Ҫ�ر�ָ�������յģ��������գ�
Monday ����һ
Tuesday ���ڶ�
Wednesday ������
Thursday ������
Friday ������
Staturday ������
Sunday ������';

comment on column DEV_WORK_TIME_TABLE.DATES is
'���Ϊ�գ���Ϊ��������Ϊ��ĩ���߹�����';

comment on column DEV_WORK_TIME_TABLE.Businessflag is
'�Ƿ�Ӫҵ��־ Y:Ӫҵ N:��Ӫҵ';

comment on column DEV_WORK_TIME_TABLE.START_TIME is
'������ʼʱ��,��|�ָ��ȷ���֣�������ʱ���';

comment on column DEV_WORK_TIME_TABLE.END_TIME is
'��������ʱ�䣬��|�ָ��ȷ���֣�������ʱ���';

/*==============================================================*/
/* Table: ORG_WORK_TIME_TABLE                                   */
/*==============================================================*/
create table ORG_WORK_TIME_TABLE 
(
   LOGIC_ID             VARCHAR2(36)         not null,
   org_no               VARCHAR2(20)         not null,
   DATES_TYPE           VARCHAR2(20)         not null,
   DATES_TYPE_STATEMENT VARCHAR2(80),
   DATES                VARCHAR2(8),
   Businessflag         VARCHAR2(1),
   START_TIME           VARCHAR2(24),
   END_TIME             VARCHAR2(24),
   constraint PK_ORG_WORK_TIME_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ORG_WORK_TIME_TABLE is
'�豸����ʱ���';

comment on column ORG_WORK_TIME_TABLE.LOGIC_ID is
'��ţ�UUID��';

comment on column ORG_WORK_TIME_TABLE.org_no is
'������';

comment on column ORG_WORK_TIME_TABLE.DATES_TYPE is
'��������
Special
Monday
Tuesday
Wednesday
Thursday
Friday
Staturday
Sunday';

comment on column ORG_WORK_TIME_TABLE.DATES_TYPE_STATEMENT is
'��������˵��
Special �C �������ڣ���Ҫ�ر�ָ�������յģ��������գ�
Monday ����һ
Tuesday ���ڶ�
Wednesday ������
Thursday ������
Friday ������
Staturday ������
Sunday ������';

comment on column ORG_WORK_TIME_TABLE.DATES is
'���Ϊ�գ���Ϊ��������Ϊ��ĩ���߹�����';

comment on column ORG_WORK_TIME_TABLE.Businessflag is
'�Ƿ�Ӫҵ��־ Y:Ӫҵ N:��Ӫҵ';

comment on column ORG_WORK_TIME_TABLE.START_TIME is
'������ʼʱ��,��|�ָ��ȷ���֣�������ʱ���';

comment on column ORG_WORK_TIME_TABLE.END_TIME is
'��������ʱ�䣬��|�ָ��ȷ���֣�������ʱ���';


create table FAULT_CODE
(
  code        VARCHAR2(10) not null,
  fault_level NUMBER(38) not null,
  description VARCHAR2(100) not null,
  solution    VARCHAR2(100),
   constraint PK_FAULT_CODE primary key (CODE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table FAULT_CODE
  is '���ϴ����';
comment on column FAULT_CODE.code
  is '���ϼ���';
comment on column FAULT_CODE.fault_level
  is '���ϼ���';
comment on column FAULT_CODE.description
  is '��������';
comment on column FAULT_CODE.solution
  is '����취';

create table FAULT_CODE_USED
(
  code        VARCHAR2(30) not null,
  fault_level NUMBER(38) not null,
  description VARCHAR2(1024),
  solution    VARCHAR2(1024),
  filter_flag CHAR(1),
  note1       VARCHAR2(100),
  note2       VARCHAR2(100),
   constraint PK_FAULT_CODE_USED primary key (CODE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table FAULT_CODE_USED
  is '��ʹ�ù������ ';
comment on column FAULT_CODE_USED.code
  is '������';
comment on column FAULT_CODE_USED.fault_level
  is '���ϼ���';
comment on column FAULT_CODE_USED.description
  is '��������';
comment on column FAULT_CODE_USED.solution
  is '�������';
comment on column FAULT_CODE_USED.filter_flag
  is '���˱�־';
comment on column FAULT_CODE_USED.note1
  is '��ע1';
comment on column FAULT_CODE_USED.note2
  is '��ע2';

create table FAULT_FILTER
(
  logic_id      VARCHAR2(36) not null,
  fault_code    VARCHAR2(20) not null,
  dev_type_name VARCHAR2(60),
  dev_type      NUMBER(38),
  dev_no        VARCHAR2(20),
  filter_by     CHAR(1) not null,
  filter_flag   CHAR(1) default '0' not null,
  op_no         VARCHAR2(20),
  op_time       VARCHAR2(20),
   constraint PK_FAULT_FILTER primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table FAULT_FILTER
  is '���Ϲ��˱�';
comment on column FAULT_FILTER.logic_id
  is '��ţ�UUID��';
comment on column FAULT_FILTER.fault_code
  is '���ϴ���';
comment on column FAULT_FILTER.dev_type_name
  is '�豸������';
comment on column FAULT_FILTER.dev_type
  is '�豸����';
comment on column FAULT_FILTER.dev_no
  is '�豸��';
comment on column FAULT_FILTER.filter_by
  is '���˷�Χ��0 ȫ��(all)  ��1 ������(dev_type) ��2 ���豸��(dev_no)��';
comment on column FAULT_FILTER.filter_flag
  is '���˷�ʽ��0:�������� ;1����ģ�飩';
comment on column FAULT_FILTER.op_no
  is 'OP_NO';
comment on column FAULT_FILTER.op_time
  is 'OP_TIME';

create table FAULT_TABLE
(
  fault_no    VARCHAR2(36) not null,
  dev_no      VARCHAR2(20) not null,
  dev_module  VARCHAR2(10) not null,
  fault_level NUMBER(38) not null,
  fault_code  VARCHAR2(20),
  vendor_code VARCHAR2(2048),
  fault_time  VARCHAR2(20) not null,
  description VARCHAR2(500),
  solution    VARCHAR2(500),
   constraint PK_FAULT_TABLE primary key (FAULT_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
partition by range (FAULT_TIME)
(
  partition FAULT_TABLE_PART164 values less than ('2019-12-32 23:59:59')
    tablespace ZHYGSPACE,
  partition FAULT_TABLE_PART174 values less than ('2020-12-32 23:59:59')
    tablespace ZHYGSPACE,
  partition FAULT_TABLE_MAXPART values less than (MAXVALUE)
    tablespace ZHYGSPACE
);
comment on table FAULT_TABLE
  is '���ϱ�';
comment on column FAULT_TABLE.fault_no
  is '���Ϻ�';
comment on column FAULT_TABLE.dev_no
  is '�豸��';
comment on column FAULT_TABLE.dev_module
  is '�豸ģ��';
comment on column FAULT_TABLE.fault_level
  is '���ϼ���';
comment on column FAULT_TABLE.fault_code
  is '���ϴ���';
comment on column FAULT_TABLE.vendor_code
  is '���̹�����';
comment on column FAULT_TABLE.fault_time
  is '����ʱ�䣨YYYY-MM-DD HH:mm24:ss��';
comment on column FAULT_TABLE.description
  is '��������';
comment on column FAULT_TABLE.solution
  is '�������';


create table MOD_CATALOG_TABLE
(
  no   VARCHAR2(5) not null,
  name VARCHAR2(50) not null,
   constraint PK_MOD_CATALOG_TABLE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table MOD_CATALOG_TABLE
  is 'ģ������';
comment on column MOD_CATALOG_TABLE.no
  is '���';
comment on column MOD_CATALOG_TABLE.name
  is 'ģ������';


create table REMOTE_TRACE
(
  logic_id       VARCHAR2(36) not null,
  command_id     VARCHAR2(10) not null,
  dev_no         VARCHAR2(20) not null,
  op_no          VARCHAR2(20) not null,
  op_time        VARCHAR2(20) not null,
  status         VARCHAR2(50) not null,
  content        VARCHAR2(800) not null,
  check_type     VARCHAR2(2),
  cache_falg     VARCHAR2(2),
  count_all_flag VARCHAR2(2),
  cashunit_count NUMBER(38),
  cashunit_list  VARCHAR2(100),
   constraint PK_REMOTE_TRACE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table REMOTE_TRACE
  is 'Զ�̿��ƽ����¼�� ';
comment on column REMOTE_TRACE.logic_id
  is '���';
comment on column REMOTE_TRACE.command_id
  is '����ID';
comment on column REMOTE_TRACE.dev_no
  is '�豸��';
comment on column REMOTE_TRACE.op_no
  is '����Ա���';
comment on column REMOTE_TRACE.op_time
  is '����ʱ��';
comment on column REMOTE_TRACE.status
  is '����״̬';
comment on column REMOTE_TRACE.content
  is '��������';
comment on column REMOTE_TRACE.check_type
  is '���鷽ʽ��0-����ִ�У�Ĭ�ϣ���1-��ʱִ��';
comment on column REMOTE_TRACE.cache_falg
  is '�Ƿ���ҪC�˽��л��洦��';
comment on column REMOTE_TRACE.count_all_flag
  is '�Ƿ񾫲����г���';
comment on column REMOTE_TRACE.cashunit_count
  is '��Ҫ����ĳ�����Ŀ';
comment on column REMOTE_TRACE.cashunit_list
  is '�߼������������б�';

create table REMOTE_FILE_DOWN_INFO
(
  logic_id           VARCHAR2(36) not null,
  trace_logic_id     VARCHAR2(36) not null,
  remote_file        VARCHAR2(800) not null,
  local_file         VARCHAR2(800) not null,
  remote_handle_file VARCHAR2(800),
  progress           NUMBER(20,2) not null,
   constraint PK_REMOTE_FILE_DOWN_INFO primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table REMOTE_FILE_DOWN_INFO
  is '�ļ�������Ϣ��';
comment on column REMOTE_FILE_DOWN_INFO.logic_id
  is '���';
comment on column REMOTE_FILE_DOWN_INFO.trace_logic_id
  is 'Զ�̿��ƽ�����';
comment on column REMOTE_FILE_DOWN_INFO.remote_file
  is 'Զ���ļ�·�����ļ���';
comment on column REMOTE_FILE_DOWN_INFO.local_file
  is '�����ļ�·�����ļ���';
comment on column REMOTE_FILE_DOWN_INFO.remote_handle_file
  is '�������Զ���ļ�·�����ļ�����ѹ�����أ�';
comment on column REMOTE_FILE_DOWN_INFO.progress
  is '�ļ����ؽ���';

create table RPT_OPEN_RATE_DEV_DATE
(
  dev_no               VARCHAR2(20) not null,
  date_time            VARCHAR2(10) not null,
  Open_rate_year     VARCHAR2(4),
  Open_rate_month    VARCHAR2(2),
  Open_rate_day      VARCHAR2(2),
  full_fun_time        NUMBER(20,2),
  full_rate            NUMBER(20,2),
  half_fun_time        NUMBER(20,2),
  half_rate            NUMBER(20,2),
  hard_fault_time      NUMBER(20,2),
  soft_fault_time      NUMBER(20,2),
  maintenance_time     NUMBER(20,2),
  comm_failure_time    NUMBER(20,2),
  close_time           NUMBER(20,2),
  other_reason_time    NUMBER(20,2),
  work_time            NUMBER(20,2),
  perfect_rate         NUMBER(20,2),
  service_rate         NUMBER(20,2),
  comm_rate            NUMBER(20,2),
  stop_time            NUMBER(20,2),
  vcomm_failure_time   NUMBER(20,2),
  suspected_crash_time NUMBER(20,2),
   constraint PK_RPT_OPEN_RATE_DEV_DATE primary key (dev_no,date_time)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_OPEN_RATE_DEV_DATE
  is '������ͳ�Ʊ���ÿ̨ÿ�죩';
comment on column RPT_OPEN_RATE_DEV_DATE.dev_no
  is '�豸��';
comment on column RPT_OPEN_RATE_DEV_DATE.date_time
  is '���� yyyyMMdd';
comment on column RPT_OPEN_RATE_DEV_DATE.Open_rate_year
  is '��¼���';
comment on column RPT_OPEN_RATE_DEV_DATE.Open_rate_month
  is '��¼�·�';
comment on column RPT_OPEN_RATE_DEV_DATE.Open_rate_day
  is '��¼����';
comment on column RPT_OPEN_RATE_DEV_DATE.full_fun_time
  is 'ȫ���ܿ���ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.full_rate
  is 'ȫ���ܿ�����';
comment on column RPT_OPEN_RATE_DEV_DATE.half_fun_time
  is '�빦�ܿ���ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.half_rate
  is '�빦�ܿ�����';
comment on column RPT_OPEN_RATE_DEV_DATE.hard_fault_time
  is 'Ӳ����ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.soft_fault_time
  is '������ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.maintenance_time
  is 'ά��ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.comm_failure_time
  is 'PͨѶ�ж�ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.close_time
  is '�ػ�ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.other_reason_time
  is '����ԭ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.work_time
  is '�涨����ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.perfect_rate
  is '�豸�����(δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_DATE.service_rate
  is '���������ʣ�δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_DATE.comm_rate
  is 'ͨѶ����ʣ�δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_DATE.stop_time
  is 'ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.vcomm_failure_time
  is 'VͨѶ����ʱ��';
comment on column RPT_OPEN_RATE_DEV_DATE.suspected_crash_time
  is '��������ʱ��';

create table RPT_OPEN_RATE_DEV_MONTH
(
  dev_no               VARCHAR2(20) not null,
  date_time            VARCHAR2(10) not null,
  Open_rate_year     VARCHAR2(4),
  Open_rate_month    VARCHAR2(2),
  full_fun_time        NUMBER(20,2),
  full_rate            NUMBER(20,2),
  half_fun_time        NUMBER(20,2),
  half_rate            NUMBER(20,2),
  hard_fault_time      NUMBER(20,2),
  soft_fault_time      NUMBER(20,2),
  maintenance_time     NUMBER(20,2),
  comm_failure_time    NUMBER(20,2),
  close_time           NUMBER(20,2),
  other_reason_time    NUMBER(20,2),
  work_time            NUMBER(20,2),
  perfect_rate         NUMBER(20,2),
  service_rate         NUMBER(20,2),
  comm_rate            NUMBER(20,2),
  stop_time            NUMBER(20,2),
  vcomm_failure_time   NUMBER(20,2),
  suspected_crash_time NUMBER(20,2),
   constraint PK_RPT_OPEN_RATE_DEV_MONTH primary key (dev_no,date_time)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_OPEN_RATE_DEV_MONTH
  is '������ͳ�Ʊ���ÿ̨ÿ�£�';
comment on column RPT_OPEN_RATE_DEV_MONTH.dev_no
  is '�豸��';
comment on column RPT_OPEN_RATE_DEV_MONTH.date_time
  is '���� yyyyMM';
comment on column RPT_OPEN_RATE_DEV_MONTH.Open_rate_year
  is '��¼���';
comment on column RPT_OPEN_RATE_DEV_MONTH.Open_rate_month
  is '��¼�·�';
comment on column RPT_OPEN_RATE_DEV_MONTH.full_fun_time
  is 'ȫ���ܿ���ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.full_rate
  is 'ȫ���ܿ�����';
comment on column RPT_OPEN_RATE_DEV_MONTH.half_fun_time
  is '�빦�ܿ���ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.half_rate
  is '�빦�ܿ�����';
comment on column RPT_OPEN_RATE_DEV_MONTH.hard_fault_time
  is 'Ӳ����ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.soft_fault_time
  is '������ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.maintenance_time
  is 'ά��ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.comm_failure_time
  is 'PͨѶ�ж�ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.close_time
  is '�ػ�ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.other_reason_time
  is '����ԭ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.work_time
  is '�涨����ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.perfect_rate
  is '�豸�����(δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_MONTH.service_rate
  is '���������ʣ�δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_MONTH.comm_rate
  is 'ͨѶ����ʣ�δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_MONTH.stop_time
  is 'ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.vcomm_failure_time
  is 'VͨѶ����ʱ��';
comment on column RPT_OPEN_RATE_DEV_MONTH.suspected_crash_time
  is '��������ʱ��';

create table RPT_OPEN_RATE_DEV_YEAR
(
  dev_no               VARCHAR2(20) not null,
  date_time            VARCHAR2(10) not null,
  Open_rate_year     VARCHAR2(4),
  full_fun_time        NUMBER(20,2),
  full_rate            NUMBER(20,2),
  half_fun_time        NUMBER(20,2),
  half_rate            NUMBER(20,2),
  hard_fault_time      NUMBER(20,2),
  soft_fault_time      NUMBER(20,2),
  maintenance_time     NUMBER(20,2),
  comm_failure_time    NUMBER(20,2),
  close_time           NUMBER(20,2),
  other_reason_time    NUMBER(20,2),
  work_time            NUMBER(20,2),
  perfect_rate         NUMBER(20,2),
  service_rate         NUMBER(20,2),
  comm_rate            NUMBER(20,2),
  stop_time            NUMBER(20,2),
  vcomm_failure_time   NUMBER(20,2),
  suspected_crash_time NUMBER(20,2),
   constraint PK_RPT_OPEN_RATE_DEV_YEAR primary key (dev_no,date_time)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_OPEN_RATE_DEV_YEAR
  is '������ͳ�Ʊ���ÿ̨ÿ�꣩';
comment on column RPT_OPEN_RATE_DEV_YEAR.dev_no
  is '�豸��';
comment on column RPT_OPEN_RATE_DEV_YEAR.date_time
  is '���� yyyy';
comment on column RPT_OPEN_RATE_DEV_YEAR.Open_rate_year
  is '��¼���';
comment on column RPT_OPEN_RATE_DEV_YEAR.full_fun_time
  is 'ȫ���ܿ���ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.full_rate
  is 'ȫ���ܿ�����';
comment on column RPT_OPEN_RATE_DEV_YEAR.half_fun_time
  is '�빦�ܿ���ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.half_rate
  is '�빦�ܿ�����';
comment on column RPT_OPEN_RATE_DEV_YEAR.hard_fault_time
  is 'Ӳ����ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.soft_fault_time
  is '������ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.maintenance_time
  is 'ά��ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.comm_failure_time
  is 'PͨѶ�ж�ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.close_time
  is '�ػ�ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.other_reason_time
  is '����ԭ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.work_time
  is '�涨����ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.perfect_rate
  is '�豸�����(δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_YEAR.service_rate
  is '���������ʣ�δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_YEAR.comm_rate
  is 'ͨѶ����ʣ�δʹ�ã�';
comment on column RPT_OPEN_RATE_DEV_YEAR.stop_time
  is 'ͣ��ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.vcomm_failure_time
  is 'VͨѶ����ʱ��';
comment on column RPT_OPEN_RATE_DEV_YEAR.suspected_crash_time
  is '��������ʱ��';


create table RPT_BATCH_TASK
(
  logicid  VARCHAR2(40) not null,
  tasktype VARCHAR2(2) not null,
  task_year     VARCHAR2(4),
  task_month    VARCHAR2(2),
  task_day      VARCHAR2(2),
  task_hour     VARCHAR2(2),
  addtime  VARCHAR2(20),
  taskflag CHAR(1) not null,
  TAKEFLAG  CHAR(1),
  TAKETIME  VARCHAR2(20),
  SYNCOUNT  INTEGER,
  FINISHTIME  VARCHAR2(20),
   constraint PK_RPT_BATCH_TASK primary key (logicid)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_BATCH_TASK
  is '�����Ϣͬ�������';
comment on column RPT_BATCH_TASK.tasktype
  is '�������ͣ�1:ÿ̨ÿСʱ���������ͽ���ͳ��2:ÿ̨ÿ����������ͽ���ͳ��3:ÿ̨ÿ�콻��ͳ��4:����ÿ�콻��ͳ��5:����ÿ�½���ͳ��6:����ÿ�꽻��ͳ�ƣ�';
comment on column RPT_BATCH_TASK.addtime
  is '����ʱ��YYYY-MM-DD hh:mm:ss';
comment on column RPT_BATCH_TASK.taskflag
  is '�����־ 0��δ��� 1���ѳɹ� 2���ѽ�����δ�ɹ���';
comment on column RPT_BATCH_TASK.TAKEFLAG
  is '���ر�־ Ĭ��Ϊ0,0��δ����,1���Ѽ���';
comment on column RPT_BATCH_TASK.TAKETIME
  is 'YYYY-MM-DD hh:mm:ss';
comment on column RPT_BATCH_TASK.SYNCOUNT
  is 'Ĭ��0';
comment on column RPT_BATCH_TASK.FINISHTIME
  is 'YYYY-MM-DD hh:mm:ss';
comment on column RPT_BATCH_TASK.task_year
  is '�������';
comment on column RPT_BATCH_TASK.task_month
  is '�����·�';
comment on column RPT_BATCH_TASK.task_day
  is '������';
comment on column RPT_BATCH_TASK.task_hour
  is '����Сʱ��00~23';

create table RPT_TRANS_DEV_HOUR_TYPE
(
  dev_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_hour     VARCHAR2(2),
  trans_type     VARCHAR2(20),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
  trans_day      VARCHAR2(2),
  org_no         VARCHAR2(20),
   constraint PK_RPT_TRANS_DEV_HOUR_TYPE primary key (DEV_NO, DATE_TIME,trans_hour, TRANS_TYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_DEV_HOUR_TYPE
  is '����ͳ�Ʊ���ÿ̨ÿСʱ���������ͣ�';
comment on column RPT_TRANS_DEV_HOUR_TYPE.dev_no
  is '�豸��';
comment on column RPT_TRANS_DEV_HOUR_TYPE.date_time
  is '����ʱ��yyyyMMdd';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_hour
  is '����Сʱ��00~23';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_type
  is '��������';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_amount
  is '���׽��';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_count
  is '��������';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_year
  is '�������';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_month
  is '�����·�';
comment on column RPT_TRANS_DEV_HOUR_TYPE.trans_day
  is '������';
comment on column RPT_TRANS_DEV_HOUR_TYPE.org_no
  is '������';

create table RPT_TRANS_DEV_DAY_TYPE_CFLAG
(
  dev_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_type     VARCHAR2(20),
  cardflag     VARCHAR2(3),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
  trans_day      VARCHAR2(2),
  org_no         VARCHAR2(20),
   constraint PK_TRANS_DEV_DAY_TYPE_CFLAG primary key (DEV_NO, DATE_TIME, TRANS_TYPE,cardflag)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_DEV_DAY_TYPE_CFLAG
  is '����ͳ�Ʊ���ÿ̨ÿ����������͸����֣�';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.dev_no
  is '�豸��';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.date_time
  is '����ʱ��yyyyMMdd';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_type
  is '��������';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.cardflag
  is '����';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_amount
  is '���׽��';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_count
  is '��������';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_year
  is '�������';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_month
  is '�����·�';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.trans_day
  is '������';
comment on column RPT_TRANS_DEV_DAY_TYPE_CFLAG.org_no
  is '������';
  
create table RPT_TRANS_DEV_DAY_TYPE
(
  dev_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_type     VARCHAR2(20),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
  trans_day      VARCHAR2(2),
  org_no         VARCHAR2(20),
   constraint PK_RPT_TRANS_DEV_DAY_TYPE primary key (DEV_NO, DATE_TIME, TRANS_TYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_DEV_DAY_TYPE
  is '����ͳ�Ʊ���ÿ̨ÿ����������ͣ�';
comment on column RPT_TRANS_DEV_DAY_TYPE.dev_no
  is '�豸��';
comment on column RPT_TRANS_DEV_DAY_TYPE.date_time
  is '����ʱ��yyyyMMdd';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_type
  is '��������';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_amount
  is '���׽��';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_count
  is '��������';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_year
  is '�������';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_month
  is '�����·�';
comment on column RPT_TRANS_DEV_DAY_TYPE.trans_day
  is '������';
comment on column RPT_TRANS_DEV_DAY_TYPE.org_no
  is '������';

create table RPT_TRANS_DEV_DAY
(
  dev_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
  trans_day      VARCHAR2(2),
  org_no         VARCHAR2(20),
   constraint PK_RPT_TRANS_DEV_DAY primary key (DEV_NO, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_DEV_DAY
  is '����ͳ�Ʊ���ÿ̨ÿ�죩';
comment on column RPT_TRANS_DEV_DAY.dev_no
  is '�豸��';
comment on column RPT_TRANS_DEV_DAY.date_time
  is '����ʱ��yyyyMMdd';
comment on column RPT_TRANS_DEV_DAY.trans_amount
  is '���׽��';
comment on column RPT_TRANS_DEV_DAY.trans_count
  is '��������';
comment on column RPT_TRANS_DEV_DAY.trans_year
  is '�������';
comment on column RPT_TRANS_DEV_DAY.trans_month
  is '�����·�';
comment on column RPT_TRANS_DEV_DAY.trans_day
  is '������';
comment on column RPT_TRANS_DEV_DAY.org_no
  is '������';

create table RPT_TRANS_ORG_DAY
(
  org_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
  trans_day      VARCHAR2(2),
   constraint PK_RPT_TRANS_ORG_DAY primary key (org_no, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_ORG_DAY
  is '����ͳ�Ʊ�������ÿ�죩';
comment on column RPT_TRANS_ORG_DAY.date_time
  is '����ʱ��yyyyMMdd';
comment on column RPT_TRANS_ORG_DAY.trans_amount
  is '���׽��';
comment on column RPT_TRANS_ORG_DAY.trans_count
  is '��������';
comment on column RPT_TRANS_ORG_DAY.trans_year
  is '�������';
comment on column RPT_TRANS_ORG_DAY.trans_month
  is '�����·�';
comment on column RPT_TRANS_ORG_DAY.trans_day
  is '������';
comment on column RPT_TRANS_ORG_DAY.org_no
  is '������';
  
create table RPT_TRANS_ORG_MONTH
(
  org_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
   constraint PK_RPT_TRANS_ORG_MONTH primary key (org_no, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_ORG_MONTH
  is '����ͳ�Ʊ�������ÿ�£�';
comment on column RPT_TRANS_ORG_MONTH.date_time
  is '����ʱ��yyyyMM';
comment on column RPT_TRANS_ORG_MONTH.trans_amount
  is '���׽��';
comment on column RPT_TRANS_ORG_MONTH.trans_count
  is '��������';
comment on column RPT_TRANS_ORG_MONTH.trans_year
  is '�������';
comment on column RPT_TRANS_ORG_MONTH.trans_month
  is '�����·�';
comment on column RPT_TRANS_ORG_MONTH.org_no
  is '������';
  
create table RPT_TRANS_ORG_YEAR
(
  org_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
   constraint PK_RPT_TRANS_ORG_YEAR primary key (org_no, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_TRANS_ORG_YEAR
  is '����ͳ�Ʊ�������ÿ�죩';
comment on column RPT_TRANS_ORG_YEAR.date_time
  is '����ʱ��yyyy';
comment on column RPT_TRANS_ORG_YEAR.trans_amount
  is '���׽��';
comment on column RPT_TRANS_ORG_YEAR.trans_count
  is '��������';
comment on column RPT_TRANS_ORG_YEAR.trans_year
  is '�������';
comment on column RPT_TRANS_ORG_YEAR.org_no
  is '������';
  
/*==============================================================*/
/* Table: RPT_FAULT_DEV_DATE                                  */
/*==============================================================*/
create table RPT_FAULT_DEV_DATE 
(
   DEV_NO               VARCHAR2(20)          not null,
   DATE_TIME            VARCHAR2(10)          not null,
  fault_year     VARCHAR2(4),
  fault_month    VARCHAR2(2),
  fault_day      VARCHAR2(2),
   FAULT_TIMES          NUMBER(20),
   IDC_FAULT_TIMES      NUMBER(20),
   PIN_FAULT_TIMES      NUMBER(20),
   CDM_FAULT_TIMES      NUMBER(20),
   CIM_FAULT_TIMES      NUMBER(20),
   JPR_FAULT_TIMES      NUMBER(20),
   RPR_FAULT_TIMES      NUMBER(20),
   SIU_FAULT_TIMES      NUMBER(20),
   DEP_FAULT_TIMES      NUMBER(20),
   UPS_FAULT_TIMES      NUMBER(20),
   SPR_FAULT_TIMES      NUMBER(20),
   CHK_FAULT_TIMES      NUMBER(20),
   TTU_FAULT_TIMES      NUMBER(20),
   PBK_FAULT_TIMES      NUMBER(20),
   CAM_FAULT_TIMES      NUMBER(20),
   FAULT_TIME           NUMBER(20),
   IDC_FAULT_TIME       NUMBER(20),
   PIN_FAULT_TIME       NUMBER(20),
   CDM_FAULT_TIME       NUMBER(20),
   CIM_FAULT_TIME       NUMBER(20),
   JPR_FAULT_TIME       NUMBER(20),
   RPR_FAULT_TIME       NUMBER(20),
   SIU_FAULT_TIME       NUMBER(20),
   DEP_FAULT_TIME       NUMBER(20),
   UPS_FAULT_TIME       NUMBER(20),
   SPR_FAULT_TIME       NUMBER(20),
   CHK_FAULT_TIME       NUMBER(20),
   TTU_FAULT_TIME       NUMBER(20),
   PBK_FAULT_TIME       NUMBER(20),
   CAM_FAULT_TIME       NUMBER(20),
   constraint PK_RPT_FAULT_DEV_DATE primary key (DEV_NO,DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 2048K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 5120K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_FAULT_DEV_DATE is
'����ͳ�Ʊ���ÿ̨ÿ�죩';

comment on column RPT_FAULT_DEV_DATE.DEV_NO is
'�豸��';

comment on column RPT_FAULT_DEV_DATE.DATE_TIME is
'����yyyyMMdd';

comment on column RPT_FAULT_DEV_DATE.fault_year
  is '��¼���';
comment on column RPT_FAULT_DEV_DATE.fault_month
  is '��¼�·�';
comment on column RPT_FAULT_DEV_DATE.fault_day
  is '��¼����';
comment on column RPT_FAULT_DEV_DATE.FAULT_TIMES is
'���ϴ���';

comment on column RPT_FAULT_DEV_DATE.IDC_FAULT_TIMES is
'���������ϴ���';

comment on column RPT_FAULT_DEV_DATE.PIN_FAULT_TIMES is
'������̹��ϴ���';

comment on column RPT_FAULT_DEV_DATE.CDM_FAULT_TIMES is
'ȡ��ģ����ϴ���';

comment on column RPT_FAULT_DEV_DATE.CIM_FAULT_TIMES is
'���ģ����ϴ���';

comment on column RPT_FAULT_DEV_DATE.JPR_FAULT_TIMES is
'��־��ӡ�����ϴ���';

comment on column RPT_FAULT_DEV_DATE.RPR_FAULT_TIMES is
'ƾƱ��ӡ�����ϴ���';

comment on column RPT_FAULT_DEV_DATE.SIU_FAULT_TIMES is
'���������ϴ���';

comment on column RPT_FAULT_DEV_DATE.DEP_FAULT_TIMES is
'�ŷ���ϴ���';

comment on column RPT_FAULT_DEV_DATE.UPS_FAULT_TIMES is
'����ϵ�Դ���ϴ���';

comment on column RPT_FAULT_DEV_DATE.SPR_FAULT_TIMES is
'�ᵥ��ӡ���ϴ���';

comment on column RPT_FAULT_DEV_DATE.CHK_FAULT_TIMES is
'֧Ʊ��ɨ����ϴ���';

comment on column RPT_FAULT_DEV_DATE.TTU_FAULT_TIMES is
'�ı��ն˵�Ԫ���ϴ���';

comment on column RPT_FAULT_DEV_DATE.PBK_FAULT_TIMES is
'���ڴ�ӡ����ģ��';

comment on column RPT_FAULT_DEV_DATE.CAM_FAULT_TIMES is
'��������ϴ���';

comment on column RPT_FAULT_DEV_DATE.FAULT_TIME is
'������ʱ��';

comment on column RPT_FAULT_DEV_DATE.IDC_FAULT_TIME is
'������������ʱ��';

comment on column RPT_FAULT_DEV_DATE.PIN_FAULT_TIME is
'������̹�����ʱ��';

comment on column RPT_FAULT_DEV_DATE.CDM_FAULT_TIME is
'ȡ��ģ�������ʱ��';

comment on column RPT_FAULT_DEV_DATE.CIM_FAULT_TIME is
'���ģ�������ʱ��';

comment on column RPT_FAULT_DEV_DATE.JPR_FAULT_TIME is
'��־��ӡ��������ʱ��';

comment on column RPT_FAULT_DEV_DATE.RPR_FAULT_TIME is
'ƾƱ��ӡ��������ʱ��';

comment on column RPT_FAULT_DEV_DATE.SIU_FAULT_TIME is
'������������ʱ��';

comment on column RPT_FAULT_DEV_DATE.DEP_FAULT_TIME is
'�ŷ������ʱ��';

comment on column RPT_FAULT_DEV_DATE.UPS_FAULT_TIME is
'����ϵ�Դ������ʱ��';

comment on column RPT_FAULT_DEV_DATE.SPR_FAULT_TIME is
'�ᵥ��ӡ������ʱ��';

comment on column RPT_FAULT_DEV_DATE.CHK_FAULT_TIME is
'֧Ʊ��ɨ�������ʱ��';

comment on column RPT_FAULT_DEV_DATE.TTU_FAULT_TIME is
'�ı��ն˵�Ԫ������ʱ��';

comment on column RPT_FAULT_DEV_DATE.PBK_FAULT_TIME is
'���ڴ�ӡ����ģ����ʱ��';

comment on column RPT_FAULT_DEV_DATE.CAM_FAULT_TIME is
'�����������ʱ��';

/*==============================================================*/
/* Table: RPT_FAULT_DEV_MONTH                                 */
/*==============================================================*/
create table RPT_FAULT_DEV_MONTH 
(
   DEV_NO               VARCHAR2(20)          not null,
   DATE_TIME            VARCHAR2(10)          not null,
  fault_year     VARCHAR2(4),
  fault_month    VARCHAR2(2),
   FAULT_TIMES          NUMBER(20),
   IDC_FAULT_TIMES      NUMBER(20),
   PIN_FAULT_TIMES      NUMBER(20),
   CDM_FAULT_TIMES      NUMBER(20),
   CIM_FAULT_TIMES      NUMBER(20),
   JPR_FAULT_TIMES      NUMBER(20),
   RPR_FAULT_TIMES      NUMBER(20),
   SIU_FAULT_TIMES      NUMBER(20),
   DEP_FAULT_TIMES      NUMBER(20),
   UPS_FAULT_TIMES      NUMBER(20),
   SPR_FAULT_TIMES      NUMBER(20),
   CHK_FAULT_TIMES      NUMBER(20),
   TTU_FAULT_TIMES      NUMBER(20),
   PBK_FAULT_TIMES      NUMBER(20),
   CAM_FAULT_TIMES      NUMBER(20),
   FAULT_TIME           NUMBER(20),
   IDC_FAULT_TIME       NUMBER(20),
   PIN_FAULT_TIME       NUMBER(20),
   CDM_FAULT_TIME       NUMBER(20),
   CIM_FAULT_TIME       NUMBER(20),
   JPR_FAULT_TIME       NUMBER(20),
   RPR_FAULT_TIME       NUMBER(20),
   SIU_FAULT_TIME       NUMBER(20),
   DEP_FAULT_TIME       NUMBER(20),
   UPS_FAULT_TIME       NUMBER(20),
   SPR_FAULT_TIME       NUMBER(20),
   CHK_FAULT_TIME       NUMBER(20),
   TTU_FAULT_TIME       NUMBER(20),
   PBK_FAULT_TIME       NUMBER(20),
   CAM_FAULT_TIME       NUMBER(20),
   constraint PK_RPT_FAULT_DEV_MONTH primary key (DEV_NO,DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 192K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 320K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_FAULT_DEV_MONTH is
'����ͳ�Ʊ���ÿ̨ÿ�£�';

comment on column RPT_FAULT_DEV_MONTH.DEV_NO is
'�豸��';

comment on column RPT_FAULT_DEV_MONTH.DATE_TIME is
'����yyyyMM';

comment on column RPT_FAULT_DEV_MONTH.fault_year
  is '��¼���';
comment on column RPT_FAULT_DEV_MONTH.fault_month
  is '��¼�·�';
comment on column RPT_FAULT_DEV_MONTH.FAULT_TIMES is
'���ϴ���';

comment on column RPT_FAULT_DEV_MONTH.IDC_FAULT_TIMES is
'���������ϴ���';

comment on column RPT_FAULT_DEV_MONTH.PIN_FAULT_TIMES is
'������̹��ϴ���';

comment on column RPT_FAULT_DEV_MONTH.CDM_FAULT_TIMES is
'ȡ��ģ����ϴ���';

comment on column RPT_FAULT_DEV_MONTH.CIM_FAULT_TIMES is
'���ģ����ϴ���';

comment on column RPT_FAULT_DEV_MONTH.JPR_FAULT_TIMES is
'��־��ӡ�����ϴ���';

comment on column RPT_FAULT_DEV_MONTH.RPR_FAULT_TIMES is
'ƾƱ��ӡ�����ϴ���';

comment on column RPT_FAULT_DEV_MONTH.SIU_FAULT_TIMES is
'���������ϴ���';

comment on column RPT_FAULT_DEV_MONTH.DEP_FAULT_TIMES is
'�ŷ���ϴ���';

comment on column RPT_FAULT_DEV_MONTH.UPS_FAULT_TIMES is
'����ϵ�Դ���ϴ���';

comment on column RPT_FAULT_DEV_MONTH.SPR_FAULT_TIMES is
'�ᵥ��ӡ���ϴ���';

comment on column RPT_FAULT_DEV_MONTH.CHK_FAULT_TIMES is
'֧Ʊ��ɨ����ϴ���';

comment on column RPT_FAULT_DEV_MONTH.TTU_FAULT_TIMES is
'�ı��ն˵�Ԫ���ϴ���';

comment on column RPT_FAULT_DEV_MONTH.PBK_FAULT_TIMES is
'���ڴ�ӡ����ģ��';

comment on column RPT_FAULT_DEV_MONTH.CAM_FAULT_TIMES is
'��������ϴ���';

comment on column RPT_FAULT_DEV_MONTH.FAULT_TIME is
'������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.IDC_FAULT_TIME is
'������������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.PIN_FAULT_TIME is
'������̹�����ʱ��';

comment on column RPT_FAULT_DEV_MONTH.CDM_FAULT_TIME is
'ȡ��ģ�������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.CIM_FAULT_TIME is
'���ģ�������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.JPR_FAULT_TIME is
'��־��ӡ��������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.RPR_FAULT_TIME is
'ƾƱ��ӡ��������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.SIU_FAULT_TIME is
'������������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.DEP_FAULT_TIME is
'�ŷ������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.UPS_FAULT_TIME is
'����ϵ�Դ������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.SPR_FAULT_TIME is
'�ᵥ��ӡ������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.CHK_FAULT_TIME is
'֧Ʊ��ɨ�������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.TTU_FAULT_TIME is
'�ı��ն˵�Ԫ������ʱ��';

comment on column RPT_FAULT_DEV_MONTH.PBK_FAULT_TIME is
'���ڴ�ӡ����ģ����ʱ��';

comment on column RPT_FAULT_DEV_MONTH.CAM_FAULT_TIME is
'�����������ʱ��';

/*==============================================================*/
/* Table: RPT_FAULT_DEV_YEAR                                  */
/*==============================================================*/
create table RPT_FAULT_DEV_YEAR 
(
   DEV_NO               VARCHAR2(20)          not null,
   DATE_TIME            VARCHAR2(10)          not null,
  fault_year     VARCHAR2(4),
   FAULT_TIMES          NUMBER(20),
   IDC_FAULT_TIMES      NUMBER(20),
   PIN_FAULT_TIMES      NUMBER(20),
   CDM_FAULT_TIMES      NUMBER(20),
   CIM_FAULT_TIMES      NUMBER(20),
   JPR_FAULT_TIMES      NUMBER(20),
   RPR_FAULT_TIMES      NUMBER(20),
   SIU_FAULT_TIMES      NUMBER(20),
   DEP_FAULT_TIMES      NUMBER(20),
   UPS_FAULT_TIMES      NUMBER(20),
   SPR_FAULT_TIMES      NUMBER(20),
   CHK_FAULT_TIMES      NUMBER(20),
   TTU_FAULT_TIMES      NUMBER(20),
   PBK_FAULT_TIMES      NUMBER(20),
   CAM_FAULT_TIMES      NUMBER(20),
   FAULT_TIME           NUMBER(20),
   IDC_FAULT_TIME       NUMBER(20),
   PIN_FAULT_TIME       NUMBER(20),
   CDM_FAULT_TIME       NUMBER(20),
   CIM_FAULT_TIME       NUMBER(20),
   JPR_FAULT_TIME       NUMBER(20),
   RPR_FAULT_TIME       NUMBER(20),
   SIU_FAULT_TIME       NUMBER(20),
   DEP_FAULT_TIME       NUMBER(20),
   UPS_FAULT_TIME       NUMBER(20),
   SPR_FAULT_TIME       NUMBER(20),
   CHK_FAULT_TIME       NUMBER(20),
   TTU_FAULT_TIME       NUMBER(20),
   PBK_FAULT_TIME       NUMBER(20),
   CAM_FAULT_TIME       NUMBER(20),
   constraint PK_RPT_FAULT_DEV_YEAR primary key (DEV_NO,DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 128K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_FAULT_DEV_YEAR is
'����ͳ�Ʊ���ÿ̨ÿ�꣩';

comment on column RPT_FAULT_DEV_YEAR.DEV_NO is
'�豸��';

comment on column RPT_FAULT_DEV_YEAR.DATE_TIME is
'����yyyy';

comment on column RPT_FAULT_DEV_YEAR.fault_year
  is '��¼���';
comment on column RPT_FAULT_DEV_YEAR.FAULT_TIMES is
'���ϴ���';

comment on column RPT_FAULT_DEV_YEAR.IDC_FAULT_TIMES is
'���������ϴ���';

comment on column RPT_FAULT_DEV_YEAR.PIN_FAULT_TIMES is
'������̹��ϴ���';

comment on column RPT_FAULT_DEV_YEAR.CDM_FAULT_TIMES is
'ȡ��ģ����ϴ���';

comment on column RPT_FAULT_DEV_YEAR.CIM_FAULT_TIMES is
'���ģ����ϴ���';

comment on column RPT_FAULT_DEV_YEAR.JPR_FAULT_TIMES is
'��־��ӡ�����ϴ���';

comment on column RPT_FAULT_DEV_YEAR.RPR_FAULT_TIMES is
'ƾƱ��ӡ�����ϴ���';

comment on column RPT_FAULT_DEV_YEAR.SIU_FAULT_TIMES is
'���������ϴ���';

comment on column RPT_FAULT_DEV_YEAR.DEP_FAULT_TIMES is
'�ŷ���ϴ���';

comment on column RPT_FAULT_DEV_YEAR.UPS_FAULT_TIMES is
'����ϵ�Դ���ϴ���';

comment on column RPT_FAULT_DEV_YEAR.SPR_FAULT_TIMES is
'�ᵥ��ӡ���ϴ���';

comment on column RPT_FAULT_DEV_YEAR.CHK_FAULT_TIMES is
'֧Ʊ��ɨ����ϴ���';

comment on column RPT_FAULT_DEV_YEAR.TTU_FAULT_TIMES is
'�ı��ն˵�Ԫ���ϴ���';

comment on column RPT_FAULT_DEV_YEAR.PBK_FAULT_TIMES is
'���ڴ�ӡ����ģ��';

comment on column RPT_FAULT_DEV_YEAR.CAM_FAULT_TIMES is
'��������ϴ���';

comment on column RPT_FAULT_DEV_YEAR.FAULT_TIME is
'������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.IDC_FAULT_TIME is
'������������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.PIN_FAULT_TIME is
'������̹�����ʱ��';

comment on column RPT_FAULT_DEV_YEAR.CDM_FAULT_TIME is
'ȡ��ģ�������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.CIM_FAULT_TIME is
'���ģ�������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.JPR_FAULT_TIME is
'��־��ӡ��������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.RPR_FAULT_TIME is
'ƾƱ��ӡ��������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.SIU_FAULT_TIME is
'������������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.DEP_FAULT_TIME is
'�ŷ������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.UPS_FAULT_TIME is
'����ϵ�Դ������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.SPR_FAULT_TIME is
'�ᵥ��ӡ������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.CHK_FAULT_TIME is
'֧Ʊ��ɨ�������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.TTU_FAULT_TIME is
'�ı��ն˵�Ԫ������ʱ��';

comment on column RPT_FAULT_DEV_YEAR.PBK_FAULT_TIME is
'���ڴ�ӡ����ģ����ʱ��';

comment on column RPT_FAULT_DEV_YEAR.CAM_FAULT_TIME is
'�����������ʱ��';

create table RUN_STATUS_TABLE
(
  logic_id    VARCHAR2(36) not null,
  dev_no      VARCHAR2(20) not null,
  date_time   VARCHAR2(20) not null,
  run_status  VARCHAR2(2),
  action_note VARCHAR2(2),
   constraint PK_RUN_STATUS_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
partition by range (DATE_TIME)
(
  partition RUN_STATUS_PART19 values less than ('2019-12-31 00:00:00')
    tablespace ZHYGSPACE,
  partition RUN_STATUS_PART20 values less than ('2020-12-31 00:00:00')
    tablespace ZHYGSPACE,
  partition RUN_STATUS_MAXPART values less than (MAXVALUE)
    tablespace ZHYGSPACE
);
comment on table RUN_STATUS_TABLE
  is '����״̬��¼��';
comment on column RUN_STATUS_TABLE.logic_id
  is '���';
comment on column RUN_STATUS_TABLE.dev_no
  is '�豸��';
comment on column RUN_STATUS_TABLE.date_time
  is '״̬�ı�ʱ��';
comment on column RUN_STATUS_TABLE.run_status
  is '����״̬';
comment on column RUN_STATUS_TABLE.action_note
  is '������״̬';


create table SYS_MENU
(
  no          VARCHAR2(5) not null,
  name        VARCHAR2(40) not null,
  note        VARCHAR2(30),
  BG_COLOR        VARCHAR2(20),
  TILE_IMAGE        VARCHAR2(100),
  LINK        VARCHAR2(100),
  ICON        VARCHAR2(100),
  MENU_ORDER     NUMBER(5),
   constraint PK_SYS_MENU primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_MENU
  is '�˵���';
comment on column SYS_MENU.no
  is '���';
comment on column SYS_MENU.name
  is '˳��';
comment on column SYS_MENU.note
  is '��ע';
comment on column SYS_MENU.BG_COLOR
  is '������ɫ';
comment on column SYS_MENU.TILE_IMAGE
  is 'ͼƬ';
comment on column SYS_MENU.LINK
  is '����';
comment on column SYS_MENU.ICON
  is 'ͼ������';
comment on column SYS_MENU.MENU_ORDER
  is '˳���ţ���1��ʼ';

create table SYS_BUTTON
(
  no           VARCHAR2(20) not null,
  name         VARCHAR2(40),
  menu         VARCHAR2(5),
  note         VARCHAR2(30),
  button_order VARCHAR2(5),
  url          VARCHAR2(10),
  AUDIT_FLAG  VARCHAR2(1) not null,
   constraint PK_SYS_BUTTON primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_BUTTON
  is '��ť��';
comment on column SYS_BUTTON.no
  is '���';
comment on column SYS_BUTTON.name
  is '����';
comment on column SYS_BUTTON.menu
  is '�����˵�';
comment on column SYS_BUTTON.note
  is '��ע';
comment on column SYS_BUTTON.AUDIT_FLAG
  is '�Ƿ������ Y:��� N:�����';
alter table SYS_BUTTON
  add constraint FK_BUTTON_R_MENU foreign key (MENU)
  references SYS_MENU (NO);

create table SYS_JOB
(
  job       VARCHAR2(100) not null,
  date_time VARCHAR2(10) not null,
  status    NUMBER(38),
  note      VARCHAR2(200),
   constraint PK_SYS_JOB primary key (JOB, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_JOB
  is '��ʱ����ִ�н����';
comment on column SYS_JOB.job
  is '������';
comment on column SYS_JOB.date_time
  is 'ִ��ʱ��';
comment on column SYS_JOB.status
  is '0��ʧ�ܣ�1���ɹ�';
comment on column SYS_JOB.note
  is '��ע';


create table SYS_ORG_TYPE
(
  no    VARCHAR2(40) not null,
  type  VARCHAR2(50) not null,
  grade VARCHAR2(2) not null,
   constraint PK_SYS_ORG_TYPE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_ORG_TYPE
  is '�������ͱ�';
comment on column SYS_ORG_TYPE.no
  is '�������ͱ��';
comment on column SYS_ORG_TYPE.type
  is '��������';
comment on column SYS_ORG_TYPE.grade
  is '��������';

create table SYS_ORG
(
  no                  VARCHAR2(20) not null,
  name                VARCHAR2(160) not null,
  parent_org          VARCHAR2(20),
  left_no                NUMBER(38),
  right_no               NUMBER(38),
  org_type            VARCHAR2(40),
  moneyorg_flag       VARCHAR2(1),
  x                   VARCHAR2(20),
  y                   VARCHAR2(20),
  address             VARCHAR2(200),
  linkman             VARCHAR2(30),
  telephone           VARCHAR2(30),
  mobile              VARCHAR2(30),
  fax                 VARCHAR2(30),
  email               VARCHAR2(40),
  business_range      VARCHAR2(256),
  cup_area_code       VARCHAR2(8),
  address_code        VARCHAR2(15),
  AREA_NO_PROVINCE             VARCHAR2(10),
  AREA_NO_CITY             VARCHAR2(10),
  AREA_NO_COUNTY             VARCHAR2(10),
  area_type           VARCHAR2(3),
  org_physics_catalog VARCHAR2(3),
  note                VARCHAR2(100),
  IS_SELFHELP   Number(5,0),
  IS_BANKOUTLET  Number(5,0),
  AREA_NO    Varchar(10),
  ORG_STATUS   Number(5,0),
   constraint PK_SYS_ORG primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_ORG
  is '��֯������';
comment on column SYS_ORG.no
  is '�������';
comment on column SYS_ORG.name
  is '��������';
comment on column SYS_ORG.parent_org
  is 'ֱ���ϼ�';
comment on column SYS_ORG.left_no
  is 'Ԥ���������';
comment on column SYS_ORG.right_no
  is 'Ԥ���������';
comment on column SYS_ORG.org_type
  is '�������ͣ�';
comment on column SYS_ORG.moneyorg_flag
  is '�Ƿ��Ǽӳ�������1���� 2����';
comment on column SYS_ORG.x
  is '�����꣨���ȣ�';
comment on column SYS_ORG.y
  is '�����꣨γ�ȣ�';
comment on column SYS_ORG.address
  is '��ַ';
comment on column SYS_ORG.linkman
  is '��ϵ��';
comment on column SYS_ORG.telephone
  is '�绰';
comment on column SYS_ORG.mobile
  is '�ֻ�';
comment on column SYS_ORG.fax
  is '����';
comment on column SYS_ORG.email
  is '�����ʼ�';
comment on column SYS_ORG.business_range
  is 'ҵ��Χ';
comment on column SYS_ORG.cup_area_code
  is '������׼��������';
comment on column SYS_ORG.address_code
  is '�ص����';
comment on column SYS_ORG.AREA_NO_PROVINCE
  is '����ʡ���������';
comment on column SYS_ORG.AREA_NO_CITY
  is '�������м��������';
comment on column SYS_ORG.AREA_NO_COUNTY
  is '�����ؼ��������';
comment on column SYS_ORG.area_type
  is '�����������ͣ�1������������ 2���м���ҵ���� 3���������ؼ����� 4����ҵ԰�� 5��������ҵ���� 6�����й��������� 7�������� 8����ס����';
comment on column SYS_ORG.org_physics_catalog
  is '�����������ͣ�1��ȫ������������ 2��ȫ������������ 3���������������� 4���������������� 5���Ƹ����ģ�';
comment on column SYS_ORG.note
  is '��ע';
comment on column SYS_ORG.IS_SELFHELP
  is '�Ƿ����������� 1���� 0������';
comment on column SYS_ORG.IS_BANKOUTLET
  is '�Ƿ�������  1���� 0������';
comment on column SYS_ORG.AREA_NO
  is '�������';
comment on column SYS_ORG.ORG_STATUS
  is '����״̬';
alter table SYS_ORG
  add constraint FK_SYS_ORG_R_PARENT_ORG foreign key (PARENT_ORG)
  references SYS_ORG (NO);
alter table SYS_ORG
  add constraint FK_SYS_ORG_R_TYPE foreign key (ORG_TYPE)
  references SYS_ORG_TYPE (NO);


create table SYS_ROLE
(
  no       VARCHAR2(50) not null,
  name     VARCHAR2(50) not null,
  org_type VARCHAR2(50),
  note     VARCHAR2(200),
   constraint PK_SYS_ROLE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_ROLE
  is '��ɫ��';
comment on column SYS_ROLE.no
  is '��ɫ���';
comment on column SYS_ROLE.name
  is '��ɫ����';
comment on column SYS_ROLE.org_type
  is '��ɫ������������';
comment on column SYS_ROLE.note
  is '��ע';

create table SYS_ROLE_BUTTON
(
  role_no   VARCHAR2(50) not null,
  button_no VARCHAR2(20) not null,
   constraint PK_SYS_ROLE_BUTTON primary key (ROLE_NO, BUTTON_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_ROLE_BUTTON
  is '��ɫ��ťȨ�ޱ� ';
comment on column SYS_ROLE_BUTTON.role_no
  is '��ɫ���';
comment on column SYS_ROLE_BUTTON.button_no
  is '��ť���';
alter table SYS_ROLE_BUTTON
  add constraint FK_ROLE_BUTTON_R_BUTTON foreign key (BUTTON_NO)
  references SYS_BUTTON (NO)
  disable
  novalidate;
alter table SYS_ROLE_BUTTON
  add constraint FK_ROLE_BUTTON_R_ROLE foreign key (ROLE_NO)
  references SYS_ROLE (NO)
  disable
  novalidate;

create table SYS_ROLE_MENU
(
  role_no VARCHAR2(50) not null,
  menu_no VARCHAR2(5) not null,
   constraint PK_SYS_ROLE_MENU primary key (ROLE_NO, MENU_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_ROLE_MENU
  is '��ɫ�˵�Ȩ�ޱ� ';
comment on column SYS_ROLE_MENU.role_no
  is '��ɫ���';
comment on column SYS_ROLE_MENU.menu_no
  is '�˵����';
alter table SYS_ROLE_MENU
  add constraint FK_ROLE_MENU_R_MENU foreign key (MENU_NO)
  references SYS_MENU (NO);
alter table SYS_ROLE_MENU
  add constraint FK_ROLE_MENU_R_ROLE foreign key (ROLE_NO)
  references SYS_ROLE (NO)
  disable
  novalidate;


create table TRANS_INFO
(
  transserialnum          VARCHAR2(20) not null,
  transtime               VARCHAR2(14) not null,
  devno                   VARCHAR2(20) not null,
  transtype               VARCHAR2(10) not null,
  transamount             NUMBER(38),
  transcurrent            VARCHAR2(3),
  cardno                  VARCHAR2(25),
  cardtype                VARCHAR2(3),
  payintoaccount          VARCHAR2(20),
  payintoaccounttype      VARCHAR2(3),
  hostserialno            VARCHAR2(12),
  additionalinf           VARCHAR2(20),
  retcode                 VARCHAR2(6),
  transstatus             VARCHAR2(4),
  cardflag                NUMBER(38),
  original_local_serialno VARCHAR2(6),
  charge                  VARCHAR2(12),
  examine_teller_no       VARCHAR2(10),
  ushield_certificate_no  VARCHAR2(50),
  token_no                VARCHAR2(50),
  card_business_type      VARCHAR2(10),
  signing_info            VARCHAR2(20),
  hostinfo                VARCHAR2(200),
  cost_time               NUMBER,
   constraint PK_TRANS_INFO primary key (TRANSSERIALNUM, TRANSTIME, DEVNO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
partition by range (TRANSTIME)
(
  partition TRANS_INFO_PART1912 values less than ('20191231235959')
    tablespace ZHYGSPACE,
  partition TRANS_INFO_PART2012 values less than ('20201231235959')
    tablespace ZHYGSPACE,
  partition TRANS_INFO_MAXPART values less than (MAXVALUE)
    tablespace ZHYGSPACE
);
comment on table TRANS_INFO
  is '������Ϣ��';
comment on column TRANS_INFO.cost_time
  is '���׺�ʱ';

create table TRANS_RET_CODE
(
  ret_code        VARCHAR2(10) not null,
  detail_explain  VARCHAR2(300) not null,
  briefly_explain VARCHAR2(150),
  trans_status    CHAR(1),
   constraint PK_TRANS_RET_CODE primary key (RET_CODE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TRANS_RET_CODE
  is '���ش�������ձ�';
comment on column TRANS_RET_CODE.ret_code
  is '���ؾܾ���';
comment on column TRANS_RET_CODE.detail_explain
  is '˵��';
comment on column TRANS_RET_CODE.briefly_explain
  is '��Ҫ˵��';
comment on column TRANS_RET_CODE.trans_status
  is '1���ɹ���2��ʧ�ܣ�3����ʱ';

create table TRANS_TYPE
(
  no                  VARCHAR2(20) not null,
  name                VARCHAR2(50),
  note                VARCHAR2(80),
  accounts_check_flag NUMBER(38) default 0,
  cashflag            NUMBER(38),
  trans_value         INTEGER default 0 not null,
  CATEGORY            VARCHAR2(2),
   constraint PK_TRANS_TYPE primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TRANS_TYPE
  is '�������ͱ�';
comment on column TRANS_TYPE.no
  is '�������ͺ�';
comment on column TRANS_TYPE.name
  is '��������';
comment on column TRANS_TYPE.note
  is '��ע˵��';
comment on column TRANS_TYPE.accounts_check_flag
  is '���˱�־';
comment on column TRANS_TYPE.cashflag
  is '�ֽ��ʶ 1:�ֽ� 0:���ֽ�';
comment on column TRANS_TYPE.trans_value
  is '���׼�ֵ';
comment on column TRANS_TYPE.CATEGORY
  is '�����������';


create table USR_MONITOR_SELECT
(
  user_no                VARCHAR2(20) not null,
  monitor_type           VARCHAR2(2) not null,
  org_no                 VARCHAR2(20) not null,
  monitor_status         VARCHAR2(30) not null,
  sort                   VARCHAR2(2) not null,
  dev_no                 VARCHAR2(20),
  dev_catalog            VARCHAR2(5) not null,
  dev_vendor             VARCHAR2(5) not null,
  dev_work_type          NUMBER(38) not null,
  dev_away_flag          NUMBER(38) not null,
  dev_atmc               VARCHAR2(50) not null,
  dev_os                 VARCHAR2(50) not null,
  care_level             CHAR(1),
  dev_location           VARCHAR2(10),
  monitor_interval       VARCHAR2(3),
  row_select             VARCHAR2(200),
  row_unselect           VARCHAR2(200),
  note                   VARCHAR2(10),
  group_method           NUMBER(38),
  status_relationship    NUMBER(38),
  monitor_status_type    NUMBER(38),
  defined_monitor_status VARCHAR2(30),
  dev_cash_flag          VARCHAR2(10),
   constraint PK_USR_MONITOR_SELECT primary key (USER_NO, MONITOR_TYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table USR_MONITOR_SELECT
  is 'Զ�̼��������';
comment on column USR_MONITOR_SELECT.user_no
  is '��Ա���';
comment on column USR_MONITOR_SELECT.monitor_type
  is '�������';
comment on column USR_MONITOR_SELECT.org_no
  is 'ѡ���ػ���';
comment on column USR_MONITOR_SELECT.monitor_status
  is '8λ������״̬
5λ��ģ��״̬
5λ������״̬
5λ������״̬';
comment on column USR_MONITOR_SELECT.sort
  is '0������
 1������';
comment on column USR_MONITOR_SELECT.dev_no
  is '�����Ų�ѯ������������ģ����ѯ�����Զ�������ѯ(����Ϊ�豸��,�豸��,...),�и�������';
comment on column USR_MONITOR_SELECT.dev_catalog
  is '0��ȫ��';
comment on column USR_MONITOR_SELECT.dev_vendor
  is '0��ȫ��';
comment on column USR_MONITOR_SELECT.dev_work_type
  is '0��ȫ��';
comment on column USR_MONITOR_SELECT.dev_away_flag
  is '0��ȫ��';
comment on column USR_MONITOR_SELECT.dev_atmc
  is '0��ȫ��';
comment on column USR_MONITOR_SELECT.dev_os
  is '0��ȫ��';
comment on column USR_MONITOR_SELECT.care_level
  is '1-�ص�2-�е�3-һ��';
comment on column USR_MONITOR_SELECT.dev_location
  is '�豸λ��';
comment on column USR_MONITOR_SELECT.monitor_interval
  is 'ˢ��Ƶ��';
comment on column USR_MONITOR_SELECT.row_select
  is '��ʾ����';
comment on column USR_MONITOR_SELECT.row_unselect
  is '����ʾ����';
comment on column USR_MONITOR_SELECT.note
  is '|�ָ����ڴ��0ȫ��1�ֽ�2���ֽ��豸';
comment on column USR_MONITOR_SELECT.group_method
  is '���鷽ʽ';
comment on column USR_MONITOR_SELECT.status_relationship
  is '����״̬��ģ��״̬������״̬������״̬֮��Ĺ�ϵ  0-ȫ������ 1-������һ';
comment on column USR_MONITOR_SELECT.monitor_status_type
  is '���״̬���� 0-�Զ���ģʽ 1-��׼ģʽ';
comment on column USR_MONITOR_SELECT.defined_monitor_status
  is '�Զ�����״̬ ǰ0-8λΪ���״̬9-17λΪ�����״̬';
comment on column USR_MONITOR_SELECT.dev_cash_flag
  is 'DEV_CASH_FLAG';


--DB_LOCKS���ṹ
CREATE TABLE DB_LOCKS (
  LOCKNAME  VARCHAR2(40) not null,
  TAKEFLAG   VARCHAR2(1) default 0,
  TAKEUPTIME TIMESTAMP,
  TAKEUSER   VARCHAR2(60),
   constraint PK_DB_LOCKS primary key (LOCKNAME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on column DB_LOCKS.LOCKNAME
  is '����';
comment on column DB_LOCKS.TAKEFLAG
  is '0��δռ�ã�1��ռ��';
comment on column DB_LOCKS.TAKEUPTIME
  is 'ռ��ʱ��';
comment on column DB_LOCKS.TAKEUSER
  is 'ռ����';

--DB_SERVERS_STATE���ṹ
CREATE TABLE DB_SERVERS_STATE
  (
    SERVERNAME     VARCHAR2(200) NOT NULL,
    LASTCHECKINTIME INT NOT NULL,
    CHECKININTERVAL INT NOT NULL,
    SERVERIP       VARCHAR2(30),
    SERVERSTATE     VARCHAR2(2) NOT NULL,
   constraint PK_DB_SERVERS_STATE primary key (SERVERNAME,SERVERIP)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on column DB_SERVERS_STATE.SERVERNAME
  is '��������';
comment on column DB_SERVERS_STATE.LASTCHECKINTIME
  is '��һ�μ��ʱ��';
comment on column DB_SERVERS_STATE.CHECKININTERVAL
  is '���ʱ����';
comment on column DB_SERVERS_STATE.SERVERIP
  is '������IP';
comment on column DB_SERVERS_STATE.SERVERSTATE
  is '������״̬��1:������-1���쳣';

create table SYS_LOG
(
  user_no VARCHAR2(20) not null,
  operate_time    VARCHAR2(20) not null,
  MENU_NO VARCHAR2(100) not null,
  BTN_NO VARCHAR2(30) not null,
  no      VARCHAR2(20) not null,
  Current_detail   blob,
  Before_detail  blob,
  note      VARCHAR2(100),
   constraint PK_SYS_LOG primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_LOG
  is '������־';
comment on column SYS_LOG.user_no
  is '�����û�';
comment on column SYS_LOG.operate_time
  is '����ʱ�� YYYY-MM-DD hh:mi:ss';
comment on column SYS_LOG.MENU_NO
  is '����ģ���� ͬSYS_OPERATE.MENU_NO';
comment on column SYS_LOG.BTN_NO
  is '������� ͬSYS_OPERATE.BTN_NO';
comment on column SYS_LOG.no
  is '��¼��� yyyymmddhhmissSSS';
comment on column SYS_LOG.Current_detail
  is '��������ϸ����';
comment on column SYS_LOG.Before_detail
  is '����ǰ��ϸ����';
comment on column SYS_LOG.note
  is '��ע';

create table SYS_OPERATE
(
  MENU_NO   VARCHAR2(100) not null,
  BTN_NO        VARCHAR2(30) not null,
  MENU_NAME VARCHAR2(60) not null,
  BTN_NAME  VARCHAR2(30) not null,
   constraint PK_SYS_OPERATE primary key (MENU_NO,BTN_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_OPERATE
  is '������';
comment on column SYS_OPERATE.menu_name
  is '����ģ������';
comment on column SYS_OPERATE.btn_name
  is '��������';
comment on column SYS_OPERATE.BTN_NO
  is '������� ������';
comment on column SYS_OPERATE.MENU_NO
  is '����ģ���� ����';


/*==============================================================*/
/* Table: SHORTEN_TABLE                                         */
/*==============================================================*/
create table SHORTEN_TABLE 
(
   LOGIC_ID             VARCHAR2(36)          not null,
   DEV_NO               VARCHAR2(20)          not null,
   LACK_TYPE            INTEGER              not null,
   LACK_DATE            VARCHAR2(10)          not null,
   LACK_TIME            VARCHAR2(10)          not null,
   PERIOD               VARCHAR2(10),
   UNLACK_DATE          VARCHAR2(10),
   UNLACK_TIME          VARCHAR2(10),
   STATUS               VARCHAR2(1),
   constraint PK_SHORTEN_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
PARTITION BY RANGE (LACK_DATE) (
PARTITION SHORTEN_TABLE_PART1912 VALUES LESS THAN ('2019-12-32') tablespace ZHYGSPACE,
PARTITION SHORTEN_TABLE_PART2012 VALUES LESS THAN ('2020-12-32') tablespace ZHYGSPACE,
PARTITION SHORTEN_TABLE_MAXPART VALUES LESS THAN (MAXVALUE) tablespace ZHYGSPACE
);

comment on table SHORTEN_TABLE is
'ȱ��ȱֽ��ˮ��';

comment on column SHORTEN_TABLE.LOGIC_ID is
'���';

comment on column SHORTEN_TABLE.DEV_NO is
'�豸��';

comment on column SHORTEN_TABLE.LACK_TYPE is
'1 �C ȱ�����ٳ���
2 �C ƾ����ӡ��ȱֽ����ֽ��
3 �C ��־��ӡ��ȱֽ����ֽ��';

comment on column SHORTEN_TABLE.LACK_DATE is
'��������';

comment on column SHORTEN_TABLE.LACK_TIME is
'����ʱ��';

comment on column SHORTEN_TABLE.PERIOD is
'������ں�';

comment on column SHORTEN_TABLE.UNLACK_DATE is
'��������';

comment on column SHORTEN_TABLE.UNLACK_TIME is
'����ʱ��';

comment on column SHORTEN_TABLE.STATUS is
'״̬';


/*==============================================================*/
/* Table: CLEAR_TABLE                                           */
/*==============================================================*/
create table CLEAR_TABLE 
(
   LOGIC_ID             VARCHAR2(36)          not null,
   DEV_NO               VARCHAR2(20)          not null,
   CLEAR_TIME           TIMESTAMP            not null,
   DEPOSIT_COUNT        INTEGER,
   DEPOSIT_AMOUNT       NUMBER(20,2),
   WITHDRAW_COUNT       INTEGER,
   WITHDRAW_AMOUNT      NUMBER(20,2),
   TRANSFER_COUNT       INTEGER,
   TRANSFER_AMOUNT      NUMBER(20,2),
   constraint PK_CLEAR_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
PARTITION BY RANGE (CLEAR_TIME) (
PARTITION CLEAR_TABLE_PART1912 VALUES LESS THAN (to_date('2019-12-31','yyyy-mm-dd')) tablespace ZHYGSPACE,
PARTITION CLEAR_TABLE_PART2012 VALUES LESS THAN (to_date('2020-12-31','yyyy-mm-dd')) tablespace ZHYGSPACE,
PARTITION CLEAR_TABLE_MAXPART VALUES LESS THAN (MAXVALUE) tablespace ZHYGSPACE
);

comment on table CLEAR_TABLE is
'������ı�';

comment on column CLEAR_TABLE.LOGIC_ID is
'���';

comment on column CLEAR_TABLE.DEV_NO is
'�豸��';

comment on column CLEAR_TABLE.CLEAR_TIME is
'���ʱ��';

comment on column CLEAR_TABLE.DEPOSIT_COUNT is
'������';

comment on column CLEAR_TABLE.DEPOSIT_AMOUNT is
'�����';

comment on column CLEAR_TABLE.WITHDRAW_COUNT is
'ȡ�����';

comment on column CLEAR_TABLE.WITHDRAW_AMOUNT is
'ȡ����';

comment on column CLEAR_TABLE.TRANSFER_COUNT is
'ת�ʱ���';

comment on column CLEAR_TABLE.TRANSFER_AMOUNT is
'ת�ʽ��';


/*==============================================================*/
/* Table: RETAIN_CARD_TRACE                                     */
/*==============================================================*/
create table RETAIN_CARD_TRACE 
(
   LOGIC_ID             VARCHAR2(36)         not null,
   DEV_NO               VARCHAR2(20)         not null,
   STATUS_CHANGE_DATE   VARCHAR2(10)             not null,
   STATUS_CHANGE_TIME   VARCHAR2(10)             not null,
   ACCOUNT              VARCHAR2(25),
   STATUS               VARCHAR2(2),
   NOTE                 VARCHAR2(200),
   CARD_INFO_LOGIC_ID   VARCHAR2(36)         not null,
   constraint PK_RETAIN_CARD_TRACE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage (initial 64K)
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage (initial 64K)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RETAIN_CARD_TRACE is
'�̿��������̱�';

comment on column RETAIN_CARD_TRACE.LOGIC_ID is
'���';

comment on column RETAIN_CARD_TRACE.DEV_NO is
'�豸��';

comment on column RETAIN_CARD_TRACE.STATUS_CHANGE_DATE is
'״̬�ı�����';

comment on column RETAIN_CARD_TRACE.STATUS_CHANGE_TIME is
'״̬�ı�ʱ��';

comment on column RETAIN_CARD_TRACE.ACCOUNT is
'����';

comment on column RETAIN_CARD_TRACE.STATUS is
'0 ����
1 ����
3 ���ƽ�������
20 ��ȡ
21 ����';

comment on column RETAIN_CARD_TRACE.NOTE is
'��ע';

comment on column RETAIN_CARD_TRACE.CARD_INFO_LOGIC_ID is
'�̿���ϢID';


/*==============================================================*/
/* Table: DEV_CASH_CLEAR                                        */
/*==============================================================*/
create table DEV_CASH_CLEAR 
(
   DEV_NO               VARCHAR2(20)          not null,
   ADDCASH_ID           CHAR(10)             not null,
   ADDCASH_DATETIME     CHAR(19),
   ADDCASH_AMOUNT       INTEGER,
   ADDCASH_TYPE         VARCHAR2(60),
   ADDCASH_COUNT        VARCHAR2(60),
   CLEAR_DATETIME       CHAR(19),
   ADDCASH_LEFT         INTEGER,
   ADDCASH_LASTAMOUNT   INTEGER,
   ADDCASH_RETRACTCOUNT INTEGER,
   DEPOSIT_COUNT        INTEGER,
   DEPOSIT_AMOUNT       INTEGER,
   WITHDRAW_COUNT       INTEGER,
   WITHDRAW_AMOUNT      INTEGER,
   CLEAR_ID             VARCHAR2(30),
   CASHUTIL_AMOUNT      VARCHAR2(100),
   CASHBY_HANDCOUNT     VARCHAR2(100),
   ADD_ID               VARCHAR2(30),
   ADD_CASH_METHOD		VARCHAR2(2),
   constraint PK_DEV_CASH_CLEAR primary key (DEV_NO, ADDCASH_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_CASH_CLEAR is
'�豸��ӳ���Ϣ��';

comment on column DEV_CASH_CLEAR.DEV_NO is
'�豸��';

comment on column DEV_CASH_CLEAR.ADDCASH_ID is
'�ӳ���ʶ����ǰ����+��ţ����Ϊ��λ����00~99��';

comment on column DEV_CASH_CLEAR.ADDCASH_DATETIME is
'�ӳ�ʱ��';

comment on column DEV_CASH_CLEAR.ADDCASH_AMOUNT is
'�ӳ����';

comment on column DEV_CASH_CLEAR.ADDCASH_TYPE is
'�ӳ���ֵ���� ��50,100������ֵ�Զ��ŷָ�';

comment on column DEV_CASH_CLEAR.ADDCASH_COUNT is
'�ӳ����� �� 1000,2000 ������ֵ��AddCashType����ֵ��Ӧ��ͬ���Զ��ŷָ�';

comment on column DEV_CASH_CLEAR.CLEAR_DATETIME is
'���ʱ��';

comment on column DEV_CASH_CLEAR.ADDCASH_LEFT is
'����β�����';

comment on column DEV_CASH_CLEAR.ADDCASH_LASTAMOUNT is
'����ʣ��������������䣩';

comment on column DEV_CASH_CLEAR.ADDCASH_RETRACTCOUNT is
'����������';

comment on column DEV_CASH_CLEAR.DEPOSIT_COUNT is
'����ܱ���';

comment on column DEV_CASH_CLEAR.DEPOSIT_AMOUNT is
'����ܽ��';

comment on column DEV_CASH_CLEAR.WITHDRAW_COUNT is
'ȡ���ܱ���';

comment on column DEV_CASH_CLEAR.WITHDRAW_AMOUNT is
'ȡ���ܽ��';

comment on column DEV_CASH_CLEAR.CLEAR_ID is
'CLEAR_ID';

comment on column DEV_CASH_CLEAR.CASHUTIL_AMOUNT is
'CASHUTIL_AMOUNT';

comment on column DEV_CASH_CLEAR.CASHBY_HANDCOUNT is
'CASHBY_HANDCOUNT';

comment on column DEV_CASH_CLEAR.ADD_ID is
'ADD_ID';

comment on column DEV_CASH_CLEAR.ADD_CASH_METHOD is 
'�ӳ���ʽ��0-���ؼӳ���1-�����ӳ���';


/*==============================================================*/
/* Table: RUN_STATUS_DEV_TABLE                                  */
/*==============================================================*/
create table RUN_STATUS_DEV_TABLE
(
  DEV_NO     VARCHAR2(20) not null,
  DATE_TIME  VARCHAR2(20) not null,
  RUN_STATUS VARCHAR2(2),
  STATUS_NO  VARCHAR2(10),
  DATE_YMD   VARCHAR2(10) not null,
   constraint PK_RUN_STATUS_DEV_TABLE primary key (DEV_NO, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
tablespace ZHYGSPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table RUN_STATUS_DEV_TABLE
  is '�����ʱ����豸����״̬��';
-- Add comments to the columns 
comment on column RUN_STATUS_DEV_TABLE.DEV_NO
  is '�豸��';
comment on column RUN_STATUS_DEV_TABLE.DATE_TIME
  is '����ʱ��';
comment on column RUN_STATUS_DEV_TABLE.RUN_STATUS
  is '״̬';
comment on column RUN_STATUS_DEV_TABLE.STATUS_NO
  is '״̬���';
comment on column RUN_STATUS_DEV_TABLE.DATE_YMD
  is '����yyyy-MM-dd';

 
/*==============================================================*/
/* Table: DEV_STOP_TABLE                                        */
/*==============================================================*/
create table DEV_STOP_TABLE 
(
   LOGIC_ID             VARCHAR2(36)          not null,
   DEV_NO               VARCHAR2(20)          not null,
   SET_TIME             CHAR(19)             not null,
   STOPDEV_START_TIME   CHAR(16)             not null,
   STOPDEV_END_TIME     CHAR(16)             not null,
   STOPDEV_TYPE         INTEGER              not null,
   STOPDEV_REASON       VARCHAR2(200)         not null,
   STATUS               INTEGER              not null,
   OP_NO                VARCHAR2(20),
   ISAFTER              INTEGER              default 0 not null,
   constraint PK_DEV_STOP_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DEV_STOP_TABLE is
'�豸ͣ����';

comment on column DEV_STOP_TABLE.LOGIC_ID is
'�߼�����';

comment on column DEV_STOP_TABLE.DEV_NO is
'�豸��';

comment on column DEV_STOP_TABLE.SET_TIME is
'����ͣ��ʱ��';

comment on column DEV_STOP_TABLE.STOPDEV_START_TIME is
'ͣ����ʼʱ��(yyyy-mm-dd HH:MM��';

comment on column DEV_STOP_TABLE.STOPDEV_END_TIME is
'ͣ������ʱ��(YYYY-MM-DD HH:MM)';

comment on column DEV_STOP_TABLE.STOPDEV_TYPE is
'ͣ��ԭ������
(0:�ż�
1:װ��
2:ͣ��
3:�豸����δ�޸�
4:����
)';

comment on column DEV_STOP_TABLE.STOPDEV_REASON is
'ͣ��ԭ��';

comment on column DEV_STOP_TABLE.STATUS is
'ͣ��״̬
(0��ͣ��δ��ʼ��
1������ͣ��
2��ͣ������
)';

comment on column DEV_STOP_TABLE.OP_NO is
'����Ա';

comment on column DEV_STOP_TABLE.ISAFTER is
'��ǰ���º�ͣ��(0����ǰͣ��  1���º�ͣ��)';


create table NOTIFY_MODEL
(
  model_id    NUMBER(38) not null,
  notify_type NUMBER(38) not null,
  notify_way  NUMBER(38) not null,
  model_by    NUMBER(38) not null,
  info_set    VARCHAR2(1024) not null
)
tablespace ZHYGSPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table NOTIFY_MODEL
  is 'CASE֪ͨ����ģ���';
-- Add comments to the columns 
comment on column NOTIFY_MODEL.model_id
  is '��ţ�UUID��';
comment on column NOTIFY_MODEL.notify_type
  is '֪ͨ����
1CASE����֪ͨ
2CASE����֪ͨ
3CASE�ر�֪ͨ
4CASE����֪ͨ';
comment on column NOTIFY_MODEL.notify_way
  is '֪ͨ��ʽ��δʹ�ã�';
comment on column NOTIFY_MODEL.model_by
  is 'ģ����Դ��0��Ĭ�ϣ�1�����ƣ�';
comment on column NOTIFY_MODEL.info_set
  is '���Ÿ�ʽ';
-- Create/Recreate primary, unique and foreign key constraints 
alter table NOTIFY_MODEL
  add constraint PK_NOTIFY_MODEL primary key (MODEL_ID)
  using index 
  tablespace ZHYGIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


create table SERVICE_PROP_CONTENT
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_CONTENT
  is '���ݹ�������������';
alter table SERVICE_PROP_CONTENT
  add constraint SERVICE_PROP_CONTENT_PK primary key (key_id);

create table SERVICE_PROP_CONTROL
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_CONTROL
  is 'Զ�̿��Ʒ�������';
alter table SERVICE_PROP_CONTROL
  add constraint SERVICE_PROP_CONTROL_PK primary key (key_id);

create table SERVICE_PROP_DEVRMTSERVER
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_DEVRMTSERVER
  is '���ķ����������';
alter table SERVICE_PROP_DEVRMTSERVER
  add constraint SERVICE_PROP_DEVRMTSERVER_PK primary key (key_id);

create table SERVICE_PROP_RVCSERVER
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_RVCSERVER
  is '���ݹ�����̨��������';
alter table SERVICE_PROP_RVCSERVER
  add constraint SERVICE_PROP_RVCSERVER_PK primary key (key_id);

create table SERVICE_PROP_MONITOR
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_MONITOR
  is '��ط������ñ�';
alter table SERVICE_PROP_MONITOR
  add constraint SERVICE_PROP_MONITOR_PK primary key (key_id);


create table SERVICE_PROP_REPORTS
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_REPORTS
  is '�����������ñ�';
alter table SERVICE_PROP_REPORTS
  add constraint SERVICE_PROP_REPORTS_PK primary key (key_id);

create table SERVICE_PROP_SYSTEM
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_SYSTEM
  is 'ϵͳ�����������ñ�';
alter table SERVICE_PROP_SYSTEM
  add constraint SERVICE_PROP_SYSTEM_PK primary key (key_id);

create table SERVICE_PROP_BUSINESS
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_BUSINESS
  is '��ط������ñ�';
alter table SERVICE_PROP_BUSINESS
  add constraint SERVICE_PROP_BUSINESS_PK primary key (key_id);


create table SERVICE_PROP_BANKINTERFACE
(
  key_id   VARCHAR2(30) not null,
  value VARCHAR2(100),
  note VARCHAR2(500)
);
comment on table SERVICE_PROP_BANKINTERFACE
  is '��ɫҵ��������ñ�';
alter table SERVICE_PROP_BANKINTERFACE
  add constraint SERVICE_PROP_BANKINTFA_PK primary key (key_id);


create table SYS_BULLETIN_INFO 
(
   BULLETIN_ID          VARCHAR2(36)         not null,
   TITLE                VARCHAR2(300)        not null,
   CONTENT              VARCHAR2(900)        not null,
   RELEASE_DATE         VARCHAR2(10)         not null,
   EXPIRE_DATE          VARCHAR2(10)         not null,
   PUBLISHER            VARCHAR2(30)         not null,
   ATTACHMENT1          VARCHAR2(100),
   ATTACHMENT2          VARCHAR2(100),
   ATTACHMENT3          VARCHAR2(100),
   constraint PK_SYS_BULLETIN_INFO primary key (BULLETIN_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_BULLETIN_INFO is
'ϵͳ�����';

comment on column SYS_BULLETIN_INFO.BULLETIN_ID is
'������';

comment on column SYS_BULLETIN_INFO.TITLE is
'��������';

comment on column SYS_BULLETIN_INFO.CONTENT is
'��������';

comment on column SYS_BULLETIN_INFO.RELEASE_DATE is
'���淢������';

comment on column SYS_BULLETIN_INFO.EXPIRE_DATE is
'�����ֹ����';

comment on column SYS_BULLETIN_INFO.PUBLISHER is
'������';

comment on column SYS_BULLETIN_INFO.ATTACHMENT1 is
'ϵͳ���渽��·��1';

comment on column SYS_BULLETIN_INFO.ATTACHMENT2 is
'ϵͳ���渽��·��2';

comment on column SYS_BULLETIN_INFO.ATTACHMENT3 is
'ϵͳ���渽��·��3';


create table RETAIN_CARD_TABLE 
(
   LOGIC_ID             VARCHAR2(36)         not null,
   DEV_NO               VARCHAR2(20)         not null,
   RETAIN_DATE          Varchar2(10)             not null,
   RETAIN_TIME          Varchar2(10)             not null,
   ACCOUNT              VARCHAR2(25)         not null,
   REASON               VARCHAR2(200),
   PERIOD               VARCHAR2(10),
   CARD_STUCK_ORG       VARCHAR2(20),
   CARD_HANDLE_ORG      VARCHAR2(20),
   AUTO_FLAG            CHAR(1)              default '1',
   CHECK_OP             VARCHAR2(20),
   CHECK_DATE           VARCHAR2(10),
   CHECK_TIME           VARCHAR2(10),
   OP_NO                VARCHAR2(20),
   OP_DATE              VARCHAR2(10),
   OP_TIME              VARCHAR2(10),
   OP_ADDRESS           VARCHAR2(200),
   ACCOUNT_NAME         VARCHAR2(20),
   ACCOUNT_ID           VARCHAR2(20),
   ACCOUNT_PHONE        VARCHAR2(15),
   CERT_TYPE            Varchar2(2),
   TYPE_FLAG            VARCHAR2(1)          default '0' not null,
   STATUS               VARCHAR2(2)           not null,
   CARD_RETAIN_TYPE		VARCHAR2(1),
   constraint PK_RETAIN_CARD_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RETAIN_CARD_TABLE is
'�̿���Ϣ��';

comment on column RETAIN_CARD_TABLE.LOGIC_ID is
'���';

comment on column RETAIN_CARD_TABLE.DEV_NO is
'�豸��';

comment on column RETAIN_CARD_TABLE.RETAIN_DATE is
'�̿�����';

comment on column RETAIN_CARD_TABLE.RETAIN_TIME is
'�̿�ʱ��';

comment on column RETAIN_CARD_TABLE.ACCOUNT is
'����';

comment on column RETAIN_CARD_TABLE.REASON is
'ԭ��';

comment on column RETAIN_CARD_TABLE.PERIOD is
'������ں�';

comment on column RETAIN_CARD_TABLE.CARD_STUCK_ORG is
'�̿�����';

comment on column RETAIN_CARD_TABLE.CARD_HANDLE_ORG is
'��������';

comment on column RETAIN_CARD_TABLE.AUTO_FLAG is
'�Զ�¼���־��1��ʾ�Զ���0��ʾ�ֶ�';

comment on column RETAIN_CARD_TABLE.CHECK_OP is
'�Ǽ���';

comment on column RETAIN_CARD_TABLE.CHECK_DATE is
'�Ǽ�����';

comment on column RETAIN_CARD_TABLE.CHECK_TIME is
'�Ǽ�ʱ��';

comment on column RETAIN_CARD_TABLE.OP_NO is
'������';

comment on column RETAIN_CARD_TABLE.OP_DATE is
'��������';

comment on column RETAIN_CARD_TABLE.OP_TIME is
'����ʱ��';

comment on column RETAIN_CARD_TABLE.OP_ADDRESS is
'�����ص�';

comment on column RETAIN_CARD_TABLE.ACCOUNT_NAME is
'�ͻ�����';

comment on column RETAIN_CARD_TABLE.ACCOUNT_ID is
'�ͻ�֤����';

comment on column RETAIN_CARD_TABLE.ACCOUNT_PHONE is
'�ͻ��绰';

comment on column RETAIN_CARD_TABLE.CERT_TYPE is
'֤������';

comment on column RETAIN_CARD_TABLE.TYPE_FLAG is
'�������ͣ�0�����̿���1�����̳���';

comment on column RETAIN_CARD_TABLE.STATUS is
'0 ����
1 ����
3 ���ƽ�������
20 ��ȡ
21 ����';

comment on column RETAIN_CARD_TABLE.CARD_RETAIN_TYPE is
'�̿����ͣ�1-���̿��������䣻2-���̿����˿�����3-�̿���ȡ�ߣ�����������4-�̿���ȡ�ߣ��˿�����';


/*==============================================================*/
/* Table: UNIONPAY_AREACODE_TABLE                                   */
/*==============================================================*/
create table UNIONPAY_AREACODE_TABLE 
(
   code_id             Varchar2(30)         not null,
   Area_name           Varchar2(50)         not null,
   constraint PK_UNIONPAY_AREACODE_TABLE primary key (code_id)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table UNIONPAY_AREACODE_TABLE is
'�����������';

comment on column UNIONPAY_AREACODE_TABLE.code_id is
'������������';

comment on column UNIONPAY_AREACODE_TABLE.Area_name is
'��������';


/*==============================================================*/
/* Table: SELFHELP_BANK_TABLE                                   */
/*==============================================================*/
create table SELFHELP_BANK_TABLE 
(
   logic_id             Varchar2(40)         not null,
   bank_name           Varchar2(50)         not null,
   Bank_area           Varchar2(80),
  x                   VARCHAR2(20),
  y                   VARCHAR2(20),
   FHorgno           Varchar2(20),
   AREA_NO_PROVINCE           Varchar2(10),
   AREA_NO_CITY           Varchar2(10),
   AREA_NO_COUNTY           Varchar2(10),
   constraint PK_SELFHELP_BANK_TABLE primary key (logic_id)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SELFHELP_BANK_TABLE is
'�����豸�������б�';

comment on column SELFHELP_BANK_TABLE.bank_name is
'������������';

comment on column SELFHELP_BANK_TABLE.Bank_area is
'������ַ';

comment on column SELFHELP_BANK_TABLE.x
  is '�����꣨���ȣ�';
comment on column SELFHELP_BANK_TABLE.y
  is '�����꣨γ�ȣ�';
  
comment on column SELFHELP_BANK_TABLE.FHorgno is
'�������У�2�����������';

comment on column SELFHELP_BANK_TABLE.AREA_NO_PROVINCE is
'����ʡ���������';

comment on column SELFHELP_BANK_TABLE.AREA_NO_CITY is
'�������м��������';

comment on column SELFHELP_BANK_TABLE.AREA_NO_COUNTY is
'�����ؼ��������';


/*==============================================================*/
/* Table: PROVINCE_CITY_CODE                                   */
/*==============================================================*/
create table PROVINCE_CITY_CODE 
(
   code             Varchar2(40)         not null,
   Code_name           Varchar2(50)         not null,
   GRADE           Varchar2(1),
   Province_code           Varchar2(10),
   City_code           Varchar2(10),
   constraint PK_PROVINCE_CITY_CODE primary key (code)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table PROVINCE_CITY_CODE is
'��׼ʡ���ر����';

comment on column PROVINCE_CITY_CODE.code is
'���';

comment on column PROVINCE_CITY_CODE.Code_name is
'����';

comment on column PROVINCE_CITY_CODE.GRADE is
'���� 1��ʡ��2�����м�3���ؼ�
';

comment on column PROVINCE_CITY_CODE.Province_code is
'����ʡ���������';

comment on column PROVINCE_CITY_CODE.City_code is
'�������м��������';

create table APPS_PROJ_APPLY_RANGE
(
  LOGICID       VARCHAR2(40) not null,
  APPSID        VARCHAR2(40),
  LIMIT_CATALOG       VARCHAR2(5),
   constraint PK_APPS_PROJ_APPLY_RANGE primary key (LOGICID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_PROJ_APPLY_RANGE
  is '���̹�����÷�Χ��';
comment on column APPS_PROJ_APPLY_RANGE.APPSID
  is '���̣������';
comment on column APPS_PROJ_APPLY_RANGE.LIMIT_CATALOG
  is '�����豸����';

create table APPS_VER_APPLY_DEPEND
(
  LOGICID       VARCHAR2(40) not null,
  APPSID        VARCHAR2(40),
  VERSIONAPPNO        VARCHAR2(12),
  RANGETYPE       VARCHAR2(1),
  PERVERAPPNO        VARCHAR2(12),
  PERVERSEQNO        VARCHAR2(12),
  PEROTHERAPPSID        VARCHAR2(40),
  PERMINOTHERVERAPPNO        VARCHAR2(12),
  PERMINOTHERVERSEQNO        VARCHAR2(12),
  constraint PK_APPS_VER_APPLY_DEPEND primary key (LOGICID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table APPS_VER_APPLY_DEPEND
  is '���̹�����÷�Χ��';
comment on column APPS_VER_APPLY_DEPEND.APPSID
  is '���̱�ʶ ���̣������';
comment on column APPS_VER_APPLY_DEPEND.VERSIONAPPNO
  is 'Ӧ�ð汾��';
comment on column APPS_VER_APPLY_DEPEND.RANGETYPE
  is '��Χ���� 1:���������汾�ţ�2:�����������̺Ͱ汾��';
comment on column APPS_VER_APPLY_DEPEND.PERVERAPPNO
  is '�����������̰汾��';
comment on column APPS_VER_APPLY_DEPEND.PERVERSEQNO
  is '�����������̰汾���к�';
comment on column APPS_VER_APPLY_DEPEND.PEROTHERAPPSID
  is '�����������̱�ʶ';
comment on column APPS_VER_APPLY_DEPEND.PERMINOTHERVERAPPNO
  is '��������������С�汾��';
comment on column APPS_VER_APPLY_DEPEND.PERMINOTHERVERSEQNO
  is '��������������С�汾���к�';
  
create table ADS_RANGE_INFO
(
  LOGICID   VARCHAR2(40) not null,
  ADS_ID    VARCHAR2(40) not null,
  ORGNO     VARCHAR2(20),
  CATALOG   VARCHAR2(5),
  DEVNO   VARCHAR2(20),
   constraint PK_ADS_RANGE_INFO primary key (LOGICID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_RANGE_INFO
  is '������÷�Χ��';
comment on column ADS_RANGE_INFO.ADS_ID
  is '����ʶ';
comment on column ADS_RANGE_INFO.ORGNO
  is '������';
comment on column ADS_RANGE_INFO.CATALOG
  is '�豸����';
comment on column ADS_RANGE_INFO.DEVNO
  is '�豸��';


create table ADS_CANCEL_INFO
(
  ADS_ID    VARCHAR2(40) not null,
  DEVNO   VARCHAR2(20) not null,
  adduser  VARCHAR2(20),
  addtime  VARCHAR2(20),
  taskflag CHAR(1) not null,
   constraint PK_ADS_CANCEL_INFO primary key (ADS_ID,DEVNO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ADS_CANCEL_INFO
  is '��泷����¼��';
comment on column ADS_CANCEL_INFO.ADS_ID
  is '����ʶ';
comment on column ADS_CANCEL_INFO.DEVNO
  is '�豸��';
comment on column ADS_CANCEL_INFO.adduser
  is '������Ա';
comment on column ADS_CANCEL_INFO.addtime
  is '����ʱ��';
comment on column ADS_CANCEL_INFO.taskflag
  is '�����ʶ 0��δ֪ͨ 1����֪ͨ';
  
create table TASK_LABEL_CATALOG
(
  no         Varchar2(5) not null,
  catalog    Varchar2(2),
  Label_Name  Varchar2(40),
   constraint PK_TASK_LABEL_CATALOG primary key (no)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TASK_LABEL_CATALOG
  is '��ά��ǩ����';
comment on column TASK_LABEL_CATALOG.no
  is '��ǩ���';
comment on column TASK_LABEL_CATALOG.catalog
  is '��ǩ���� 1������ԭ�򣨹����� 2����������������� 3�����ۣ�������';
comment on column TASK_LABEL_CATALOG.Label_Name
  is '��ǩ����';

create table TASK_SHEET_TRACE
(
  trace_id         Varchar2(36) not null,
  case_no    Varchar2(36),
  case_trace_id  Varchar2(36),
  Trace_time  Varchar2(26),
  trace_by  Varchar2(20),
  SERVICE_COMPANY  Varchar2(40),
  SERVICE_PERSON  Varchar2(40),
  otherReason  Varchar2(100),
  otherSolution  Varchar2(100),
  replacemod  Varchar2(20),
  Service_score  Varchar2(1),
  Service_remark  Varchar2(100),
   constraint PK_TASK_SHEET_TRACE primary key (trace_id)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TASK_SHEET_TRACE
  is '����������ϸ��';
comment on column TASK_SHEET_TRACE.case_no
  is '��Ӧ��CASE���';
comment on column TASK_SHEET_TRACE.case_trace_id
  is '��Ӧcase trace���';
comment on column TASK_SHEET_TRACE.Trace_time
  is '��¼ʱ�� Yyyy-mm-dd hh:mi:ss';
comment on column TASK_SHEET_TRACE.trace_by
  is '��¼��';
comment on column TASK_SHEET_TRACE.SERVICE_COMPANY
  is '����ά���̱��';
comment on column TASK_SHEET_TRACE.SERVICE_PERSON
  is '����ά��Ա���';
comment on column TASK_SHEET_TRACE.otherReason
  is '����ԭ������';
comment on column TASK_SHEET_TRACE.otherSolution
  is '���������������';
comment on column TASK_SHEET_TRACE.replacemod
  is '�滻ģ��';
comment on column TASK_SHEET_TRACE.Service_score
  is '��������';
comment on column TASK_SHEET_TRACE.Service_remark
  is '������������';

create table TASK_SHEET_LABEL
(
  trace_id         Varchar2(36) not null,
  Label_no    Varchar2(5) not null,
  Label_catalog  Varchar2(2),
   constraint PK_TASK_SHEET_LABEL primary key (Label_no,trace_id)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TASK_SHEET_LABEL
  is '����������ǩ��';
comment on column TASK_SHEET_LABEL.trace_id
  is '��� ͬTASK_SHEET_TRACE. trace_id';
comment on column TASK_SHEET_LABEL.Label_no
  is '��ǩ���';
comment on column TASK_SHEET_LABEL.Label_catalog
  is '��ǩ���� 1������ԭ�򣨹�����2�����������������3�����ۣ�������';
  

create table PARAM_BUSINESS_TEMPLATE
(
  PARAMKEY         Varchar2(50) not null,
  PARAMNAME    Varchar2(100) not null,
  PARAMVALUE  Varchar2(500),
  REMARK  Varchar2(500),
  REGEX  Varchar2(500),
   constraint PK_PARAM_BUSINESS_TEMPLATE primary key (PARAMKEY)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table PARAM_BUSINESS_TEMPLATE
  is 'ҵ�����ģ���';
comment on column PARAM_BUSINESS_TEMPLATE.PARAMKEY
  is '����ΨһӢ�ı�ʶ';
comment on column PARAM_BUSINESS_TEMPLATE.PARAMNAME
  is '������������';
comment on column PARAM_BUSINESS_TEMPLATE.PARAMVALUE
  is '����Ĭ��ֵ';
comment on column PARAM_BUSINESS_TEMPLATE.REMARK
  is '��������';
comment on column PARAM_BUSINESS_TEMPLATE.REGEX
  is '�������ʽ������У�������Ƿ�Ϸ�';
  

create table PARAM_BUSINESS_CONFIG
(
  DEVNO    Varchar2(20) not null,
  PARAMKEY         Varchar2(50) not null,
  PARAMVALUE  Varchar2(500),
  ADDUSER  Varchar2(20),
  ADDTIME  Varchar2(20),
  TASKFLAG  CHAR(1),
  TAKEFLAG  CHAR(1),
  TAKETIME  Varchar2(20),
   constraint PK_PARAM_BUSINESS_CONFIG primary key (DEVNO,PARAMKEY)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table PARAM_BUSINESS_CONFIG
  is 'ҵ�����ģ���';
comment on column PARAM_BUSINESS_CONFIG.DEVNO
  is '�豸��';
comment on column PARAM_BUSINESS_CONFIG.PARAMKEY
  is '����ΨһӢ�ı�ʶ';
comment on column PARAM_BUSINESS_CONFIG.PARAMVALUE
  is '����ֵ';
comment on column PARAM_BUSINESS_CONFIG.ADDUSER
  is '������Ա';
comment on column PARAM_BUSINESS_CONFIG.ADDTIME
  is '�ü�¼���ӵ�ʱ�䣬YYYY-MM-DD hh:mm:ss';
comment on column PARAM_BUSINESS_CONFIG.TASKFLAG
  is '�����־ 0��δ��� 1���ѳɹ� 2���ѽ�����δ�ɹ���';
comment on column PARAM_BUSINESS_CONFIG.TAKEFLAG
  is '���ر�־ Ĭ��Ϊ0  0��δ����  1���Ѽ���';
comment on column PARAM_BUSINESS_CONFIG.TAKETIME
  is '����ʱ�� YYYY-MM-DD hh:mm:ss';
  
/*==============================================================*/
/* Table: ATMC_FUNCTION_TABLE                                   */
/*==============================================================*/
create table ATMC_FUNCTION_TABLE 
(
   DEV_NO               VARCHAR2(20)          not null,
   TRANS_LIST           VARCHAR2(500),
   ATM_LOG              VARCHAR2(7),
   NOTE1                VARCHAR2(32),
   NOTE2                VARCHAR2(32),
   NOTE3                VARCHAR2(32),
   constraint PK_ATMC_FUNCTION_TABLE primary key (DEV_NO)
         using index pctfree 10
   initrans 2
   storage (initial 64K)
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage (initial 64K)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ATMC_FUNCTION_TABLE is
'ATMC���ܶ����';

comment on column ATMC_FUNCTION_TABLE.DEV_NO is
'�豸��';

comment on column ATMC_FUNCTION_TABLE.TRANS_LIST is
'�����б�';

comment on column ATMC_FUNCTION_TABLE.ATM_LOG is
'��־����ػ����С��100��200000��';

comment on column ATMC_FUNCTION_TABLE.NOTE1 is
'Ԥ��1��δʹ�ã�';

comment on column ATMC_FUNCTION_TABLE.NOTE2 is
'Ԥ��2��δʹ�ã�';

comment on column ATMC_FUNCTION_TABLE.NOTE3 is
'Ԥ��3��δʹ�ã�';

/*==============================================================*/
/* Table: ATMC_FUNCTION_DEF                                     */
/*==============================================================*/
create table ATMC_FUNCTION_DEF 
(
   	ID           		VARCHAR2(36)			not null,
	TRANS_NO			VARCHAR2(5)				not null,
   	TRANS_NAME          VARCHAR2(20),
   	TRANS_CODE			VARCHAR2(100),
	TRANS_TYPE			VARCHAR2(50),
	TRANS_TYPE_LEVEL	VARCHAR2(5),	
	DEV_CATALOG			VARCHAR2(5),
   constraint PK_ATMC_FUNCTION_DEF primary key (ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table ATMC_FUNCTION_DEF is 
'ATMC���ܶ���Ĭ�ϱ�';

comment on column ATMC_FUNCTION_DEF.ID is 
'���(UUID)';

comment on column ATMC_FUNCTION_DEF.TRANS_NO is  
'���ױ��(��Ӧ��ATMC�ϵĽ��ױ���λ��)';

comment on column ATMC_FUNCTION_DEF.TRANS_NAME is 
'������������';

comment on column ATMC_FUNCTION_DEF.TRANS_CODE is  
'����Ӣ������(����WSAPPlus,WSAPʱ����Ϊ��)';

comment on column ATMC_FUNCTION_DEF.TRANS_TYPE is  
'�����������(�磺���������ࡢIC��������ȵ�)';

comment on column ATMC_FUNCTION_DEF.TRANS_TYPE_LEVEL is  
'�������(��0��ʼ��0������ǰ��)';

comment on column ATMC_FUNCTION_DEF.DEV_CATALOG is 
'�豸����(ͬDEV_CATALOG_TABLE.NO)';

create table SYS_AUDIT
(
  no      VARCHAR2(20) not null,
  user_no VARCHAR2(20) not null,
  operate_time    VARCHAR2(20) not null,
  MENU_NO VARCHAR2(100) not null,
  BTN_NO VARCHAR2(30) not null,
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
  note      VARCHAR2(100),
   constraint PK_SYS_AUDIT primary key (NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table SYS_AUDIT
  is '������־';
comment on column SYS_AUDIT.user_no
  is '�����û�';
comment on column SYS_AUDIT.operate_time
  is '����ʱ�� YYYY-MM-DD hh:mi:ss';
comment on column SYS_AUDIT.MENU_NO
  is '����ģ���� ͬSYS_OPERATE.MENU_NO';
comment on column SYS_AUDIT.BTN_NO
  is '������� ͬSYS_OPERATE.BTN_NO';
comment on column SYS_AUDIT.no
  is '��¼��� yyyymmddhhmissSSS';
comment on column SYS_AUDIT.Current_detail
  is '��������ϸ����';
comment on column SYS_AUDIT.Before_detail
  is '����ǰ��ϸ����';
comment on column SYS_AUDIT.COMMIT_NOTE
  is '�ύ��˱�ע';
comment on column SYS_AUDIT.COMMIT_ORG
  is '�ύ��˻������';
comment on column SYS_AUDIT.COMMIT_ROLE
  is '�ύ��˽�ɫ���';
comment on column SYS_AUDIT.COMMIT_USER
  is '�ύ�����Ա���';
comment on column SYS_AUDIT.COMMIT_STATUS
  is '�ύ״̬ 1:�ύ��� 9�����������ύ��ˣ���˾ܾ�������������';
comment on column SYS_AUDIT.AUDIT_USER
  is 'ʵ�������Ա���';
comment on column SYS_AUDIT.AUDIT_RESULT
  is '��˽�� Y������ˣ�ͨ�� N������ˣ��ܾ�';
comment on column SYS_AUDIT.AUDIT_TIME
  is '���ʱ��';
comment on column SYS_AUDIT.AUDIT_NOTE
  is '��˱�ע';
comment on column SYS_AUDIT.note
  is '��ע';
  
create table UNREAD_BULLET_INFO
(
user_no VARCHAR2(20) not null,
bullet_no VARCHAR2(36) not null
)
tablespace ZHYGSPACE
pctfree 10
initrans 1
maxtrans 255
storage
(
initial 64K
minextents 1
maxextents unlimited
);
comment on table UNREAD_BULLET_INFO
is 'ϵͳ�����û����ʱ�';
comment on column UNREAD_BULLET_INFO.user_no
is '�û����';
comment on column UNREAD_BULLET_INFO.bullet_no
is '������';
alter table UNREAD_BULLET_INFO
add constraint UNREAD_BULLET_INFO_PK primary key (USER_NO, BULLET_NO)
using index 
tablespace ZHYGIDX
pctfree 10
initrans 2
maxtrans 255
storage
(
initial 64K
minextents 1
maxextents unlimited
);


/*==============================================================*/
/* Table: DOUBTFUL_TABLE                                        */
/*==============================================================*/
create table DOUBTFUL_TABLE 
(
   LOGIC_ID             VARCHAR2(36)          not null,
   DEV_NO               VARCHAR2(20)          not null,
   DATETIME             CHAR(19)             not null,
   CARDINFO             VARCHAR2(25)          not null,
   TRANSACCOUNT         VARCHAR2(21),
   AMOUNT               NUMBER(20,2),
   TXTYPE               VARCHAR2(20)          not null,
   TRNS                 VARCHAR2(25)          not null,
   RTPOS                VARCHAR2(14),
   HOSTCODE             VARCHAR2(10),
   LOCALCODE            VARCHAR2(6),
   constraint PK_DOUBTFUL_TABLE primary key (LOGIC_ID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 64K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table DOUBTFUL_TABLE is
'���ɽ��׼�¼��';

comment on column DOUBTFUL_TABLE.LOGIC_ID is
'��¼��ˮ��';

comment on column DOUBTFUL_TABLE.DEV_NO is
'�豸��';

comment on column DOUBTFUL_TABLE.DATETIME is
'����ʱ��(YYYY-MM-DD HH:mm:ss)';

comment on column DOUBTFUL_TABLE.CARDINFO is
'����';

comment on column DOUBTFUL_TABLE.TRANSACCOUNT is
'ת���˺�';

comment on column DOUBTFUL_TABLE.AMOUNT is
'���';

comment on column DOUBTFUL_TABLE.TXTYPE is
'��������';

comment on column DOUBTFUL_TABLE.TRNS is
'������ˮ��';

comment on column DOUBTFUL_TABLE.RTPOS is
'����λ��';

comment on column DOUBTFUL_TABLE.HOSTCODE is
'����������';

comment on column DOUBTFUL_TABLE.LOCALCODE is
'���ؾܾ���';


create table RPT_FAULT_DEV_MONTH_MOD
(
  DEV_NO          VARCHAR2(20) not null,
  DATE_TIME    VARCHAR2(10) not null,
  fault_year     VARCHAR2(4),
  fault_month    VARCHAR2(2),
  MOD_NO        VARCHAR2(5) not null,
  lv3_NUMBER  NUMBER(38),
  lv3_onsite_time  NUMBER(38),
  lv3_close_time  NUMBER(38),
  lv4_NUMBER  NUMBER(38),
  lv4_onsite_time  NUMBER(38),
  lv4_close_time  NUMBER(38),
  lv5_NUMBER  NUMBER(38),
  lv5_onsite_time  NUMBER(38),
  lv5_close_time  NUMBER(38),
  lv6_NUMBER  NUMBER(38),
  lv6_onsite_time  NUMBER(38),
  lv6_close_time  NUMBER(38),
  lv7_NUMBER  NUMBER(38),
  lv7_onsite_time  NUMBER(38),
  lv7_close_time  NUMBER(38),
  lv8_NUMBER  NUMBER(38),
  lv8_onsite_time  NUMBER(38),
  lv8_close_time  NUMBER(38),
  lv9_NUMBER  NUMBER(38),
  lv9_onsite_time  NUMBER(38),
  lv9_close_time  NUMBER(38),
  lv10_NUMBER  NUMBER(38),
  lv10_onsite_time  NUMBER(38),
  lv10_close_time  NUMBER(38),
  lv11_NUMBER  NUMBER(38),
  lv11_onsite_time  NUMBER(38),
  lv11_close_time  NUMBER(38),
  lv12_NUMBER  NUMBER(38),
  lv12_onsite_time  NUMBER(38),
  lv12_close_time  NUMBER(38),
  lv13_NUMBER  NUMBER(38),
  lv13_onsite_time  NUMBER(38),
  lv13_close_time  NUMBER(38),
  lv14_NUMBER  NUMBER(38),
  lv14_onsite_time  NUMBER(38),
  lv14_close_time  NUMBER(38),
  lv15_NUMBER  NUMBER(38),
  lv15_onsite_time  NUMBER(38),
  lv15_close_time  NUMBER(38),
   constraint PK_RPT_FAULT_DEV_MONTH_MOD primary key (DEV_NO,DATE_TIME,MOD_NO)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table RPT_FAULT_DEV_MONTH_MOD
  is '����ͳ�Ʊ���ÿ̨ÿ��ÿ��ģ�飩';
comment on column RPT_FAULT_DEV_MONTH_MOD.DEV_NO
  is '�豸��';
comment on column RPT_FAULT_DEV_MONTH_MOD.DATE_TIME
  is '���� yyyyMM';
comment on column RPT_FAULT_DEV_MONTH_MOD.fault_year
  is '��¼���';
comment on column RPT_FAULT_DEV_MONTH_MOD.fault_month
  is '��¼�·�';
comment on column RPT_FAULT_DEV_MONTH_MOD.MOD_NO
  is 'ģ����';   
comment on column RPT_FAULT_DEV_MONTH_MOD.lv3_NUMBER is '��ԴԤ������';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv3_onsite_time is '��ԴԤ����Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv3_close_time is '��ԴԤ���ر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv4_NUMBER is '��Դ�ľ�����';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv4_onsite_time is '��Դ�ľ���Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv4_close_time is '��Դ�ľ��ر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv5_NUMBER is '���֪ͨ����';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv5_onsite_time is '���֪ͨ��Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv5_close_time is '���֪ͨ�ر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv6_NUMBER is 'Ӫҵ���ϴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv6_onsite_time is 'Ӫҵ������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv6_close_time is 'Ӫҵ���Ϲر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv7_NUMBER is 'ֽ�ٴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv7_onsite_time is 'ֽ����Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv7_close_time is 'ֽ�ٹر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv8_NUMBER is 'ֽ�մ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv8_onsite_time is 'ֽ����Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv8_close_time is 'ֽ�չر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv9_NUMBER is '���ٴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv9_onsite_time is '������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv9_close_time is '���ٹر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv10_NUMBER is '���մ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv10_onsite_time is '������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv10_close_time is '���չر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv11_NUMBER is '�����������';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv11_onsite_time is '���������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv11_close_time is '��������ر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv12_NUMBER is 'һ��Ӳ�����ϴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv12_onsite_time is 'һ��Ӳ��������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv12_close_time is 'һ��Ӳ�����Ϲر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv13_NUMBER is '����Ӳ�����ϴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv13_onsite_time is '����Ӳ��������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv13_close_time is '����Ӳ�����Ϲر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv14_NUMBER is '������ϴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv14_onsite_time is '���������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv14_close_time is '������Ϲر�ʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv15_NUMBER is 'ͨѶ���ϴ���';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv15_onsite_time is 'ͨѶ������Ӧʱ��';
comment on column RPT_FAULT_DEV_MONTH_MOD.lv15_close_time is 'ͨѶ���Ϲر�ʱ��';


/*==============================================================*/
/* Table: FAIL_TX_TABLE                                         */
/*==============================================================*/
create table FAIL_TX_TABLE
(
  TX_TIME   VARCHAR2(20),
  TX_DETAIL VARCHAR2(2000),
   constraint PK_FAIL_TX_TABLE primary key (TX_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

------------------------------------
-----PJS_ACCOUNT_CYCLE_INFO ��
------------------------------------
create table PJS_ACCOUNT_CYCLE_INFO
(
  ID               NUMBER not null,
  TERM_NO         VARCHAR2(64),
  START_DATE      TIMESTAMP not null,
  END_DATE        TIMESTAMP,
  DEP_COUNT       NUMBER,
  CWD_COUNT       NUMBER,
  DEP_AMOUNT      NUMBER,
  CWD_AMOUNT      NUMBER,
  DOUBTFUL_COUNT NUMBER
)
tablespace ZHYGSPACE;
-- Create/Recreate primary, unique and foreign key constraints
alter table PJS_ACCOUNT_CYCLE_INFO
  add constraint PK_PJS_ACCOUNT_CYCLE_INFO_ID primary key (ID)
  using index 
  tablespace ZHYGIDX;
-- Create/Recreate indexes 
create index IDX_PJS_ACCOUNT_END_DATE on PJS_ACCOUNT_CYCLE_INFO (END_DATE)
  tablespace ZHYGIDX;
create index IDX_PJS_ACCOUNT_TERM_NO on PJS_ACCOUNT_CYCLE_INFO (TERM_NO)
  tablespace ZHYGIDX;

------------------------------------
-----PJS_CLIENT_CYCLE_INFO ��
------------------------------------
-- Create table
create table PJS_CLIENT_CYCLE_INFO
(
  ID               NUMBER not null,
  START_DATE       TIMESTAMP,
  INSERT_CARDNO    VARCHAR2(64),
  ACCOUNT_CYCLE_ID NUMBER not null
)
tablespace ZHYGSPACE;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PJS_CLIENT_CYCLE_INFO
  add constraint PK_PJS_CLIENT_CYCLE_INFO_ID primary key (ID)
  using index 
  tablespace ZHYGIDX;
create index IDX_PJS_CLT_ACCID on PJS_CLIENT_CYCLE_INFO (ACCOUNT_CYCLE_ID)
  tablespace ZHYGIDX;


------------------------------------
-----PJS_EJDATA_INFO_RT ��
------------------------------------
-- Create table
create table PJS_EJDATA_INFO_RT
(
  ID               NUMBER not null,
  EJ_START_DATE    TIMESTAMP,
  ORGAN_NO         VARCHAR2(12),
  TERM_NO          VARCHAR2(24),
  EJ_TYPE          NUMBER(4),
  INSERT_CARD_NO   VARCHAR2(24),
  TRANS_ACCOUNT    VARCHAR2(24),
  TRANS_MONEY      NUMBER(12,2),
  LOCAL_SERIAL_NO  VARCHAR2(12),
  HOST_SERIAL_NO   VARCHAR2(24),
  HOST_RETCODE     VARCHAR2(12),
  LOCAL_ERROR_CODE VARCHAR2(64),
  DOUBTFUL_LEVEL   VARCHAR2(1),
  TRANSFER_TO_ACCOUNT   VARCHAR2(24),
  ORIGINAL_LOCAL_SERIAL_NO  VARCHAR2(12),
  ACCOUNT_TYPE     VARCHAR2(12),
  TRANS_CURRENCY   NUMBER,
  JOURNAL_DATA     BLOB,
  TFR_CARD_TYPE    VARCHAR2(10),
  RESERVE1         VARCHAR2(1024),
  RESERVE2         VARCHAR2(1024),
  RESERVE3         VARCHAR2(1024),
  RESERVE4         NUMBER,
  RESERVE5         NUMBER,
  CLIENT_CYCLE_ID  NUMBER,
  TXDATE           VARCHAR2(20),
  EJMONTH          VARCHAR2(2)
  )
partition by list(EJMONTH)
(
    partition PJS_PT_RANG0 values ('01')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG1 values ('02')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG2 values ('03')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG3 values ('04')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG4 values ('05')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG5 values ('06')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG6 values ('07')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG7 values ('08')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG8 values ('09')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG9 values ('10')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG10 values ('11')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG11 values ('12')
    tablespace ZHYGSPACE,
    partition PJS_PT_RANG12 values (default)
    tablespace ZHYGSPACE
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PJS_EJDATA_INFO_RT
  add constraint PK_EJDATA_INFO_ID primary key (EJMONTH,ID)
  using index 
  tablespace ZHYGIDX LOCAL;
--Create/Recreate indexes 
create index IDX_EJDATA_INFO_TACC on PJS_EJDATA_INFO_RT (TRANS_ACCOUNT)
  tablespace ZHYGIDX LOCAL;
create index IDX_EJDATA_INFO_CLTID on PJS_EJDATA_INFO_RT (TERM_NO, CLIENT_CYCLE_ID)
  tablespace ZHYGIDX LOCAL;
create index IDX_EJDATA_INFO_TNO on PJS_EJDATA_INFO_RT (TERM_NO)
  tablespace ZHYGIDX LOCAL;
create index IDX_EJDATA_INFO_TNOTXDATE on PJS_EJDATA_INFO_RT (TERM_NO, TXDATE)  
  tablespace ZHYGIDX LOCAL;



------------------------------------
-----PJS_EJDATA _INFO_HIS ��
------------------------------------
-- Create table
create table PJS_EJDATA_INFO_HIS
(
  ID               NUMBER not null,
  EJ_START_DATE    TIMESTAMP,
  ORGAN_NO         VARCHAR2(12),
  TERM_NO          VARCHAR2(24),
  EJ_TYPE          NUMBER(4),
  INSERT_CARD_NO   VARCHAR2(24),
  TRANS_ACCOUNT    VARCHAR2(24),
  TRANS_MONEY      NUMBER(12,2),
  LOCAL_SERIAL_NO  VARCHAR2(12),
  HOST_SERIAL_NO   VARCHAR2(24),
  HOST_RETCODE     VARCHAR2(12),
  LOCAL_ERROR_CODE VARCHAR2(64),
  DOUBTFUL_LEVEL   VARCHAR2(1),
  TRANSFER_TO_ACCOUNT   VARCHAR2(24),
  ORIGINAL_LOCAL_SERIAL_NO  VARCHAR2(12),
  ACCOUNT_TYPE     VARCHAR2(12),
  TRANS_CURRENCY   NUMBER,
  JOURNAL_DATA     BLOB,
  TFR_CARD_TYPE    VARCHAR2(10),
  RESERVE1         VARCHAR2(1024),
  RESERVE2         VARCHAR2(1024),
  RESERVE3         VARCHAR2(1024),
  RESERVE4         NUMBER,
  RESERVE5         NUMBER,
  CLIENT_CYCLE_ID  NUMBER
)
tablespace ZHYGSPACE;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PJS_EJDATA_INFO_HIS
  add constraint PK_EJDATA_INFO_HIS_ID primary key (ID)
  using index 
  tablespace ZHYGIDX;
-- Create/Recreate indexes 
create index IDX_EJDATA_INFO_HIS_SDATE on PJS_EJDATA_INFO_HIS (EJ_START_DATE)
  tablespace ZHYGIDX;
create index IDX_EJDATA_INFO_HIS_TACC on PJS_EJDATA_INFO_HIS (TRANS_ACCOUNT)
  tablespace ZHYGIDX;
create index IDX_EJDATA_INFO_HIS_TNO on PJS_EJDATA_INFO_HIS (TERM_NO)
  tablespace ZHYGIDX;


------------------------------------
-----PJS_TASK_INFO ��
------------------------------------
-- Create table
create table PJS_TASK_INFO
(
  ID           NUMBER not null,
  USER_OF_TASK VARCHAR2(24) not null,
  TASK_TYPE    NUMBER not null,
  RESULT_TYPE  NUMBER not null,
  RUN_DATE     TIMESTAMP not null,
  START_DATE   TIMESTAMP not null,
  END_DATE     TIMESTAMP not null,
  STATE        NUMBER not null,
  RESULT_URL   VARCHAR2(1024),
  RESERVE1     VARCHAR2(1024),
  RESERVE2     VARCHAR2(1024),
  RESERVE3     VARCHAR2(1024),
  RESERVE4     NUMBER,
  RESERVE5     NUMBER,
  TERM_LIST    CLOB not null
)
tablespace ZHYGSPACE;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PJS_TASK_INFO
  add constraint PK_TASK_INFO_ID primary key (ID)
  using index 
  tablespace ZHYGIDX;
-- Create/Recreate indexes 
create index IDX_TASK_INFO_UOT on PJS_TASK_INFO (USER_OF_TASK)
  tablespace ZHYGIDX;


------------------------------------
-----PJS_TERM _INFO ��
------------------------------------
-- Create table
create table PJS_TERM_INFO
(
  ID               NUMBER not null,
  MUK              VARCHAR2(32),  
  TERM_NO          VARCHAR2(64) not null,
  AREA_NO          VARCHAR2(64),
  ORGAN_NO         VARCHAR2(64),
  IPADDRESS        VARCHAR2(32),
  TERM_MAIN_TYPE   CHAR(1),
  VENDOR_NAME      VARCHAR2(128),
  APPLICATION_TYPE VARCHAR2(128),
  ADDRESS          VARCHAR2(256),
  CPU_INFO         VARCHAR2(128),
  MEMORY_INFO      VARCHAR2(128),
  HARDISK_INFO     VARCHAR2(256),
  CPUID            VARCHAR2(512),
  REMARK           VARCHAR2(256),
  DATA_SEQUENCE    NUMBER default 0,
  BIND_REMARK      VARCHAR2(10),
  TEMPLATE_VERSION  VARCHAR2(30),
  ENABLED_STATUS    VARCHAR2(1) default 'Y',
  STATUS_CHANGE_TIME TIMESTAMP,
  BIND_TIME        TIMESTAMP
)
tablespace ZHYGSPACE;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PJS_TERM_INFO
  add constraint PK_TERM_INFO_ID primary key (ID)
  using index 
  tablespace ZHYGIDX;
-- Create/Recreate indexes 
create index IDX_TERM_INFO_ONO on PJS_TERM_INFO (ORGAN_NO)
  tablespace ZHYGIDX;
create unique index IDX_TERM_INFO_TNO on PJS_TERM_INFO (TERM_NO)
  tablespace ZHYGIDX;

  
/*==============================================================*/
/* Table: PJS_EJDATA_JOB   ��־��ˮ��                                         */
/*==============================================================*/
create table PJS_EJDATA_JOB 
(
   TERM_NO              VARCHAR2(24)          not null,
   DATA_SEQUENCE        NUMBER               not null, 
   MESSAGE_DATE         TIMESTAMP,
   WRITE_POS_START      NUMBER,
   WRITE_POS_END        NUMBER,
   END_FLAG             NUMBER,
   TIME                 TIMESTAMP,
   ENCRYPT_FLAG         VARCHAR2(1),
   primary key (TERM_NO,DATA_SEQUENCE)       
)
tablespace ZHYGSPACE;

/*==============================================================*/
/* Table: PJS_EJPARSE_JOB   ������¼��                                         */
/*==============================================================*/
create table PJS_EJPARSE_JOB 
(
   TERM_NO              VARCHAR2(24)          not null,
   DATA_SEQUENCE        NUMBER               not null,
   MESSAGE_DATE         TIMESTAMP,
   PARSE_POS            NUMBER,
   PARSE_FLAG           NUMBER,
   LAST_PARSE_TIME      TIMESTAMP,
   primary key (TERM_NO)       
)
tablespace ZHYGSPACE;

--zijin  mod
/*==============================================================*/
/* Table: PRS_RECEIPT_INFO  ƾ��������¼��                                         */
/*==============================================================*/
create table PRS_RECEIPT_INFO
(
  BANKNO               VARCHAR2(20)        ,  
  TERMNO           VARCHAR2(32)  not null  ,
  ACCOUNT             VARCHAR2(32)        ,  
  AMOUNT             VARCHAR2(12)        ,    
  CURRENCY          VARCHAR2(10)        ,  
  TRANSDATE              VARCHAR2(16)   not null ,  
  TRANSTIME            VARCHAR2(16)   not null ,  
  TRANSTYPE          VARCHAR2(32)        ,  
  INCARDNO         VARCHAR2(16)        ,
  OUTCARDNO           VARCHAR2(16)        ,
  FEE               VARCHAR2(12)           ,
  HOSTSERIALNO        VARCHAR2(32)         ,
  LOCALSERIALNO        VARCHAR2(32)           ,
  HOSTRETURN            VARCHAR2(16)        ,
  LOCALERROR           VARCHAR2(16)         ,
  CONTACTPHONE        VARCHAR2(16)          ,
  ISCARDRETAINED          VARCHAR2(10)             ,
  RECOGNIZEDSERIALNO      blob                 ,
  UNRECOGNIZEDSERIALNO   blob             ,
  MEMO               VARCHAR2(1024)        ,
  UNPARSEINFO           VARCHAR2(1024)        ,
  ISSEND               VARCHAR2(12)         
) tablespace ZHYGSPACE  ;

---- Create/Recreate primary, unique and foreign key constraints 
alter table PRS_RECEIPT_INFO
  add constraint PK_ERDATA_INFO_ID primary key (TERMNO,TRANSDATE,TRANSTIME)
  using index 
  tablespace ZHYGIDX ;
  
  /*==============================================================*/
/* Table: PRS_OTHER_RECEIPT_INFO  ��������ֶβ�ȫ��ƾ����¼��                                         */
/*==============================================================*/
create table PRS_OTHER_RECEIPT_INFO  
(
	MESSAGEID   VARCHAR2(64)  not null,
	TERM_NO	    VARCHAR2(32),
	TRANS_DATE  VARCHAR2(16),
	TRANS_TIME	VARCHAR2(16),
	RECEIPT	    VARCHAR2(2048),
	primary key (MESSAGEID)   
) tablespace ZHYGSPACE ;
  


CREATE TABLE qrtz_job_details
  (
    JOB_NAME  VARCHAR2(200) NOT NULL,
    JOB_GROUP VARCHAR2(200) NOT NULL,
    DESCRIPTION VARCHAR2(250) NULL,
    JOB_CLASS_NAME   VARCHAR2(250) NOT NULL, 
    IS_DURABLE VARCHAR2(1) NOT NULL,
    IS_VOLATILE VARCHAR2(1) NOT NULL,
    IS_STATEFUL VARCHAR2(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR2(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (JOB_NAME,JOB_GROUP)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_job_listeners
  (
    JOB_NAME  VARCHAR2(200) NOT NULL, 
    JOB_GROUP VARCHAR2(200) NOT NULL,
    JOB_LISTENER VARCHAR2(200) NOT NULL,
    PRIMARY KEY (JOB_NAME,JOB_GROUP,JOB_LISTENER),
    FOREIGN KEY (JOB_NAME,JOB_GROUP) 
	REFERENCES QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP)
)tablespace ZHYGSPACE;

CREATE TABLE qrtz_triggers
  (
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    JOB_NAME  VARCHAR2(200) NOT NULL, 
    JOB_GROUP VARCHAR2(200) NOT NULL,
    IS_VOLATILE VARCHAR2(1) NOT NULL,
    DESCRIPTION VARCHAR2(250) NULL,
    NEXT_FIRE_TIME NUMBER(13) NULL,
    PREV_FIRE_TIME NUMBER(13) NULL,
    PRIORITY NUMBER(13) NULL,
    TRIGGER_STATE VARCHAR2(16) NOT NULL,
    TRIGGER_TYPE VARCHAR2(8) NOT NULL,
    START_TIME NUMBER(13) NOT NULL,
    END_TIME NUMBER(13) NULL,
    CALENDAR_NAME VARCHAR2(200) NULL,
    MISFIRE_INSTR NUMBER(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (JOB_NAME,JOB_GROUP) 
	REFERENCES QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP) 
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_simple_triggers
  (
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    REPEAT_COUNT NUMBER(7) NOT NULL,
    REPEAT_INTERVAL NUMBER(12) NOT NULL,
    TIMES_TRIGGERED NUMBER(10) NOT NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
	REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_cron_triggers
  (
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    CRON_EXPRESSION VARCHAR2(120) NOT NULL,
    TIME_ZONE_ID VARCHAR2(80),
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
	REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_blob_triggers
  (
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
        REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_trigger_listeners
  (
    TRIGGER_NAME  VARCHAR2(200) NOT NULL, 
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    TRIGGER_LISTENER VARCHAR2(200) NOT NULL,
    PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_LISTENER),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
	REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_calendars
  (
    CALENDAR_NAME  VARCHAR2(200) NOT NULL, 
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (CALENDAR_NAME)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_paused_trigger_grps
  (
    TRIGGER_GROUP  VARCHAR2(200) NOT NULL, 
    PRIMARY KEY (TRIGGER_GROUP)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_fired_triggers 
  (
    ENTRY_ID VARCHAR2(95) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    IS_VOLATILE VARCHAR2(1) NOT NULL,
    INSTANCE_NAME VARCHAR2(200) NOT NULL,
    FIRED_TIME NUMBER(13) NOT NULL,
    PRIORITY NUMBER(13) NOT NULL,
    STATE VARCHAR2(16) NOT NULL,
    JOB_NAME VARCHAR2(200) NULL,
    JOB_GROUP VARCHAR2(200) NULL,
    IS_STATEFUL VARCHAR2(1) NULL,
    REQUESTS_RECOVERY VARCHAR2(1) NULL,
    PRIMARY KEY (ENTRY_ID)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_scheduler_state 
  (
    INSTANCE_NAME VARCHAR2(200) NOT NULL,
    LAST_CHECKIN_TIME NUMBER(13) NOT NULL,
    CHECKIN_INTERVAL NUMBER(13) NOT NULL,
    PRIMARY KEY (INSTANCE_NAME)
)tablespace ZHYGSPACE;
CREATE TABLE qrtz_locks
  (
    LOCK_NAME  VARCHAR2(40) NOT NULL, 
    PRIMARY KEY (LOCK_NAME)
)tablespace ZHYGSPACE;
INSERT INTO qrtz_locks values('TRIGGER_ACCESS');
INSERT INTO qrtz_locks values('JOB_ACCESS');
INSERT INTO qrtz_locks values('CALENDAR_ACCESS');
INSERT INTO qrtz_locks values('STATE_ACCESS');
INSERT INTO qrtz_locks values('MISFIRE_ACCESS');

/*==============================================================*/
/* Index: idx_qrtz_j_req_recovery                                     */
/*==============================================================*/
create index idx_qrtz_j_req_recovery on qrtz_job_details (
   REQUESTS_RECOVERY ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_t_next_fire_time                                     */
/*==============================================================*/
create index idx_qrtz_t_next_fire_time on qrtz_triggers (
   NEXT_FIRE_TIME ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_t_state                                     */
/*==============================================================*/
create index idx_qrtz_t_state on qrtz_triggers (
   TRIGGER_STATE ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_t_nft_st                                     */
/*==============================================================*/
create index idx_qrtz_t_nft_st on qrtz_triggers (
   NEXT_FIRE_TIME,TRIGGER_STATE ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_t_volatile                                     */
/*==============================================================*/
create index idx_qrtz_t_volatile on qrtz_triggers (
   IS_VOLATILE ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_trig_name                                     */
/*==============================================================*/
create index idx_qrtz_ft_trig_name on qrtz_fired_triggers (
   TRIGGER_NAME ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_trig_group                                     */
/*==============================================================*/
create index idx_qrtz_ft_trig_group on qrtz_fired_triggers (
   TRIGGER_GROUP ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_trig_nm_gp                                     */
/*==============================================================*/
create index idx_qrtz_ft_trig_nm_gp on qrtz_fired_triggers (
   TRIGGER_NAME,TRIGGER_GROUP ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_trig_volatile                                     */
/*==============================================================*/
create index idx_qrtz_ft_trig_volatile on qrtz_fired_triggers (
   IS_VOLATILE ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_trig_inst_name                                     */
/*==============================================================*/
create index idx_qrtz_ft_trig_inst_name on qrtz_fired_triggers (
   INSTANCE_NAME ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_job_name                                     */
/*==============================================================*/
create index idx_qrtz_ft_job_name on qrtz_fired_triggers (
   JOB_NAME ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_job_group                                     */
/*==============================================================*/
create index idx_qrtz_ft_job_group on qrtz_fired_triggers (
   JOB_GROUP ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_job_stateful                                     */
/*==============================================================*/
create index idx_qrtz_ft_job_stateful on qrtz_fired_triggers (
   IS_STATEFUL ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;
/*==============================================================*/
/* Index: idx_qrtz_ft_job_req_recovery                                     */
/*==============================================================*/
create index idx_qrtz_ft_job_req_recovery on qrtz_fired_triggers (
   REQUESTS_RECOVERY ASC
)
pctfree 10
initrans 2
storage
(
    initial 64K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;

create table CALL_DEV
(
  TERMID          VARCHAR2(18) not null,
  LANGUAGE    CHAR(1) not null,
  DIS_NUM        CHAR(1) not null,
  RESERVE_FLAG CHAR(1) not null,
  MAX_RESERVE NUMBER(10) not null,
  MUL_SCREEN_FLAG CHAR(1) not null,
  MUL_SCREEN_IP1 VARCHAR2(20),
  MUL_SCREEN_IP2 VARCHAR2(20),
   constraint PK_CALL_DEV primary key (TERMID)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CALL_DEV
  is '�кŻ�������Ϣ��';
comment on column CALL_DEV.TERMID
  is '�ն˱��';
comment on column CALL_DEV.LANGUAGE
  is '֧������ 0����ͨ�� 1��Ӣ�� 2������';
comment on column CALL_DEV.DIS_NUM
  is '��ʾ�ȴ����� 0������ʾ 1����ʾ';   
comment on column CALL_DEV.RESERVE_FLAG
  is '֧��ԤԼ��־ 0����֧�� 1��֧��';
comment on column CALL_DEV.MAX_RESERVE
  is '���ԤԼ����'; 
comment on column CALL_DEV.MUL_SCREEN_FLAG
  is '֧���ۺ��� 0����֧�� 1��֧��';        
comment on column CALL_DEV.MUL_SCREEN_IP1
  is '�ۺ���IP1';
comment on column CALL_DEV.MUL_SCREEN_IP2
  is '�ۺ���IP2';
  
create table CALL_BUSINESSTYPE
(
  BUSINESSTYPE          CHAR(1) not null,
  CN_NAME    VARCHAR2(30) not null,
  EN_NAME        VARCHAR2(100) not null,
  CORPORATE_FLAG CHAR(1) not null,
  VIP_FLAG  CHAR(1) not null,
  RESERVE_FLAG CHAR(1) not null,
  TOP_FLAG CHAR(1) not null,
   constraint PK_CALL_BUSINESSTYPE primary key (BUSINESSTYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CALL_BUSINESSTYPE
  is '�кŻ�ȫ��ҵ�����ñ�';
comment on column CALL_BUSINESSTYPE.BUSINESSTYPE
  is 'ҵ������';
comment on column CALL_BUSINESSTYPE.CN_NAME
  is '����';
comment on column CALL_BUSINESSTYPE.EN_NAME
  is 'Ӣ��';   
comment on column CALL_BUSINESSTYPE.CORPORATE_FLAG
  is '�Թ���־ 0����˽ 1���Թ�';
comment on column CALL_BUSINESSTYPE.VIP_FLAG
  is 'VIP��־ 0����ͨ 1��VIP'; 
comment on column CALL_BUSINESSTYPE.RESERVE_FLAG
  is 'ԤԼ��־ 0����ԤԼ 1��ԤԼ';        
comment on column CALL_BUSINESSTYPE.TOP_FLAG
  is '�����ȱ�־ 0����ͨ 1��������';
  
create table CALL_RPT_DEV_HOUR_TYPE
(
  DEV_NO          VARCHAR2(20) not null,
  Date_time    VARCHAR2(10) not null,
  Trans_hour        VARCHAR2(2) not null,
  BUSINESSTYPE CHAR(1) not null,
  org_no  VARCHAR2(20),
  Account_org_no VARCHAR2(20),
  CREATE_NUM NUMBER(10),
  AVG_WAIT_LENGTH NUMBER(10),
  AVG_SERVICE_LENGTH NUMBER(10),
  MAX_WAIT_LENGTH NUMBER(10),
  MAX_SERVICE_LENGTH NUMBER(10),
   constraint PK_CALL_RPT_DEV_HOUR_TYPE primary key (DEV_NO,Date_time,Trans_hour,BUSINESSTYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CALL_RPT_DEV_HOUR_TYPE
  is '�кŻ�ͳ�Ʊ�(ÿ̨ÿСʱÿ��ҵ������)';
comment on column CALL_RPT_DEV_HOUR_TYPE.DEV_NO
  is '�豸��';
comment on column CALL_RPT_DEV_HOUR_TYPE.Date_time
  is '���� yyyyMMdd';
comment on column CALL_RPT_DEV_HOUR_TYPE.Trans_hour
  is '���׵�Сʱ 00~23';   
comment on column CALL_RPT_DEV_HOUR_TYPE.BUSINESSTYPE
  is 'ҵ������';
comment on column CALL_RPT_DEV_HOUR_TYPE.org_no
  is '�������� ��֯����/��������'; 
comment on column CALL_RPT_DEV_HOUR_TYPE.Account_org_no
  is '��������� ���˻�����';
comment on column CALL_RPT_DEV_HOUR_TYPE.CREATE_NUM
  is 'ȡ������';
comment on column CALL_RPT_DEV_HOUR_TYPE.AVG_WAIT_LENGTH
  is 'ƽ���ȴ�ʱ�� ��λ����';
comment on column CALL_RPT_DEV_HOUR_TYPE.AVG_SERVICE_LENGTH
  is 'ƽ������ʱ�� ��λ����';
comment on column CALL_RPT_DEV_HOUR_TYPE.MAX_WAIT_LENGTH
  is '���ȴ�ʱ�� ��λ����';
comment on column CALL_RPT_DEV_HOUR_TYPE.MAX_SERVICE_LENGTH
  is '������ʱ�� ��λ����';
  
create table CALL_RPT_DEV_DAY_TYPE
(
  DEV_NO          VARCHAR2(20) not null,
  Date_time    VARCHAR2(10) not null,
  BUSINESSTYPE CHAR(1) not null,
  org_no  VARCHAR2(20),
  Account_org_no VARCHAR2(20),
  CREATE_NUM NUMBER(10),
  AVG_WAIT_LENGTH NUMBER(10),
  AVG_SERVICE_LENGTH NUMBER(10),
  MAX_WAIT_LENGTH NUMBER(10),
  MAX_SERVICE_LENGTH NUMBER(10),
   constraint PK_CALL_RPT_DEV_DAY_TYPE primary key (DEV_NO,Date_time,BUSINESSTYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CALL_RPT_DEV_DAY_TYPE
  is '�кŻ�ͳ�Ʊ�(ÿ̨ÿ��ÿ��ҵ������)';
comment on column CALL_RPT_DEV_DAY_TYPE.DEV_NO
  is '�豸��';
comment on column CALL_RPT_DEV_DAY_TYPE.Date_time
  is '���� yyyyMMdd';
comment on column CALL_RPT_DEV_DAY_TYPE.BUSINESSTYPE
  is 'ҵ������';
comment on column CALL_RPT_DEV_DAY_TYPE.org_no
  is '�������� ��֯����/��������'; 
comment on column CALL_RPT_DEV_DAY_TYPE.Account_org_no
  is '��������� ���˻�����';
comment on column CALL_RPT_DEV_DAY_TYPE.CREATE_NUM
  is 'ȡ������';
comment on column CALL_RPT_DEV_DAY_TYPE.AVG_WAIT_LENGTH
  is 'ƽ���ȴ�ʱ�� ��λ����';
comment on column CALL_RPT_DEV_DAY_TYPE.AVG_SERVICE_LENGTH
  is 'ƽ������ʱ�� ��λ����';
comment on column CALL_RPT_DEV_DAY_TYPE.MAX_WAIT_LENGTH
  is '���ȴ�ʱ�� ��λ����';
comment on column CALL_RPT_DEV_DAY_TYPE.MAX_SERVICE_LENGTH
  is '������ʱ�� ��λ����';
  
create table CALL_RPT_DEV_MONTH_TYPE
(
  DEV_NO          VARCHAR2(20) not null,
  Date_time    VARCHAR2(10) not null,
  BUSINESSTYPE CHAR(1) not null,
  org_no  VARCHAR2(20),
  Account_org_no VARCHAR2(20),
  CREATE_NUM NUMBER(10),
  AVG_WAIT_LENGTH NUMBER(10),
  AVG_SERVICE_LENGTH NUMBER(10),
  MAX_WAIT_LENGTH NUMBER(10),
  MAX_SERVICE_LENGTH NUMBER(10),
   constraint PK_CALL_RPT_DEV_MONTH_TYPE primary key (DEV_NO,Date_time,BUSINESSTYPE)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CALL_RPT_DEV_MONTH_TYPE
  is '�кŻ�ͳ�Ʊ�(ÿ̨ÿ��ÿ��ҵ������)';
comment on column CALL_RPT_DEV_MONTH_TYPE.DEV_NO
  is '�豸��';
comment on column CALL_RPT_DEV_MONTH_TYPE.Date_time
  is '���� yyyyMM';
comment on column CALL_RPT_DEV_MONTH_TYPE.BUSINESSTYPE
  is 'ҵ������';
comment on column CALL_RPT_DEV_MONTH_TYPE.org_no
  is '�������� ��֯����/��������'; 
comment on column CALL_RPT_DEV_MONTH_TYPE.Account_org_no
  is '��������� ���˻�����';
comment on column CALL_RPT_DEV_MONTH_TYPE.CREATE_NUM
  is 'ȡ������';
comment on column CALL_RPT_DEV_MONTH_TYPE.AVG_WAIT_LENGTH
  is 'ƽ���ȴ�ʱ�� ��λ����';
comment on column CALL_RPT_DEV_MONTH_TYPE.AVG_SERVICE_LENGTH
  is 'ƽ������ʱ�� ��λ����';
comment on column CALL_RPT_DEV_MONTH_TYPE.MAX_WAIT_LENGTH
  is '���ȴ�ʱ�� ��λ����';
comment on column CALL_RPT_DEV_MONTH_TYPE.MAX_SERVICE_LENGTH
  is '������ʱ�� ��λ����';
  
create table CALL_RPT_DEV_DAY_TYPE_STATUS
(
  DEV_NO          VARCHAR2(20) not null,
  Date_time    VARCHAR2(10) not null,
  BUSINESSTYPE CHAR(1) not null,
  CALL_STATUS CHAR(1) not null,
  org_no  VARCHAR2(20),
  Account_org_no VARCHAR2(20),
  TRANS_NUM NUMBER(10),
  UPDATETIME VARCHAR2(20),
   constraint PK_RPT_DEV_DAY_TYPE_STATUS primary key (DEV_NO,Date_time,BUSINESSTYPE,CALL_STATUS)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table CALL_RPT_DEV_DAY_TYPE_STATUS
  is '�кŻ�ͳ�Ʊ�(ÿ̨ÿ��ÿ��ҵ������)';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.DEV_NO
  is '�豸��';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.Date_time
  is '���� yyyyMMdd';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.BUSINESSTYPE
  is 'ҵ������';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.CALL_STATUS
  is '״̬ 0����ȡ�� 1���ѽк� 2����ɷ��� 3��ת���� 4����ʧЧ';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.org_no
  is '�������� ��֯����/��������'; 
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.Account_org_no
  is '��������� ���˻�����';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.TRANS_NUM
  is '��������';
comment on column CALL_RPT_DEV_DAY_TYPE_STATUS.UPDATETIME
  is '��¼���µ�ʱ�䣬YYYY-MM-DD hh:mm:ss';

-- ----------------------------
-- Table structure for MEDIA_CONTENT
-- ----------------------------
CREATE TABLE "MEDIA_CONTENT"
(
    "NO"             VARCHAR2(36)                     NOT NULL,
    "NAME"           VARCHAR2(100)                    NOT NULL,
    "CREATE_USER"    VARCHAR2(20)                     NOT NULL,
    "CREATE_TIME"    VARCHAR2(19)                     NOT NULL,
    "TEMPLATE_NO"    VARCHAR2(36)                     NOT NULL,
    "VERSION"        VARCHAR2(11) DEFAULT '1.0.0'     NOT NULL,
    "VERSION_SERIAL" VARCHAR2(9)  DEFAULT '001000000' NOT NULL,
    "URL"            VARCHAR2(500)                    NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_CONTENT"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_CONTENT"."NAME" IS '��������';
COMMENT ON COLUMN "MEDIA_CONTENT"."CREATE_USER" IS '������';
COMMENT ON COLUMN "MEDIA_CONTENT"."CREATE_TIME" IS '����ʱ�䡣yyyy-MM-dd HH:mm:ss';
COMMENT ON COLUMN "MEDIA_CONTENT"."TEMPLATE_NO" IS 'ģ����';
COMMENT ON COLUMN "MEDIA_CONTENT"."VERSION" IS '�汾��';
COMMENT ON COLUMN "MEDIA_CONTENT"."VERSION_SERIAL" IS '�汾���к�';
COMMENT ON COLUMN "MEDIA_CONTENT"."URL" IS '���ݰ�·��';
COMMENT ON TABLE "MEDIA_CONTENT" IS '��ý��չʾ������Ϣ��';

ALTER TABLE "MEDIA_CONTENT"
    ADD CONSTRAINT "MEDIA_CONTENT_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_CONTENT_RESOURCE
-- ----------------------------
CREATE TABLE "MEDIA_CONTENT_RESOURCE"
(
    "NO"          VARCHAR2(36) NOT NULL,
    "AREA_NO"     VARCHAR2(36) NOT NULL,
    "RESOURCE_NO" VARCHAR2(36) NOT NULL,
    "DURATION"    NUMBER,
    "CONTENT_NO"  VARCHAR2(36) NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_CONTENT_RESOURCE"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_CONTENT_RESOURCE"."AREA_NO" IS '������';
COMMENT ON COLUMN "MEDIA_CONTENT_RESOURCE"."RESOURCE_NO" IS '�زı��';
COMMENT ON COLUMN "MEDIA_CONTENT_RESOURCE"."DURATION" IS '����ʱ������λs';
COMMENT ON COLUMN "MEDIA_CONTENT_RESOURCE"."CONTENT_NO" IS '���ݱ��';
COMMENT ON TABLE "MEDIA_CONTENT_RESOURCE" IS '��ý��չ�������ݱ�';

ALTER TABLE "MEDIA_CONTENT_RESOURCE"
    ADD CONSTRAINT "MEDIA_CONTENT_RESOURCE_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_DEV_INFO
-- ----------------------------
CREATE TABLE "MEDIA_DEV_INFO"
(
    "NO"         VARCHAR2(20)          NOT NULL,
    "SCREEN_NUM" VARCHAR2(3) DEFAULT 1 NOT NULL,
    "CAMERA"     VARCHAR2(1) DEFAULT 0 NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_DEV_INFO"."NO" IS '�豸��';
COMMENT ON COLUMN "MEDIA_DEV_INFO"."CAMERA" IS '�Ƿ�������ͷ
0����
1����';
COMMENT ON TABLE "MEDIA_DEV_INFO" IS '��ý���豸��Ϣ��';

ALTER TABLE "MEDIA_DEV_INFO"
    ADD CONSTRAINT "MEDIA_DEV_INFO_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_DEV_SCREEN
-- ----------------------------
CREATE TABLE "MEDIA_DEV_SCREEN"
(
    "NO"         VARCHAR2(20)  NOT NULL,
    "SCREEN_NO"  VARCHAR2(10)  NOT NULL,
    "NAME"       VARCHAR2(100) NOT NULL,
    "SCALE"      VARCHAR2(10)  NOT NULL,
    "RESOLUTION" VARCHAR2(10)  NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_DEV_SCREEN"."NO" IS '�豸��';
COMMENT ON COLUMN "MEDIA_DEV_SCREEN"."SCREEN_NO" IS '��Ļ���';
COMMENT ON COLUMN "MEDIA_DEV_SCREEN"."NAME" IS '��Ļ����';
COMMENT ON COLUMN "MEDIA_DEV_SCREEN"."SCALE" IS '��Ļ����
��:��';
COMMENT ON COLUMN "MEDIA_DEV_SCREEN"."RESOLUTION" IS '�ֱ���
��*��';
COMMENT ON TABLE "MEDIA_DEV_SCREEN" IS '��ý���豸��Ļ��';

ALTER TABLE "MEDIA_DEV_SCREEN"
    ADD CONSTRAINT "MEDIA_DEV_SCREEN_PK" PRIMARY KEY ("NO", "SCREEN_NO");
-- ----------------------------
-- Table structure for MEDIA_DEV_STATUS
-- ----------------------------
CREATE TABLE "MEDIA_DEV_STATUS"
(
    "NO"            VARCHAR2(10)          NOT NULL,
    "RUN_STATUS"    VARCHAR2(1) DEFAULT 1 NOT NULL,
    "SCREEN_STATUS" VARCHAR2(1) DEFAULT 1 NOT NULL,
	"UPDATE_TIME"   VARCHAR2(14)          NOT NULL,
	"VOICE_STATUS"  VARCHAR2(3)           NOT NULL,
	"BRIGHTNESS_STATUS" VARCHAR2(3)       NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_DEV_STATUS"."NO" IS '�豸��';
COMMENT ON COLUMN "MEDIA_DEV_STATUS"."RUN_STATUS" IS '����״̬��
0������
1���ػ�
2������';
COMMENT ON COLUMN "MEDIA_DEV_STATUS"."SCREEN_STATUS" IS '��Ļ״̬
0������
1��Ϣ��';
COMMENT ON COLUMN "MEDIA_DEV_STATUS"."UPDATE_TIME" IS '�������ʱ��
ʱ�䣨14λ�����磺yyyymmddhhmmss��';
COMMENT ON COLUMN "MEDIA_DEV_STATUS"."VOICE_STATUS" IS '����״̬
������С��-1~100,-1��ʾ����';
COMMENT ON COLUMN "MEDIA_DEV_STATUS"."BRIGHTNESS_STATUS" IS '��Ļ����
��Ļ���ȣ�0~100';
COMMENT ON TABLE "MEDIA_DEV_STATUS" IS '��ý���豸״̬��Ϣ��';

ALTER TABLE "MEDIA_DEV_STATUS"
    ADD CONSTRAINT "MEDIA_DEV_STATUS_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_DEV_TASK
-- ----------------------------
CREATE TABLE "MEDIA_DEV_TASK"
(
    "NO"              VARCHAR2(36) NOT NULL,
    "DEV_NO"          VARCHAR2(20) NOT NULL,
    "PLAY_TASK_NO"    VARCHAR2(36) NOT NULL,
    "TASK_VERSION"    VARCHAR2(11) NOT NULL,
    "CONTENT_VERSION" VARCHAR2(11) NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_DEV_TASK"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_DEV_TASK"."DEV_NO" IS '�豸��';
COMMENT ON COLUMN "MEDIA_DEV_TASK"."PLAY_TASK_NO" IS '���ŵ����';
COMMENT ON COLUMN "MEDIA_DEV_TASK"."TASK_VERSION" IS '�汾��';
COMMENT ON COLUMN "MEDIA_DEV_TASK"."CONTENT_VERSION" IS '���ݰ汾��';
COMMENT ON TABLE "MEDIA_DEV_TASK" IS '��ý���豸��ǰ�����';

ALTER TABLE "MEDIA_DEV_TASK"
    ADD CONSTRAINT "MEDIA_DEV_TASK_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_MARQUEE
-- ----------------------------
CREATE TABLE "MEDIA_MARQUEE"
(
    "NO"           VARCHAR2(32)     NOT NULL,
    "NAME"         VARCHAR2(100)    NOT NULL,
    "ORG"          VARCHAR2(300),
    "DEV_CATALOG"  VARCHAR2(300),
    "VALID_TIME"   VARCHAR2(19)     NOT NULL,
    "INVALID_TIME" VARCHAR2(19)     NOT NULL,
    "START_TIME"   VARCHAR2(8)      NOT NULL,
    "END_TIME"     VARCHAR2(8)      NOT NULL,
    "SPEED"        NUMBER DEFAULT 5 NOT NULL,
    "STATE"        VARCHAR2(1)      NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_MARQUEE"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_MARQUEE"."NAME" IS '����������';
COMMENT ON COLUMN "MEDIA_MARQUEE"."ORG" IS '�����豸����';
COMMENT ON COLUMN "MEDIA_MARQUEE"."DEV_CATALOG" IS '�����豸����';
COMMENT ON COLUMN "MEDIA_MARQUEE"."VALID_TIME" IS '��Чʱ��';
COMMENT ON COLUMN "MEDIA_MARQUEE"."INVALID_TIME" IS 'ʧЧʱ��';
COMMENT ON COLUMN "MEDIA_MARQUEE"."START_TIME" IS '���ſ�ʼʱ��';
COMMENT ON COLUMN "MEDIA_MARQUEE"."END_TIME" IS '���Ž���ʱ��';
COMMENT ON COLUMN "MEDIA_MARQUEE"."SPEED" IS '�����ٶȡ���λΪ��/s';
COMMENT ON COLUMN "MEDIA_MARQUEE"."STATE" IS '0��δʹ��
1���ѷ���
2����ͣ��';
COMMENT ON TABLE "MEDIA_MARQUEE" IS '��ý��չʾ��������Ϣ��';

ALTER TABLE "MEDIA_MARQUEE"
    ADD CONSTRAINT "MEDIA_MARQUEE_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_PLAY_RANGE
-- ----------------------------
CREATE TABLE "MEDIA_PLAY_RANGE"
(
    "NO"           VARCHAR2(36) NOT NULL,
    "PLAY_TASK_NO" VARCHAR2(36) NOT NULL,
    "ORG"          VARCHAR2(40),
    "DEV_CATALOG"  VARCHAR2(5),
    "DEV_VENDOR"   VARCHAR2(5),
    "DEV_TYPE"     VARCHAR2(5),
    "DEV_NO"       VARCHAR2(40),
    "SCREEN_NO"    VARCHAR2(3) DEFAULT '1'
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 262144
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."PLAY_TASK_NO" IS '���������';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."ORG" IS '������';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."DEV_CATALOG" IS '�豸����';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."DEV_VENDOR" IS '�豸Ʒ��';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."DEV_TYPE" IS '�豸�ͺ�';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."DEV_NO" IS '�豸��';
COMMENT ON COLUMN "MEDIA_PLAY_RANGE"."SCREEN_NO" IS '��Ļ��š�
1������
2������';
COMMENT ON TABLE "MEDIA_PLAY_RANGE" IS '����豸��Χ��';

ALTER TABLE "MEDIA_PLAY_RANGE"
    ADD CONSTRAINT "SYS_C0012421" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_PLAY_TASK
-- ----------------------------
CREATE TABLE "MEDIA_PLAY_TASK"
(
    "NO"             VARCHAR2(36)                          NOT NULL,
    "CONTENT_NO"     VARCHAR2(36)                          NOT NULL,
    "NAME"           VARCHAR2(100)                         NOT NULL,
    "VALID_TIME"     VARCHAR2(19) DEFAULT '00000000000000' NOT NULL,
    "INVALID_TIME"   VARCHAR2(19) DEFAULT '20991212235959' NOT NULL,
    "START_TIME"     VARCHAR2(19) DEFAULT '00:00:00',
    "END_TIME"       VARCHAR2(19) DEFAULT '23:59:59',
    "NOTE"           VARCHAR2(500),
    "STATE"          VARCHAR2(1),
    "VERSION"        VARCHAR2(11) DEFAULT '1.0.0'          NOT NULL,
    "VERSION_SERIAL" VARCHAR2(9)  DEFAULT '001000000'      NOT NULL,
    "DURATION"       VARCHAR2(20) DEFAULT '0'              NOT NULL
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."CONTENT_NO" IS '���ݱ��';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."NAME" IS '��������';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."VALID_TIME" IS '��Чʱ�䡣yyyy-MM-dd HH:mm:ss';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."INVALID_TIME" IS 'ʧЧʱ��';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."START_TIME" IS '����ʱ�䡣HH:mm:ss';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."END_TIME" IS 'ֹͣʱ��';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."NOTE" IS '˵��';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."STATE" IS '0��δ������1���ѷ�����2����ͣ��';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."VERSION" IS '�汾��';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."VERSION_SERIAL" IS '�汾���к�';
COMMENT ON COLUMN "MEDIA_PLAY_TASK"."DURATION" IS '��������ʱ��';
COMMENT ON TABLE "MEDIA_PLAY_TASK" IS '��ý�岥��������Ϣ��';

ALTER TABLE "MEDIA_PLAY_TASK"
    ADD CONSTRAINT "MEDIA_PLAYLIST_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_RESOURCE
-- ----------------------------
CREATE TABLE "MEDIA_RESOURCE"
(
    "NO"          VARCHAR2(36)          NOT NULL,
    "TYPE"        VARCHAR2(2),
    "RESOLUTION"  VARCHAR2(10),
    "DURATION"    NUMBER,
    "FILE_SIZE"   VARCHAR2(20),
    "AUDIT_STATE" VARCHAR2(1) DEFAULT 1 NOT NULL,
    "STATE"       VARCHAR2(1)           NOT NULL,
    "EXPIRE_TIME" VARCHAR2(19)          NOT NULL,
    "CREATE_TIME" VARCHAR2(19),
    "CREATE_USER" VARCHAR2(20)          NOT NULL,
    "NAME"        VARCHAR2(100)         NOT NULL,
    "URL"         VARCHAR2(200),
    "MAINTAIN"    VARCHAR2(1) DEFAULT 1 NOT NULL,
    "USER_ORG_NO" VARCHAR2(20)
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_RESOURCE"."NO" IS '���';
COMMENT ON COLUMN "MEDIA_RESOURCE"."TYPE" IS '��Դ���͡�
1��ͼƬ
2����Ƶ
3������
4���ı�
5����Ƶ
6����ҳ
7������
8��logo';
COMMENT ON COLUMN "MEDIA_RESOURCE"."RESOLUTION" IS '�ֱ��ʡ���������*��������';
COMMENT ON COLUMN "MEDIA_RESOURCE"."DURATION" IS '��Ƶ����Ƶʱ������λs';
COMMENT ON COLUMN "MEDIA_RESOURCE"."FILE_SIZE" IS '�ļ���С����λ�ֽ�';
COMMENT ON COLUMN "MEDIA_RESOURCE"."AUDIT_STATE" IS '���״̬��1��δ��ˣ�2�����ͨ����3����˾ܾ�';
COMMENT ON COLUMN "MEDIA_RESOURCE"."STATE" IS 'ʹ��״̬��1�����ã�2�������ã�3����ɾ��';
COMMENT ON COLUMN "MEDIA_RESOURCE"."EXPIRE_TIME" IS '��Ч�ڡ�yyyy-MM-dd HH:mm:ss';
COMMENT ON COLUMN "MEDIA_RESOURCE"."CREATE_TIME" IS '�ϴ�ʱ�䡣yyyy-MM-dd HH:mm:ss';
COMMENT ON COLUMN "MEDIA_RESOURCE"."CREATE_USER" IS '�ϴ���';
COMMENT ON COLUMN "MEDIA_RESOURCE"."NAME" IS '��Դ����';
COMMENT ON COLUMN "MEDIA_RESOURCE"."URL" IS '��Դ·��';
COMMENT ON COLUMN "MEDIA_RESOURCE"."MAINTAIN" IS '�Ƿ��ά��
0��������
1������';
COMMENT ON COLUMN "MEDIA_RESOURCE"."USER_ORG_NO" IS '�û�������';
COMMENT ON TABLE "MEDIA_RESOURCE" IS '��ý����Դ��Ϣ��';

ALTER TABLE "MEDIA_RESOURCE"
    ADD CONSTRAINT "MEDIA_RESOURCE_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_TEMPLATE
-- ----------------------------
CREATE TABLE "MEDIA_TEMPLATE"
(
    "NO"          VARCHAR2(36)  NOT NULL,
    "NAME"        VARCHAR2(100) NOT NULL,
    "TYPE"        VARCHAR2(1)   NOT NULL,
    "CREATE_TIME" VARCHAR2(19)  NOT NULL,
    "CREATE_USER" VARCHAR2(20)  NOT NULL,
    "SCALE"       VARCHAR2(10),
    "BACK_IMG"    VARCHAR2(36)
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_TEMPLATE"."NO" IS 'ģ����';
COMMENT ON COLUMN "MEDIA_TEMPLATE"."NAME" IS 'ģ������';
COMMENT ON COLUMN "MEDIA_TEMPLATE"."TYPE" IS '��ʽ��1��������2������';
COMMENT ON COLUMN "MEDIA_TEMPLATE"."CREATE_TIME" IS '����ʱ�䡣yyyy-MM-dd HH:mm:ss';
COMMENT ON COLUMN "MEDIA_TEMPLATE"."CREATE_USER" IS '������';
COMMENT ON COLUMN "MEDIA_TEMPLATE"."SCALE" IS 'ģ����߱�������:��';
COMMENT ON COLUMN "MEDIA_TEMPLATE"."BACK_IMG" IS '����ͼƬ';
COMMENT ON TABLE "MEDIA_TEMPLATE" IS '��ý��չʾģ����Ϣ��';

ALTER TABLE "MEDIA_TEMPLATE"
    ADD CONSTRAINT "MEDIA_TEMPLATE_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for MEDIA_TEMPLATE_AREA
-- ----------------------------
CREATE TABLE "MEDIA_TEMPLATE_AREA"
(
    "TEMPLATE_NO" VARCHAR2(36),
    "NO"          VARCHAR2(36) NOT NULL,
    "LEFT_DIS"    VARCHAR2(10) NOT NULL,
    "TOP_DIS"     VARCHAR2(10) NOT NULL,
    "WIDTH"       VARCHAR2(10) NOT NULL,
    "HEIGHT"      VARCHAR2(10) NOT NULL,
    "TYPE"        VARCHAR2(2)
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."TEMPLATE_NO" IS 'ģ����';
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."NO" IS '������';
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."LEFT_DIS" IS '�������ģ�����߾࣬��λ%';
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."TOP_DIS" IS '�������ģ����ϱ߾࣬��λ%';
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."WIDTH" IS '������ȣ���λ%';
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."HEIGHT" IS '����߶ȣ���λ%';
COMMENT ON COLUMN "MEDIA_TEMPLATE_AREA"."TYPE" IS '������Դ���͡�ͬ��Դ����';
COMMENT ON TABLE "MEDIA_TEMPLATE_AREA" IS '��ý��ģ�������';

ALTER TABLE "MEDIA_TEMPLATE_AREA"
    ADD CONSTRAINT "MEDIA_TEMPLATE_AREA_PK" PRIMARY KEY ("NO");
-- ----------------------------
-- Table structure for SERVICE_PROP_MEDIASHOW
-- ----------------------------
CREATE TABLE "SERVICE_PROP_MEDIASHOW"
(
    "KEY_ID" VARCHAR2(100) NOT NULL,
    "VALUE"  VARCHAR2(200) NOT NULL,
    "NOTE"   VARCHAR2(200)                  
)
    TABLESPACE "ZHYGSPACE"
    LOGGING
    NOCOMPRESS
    PCTFREE 10
    INITRANS 1
    STORAGE
(
    INITIAL 65536
    NEXT 1048576
    MINEXTENTS 1
    MAXEXTENTS 2147483645
    BUFFER_POOL DEFAULT
)
    PARALLEL 1
    NOCACHE
    DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "SERVICE_PROP_MEDIASHOW"."KEY_ID" IS '������';
COMMENT ON COLUMN "SERVICE_PROP_MEDIASHOW"."VALUE" IS '����ֵ';
COMMENT ON COLUMN "SERVICE_PROP_MEDIASHOW"."NOTE" IS '����˵��';

ALTER TABLE "SERVICE_PROP_MEDIASHOW"
    ADD CONSTRAINT "SERVICE_PROP_MEDIASHOW_PK" PRIMARY KEY ("KEY_ID");

--���ֺź������汾��
create table NSN_BLACK_VERSION
(
  VER_ID	VARCHAR2(16) not null,
  VER_DESP	VARCHAR2(256),
  NOTE		VARCHAR2(256)
)
tablespace NTS_SPACE;
comment on table NSN_BLACK_VERSION
  is '���ֺź������汾��';
comment on column NSN_BLACK_VERSION.VER_ID
  is '�汾ID�����磺1.0.1';
comment on column NSN_BLACK_VERSION.VER_DESP
  is '�汾����';
comment on column NSN_BLACK_VERSION.NOTE
  is '��ע';
alter table NSN_BLACK_VERSION
  add constraint PK_NSN_BK_VER primary key (VER_ID)
  using index tablespace NTS_IDXSPACE;

--���ֺź������� 
create table NSN_BLACK_TABLE
(
  NSN_BK_ID		VARCHAR2(20) not null,
  NOTE_SN		VARCHAR2(20) not null,
  NOTE_CURRENCY	VARCHAR2(10) not null,
  NOTE_VALUE	INTEGER not null,
  BK_TYPE		INTEGER not null,
  VER_ID		VARCHAR2(16) not null, 
  ADD_DATE		VARCHAR2(10)  not null,
  ADD_TIME		VARCHAR2(8) not null,
  ADD_OP_NO		VARCHAR2(20)  not null,
  NOTE			VARCHAR2(100)
)
tablespace NTS_SPACE;
comment on table NSN_BLACK_TABLE
  is '���ֺź�������';
comment on column NSN_BLACK_TABLE.NSN_BK_ID
  is '���ֺź�����ID;����8λ����(YYYYMMDD)+9λʱ��(hhmmssSSS)';
comment on column NSN_BLACK_TABLE.NOTE_SN
  is '���ֺ���';
comment on column NSN_BLACK_TABLE.NOTE_CURRENCY
  is '��Ʊ����:USD-��Ԫ;EUR-ŷԪ;GBP-Ӣ��;CNY-�����;JPY-��Ԫ;AUD-��Ԫ;HKD-��Ԫ;YTL-������;CAD-��Ԫ;RUB-¬��;KRW-��Ԫ';
comment on column NSN_BLACK_TABLE.NOTE_VALUE
  is '��Ʊ��ֵ:50,100��';
comment on column NSN_BLACK_TABLE.BK_TYPE
  is '����������:1-���;2-ȡ��';
comment on column NSN_BLACK_TABLE.VER_ID
  is '�汾ID';
comment on column NSN_BLACK_TABLE.ADD_DATE
  is '��������';
comment on column NSN_BLACK_TABLE.ADD_TIME
  is '����ʱ��';
comment on column NSN_BLACK_TABLE.ADD_OP_NO
  is '������Ա';
comment on column NSN_BLACK_TABLE.NOTE
  is '��ע������д��ѡ��������ԭ��';
alter table NSN_BLACK_TABLE
  add constraint PK_NSN_BLACK primary key (NSN_BK_ID)
  using index tablespace NTS_IDXSPACE;
alter table NSN_BLACK_TABLE
  add constraint FK_BK_R_VER foreign key (VER_ID)
  references NSN_BLACK_VERSION (VER_ID);

--���ֺź������·���¼
create table NSN_BLACK_ISSUE
(
  ISSUE_BATCH	VARCHAR2(20) not null,
  DEV_NO		VARCHAR2(20) not null,
  BK_TYPE		INTEGER not null,
  BK_VER_ID		VARCHAR2(16) not null,
  BK_COUNT		INTEGER default 0 not null,
  ISSUE_RET		INTEGER default 0 not null,
  ISSUE_DATE	VARCHAR2(10) not null,
  ISSUE_TIME	VARCHAR2(8) not null,
  ISSUE_OP_NO	VARCHAR2(20) not null,
  NOTE			VARCHAR2(64)
)
tablespace NTS_SPACE;
comment on table NSN_BLACK_ISSUE
  is '���ֺź������·���¼';
comment on column NSN_BLACK_ISSUE.ISSUE_BATCH
  is '�·�����:8λ����(YYYYMMDD)+9λʱ��(hhmmssSSS)';
comment on column NSN_BLACK_ISSUE.DEV_NO
  is '�豸��';
comment on column NSN_BLACK_ISSUE.BK_TYPE
  is '����������:1-��CdmSerialNo��;2-ȡ�CimSerialNo��';
comment on column NSN_BLACK_ISSUE.BK_VER_ID
  is '�������汾';
comment on column NSN_BLACK_ISSUE.BK_COUNT
  is '����������';
comment on column NSN_BLACK_ISSUE.ISSUE_DATE
  is '�·�����';
comment on column NSN_BLACK_ISSUE.ISSUE_TIME
  is '�·�ʱ��';
comment on column NSN_BLACK_ISSUE.ISSUE_OP_NO
  is '�·���Ա';
comment on column NSN_BLACK_ISSUE.NOTE
  is '��ע';
alter table NSN_BLACK_ISSUE
  add constraint PK_NSN_BK_ISU primary key (ISSUE_BATCH,DEV_NO)
  using index tablespace NTS_IDXSPACE;

--���ɹ��ֺŹ���� 
create table SUS_REG_TABLE
(
  REG_EXP	VARCHAR2(64) not null,
  ADD_DATE	VARCHAR2(10)  not null,
  ADD_TIME	VARCHAR2(8) not null,
  ADD_OP_NO	VARCHAR2(20)  not null,
  NOTE		VARCHAR2(256)
)
tablespace NTS_SPACE;
comment on table SUS_REG_TABLE
  is '���ɹ��ֺŹ����';
comment on column SUS_REG_TABLE.REG_EXP
  is '�������ʽ;Base64�����洢';
comment on column SUS_REG_TABLE.ADD_DATE
  is '��������';
comment on column SUS_REG_TABLE.ADD_TIME
  is '����ʱ��';
comment on column SUS_REG_TABLE.ADD_OP_NO
  is '������Ա';
comment on column SUS_REG_TABLE.NOTE
  is '��ע������д��ѡ���ɹ������ԭ��';
alter table SUS_REG_TABLE
  add constraint PK_SUS_REG primary key (REG_EXP)
  using index tablespace NTS_IDXSPACE;

--�ļ�����ͬ����¼��
create table TEXT_SYNC_TABLE
(
  TEXT_DATE		VARCHAR2(10) not null,
  DEV_NO		VARCHAR2(20) not null,
  SYNC_TYPE		INTEGER default 0 not null,
  COMPLETE_FLAG	INTEGER default 0 not null,
  SYNC_RESULT	INTEGER default 0 not null,
  TEXT_PATH		VARCHAR2(256),
  SYNC_DATE		VARCHAR2(10) not null,
  SYNC_TIME		VARCHAR2(8) not null,
  SYNC_OP_NO	VARCHAR2(20),
  NOTE			VARCHAR2(100)
)
tablespace NTS_SPACE;
comment on table TEXT_SYNC_TABLE
  is '�ļ�����ͬ����¼��';
comment on column TEXT_SYNC_TABLE.TEXT_DATE
  is '�ı�����';
comment on column TEXT_SYNC_TABLE.DEV_NO
  is '�豸��';
comment on column TEXT_SYNC_TABLE.SYNC_TYPE
  is 'ͬ����ʽ:0-�Զ�,1-�ֶ�';
comment on column TEXT_SYNC_TABLE.COMPLETE_FLAG
  is '������ʶ:0-����;1-������';
comment on column TEXT_SYNC_TABLE.SYNC_RESULT
  is 'ͬ�����:0-ʧ��;1-�ɹ�';
comment on column TEXT_SYNC_TABLE.TEXT_PATH
  is '�ı�·��:��ͬ�����Ϊ1ʱ������Ϊ��';
comment on column TEXT_SYNC_TABLE.SYNC_DATE
  is 'ͬ������';
comment on column TEXT_SYNC_TABLE.SYNC_TIME
  is 'ͬ��ʱ��';
comment on column TEXT_SYNC_TABLE.SYNC_OP_NO
  is 'ͬ����Ա:��ͬ�����Ϊ1ʱ������Ϊ��';
comment on column TEXT_SYNC_TABLE.NOTE
  is '��ע';
alter table TEXT_SYNC_TABLE
  add constraint PK_TEXT_SYNC primary key (TEXT_DATE, DEV_NO)
  using index tablespace NTS_IDXSPACE;


--������ˮ��
create table TX_TABLE
(
  TX_ID				VARCHAR2(40) not null,
  DEV_NO			VARCHAR2(20) not null,
  ORG_NO        	VARCHAR2(20) not null,
  TX_SN				VARCHAR2(25),
  TX_DATE			VARCHAR2(10) not null,
  TX_TIME			VARCHAR2(8) not null,
  TX_MONTH	    	VARCHAR2(2) not null,
  TX_DAY			VARCHAR2(2) not null,
  TX_TYPE			VARCHAR2(10) not null,
  PRI_ACCOUNT		VARCHAR2(30) not null,
  CUR_CODE			VARCHAR2(10),
  TX_AMT			VARCHAR(10),
  TX_STATUS     	VARCHAR2(10) not null,
  C_REJECT_CODE		VARCHAR2(10), 
  H_REJECT_CODE		VARCHAR2(10),
  SUSPIC_FLAG   	INTEGER default 0 not null,
  PIC_SYNC_FLAG		INTEGER default 0 not null,
  PIC_SYNC_TYPE		INTEGER,
  PIC_SYNC_DATE		VARCHAR2(10),
  PIC_SYNC_TIME		VARCHAR2(8),
  PIC_SYNC_OP_NO 	VARCHAR2(20),
  FSN_GEN_FLG 		INTEGER default 0 not null,
  FSN_GEN_CNT 		INTEGER default 0,
  NOTE				VARCHAR2(100),
  BNS_RELATED_INFO	VARCHAR2(50),
  CRH_GEN_FLAG		INTEGER,
  FSN_SYNC_FLAG		INTEGER default 0 not null,
  FSN_SYNC_TYPE		INTEGER,
  FSN_SYNC_DATE		VARCHAR2(10),
  FSN_SYNC_TIME		VARCHAR2(8),
  FSN_SYNC_OP_NO 	VARCHAR2(20),
  INTERFACE_MODE  	VARCHAR(8),
  FSN_PARSE_FLAG  	INTEGER default 0 not null,
  FSN_PARSE_DATE  	VARCHAR2(10),
  FSN_PARSE_TIME  	VARCHAR2(10),
  FSN_GEN_DATE    	VARCHAR2(10),
  FSN_GEN_TIME    	VARCHAR2(10),
  FSN_GEN_PATH  	VARCHAR2(200)
)
PARTITION BY RANGE (TX_MONTH)
SUBPARTITION BY LIST (TX_DAY)
SUBPARTITION TEMPLATE(
  SUBPARTITION D01 VALUES ('01') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D02 VALUES ('02') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D03 VALUES ('03') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D04 VALUES ('04') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D05 VALUES ('05') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D06 VALUES ('06') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D07 VALUES ('07') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D08 VALUES ('08') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D09 VALUES ('09') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D10 VALUES ('10') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D11 VALUES ('11') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D12 VALUES ('12') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D13 VALUES ('13') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D14 VALUES ('14') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D15 VALUES ('15') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D16 VALUES ('16') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D17 VALUES ('17') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D18 VALUES ('18') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D19 VALUES ('19') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D20 VALUES ('20') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D21 VALUES ('21') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D22 VALUES ('22') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D23 VALUES ('23') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D24 VALUES ('24') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D25 VALUES ('25') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D26 VALUES ('26') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D27 VALUES ('27') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D28 VALUES ('28') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D29 VALUES ('29') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D30 VALUES ('30') TABLESPACE TRANS_TX_DATA_SPACE,
  SUBPARTITION D31 VALUES ('31') TABLESPACE TRANS_TX_DATA_SPACE
)
(
  PARTITION M01 VALUES LESS THAN ('02') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M02 VALUES LESS THAN ('03') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M03 VALUES LESS THAN ('04') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M04 VALUES LESS THAN ('05') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M05 VALUES LESS THAN ('06') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M06 VALUES LESS THAN ('07') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M07 VALUES LESS THAN ('08') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M08 VALUES LESS THAN ('09') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M09 VALUES LESS THAN ('10') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M10 VALUES LESS THAN ('11') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M11 VALUES LESS THAN ('12') TABLESPACE TRANS_TX_DATA_SPACE,
  PARTITION M12 VALUES LESS THAN ('13') TABLESPACE TRANS_TX_DATA_SPACE
);
comment on table TX_TABLE
  is '������ˮ��';
comment on column TX_TABLE.TX_ID
  is '����ID:�豸��+8λ����(YYYYMMDD)+6λ����ʱ��(hhMMss)+2λ˳���(00~99)';
comment on column TX_TABLE.DEV_NO
  is '�豸��';
comment on column TX_TABLE.ORG_NO
  is '�������';
comment on column TX_TABLE.TX_SN
  is 'C�˽�����ˮ��';
comment on column TX_TABLE.TX_DATE
  is '��������';
comment on column TX_TABLE.TX_TIME
  is '����ʱ��';
comment on column TX_TABLE.TX_MONTH
  is '�·�';
comment on column TX_TABLE.TX_DAY
  is '��';
comment on column TX_TABLE.TX_TYPE
  is '�������ͣ�CWD-ȡ�CDP-�п���ADP-�޿���ICQC-Ȧ��';
comment on column TX_TABLE.PRI_ACCOUNT
  is '����';
comment on column TX_TABLE.CUR_CODE
  is '���ױ���:USD-��Ԫ;EUR-ŷԪ;GBP-Ӣ��;CNY-�����;JPY-��Ԫ;AUD-��Ԫ;HKD-��Ԫ;TLG-������;CAD-��Ԫ;RUB-¬��;KRW-��Ԫ';
comment on column TX_TABLE.TX_AMT
  is '���׽���λ��Ԫ';
comment on column TX_TABLE.TX_STATUS
  is '��Ʊ����ԭ��:00-�������볮��01-��λ���գ�02-��ʱ���գ�03-���ױ�ȡ����99-�����쳣���';
comment on column TX_TABLE.C_REJECT_CODE
  is 'C�˾ܾ���';
comment on column TX_TABLE.H_REJECT_CODE
  is '�����ܾ���';
comment on column TX_TABLE.SUSPIC_FLAG
  is '���ɱ��:0-����,1-����';
comment on column TX_TABLE.PIC_SYNC_FLAG
  is 'ͼƬͬ����ʶ��0-δͬ����1-����ͬ����2-��ȫͬ����3-����ͬ����4-������';
comment on column TX_TABLE.PIC_SYNC_TYPE
  is 'ͼƬͬ����ʽ:0-�Զ�,1-�ֶ�,2-ʵʱ';
comment on column TX_TABLE.PIC_SYNC_DATE
  is 'ͼƬͬ������';
comment on column TX_TABLE.PIC_SYNC_TIME
  is 'ͼƬͬ��ʱ��';
comment on column TX_TABLE.PIC_SYNC_OP_NO
  is 'ͼƬͬ����Ա';
comment on column TX_TABLE.FSN_GEN_FLG
  is 'FSN���ɱ�־:0-δ����FSN;1-������FSN;2-������;3-������';
comment on column TX_TABLE.FSN_GEN_CNT
  is 'FSN���ɴ���';
comment on column TX_TABLE.FSN_SYNC_FLAG
  is 'FSN�ļ�ͬ����ʶ��0-δͬ����1-����ͬ����2-��ȫͬ����3-����ͬ����4-��������5-ͬ����';
comment on column TX_TABLE.FSN_SYNC_TYPE
  is 'FSN�ļ�ͬ����ʽ:0-��ʱ,1-�ֶ�,2-ʵʱ';
comment on column TX_TABLE.FSN_SYNC_DATE
  is 'FSN�ļ�ͬ������';
comment on column TX_TABLE.FSN_SYNC_TIME
  is 'FSN�ļ�ͬ��ʱ��';
comment on column TX_TABLE.FSN_SYNC_OP_NO
  is 'FSN�ļ�ͬ����Ա';
comment on column TX_TABLE.NOTE
  is '��ע';
comment on column TX_TABLE.BNS_RELATED_INFO
  is 'ҵ�������Ϣ';
comment on column TX_TABLE.CRH_GEN_FLAG
  is 'CRH���ɱ�־��0-δ���ɣ�1-�����ɣ���';
  comment on column TX_TABLE.INTERFACE_MODE
  is '���Ľӿ�����';
comment on column TX_TABLE.FSN_PARSE_FLAG
  is 'FSN�ļ�������ʶ��0-δ��ʼ��1-���������С�2-�����ɹ���3-����ʧ�ܣ��ȴ�������4-����ʧ�ܣ����ٽ�����5-���ֽ���';
comment on column TX_TABLE.FSN_PARSE_DATE
  is '�������� YYYY-MM-DD';
comment on column TX_TABLE.FSN_PARSE_TIME
  is '����ʱ�� hh:mi:ss';
comment on column TX_TABLE.FSN_GEN_DATE
  is '�������� YYYY-MM-DD';
comment on column TX_TABLE.FSN_GEN_TIME
  is '����ʱ�� hh:mi:ss';
comment on column TX_TABLE.FSN_GEN_PATH
  is 'FSN�ļ�����·��';
alter table TX_TABLE
  add constraint PK_TX_TAB primary key (TX_ID)
  using index tablespace NTS_IDXSPACE;
CREATE INDEX INDEX_TX_DATE ON TX_TABLE (TX_DATE) LOCAL
  TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_TX_MONTH_DAY ON TX_TABLE (TX_MONTH, TX_DAY) LOCAL
  TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_TX_DEVNO ON TX_TABLE (DEV_NO) LOCAL
  TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_TX_PRIACC ON TX_TABLE (PRI_ACCOUNT) LOCAL
  TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_TX_ORGNO ON TX_TABLE (ORG_NO) LOCAL
  TABLESPACE NTS_IDXSPACE;


--���׹��̱�
create table TX_SEC_TABLE
(
  TX_SECTION_ID		VARCHAR2(42) not null,
  TX_ID				VARCHAR2(40) not null,
  SECTION_NO		INTEGER default 1 not null,
  TX_DATE		    VARCHAR2(10) not null,
  TX_MONTH	    	VARCHAR2(2) not null,
  TX_DAY	    	VARCHAR2(2) not null,
  NOTE_COUNT		INTEGER not null,
  C_FSN_PATH		VARCHAR2(256),
  S_FSN_PATH		VARCHAR2(256),
  PARSE_SUCC_FLAG       VARCHAR2(5)
)
PARTITION BY RANGE (TX_MONTH)
SUBPARTITION BY LIST (TX_DAY)
SUBPARTITION TEMPLATE(
  SUBPARTITION D01 VALUES ('01') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D02 VALUES ('02') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D03 VALUES ('03') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D04 VALUES ('04') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D05 VALUES ('05') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D06 VALUES ('06') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D07 VALUES ('07') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D08 VALUES ('08') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D09 VALUES ('09') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D10 VALUES ('10') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D11 VALUES ('11') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D12 VALUES ('12') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D13 VALUES ('13') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D14 VALUES ('14') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D15 VALUES ('15') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D16 VALUES ('16') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D17 VALUES ('17') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D18 VALUES ('18') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D19 VALUES ('19') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D20 VALUES ('20') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D21 VALUES ('21') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D22 VALUES ('22') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D23 VALUES ('23') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D24 VALUES ('24') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D25 VALUES ('25') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D26 VALUES ('26') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D27 VALUES ('27') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D28 VALUES ('28') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D29 VALUES ('29') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D30 VALUES ('30') TABLESPACE TRANS_SEC_DATA_SPACE,
  SUBPARTITION D31 VALUES ('31') TABLESPACE TRANS_SEC_DATA_SPACE
)
(
  PARTITION M01 VALUES LESS THAN ('02') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M02 VALUES LESS THAN ('03') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M03 VALUES LESS THAN ('04') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M04 VALUES LESS THAN ('05') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M05 VALUES LESS THAN ('06') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M06 VALUES LESS THAN ('07') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M07 VALUES LESS THAN ('08') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M08 VALUES LESS THAN ('09') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M09 VALUES LESS THAN ('10') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M10 VALUES LESS THAN ('11') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M11 VALUES LESS THAN ('12') TABLESPACE TRANS_SEC_DATA_SPACE,
  PARTITION M12 VALUES LESS THAN ('13') TABLESPACE TRANS_SEC_DATA_SPACE
);
comment on table TX_SEC_TABLE
  is '���׹��̱�';
comment on column TX_SEC_TABLE.TX_SECTION_ID
  is '���׹���ID:����ID+3λ���̱�ţ�������ǰ��0��';
comment on column TX_SEC_TABLE.TX_ID
  is '����ID';
comment on column TX_SEC_TABLE.SECTION_NO
  is '���̱��:��1��ʼ����Ȼ��˳����';
comment on column TX_SEC_TABLE.TX_DATE
  is '��������';
comment on column TX_SEC_TABLE.TX_MONTH
  is '�·�';
comment on column TX_SEC_TABLE.TX_DAY
  is '��';
comment on column TX_SEC_TABLE.NOTE_COUNT
  is '��Ʊ����';
comment on column TX_SEC_TABLE.C_FSN_PATH
  is 'C�˱���FSN��·��';
comment on column TX_SEC_TABLE.S_FSN_PATH
  is '����˱���FSN��·��';
comment on column TX_SEC_TABLE.PARSE_SUCC_FLAG
  is 'FSN�ļ��Ƿ�����ɹ���F-δ�ɹ���T-�����ɹ�';
alter table TX_SEC_TABLE
  add constraint PK_TX_SEC primary key (TX_SECTION_ID)
  using index tablespace NTS_IDXSPACE;
CREATE INDEX INDEX_SEC_TXID ON TX_SEC_TABLE (TX_ID) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_SEC_DATE ON TX_SEC_TABLE (TX_DATE) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_SEC_MONTH_DAY ON TX_SEC_TABLE (TX_MONTH, TX_DAY) LOCAL
 TABLESPACE NTS_IDXSPACE;


--���׹��̳�Ʊ(���ֺ�)��ϸ��
create table TX_SEC_NSN_TABLE
(
  TX_SEC_NSN_ID		VARCHAR2(45) not null,
  NOTE_SN			VARCHAR2(20) not null,
  TX_ID				VARCHAR2(40) not null,
  TX_SECTION_ID		VARCHAR2(42) not null,
  ORG_NO            VARCHAR2(20) not null,
  SCAN_DATE		    VARCHAR2(10) not null,
  SCAN_TIME         VARCHAR2(8) not null,
  TX_MONTH	    	VARCHAR2(2) not null,
  TX_DAY	    	VARCHAR2(2) not null,
  TERMINAL_ACTION	INTEGER not null,
  IDENTIFY_FLAG		INTEGER default 0 not null,
  CUR_CODE			VARCHAR2(10),
  SUSPIC_FLAG		INTEGER,
  NOTE_STATUS		INTEGER,
  NOTE_VERSION		INTEGER,
  NOTE_VALUE		INTEGER,
  C_PIC_PATH		VARCHAR2(256),
  CHAR_NUM			INTEGER,
  MACHINE_S_NO		VARCHAR2(24),
  L_PIC_PATH		VARCHAR2(256),
  SAVE_IMG_FLAG		INTEGER default 2 not null,
  ERROR_CODE  		VARCHAR2(6),
  RESERVE1          INTEGER,
  MONEY_TYPE		INTEGER
)
PARTITION BY RANGE (TX_MONTH)
SUBPARTITION BY LIST (TX_DAY)
SUBPARTITION TEMPLATE(
  SUBPARTITION D01 VALUES ('01') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D02 VALUES ('02') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D03 VALUES ('03') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D04 VALUES ('04') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D05 VALUES ('05') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D06 VALUES ('06') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D07 VALUES ('07') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D08 VALUES ('08') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D09 VALUES ('09') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D10 VALUES ('10') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D11 VALUES ('11') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D12 VALUES ('12') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D13 VALUES ('13') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D14 VALUES ('14') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D15 VALUES ('15') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D16 VALUES ('16') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D17 VALUES ('17') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D18 VALUES ('18') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D19 VALUES ('19') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D20 VALUES ('20') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D21 VALUES ('21') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D22 VALUES ('22') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D23 VALUES ('23') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D24 VALUES ('24') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D25 VALUES ('25') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D26 VALUES ('26') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D27 VALUES ('27') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D28 VALUES ('28') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D29 VALUES ('29') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D30 VALUES ('30') TABLESPACE TRANS_NSN_DATA_SPACE,
  SUBPARTITION D31 VALUES ('31') TABLESPACE TRANS_NSN_DATA_SPACE
)
(
  PARTITION M01 VALUES LESS THAN ('02') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M02 VALUES LESS THAN ('03') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M03 VALUES LESS THAN ('04') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M04 VALUES LESS THAN ('05') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M05 VALUES LESS THAN ('06') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M06 VALUES LESS THAN ('07') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M07 VALUES LESS THAN ('08') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M08 VALUES LESS THAN ('09') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M09 VALUES LESS THAN ('10') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M10 VALUES LESS THAN ('11') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M11 VALUES LESS THAN ('12') TABLESPACE TRANS_NSN_DATA_SPACE,
  PARTITION M12 VALUES LESS THAN ('13') TABLESPACE TRANS_NSN_DATA_SPACE
);
comment on table TX_SEC_NSN_TABLE
  is '���׹��̳�Ʊ(���ֺ�)��ϸ��';
comment on column TX_SEC_NSN_TABLE.TX_SEC_NSN_ID
  is '���׹��̳�Ʊ(���ֺ�)ID�����׹���ID+3λ˳���(000~999)';
comment on column TX_SEC_NSN_TABLE.NOTE_SN
  is '���ֺ���';
comment on column TX_SEC_NSN_TABLE.TX_ID
  is '����ID';
comment on column TX_SEC_NSN_TABLE.TX_SECTION_ID
  is '���׹���ID';
comment on column TX_SEC_NSN_TABLE.ORG_NO
  is '�������';
comment on column TX_SEC_NSN_TABLE.SCAN_DATE
  is 'ɨ������';
comment on column TX_SEC_NSN_TABLE.SCAN_TIME
  is 'ɨ��ʱ��';
comment on column TX_SEC_NSN_TABLE.TX_MONTH
  is '�·�';
comment on column TX_SEC_NSN_TABLE.TX_DAY
  is '��';
comment on column TX_SEC_NSN_TABLE.TERMINAL_ACTION
  is '�ն˶���:1-����;2-�³�';
comment on column TX_SEC_NSN_TABLE.IDENTIFY_FLAG
  is '���ֺ���ʶ���ʶ:0-����ʶ��;1-��ʶ��';
comment on column TX_SEC_NSN_TABLE.CUR_CODE 
  is '���ױ���:USD-��Ԫ;EUR-ŷԪ;GBP-Ӣ��;CNY-�����;JPY-��Ԫ;AUD-��Ԫ;HKD-��Ԫ;TLG-������;CAD-��Ԫ;RUB-¬��;KRW-��Ԫ;UNK-δ֪,��ȡʧ��';
comment on column TX_SEC_NSN_TABLE.SUSPIC_FLAG
  is '���ɱ�־��0-����;1-������;2-�쳣����';
comment on column TX_SEC_NSN_TABLE.NOTE_STATUS
  is 'SP�Գ�Ʊ��ʶ����:0-�ٳ�����ɳ�;1-�泮;2-�б�(��ֻ�����);3-�ɱ�(��ֻ�����)';
comment on column TX_SEC_NSN_TABLE.NOTE_VERSION
  is '��Ʊ�汾';
comment on column TX_SEC_NSN_TABLE.NOTE_VALUE
  is '��Ʊ��ֵ';
comment on column TX_SEC_NSN_TABLE.C_PIC_PATH
  is 'C��ͼƬ����·��';
comment on column TX_SEC_NSN_TABLE.CHAR_NUM
  is '���ֺ��ַ���';
comment on column TX_SEC_NSN_TABLE.MACHINE_S_NO
  is '���߱�ţ���� ��BOC��/��˾��д/���ͱ��';
comment on column TX_SEC_NSN_TABLE.L_PIC_PATH
  is '�����ͼƬ����·��';
comment on column TX_SEC_NSN_TABLE.SAVE_IMG_FLAG
  is 'ͼƬ�洢��־��0-��ͼƬ��1-ͼƬ�ļ��洢 ��2-ͼƬ���ݿ�洢';
comment on column TX_SEC_NSN_TABLE.ERROR_CODE
  is '������';
comment on column TX_SEC_NSN_TABLE.RESERVE1
  is '������1';
comment on column TX_SEC_NSN_TABLE.MONEY_TYPE
  is '��Ʊ����';
alter table TX_SEC_NSN_TABLE
  add constraint PK_TX_SEC_NSN primary key (TX_SEC_NSN_ID)
  using index tablespace NTS_IDXSPACE;
CREATE INDEX INDEX_NSN_NOTESN ON TX_SEC_NSN_TABLE (NOTE_SN) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_NSN_TXSECTIONID ON TX_SEC_NSN_TABLE (TX_SECTION_ID) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_NSN_TXID ON TX_SEC_NSN_TABLE (TX_ID) LOCAL
 TABLESPACE NTS_IDXSPACE;  
CREATE INDEX INDEX_NSN_DATE ON TX_SEC_NSN_TABLE (SCAN_DATE) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_NSN_MONTH_DAY ON TX_SEC_NSN_TABLE (TX_MONTH, TX_DAY) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_NSN_ORGNO ON TX_SEC_NSN_TABLE (ORG_NO) LOCAL
 TABLESPACE NTS_IDXSPACE;


--FSN�ļ���Ϣ��
create table FSN_FILE_INFO
(
  DEV_NO			VARCHAR2(40) not null,
  FILE_DATE			VARCHAR2(10) not null,
  SERIAL_NUMBER		Integer not null,
  NSN_NUM			Integer not null,
  NOTE				VARCHAR2(50)
) tablespace NTS_SPACE;
comment on table FSN_FILE_INFO is 'FSN�ļ���Ϣ��';
comment on column FSN_FILE_INFO.DEV_NO is '�豸��';
comment on column FSN_FILE_INFO.FILE_DATE is '�ļ�����';
comment on column FSN_FILE_INFO.SERIAL_NUMBER is '��ǰ�ļ����';
comment on column FSN_FILE_INFO.NSN_NUM is '��ǰ�ļ��й��ֺ�����';
comment on column FSN_FILE_INFO.NOTE is '����';
alter table FSN_FILE_INFO
  add constraint PK_FSN_FILE_INFO primary key (DEV_NO, FILE_DATE)
  using index tablespace NTS_IDXSPACE;


--���׹��ֺ�ͼƬ��Ϣ��
CREATE TABLE TX_NSN_IMAGE (
  IMAGE_ID		VARCHAR2(45) NOT NULL,
  TX_ID			VARCHAR2(40) NOT NULL,
  TX_DATE		VARCHAR2(10) NOT NULL,
  TX_MONTH		VARCHAR2(2) NOT NULL,
  TX_DAY		VARCHAR2(2) NOT NULL,
  IMAGE_TYPE    INTEGER NOT NULL,
  IMAGE_INFO	BLOB
)
PARTITION BY RANGE (TX_MONTH)
SUBPARTITION BY LIST (TX_DAY)
SUBPARTITION TEMPLATE(
  SUBPARTITION D01 VALUES ('01') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D02 VALUES ('02') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D03 VALUES ('03') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D04 VALUES ('04') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D05 VALUES ('05') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D06 VALUES ('06') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D07 VALUES ('07') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D08 VALUES ('08') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D09 VALUES ('09') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D10 VALUES ('10') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D11 VALUES ('11') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D12 VALUES ('12') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D13 VALUES ('13') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D14 VALUES ('14') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D15 VALUES ('15') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D16 VALUES ('16') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D17 VALUES ('17') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D18 VALUES ('18') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D19 VALUES ('19') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D20 VALUES ('20') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D21 VALUES ('21') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D22 VALUES ('22') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D23 VALUES ('23') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D24 VALUES ('24') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D25 VALUES ('25') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D26 VALUES ('26') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D27 VALUES ('27') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D28 VALUES ('28') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D29 VALUES ('29') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D30 VALUES ('30') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  SUBPARTITION D31 VALUES ('31') TABLESPACE TRANS_IMAGE_DATA_SPACE
)
(
  PARTITION M01 VALUES LESS THAN ('02') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M02 VALUES LESS THAN ('03') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M03 VALUES LESS THAN ('04') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M04 VALUES LESS THAN ('05') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M05 VALUES LESS THAN ('06') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M06 VALUES LESS THAN ('07') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M07 VALUES LESS THAN ('08') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M08 VALUES LESS THAN ('09') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M09 VALUES LESS THAN ('10') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M10 VALUES LESS THAN ('11') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M11 VALUES LESS THAN ('12') TABLESPACE TRANS_IMAGE_DATA_SPACE,
  PARTITION M12 VALUES LESS THAN ('13') TABLESPACE TRANS_IMAGE_DATA_SPACE
);
alter table TX_NSN_IMAGE
  add constraint PK_TX_NSN_IMAGE primary key (IMAGE_ID)
  using index tablespace NTS_IDXSPACE;
comment on table TX_NSN_IMAGE is '���׹��ֺ�ͼƬ��Ϣ��';
comment on column TX_NSN_IMAGE.IMAGE_ID is 'ID(FK:TX_SEC_NSN_TABLE.TX_SEC_NSN_ID)';
comment on column TX_NSN_IMAGE.TX_ID is '����ID(FK:TX_TABLE.TX_ID)';
comment on column TX_NSN_IMAGE.TX_DATE is '��������:yyyy-MM-dd';
comment on column TX_NSN_IMAGE.TX_MONTH is '�����·�';
comment on column TX_NSN_IMAGE.TX_DAY is '������';
comment on column TX_NSN_IMAGE.IMAGE_TYPE is 'ͼƬ����:1-ԭͼ,2-����';
comment on column TX_NSN_IMAGE.IMAGE_INFO is 'ͼƬ��Ϣ';

CREATE INDEX INDEX_IMAGE_TXID ON TX_NSN_IMAGE (TX_ID) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_IMAGE_TXDATE ON TX_NSN_IMAGE (TX_DATE) LOCAL
 TABLESPACE NTS_IDXSPACE;
CREATE INDEX INDEX_IMAGE_MONTH_DAY ON TX_NSN_IMAGE (TX_MONTH, TX_DAY) LOCAL
 TABLESPACE NTS_IDXSPACE;


--���ֺŶ�ʱ����ִ�������
create table NTS_JOB
(
  JOB_NAME		VARCHAR2(100) NOT NULL,
  EXE_TIME		VARCHAR2(20) NOT NULL,
  END_TIME		VARCHAR2(20),
  STATUS		INTEGER NOT NULL,
  DESCRIPTION	VARCHAR2(256),
  NOTE			VARCHAR2(2048)
) tablespace NTS_SPACE;
comment on table NTS_JOB is '���ֺŶ�ʱ����ִ�������';
comment on column NTS_JOB.JOB_NAME is '��ʱ��������';
comment on column NTS_JOB.EXE_TIME is 'ִ��ʱ�䣺yyyy-MM-dd hh:mm:ss';
comment on column NTS_JOB.END_TIME is '����ʱ�䣺yyyy-MM-dd hh:mm:ss';
comment on column NTS_JOB.STATUS is 'ִ��״̬��0�������С�-1��ʧ�ܡ�1���ɹ�';
comment on column NTS_JOB.DESCRIPTION is '��ʱ��������';
comment on column NTS_JOB.NOTE is '��ע';
alter table NTS_JOB 
  add constraint PK_NTS_JOB primary key (JOB_NAME, EXE_TIME)
  using index tablespace NTS_IDXSPACE;


--����GZH�ļ�¼��
create table GZH_IMP_RECORD
(
  GZH_IMP_ID		VARCHAR2(30) NOT NULL,
  GRADE				INTEGER default 1 NOT NULL,
  IMP_RESULT		INTEGER default 0 NOT NULL,
  PAC_NUM			INTEGER NOT NULL,
  BALE_NUM			INTEGER NOT NULL,
  IMP_DATE			VARCHAR2(10) NOT NULL,
  IMP_TIME			VARCHAR2(8) NOT NULL,
  TEXT_PATH			VARCHAR2(100),
  NAME				VARCHAR2(50),
  NOTE				VARCHAR2(64)
)
tablespace NTS_SPACE;
comment on table GZH_IMP_RECORD
  is '����GZH�ļ�¼�� ';
comment on column GZH_IMP_RECORD.GZH_IMP_ID
  is '�ֹ������¼��ţ��������б���+��������(YYYYMMDD)+����ʱ��(hhmmss)';
comment on column GZH_IMP_RECORD.GRADE
  is 'ѹ��������1:һ��;2:����';
comment on column GZH_IMP_RECORD.IMP_RESULT
  is '������:0-	ʧ��;1-	������;2-	�ɹ�';
comment on column GZH_IMP_RECORD.PAC_NUM
  is '���� ';
comment on column GZH_IMP_RECORD.BALE_NUM
  is '����';
comment on column GZH_IMP_RECORD.IMP_DATE
  is '�������ڣ�YYYY-MM-DD';
comment on column GZH_IMP_RECORD.IMP_TIME
  is '����ʱ�䣺hh:mm:ss';
comment on column GZH_IMP_RECORD.TEXT_PATH
  is '�ļ�·��';
comment on column GZH_IMP_RECORD.NAME
  is 'GZH�ļ���';
comment on column GZH_IMP_RECORD.NOTE
  is '��ע';
alter table GZH_IMP_RECORD
  add constraint PK_GZH_IMP_RECORD primary key (GZH_IMP_ID)
  using index tablespace NTS_IDXSPACE;


 --����CRH�ļ�¼��--
create table CRH_IMP_RECORD
(
  CRH_IMP_ID		VARCHAR2(30) NOT NULL,
  OP_NO				VARCHAR2(20),
  IMP_RESULT		INTEGER default 0 NOT NULL,
  IMP_DATE			VARCHAR2(10) NOT NULL,
  IMP_TIME			VARCHAR2(8) NOT NULL,
  TEXT_PATH			VARCHAR2(100),
  NAME				VARCHAR2(50),
  NOTE				VARCHAR2(64)
)
tablespace NTS_SPACE;
comment on table CRH_IMP_RECORD
  is '����CRH�ļ�¼�� ';
comment on column CRH_IMP_RECORD.CRH_IMP_ID
  is '�ֹ������¼��ţ��������б���+��������(YYYYMMDD)+����ʱ��(hhmmss)';
comment on column CRH_IMP_RECORD.OP_NO
  is '������Ա';
comment on column CRH_IMP_RECORD.IMP_RESULT
  is '������:0-	ʧ��;1-	������;2-	�ɹ�';
comment on column CRH_IMP_RECORD.IMP_DATE
  is '�������ڣ�YYYY-MM-DD';
comment on column CRH_IMP_RECORD.IMP_TIME
  is '����ʱ�䣺hh:mm:ss';
comment on column CRH_IMP_RECORD.TEXT_PATH
  is '�ļ�·��';
comment on column CRH_IMP_RECORD.NAME
  is 'CRH�ļ���';
comment on column CRH_IMP_RECORD.NOTE
  is '��ע';
alter table CRH_IMP_RECORD
  add constraint PK_CRH_IMP_RECORD primary key (CRH_IMP_ID)
  using index tablespace NTS_IDXSPACE;


--����--

-- Create table
create table TELLER_BUSINESS_JOURNALA
(
  journal_id   VARCHAR2(30),
  opt_org      VARCHAR2(12),
  opt_date     VARCHAR2(8),
  opt_time     VARCHAR2(20),
  opt_user     VARCHAR2(20),
  auth_user    VARCHAR2(20),
  func         VARCHAR2(20),
  state        VARCHAR2(1),
  ret_code     VARCHAR2(30),
  ret_msg      VARCHAR2(200),
  auth_org     VARCHAR2(12),
  auth_flag    VARCHAR2(2),
  auth_cause   VARCHAR2(2000),
  auth_msg     VARCHAR2(100),
  req_id       VARCHAR2(50),
  terminal     VARCHAR2(20),
  appr_user    VARCHAR2(20),
  appr_org     VARCHAR2(12),
  work_date    VARCHAR2(8),
  channel      VARCHAR2(10),
  business_sys VARCHAR2(20),
  ref_no       VARCHAR2(30),
  reverse_flag VARCHAR2(1),
  ccy          VARCHAR2(3),
  amt          VARCHAR2(50),
  acct_no      VARCHAR2(100),
  new_seq_no   VARCHAR2(50)
)
tablespace ZHYGSPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TELLER_BUSINESS_JOURNALA
  is '���潻��ƽ̨��ˮ��';
-- Add comments to the columns 
comment on column TELLER_BUSINESS_JOURNALA.journal_id
  is '������־����';
comment on column TELLER_BUSINESS_JOURNALA.opt_org
  is '��������';
comment on column TELLER_BUSINESS_JOURNALA.opt_date
  is '��������';
comment on column TELLER_BUSINESS_JOURNALA.opt_time
  is '����ʱ��';
comment on column TELLER_BUSINESS_JOURNALA.opt_user
  is '������Ա���';
comment on column TELLER_BUSINESS_JOURNALA.auth_user
  is '��Ȩ��Ա���';
comment on column TELLER_BUSINESS_JOURNALA.func
  is '���״���';
comment on column TELLER_BUSINESS_JOURNALA.state
  is '������־';
comment on column TELLER_BUSINESS_JOURNALA.ret_code
  is '��Ӧ��';
comment on column TELLER_BUSINESS_JOURNALA.ret_msg
  is '��Ӧ��Ϣ';
comment on column TELLER_BUSINESS_JOURNALA.auth_org
  is '��Ȩ������';
comment on column TELLER_BUSINESS_JOURNALA.auth_flag
  is '��Ȩ��ʶ';
comment on column TELLER_BUSINESS_JOURNALA.auth_cause
  is '��Ȩԭ��';
comment on column TELLER_BUSINESS_JOURNALA.auth_msg
  is '��Ȩ��Ϣ';
comment on column TELLER_BUSINESS_JOURNALA.req_id
  is '����ID';
comment on column TELLER_BUSINESS_JOURNALA.terminal
  is '�ն���ˮ';
comment on column TELLER_BUSINESS_JOURNALA.work_date
  is '��������';
comment on column TELLER_BUSINESS_JOURNALA.channel
  is '��������';
comment on column TELLER_BUSINESS_JOURNALA.business_sys
  is 'ҵ��ϵͳ���';
comment on column TELLER_BUSINESS_JOURNALA.ref_no
  is '������ˮ��';
comment on column TELLER_BUSINESS_JOURNALA.reverse_flag
  is '������ʶ��1-δ������2-�ѳ���';
comment on column TELLER_BUSINESS_JOURNALA.ccy
  is '���ִ���';
comment on column TELLER_BUSINESS_JOURNALA.amt
  is '���׽��';
comment on column TELLER_BUSINESS_JOURNALA.acct_no
  is '�����˺�';
comment on column TELLER_BUSINESS_JOURNALA.new_seq_no
  is 'ǰ����ˮ��';


create table TELLER_TRANS_TYPE_MAPPING
(
  logic_id          VARCHAR2(36) not null,
  Trans_type_dev    VARCHAR2(20) not null,
  Trans_type_teller    VARCHAR2(20) not null,
   constraint PK_TELLER_TRANS_TYPE_MAPPING primary key (logic_id)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TELLER_TRANS_TYPE_MAPPING
  is '���潻������ӳ���';
comment on column TELLER_TRANS_TYPE_MAPPING.logic_id
  is '���';
comment on column TELLER_TRANS_TYPE_MAPPING.Trans_type_dev
  is '�豸�˽������ͼ��� ͬBIZTXLOG.TRANSTYPE';
comment on column TELLER_TRANS_TYPE_MAPPING.Trans_type_teller
  is '���潻�����ʹ��� ͬTELLER_BUSINESS_JOURNALA.FUNC';
  

create table TELLER_RPT_TRANS_ORG_DAY
(
  org_no         VARCHAR2(20) not null,
  date_time      VARCHAR2(10),
  trans_amount   NUMBER(20,2),
  trans_count    NUMBER(38),
  trans_year     VARCHAR2(4),
  trans_month    VARCHAR2(2),
  trans_day      VARCHAR2(2),
   constraint PK_TELLER_RPT_TRANS_ORG_DAY primary key (org_no, DATE_TIME)
         using index pctfree 10
   initrans 2
   storage
   (
       initial 128K
       next 1024K
       minextents 1
       maxextents unlimited
   )
   logging
   tablespace ZHYGIDX
)
pctfree 10
initrans 1
storage
(
    initial 256K
    next 1024K
    minextents 1
    maxextents unlimited
)
tablespace ZHYGSPACE
logging
 nocompress
 monitoring
 noparallel;

comment on table TELLER_RPT_TRANS_ORG_DAY
  is '����ͳ�Ʊ�������ÿ�죩';
comment on column TELLER_RPT_TRANS_ORG_DAY.date_time
  is '����ʱ��yyyyMMdd';
comment on column TELLER_RPT_TRANS_ORG_DAY.trans_amount
  is '���׽��';
comment on column TELLER_RPT_TRANS_ORG_DAY.trans_count
  is '��������';
comment on column TELLER_RPT_TRANS_ORG_DAY.trans_year
  is '�������';
comment on column TELLER_RPT_TRANS_ORG_DAY.trans_month
  is '�����·�';
comment on column TELLER_RPT_TRANS_ORG_DAY.trans_day
  is '������';
comment on column TELLER_RPT_TRANS_ORG_DAY.org_no
  is '������';
  

  