
create index IDX_RUNST_DEV on RUN_STATUS_TABLE (DEV_NO)
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

create index IDX_RUNST_TIME on RUN_STATUS_TABLE (DATE_TIME)
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
/* Index: ST_INDEX_DATE                                         */
/*==============================================================*/
create index ST_INDEX_DATE on SHORTEN_TABLE (
   LACK_DATE ASC
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
/* Index: ST_INDEX_DEVNO                                        */
/*==============================================================*/
create index ST_INDEX_DEVNO on SHORTEN_TABLE (
   DEV_NO ASC
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
/* Index: ST_INDEX_LACKTYPE                                     */
/*==============================================================*/
create index ST_INDEX_LACKTYPE on SHORTEN_TABLE (
   LACK_TYPE ASC
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
/* Index: CLEAR_INDEX_DEVNO                                     */
/*==============================================================*/
create index CLEAR_INDEX_DEVNO on CLEAR_TABLE (
   DEV_NO ASC
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
/* Index: CLEAR_INDEX_TIME                                      */
/*==============================================================*/
create index CLEAR_INDEX_TIME on CLEAR_TABLE (
   CLEAR_TIME ASC
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
/* Index: IDX_ADDCASHID                                         */
/*==============================================================*/
create index IDX_ADDCASHID on DEV_CASH_CLEAR (
   ADDCASH_ID DESC
)
pctfree 10
initrans 2
storage
(
    initial 128K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;

/*==============================================================*/
/* Index: IDX_DEVNO                                             */
/*==============================================================*/
create index IDX_DEVNO on DEV_CASH_CLEAR (
   DEV_NO ASC
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
/* INDEX: IDX_RUNST_DEVNO_DATEYMD                               */
/*==============================================================*/
create index IDX_RUNST_DEVNO_DATEYMD on RUN_STATUS_DEV_TABLE (DEV_NO, DATE_YMD)
  tablespace ZHYGIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    minextents 1
    maxextents unlimited
  );

commit;


/*==============================================================*/
/* Index: RCT_INDEX_DATE                                        */
/*==============================================================*/
create index RCT_INDEX_DATE on RETAIN_CARD_TABLE (
   RETAIN_DATE ASC
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
/* Index: RCT_INDEX_DEVNO                                       */
/*==============================================================*/
create index RCT_INDEX_DEVNO on RETAIN_CARD_TABLE (
   DEV_NO ASC
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
/* Index: RFDT_INDEX_DATE                                       */
/*==============================================================*/
create index RFDT_INDEX_DATE on RPT_FAULT_DEV_DATE (
   DATE_TIME ASC
)
pctfree 10
initrans 2
storage
(
    initial 2048K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;

/*==============================================================*/
/* Index: RFDT_INDEX_DEVNO                                      */
/*==============================================================*/
create index RFDT_INDEX_DEVNO on RPT_FAULT_DEV_DATE (
   DEV_NO ASC
)
pctfree 10
initrans 2
storage
(
    initial 768K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;


/*==============================================================*/
/* Index: RFMT_INDEX_DATE                                       */
/*==============================================================*/
create index RFMT_INDEX_DATE on RPT_FAULT_DEV_MONTH (
   DATE_TIME ASC
)
pctfree 10
initrans 2
storage
(
    initial 128K
    next 1024K
    minextents 1
    maxextents unlimited
    buffer_pool default
)
logging
tablespace ZHYGIDX;

/*==============================================================*/
/* Index: RFMT_INDEX_DEVNO                                      */
/*==============================================================*/
create index RFMT_INDEX_DEVNO on RPT_FAULT_DEV_MONTH (
   DEV_NO ASC
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
/* Index: RFYT_INDEX_DATE                                       */
/*==============================================================*/
create index RFYT_INDEX_DATE on RPT_FAULT_DEV_YEAR (
   DATE_TIME ASC
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
/* Index: RFYT_INDEX_DEVNO                                      */
/*==============================================================*/
create index RFYT_INDEX_DEVNO on RPT_FAULT_DEV_YEAR (
   DEV_NO ASC
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


create index IDX_RVCTASK_DEVNO on APPS_MODEL_SYNC_TASK (SYNCUNIT)
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

create index IDX_RVCTASK_TIME on APPS_MODEL_SYNC_TASK (TASKSTARTTIME)
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

create index IDX_APPSMODELVERSION_TIME on APPS_MODEL_VERSION_TABLE (UPDATE_TIME)
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