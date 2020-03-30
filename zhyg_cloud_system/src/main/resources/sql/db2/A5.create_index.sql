
create index IDX_RUNST_DEV on RUN_STATUS_TABLE (
DEV_NO )
;

create index IDX_RUNST_TIME on RUN_STATUS_TABLE (DATE_TIME)
;

/*==============================================================*/
/* Index: ST_INDEX_DATE                                         */
/*==============================================================*/
create index ST_INDEX_DATE on SHORTEN_TABLE (
   LACK_DATE ASC
)
;

/*==============================================================*/
/* Index: ST_INDEX_DEVNO                                        */
/*==============================================================*/
create index ST_INDEX_DEVNO on SHORTEN_TABLE (
   DEV_NO ASC
)
;

/*==============================================================*/
/* Index: ST_INDEX_LACKTYPE                                     */
/*==============================================================*/
create index ST_INDEX_LACKTYPE on SHORTEN_TABLE (
   LACK_TYPE ASC
)
;



/*==============================================================*/
/* Index: CLEAR_INDEX_DEVNO                                     */
/*==============================================================*/
create index CLEAR_INDEX_DEVNO on CLEAR_TABLE (
   DEV_NO ASC
)
;

/*==============================================================*/
/* Index: CLEAR_INDEX_TIME                                      */
/*==============================================================*/
create index CLEAR_INDEX_TIME on CLEAR_TABLE (
   CLEAR_TIME ASC
)
;


/*==============================================================*/
/* Index: IDX_ADDCASHID                                         */
/*==============================================================*/
create index IDX_ADDCASHID on DEV_CASH_CLEAR (
   ADDCASH_ID DESC
)
;

/*==============================================================*/
/* Index: IDX_DEVNO                                             */
/*==============================================================*/
create index IDX_DEVNO on DEV_CASH_CLEAR (
   DEV_NO ASC
)
;

  
/*==============================================================*/
/* INDEX: IDX_RUNST_DEVNO_DATEYMD                               */
/*==============================================================*/
create index IDX_RUNST_DEVNO_DATEYMD on RUN_STATUS_DEV_TABLE (DEV_NO, DATE_YMD);
commit;


/*==============================================================*/
/* Index: RCT_INDEX_DATE                                        */
/*==============================================================*/
create index RCT_INDEX_DATE on RETAIN_CARD_TABLE (
   RETAIN_DATE ASC
)
;

/*==============================================================*/
/* Index: RCT_INDEX_DEVNO                                       */
/*==============================================================*/
create index RCT_INDEX_DEVNO on RETAIN_CARD_TABLE (
   DEV_NO ASC
)
;


/*==============================================================*/
/* Index: RFDT_INDEX_DATE                                       */
/*==============================================================*/
create index RFDT_INDEX_DATE on RPT_FAULT_DEV_DATE (
   DATE_TIME ASC
)
;

/*==============================================================*/
/* Index: RFDT_INDEX_DEVNO                                      */
/*==============================================================*/
create index RFDT_INDEX_DEVNO on RPT_FAULT_DEV_DATE (
   DEV_NO ASC
)
;


/*==============================================================*/
/* Index: RFMT_INDEX_DATE                                       */
/*==============================================================*/
create index RFMT_INDEX_DATE on RPT_FAULT_DEV_MONTH (
   DATE_TIME ASC
)
;

/*==============================================================*/
/* Index: RFMT_INDEX_DEVNO                                      */
/*==============================================================*/
create index RFMT_INDEX_DEVNO on RPT_FAULT_DEV_MONTH (
   DEV_NO ASC
)
;


/*==============================================================*/
/* Index: RFYT_INDEX_DATE                                       */
/*==============================================================*/
create index RFYT_INDEX_DATE on RPT_FAULT_DEV_YEAR (
   DATE_TIME ASC
)
;

/*==============================================================*/
/* Index: RFYT_INDEX_DEVNO                                      */
/*==============================================================*/
create index RFYT_INDEX_DEVNO on RPT_FAULT_DEV_YEAR (
   DEV_NO ASC
)
;


create index IDX_RVCTASK_DEVNO on APPS_MODEL_SYNC_TASK (SYNCUNIT)
;

create index IDX_RVCTASK_TIME on APPS_MODEL_SYNC_TASK (TASKSTARTTIME)
;

create index IDX_APPSMODELVERSION_TIME on APPS_MODEL_VERSION_TABLE (UPDATE_TIME);