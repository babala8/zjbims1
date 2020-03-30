CREATE TABLESPACE ZHYGSPACE DATAFILE 
'F:/app/user/oradata/zhyg/ZHYGSPACE.dbf' 
SIZE 20M
AUTOEXTEND ON NEXT 10M 
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

CREATE TABLESPACE ZHYGIDX DATAFILE 
 'F:/app/user/oradata/zhyg/ZHYGIDX.dbf' 
SIZE 20M
AUTOEXTEND ON NEXT 10M 
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;

CREATE TABLESPACE NTS_SPACE DATAFILE 
  'F:/app/user/oradata/zhyg/nts_space.dbf' SIZE 10M AUTOEXTEND ON NEXT 5M MAXSIZE 4096M
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON;

--index tablespace
CREATE TABLESPACE NTS_IDXSPACE DATAFILE 
  'F:/app/user/oradata/zhyg/nts_idxspace_part1.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part2.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part3.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part4.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part5.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part6.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part7.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part8.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part9.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/nts_idxspace_part10.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON;

--transaction data tablespace
-- TX_TABLE
CREATE TABLESPACE TRANS_TX_DATA_SPACE DATAFILE 
  'F:/app/user/oradata/zhyg/TRANS_TX_DATA_SPACE_PART1.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M,
  'F:/app/user/oradata/zhyg/TRANS_TX_DATA_SPACE_PART2.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M,
  'F:/app/user/oradata/zhyg/TRANS_TX_DATA_SPACE_PART3.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M,
  'F:/app/user/oradata/zhyg/TRANS_TX_DATA_SPACE_PART4.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON;

-- TX_SEC_TABLE
CREATE TABLESPACE TRANS_SEC_DATA_SPACE DATAFILE 
  'F:/app/user/oradata/zhyg/TRANS_SEC_DATA_SPACE_PART1.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M,
  'F:/app/user/oradata/zhyg/TRANS_SEC_DATA_SPACE_PART2.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M,
  'F:/app/user/oradata/zhyg/TRANS_SEC_DATA_SPACE_PART3.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M,
  'F:/app/user/oradata/zhyg/TRANS_SEC_DATA_SPACE_PART4.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 2560M
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON;

-- TX_SEC_NSN_TABLE
CREATE TABLESPACE TRANS_NSN_DATA_SPACE DATAFILE 
  'F:/app/user/oradata/zhyg/TRANS_NSN_DATA_SPACE_PART1.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_NSN_DATA_SPACE_PART2.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_NSN_DATA_SPACE_PART3.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_NSN_DATA_SPACE_PART4.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_NSN_DATA_SPACE_PART5.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON;

-- TX_NSN_IMAGE
CREATE TABLESPACE TRANS_IMAGE_DATA_SPACE DATAFILE 
  'F:/app/user/oradata/zhyg/TRANS_IMAGE_DATA_SPACE_PART1.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_IMAGE_DATA_SPACE_PART2.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_IMAGE_DATA_SPACE_PART3.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_IMAGE_DATA_SPACE_PART4.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M,
  'F:/app/user/oradata/zhyg/TRANS_IMAGE_DATA_SPACE_PART5.dbf' SIZE 5M AUTOEXTEND ON NEXT 5M MAXSIZE 10240M
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON;
