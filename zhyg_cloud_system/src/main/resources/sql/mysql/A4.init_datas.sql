-- 系统用户表
INSERT INTO SYS_USER (NO, passwd, NAME, STATUS, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error) VALUES ('admin1', '3ac751c1478699664bcc11b5efc04fac', '超级管理员1', '1', '1', '10001', '0000', NULL, NULL, NULL, NULL, '2099-09-18 08:00:00', NULL, 0);
INSERT INTO SYS_USER (NO, passwd, NAME, STATUS, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error) VALUES ('admin2', '3ac751c1478699664bcc11b5efc04fac', '超级管理员2', '1', '1', '10001', '0000', NULL, NULL, NULL, NULL, '2099-09-18 08:00:00', NULL, 0);
COMMIT;

-- 卡类型表
INSERT INTO card_type_table (`NO`, card_type) VALUES('001', '借记卡');
INSERT INTO card_type_table (`NO`, card_type) VALUES('002', '信用卡');
INSERT INTO card_type_table (`NO`, card_type) VALUES('005', '存折');
INSERT INTO card_type_table (`NO`, card_type) VALUES('998', '他行卡');
COMMIT;

-- 业务分类表
INSERT INTO APPS_CATALOG_TABLE (LOGIC_ID, APPS_CATALOG) VALUES ('10001', '平台');
INSERT INTO APPS_CATALOG_TABLE (LOGIC_ID, APPS_CATALOG) VALUES ('10002', '个人业务');
INSERT INTO APPS_CATALOG_TABLE (LOGIC_ID, APPS_CATALOG) VALUES ('10003', '平台基础服务');
INSERT INTO APPS_CATALOG_TABLE (LOGIC_ID, APPS_CATALOG) VALUES ('10004', '对公业务');
COMMIT;
INSERT INTO apps_info_table (apps_id, apps_name, apps_type, apps_catalog, apps_status, logo_path, add_user, add_time, description) VALUES('ZJUAP', '全渠道统一平台', '1', '10001', '1', '', 'admin1', '2019-09-18 08:00:00', '全渠道统一平台');
INSERT INTO apps_version_table (logic_id, apps_id, version_bus_no, version_app_no, version_status, version_client_path, add_user, add_time, version_description, version_file_md5, version_seq_no, versionfilepath, VERSIONNOTIFYFLAG, TAKETIME) VALUES('0', 'ZJUAP', '001S', '1.0.0', '1', 'C:\\', 'admin1', '2019-09-18 08:00:00', '全渠道统一平台安装包', NULL, '001000000', NULL, '2', '');
commit;

-- CASE分类表
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 2, '营业预警', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 3, '资源预警', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 4, '资源耗尽', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 5, '清机通知', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 6, '营业故障', 1, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 7, '纸少', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 8, '纸空', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 9, '钞少', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 10, '钞空', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 11, '存款箱满', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 12, '一般硬件故障', 2, 30, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 13, '严重硬件故障', 2, 30, 60, 60, 300, 300, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 14, '钞箱故障', 3, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0);
INSERT INTO CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
VALUES ('0000', 15, '通讯故障', 1, 30, 60, 60, 120, 120, 7200, 1, 1, 1, 0);
COMMIT;

-- CASE升级表
INSERT INTO CASE_GRADE (grade, notify_way, notify_times, send_interval)VALUES (1, 1, 3, 30);
INSERT INTO CASE_GRADE (grade, notify_way, notify_times, send_interval)VALUES (2, 1, 1, 0);
INSERT INTO CASE_GRADE (grade, notify_way, notify_times, send_interval)VALUES (3, 1, 1, 0);
INSERT INTO CASE_GRADE (grade, notify_way, notify_times, send_interval)VALUES (4, 1, 1, 0);
INSERT INTO CASE_GRADE (grade, notify_way, notify_times, send_interval)VALUES (5, 2, 1, 0);
COMMIT;

-- 设备类型表
INSERT INTO DEV_CATALOG_TABLE (NO, NAME, enname, monitor_type,channel_type)VALUES ('ATM', 'ATM', '自动取款机', '1', '1');
INSERT INTO DEV_CATALOG_TABLE (NO, NAME, enname, monitor_type,channel_type)VALUES ('CDT', 'CDT', '发卡机', '2', '1');
INSERT INTO DEV_CATALOG_TABLE (NO, NAME, enname, monitor_type,channel_type)VALUES ('CRS', 'CRS', '自动存取款机', '1', '1');
COMMIT;

-- 设备品牌表
INSERT INTO DEV_VENDOR_TABLE (NO, NAME, address, hotline1, STATUS)VALUES ('10001', 'HITACHI', NULL, NULL, NULL);
INSERT INTO DEV_VENDOR_TABLE (NO, NAME, address, hotline1, STATUS)VALUES ('10002', 'NCR', NULL, NULL, NULL);
INSERT INTO DEV_VENDOR_TABLE (NO, NAME, address, hotline1, STATUS)VALUES ('10003', 'BST', NULL, NULL, NULL);
INSERT INTO DEV_VENDOR_TABLE (NO, NAME, address, hotline1, STATUS)VALUES ('10005', '广电运通', NULL, NULL, NULL);
INSERT INTO DEV_VENDOR_TABLE (NO, NAME, address, hotline1, STATUS)VALUES ('10006', '南天', NULL, NULL, NULL);
INSERT INTO DEV_VENDOR_TABLE (NO, NAME, address, hotline1, STATUS)VALUES ('10007', '长城', NULL, NULL, NULL);
COMMIT;

INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10001','HT-2845V','10001','CRS','','0','0','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10002','NCR-5884','10002','ATM','','0','0','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10003','NCR-5887','10002','ATM','','0','0','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10004','NCR-6625','10002','ATM','','0','0','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10005','NCR-6674','10002','ATM','','0','0','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10007','NCR-6622','10002','ATM','','0','0','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10016','BST--5200','10006','CDT','','','','2');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10012','HT-2845V-2','10001','CRS','','','','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10013','DT-7000H38N','10005','ATM','','','','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10015','HT-2845SR-2','10001','CRS','','','','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10017','BST-306B','10007','CDT','','','','2');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10011','NCR-6636','10002','CRS','','','','1');
INSERT INTO dev_type_table (`NO`, NAME, DEV_VENDOR, DEV_CATALOG, SPEC, WEIGHT, WATT, CASH_TYPE) VALUES('10014','HT-2845SR','10001','CRS','','','','1');
commit;

-- 设备维护商表
INSERT INTO DEV_SERVICE_COMPANY (NO, NAME, linkman, address, phone, mobile, fax, email)VALUES ('10001', '日立', '紫金', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- 设备维护员表
INSERT INTO DEV_SERVICE_PERSON (NO, NAME, belongto, STATUS, phone, mobile, email, leader)VALUES ('10001', '维护员1', '10001', '1', NULL, NULL, NULL, NULL);
INSERT INTO DEV_SERVICE_PERSON (NO, NAME, belongto, STATUS, phone, mobile, email, leader)VALUES ('10002', '维护员2', '10001', '1', NULL, NULL, NULL, NULL);
INSERT INTO DEV_SERVICE_PERSON (NO, NAME, belongto, STATUS, phone, mobile, email, leader)VALUES ('10003', '维护员3', '10001', '1', NULL, NULL, NULL, NULL);
COMMIT;


-- 故障代码表
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM61', 6, '安全门为打开状态', '关闭安全门');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM64', 0, '安全门为未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM65', 0, '不支持安全门', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM70', 0, '钞箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM71', 0, '至少一个钞箱空或钞少', '加钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM72', 6, '钞箱不能出钞', '检查钞箱情况');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM73', 0, '钞箱状态未知', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM80', 0, '暂存器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM81', 6, '暂存器有钞', '取出暂存器的钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM82', 0, '暂存器状态未知', '检查暂存器是否有异物');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM83', 0, '不支持暂存器', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM90', 6, '出钞门为打开状态', '关闭出钞门');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM91', 0, '出钞门为闭合状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM92', 6, '出钞门为被堵塞状态', '检查出钞门是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM93', 0, '出钞门为未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDM94', 0, '不支持出钞门', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMA0', 0, '传送带正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMA1', 6, '传送带异常', '检查传送带及通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMA2', 0, '传送带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMA3', 0, '不支持传送带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMB0', 0, '出钞口空', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMB1', 6, '出钞口非空', '清理出钞口');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMB2', 0, '出钞口状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMB3', 0, '不支持出钞口', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC0', 0, '钞箱状态正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC1', 5, '回收箱满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC2', 14, '回收箱不存在', '检查回收箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC3', 14, '回收箱不可操作', '检查回收箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC4', 10, '钞箱空', '加钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC5', 14, '钞箱不存在', '检查钞箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC6', 14, '钞箱不可操作', '检查钞箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC7', 9, '钞箱钞少', '加钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMF2', 0, '取款超时吞钞', '检查回收箱中的废钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM51', 14, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM52', 14, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM53', 14, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM54', 14, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM55', 14, '无设备', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM60', 0, '钞箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM61', 0, '有一个钞箱状态异常', '检查接触是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM62', 6, '所有钞箱都不可操作', '检查钞箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM63', 0, '存款钞箱状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM70', 0, '安全门为闭合状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM71', 6, '安全门为打开状态', '关闭安全门');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM72', 6, '安全门为异常状态', '关闭安全门');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM73', 0, '安全门为未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM74', 0, '不支持安全门', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM80', 0, '验钞暂存器空', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM81', 6, '验钞暂存器非空', '清理暂存器');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM82', 6, '验钞暂存器满', '清理暂存器');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM83', 0, '验钞暂存器状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM84', 0, '不支持验钞暂存器', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM90', 6, '入钞门为打开状态', '关闭入钞门');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM91', 0, '入钞门为闭合状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM92', 6, '入钞门为被堵塞状态', '清理入钞通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM93', 0, '入钞门为未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIM94', 0, '不支持入钞门', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMA0', 0, '传送带正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMA1', 6, '传送带异常', '检查传送带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMA2', 0, '传送带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMA3', 0, '不支持传送带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMB0', 0, '入钞口空', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMB1', 6, '入钞口非空', '清理入钞口');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMB2', 0, '入钞口状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMB3', 0, '不支持入钞口', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC0', 0, '钞箱状态正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC1', 5, '回收箱满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC2', 14, '回收箱不存在', '检查回收箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC3', 14, '回收箱不可操作', '检查回收箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC4', 11, '存款箱满', '清理存款箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC5', 14, '存款箱不存在', '检查存款箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMC6', 14, '存款箱不可操作', '检查存款箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMF1', 5, '存款回收次数超限', '检查存款箱是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CIMF2', 0, '存款超时吞钞', '检查回收箱中的废钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU53', 12, '硬件故障', '检查是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU54', 12, '使用错误', '检查是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('TTU55', 12, '无设备', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU53', 12, '硬件故障', '检查硬件是否正常');

INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU54', 12, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('SIU55', 12, '无此设备', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI54', 12, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('GUI55', 12, '无设备', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP54', 12, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP55', 12, '无此设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP60', 0, '传送带正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP61', 0, '无传送带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP62', 12, '传送带不可操作', '检查传送带是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP63', 12, '传送带状态异常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP64', 0, '传送带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP70', 0, '信封容器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP71', 6, '信封容器满', '清理信封容器');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP72', 6, '信封容器将满', '清理信封容器');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP73', 12, '信封容器不存在', '检查信封容器是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP74', 12, '信封容器不可操作', '检查信封容器是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP75', 0, '信封容器状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP76', 0, '不支持信封容器', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP80', 0, '信封供应正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP81', 3, '信封少', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP82', 4, '无信封', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP83', 12, '信封供应模块丢失', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP84', 12, '不可操作', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP85', 12, '已锁定', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP86', 0, '不支持模块', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP87', 0, '状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP90', 0, '信封分发器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP91', 8, '信封分发器不可操作', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP92', 0, '信封分发器状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEP93', 0, '不支持信封分发器', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPA0', 0, '打印机正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPA1', 8, '打印机不可操作', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPA2', 0, '打印机状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPA3', 0, '不支持打印机', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPB0', 0, '正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPB1', 3, '墨少', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPB2', 4, '墨尽', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPB3', 0, '墨状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPB4', 0, '不支持墨', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPC0', 0, '入钞门为关闭状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPC1', 6, '入钞门为打开状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPC2', 6, '入钞门为堵塞状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPC3', 0, '入钞门状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('DEPC4', 0, '不支持入钞门', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK54', 12, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK55', 12, '无设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK60', 6, '无凭条', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK61', 0, '有凭条', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK62', 6, '口有凭条', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK63', 6, '卡纸', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK64', 0, '未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK65', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK66', 0, '凭条复位已回收', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK70', 0, '纸满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK71', 7, '纸少', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK72', 8, '纸尽', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK73', 0, '纸状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK74', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK75', 6, '凭条堵塞', '清理打印机口');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK80', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK81', 0, '回收箱将满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK82', 6, '回收箱满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK83', 12, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK84', 0, '回收箱状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK90', 0, '色带满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK91', 3, '色带少', '添加色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK92', 4, '色带尽', '更换色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK93', 0, '不支持色带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBK94', 0, '色带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBKA0', 0, '墨水满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBKA1', 3, '墨水少', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBKA2', 4, '墨水尽', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBKA3', 0, '不支持墨水', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('PBKA4', 0, '墨水状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC9', 10, '钞箱空，有钞箱不可用', '检查钞箱或者加钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('CDMC8', 9, '钞箱钞少，有钞箱不可用', '检查钞箱或者加钞');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('ICC41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('ICC42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution)VALUES ('ICC43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC50', 0, '读卡器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC51', 13, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC52', 13, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC53', 13, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC54', 6, '使用错误', '检查是否有非法卡操作');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC55', 13, '无设备', '检查硬件联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC60', 0, '无卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC61', 6, '有卡', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC62', 6, '口有卡', '取走卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC63', 6, '卡被堵塞', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC64', 0, '未知状态', '检查模块是否离线');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC65', 0, '不支持Media', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC70', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC71', 6, '回收箱卡满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC72', 6, '回收箱卡将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ICC73', 13, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC50', 0, '读卡器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC51', 13, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC52', 13, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC53', 13, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC54', 6, '使用错误', '检查是否有非法卡操作');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC55', 13, '无设备', '检查硬件联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC60', 0, '无卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC61', 6, '有卡', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC62', 6, '口有卡', '取走卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC63', 6, '卡被堵塞', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC64', 0, '未知状态', '检查模块是否离线');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC65', 0, '不支持Media', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC70', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC71', 6, '回收箱卡满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC72', 6, '回收箱卡将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('ISC73', 13, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC50', 0, '读卡器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC51', 13, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC52', 13, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC53', 13, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC54', 6, '使用错误', '检查是否有非法卡操作');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC55', 13, '无设备', '检查硬件联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC60', 0, '无卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC61', 6, '有卡', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC62', 6, '口有卡', '取走卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC63', 6, '卡被堵塞', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC64', 0, '未知状态', '检查模块是否离线');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC65', 0, '不支持Media', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC70', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC71', 6, '回收箱卡满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC72', 6, '回收箱卡将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IRC73', 13, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI51', 13, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('FPI52', 13, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD50', 0, '正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD52', 12, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD54', 6, '使用错误', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD55', 12, '无设备', '检查联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD60', 0, '所有卡箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD61', 0, '至少有一个卡箱状态不正常', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD62', 12, '所有卡箱都不可操作', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD63', 12, '卡箱状态未知', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD70', 0, '传送带正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD71', 12, '传送带异常', '检查传送带状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD72', 0, '传送带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD73', 0, '不支持传送带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD80', 0, '发卡器中无卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD81', 0, '发卡器中有卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD82', 0, '发卡器口有卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD83', 6, '发卡器夹卡', '清理发卡器');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD84', 0, '未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD85', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD90', 0, '挡板处于打开状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD91', 0, '挡板处于闭合状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD92', 6, '挡板处于卡住状态', '检查挡板');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD93', 0, '挡板处于未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRD94', 0, '不支持挡板', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDA0', 0, '发卡箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDA1', 3, '发卡箱卡少', '加卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDA2', 4, '发卡箱为空', '加卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDA3', 6, '发卡箱不可用', '检查发卡箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDA4', 13, '发卡箱不存在', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDA5', 0, '发卡箱未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDB0', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDB1', 3, '回收箱卡将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDB2', 5, '回收箱卡满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDB3', 6, '回收箱不可用', '检查发卡箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDB4', 13, '回收箱不存在', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CRDB5', 0, '回收箱未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD50', 0, '正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD52', 12, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD54', 6, '使用错误', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD55', 12, '无设备', '检查联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD60', 0, '所有卡箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD61', 0, '至少有一个卡箱状态不正常', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD62', 12, '所有卡箱都不可操作', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD63', 12, '卡箱状态未知', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD70', 0, '传送带正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD71', 12, '传送带异常', '检查传送带状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD72', 0, '传送带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD73', 0, '不支持传送带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD80', 0, '发卡器中无卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD81', 0, '发卡器中有卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD82', 0, '发卡器口有卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD83', 6, '发卡器夹卡', '清理发卡器');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD84', 0, '未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD85', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD90', 0, '挡板处于打开状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD91', 0, '挡板处于闭合状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD92', 6, '挡板处于卡住状态', '检查挡板');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD93', 0, '挡板处于未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCD94', 0, '不支持挡板', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDA0', 0, '发卡箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDA1', 3, '发卡箱卡少', '加卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDA2', 4, '发卡箱为空', '加卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDA3', 6, '发卡箱不可用', '检查发卡箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDA4', 13, '发卡箱不存在', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDA5', 0, '发卡箱未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDB0', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDB1', 3, '回收箱卡将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDB2', 5, '回收箱卡满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDB3', 6, '回收箱不可用', '检查发卡箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDB4', 13, '回收箱不存在', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CCDB5', 0, '回收箱未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR50', 0, '正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR51', 12, '盖章模块未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR52', 12, '盖章模块未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR53', 12, '盖章模块硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR54', 6, '盖章模块使用错误', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR55', 12, '无此设备模块', '检查联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR60', 0, '盖章模块中无纸', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR61', 0, '盖章模块中有纸', '检查卡箱状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR62', 0, '盖章模块口有纸', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR63', 6, '盖章模块中纸Jammed', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR64', 0, '未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR65', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR70', 0, '纸满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR71', 7, '纸少', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR72', 8, '纸尽', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR73', 0, '纸状态未知', '检查打印纸是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR74', 0, '不支持该设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR75', 6, '纸Jammed', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR80', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR81', 6, '回收箱将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR82', 6, '回收箱满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR83', 0, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR84', 0, '回收箱状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR90', 0, '色带满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR91', 3, '色带少', '添加色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR92', 4, '色带尽', '更换色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR93', 0, '不支持色带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPR94', 0, '色带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPRA0', 0, '墨水满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPRA1', 3, '墨水少', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPRA2', 4, '墨水尽', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPRA3', 0, '不支持墨水', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('DPRA4', 0, '墨水状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR50', 0, '正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR51', 12, '二维码扫描仪模块未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR52', 12, '二维码扫描仪模块未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR53', 12, '二维码扫描仪模块硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR54', 6, '二维码扫描仪模块使用错误', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR55', 12, '无此设备模块', '检查联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR60', 0, '扫描仪启用', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR61', 0, '扫描仪禁用', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR62', 12, '扫描仪故障不启作用', '检查扫描仪状态状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('BCR63', 12, '扫描仪状态未知', '检查扫描仪状态状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR50', 0, '日志打印机设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR54', 6, '使用错误', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR55', 12, '无设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR60', 0, '无打印纸', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR61', 0, '有打印纸', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR62', 0, '口有打印纸', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR63', 6, '打印纸被堵塞', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR64', 0, '未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR65', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR70', 0, '纸满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR71', 7, '纸少', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR72', 8, '纸尽', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR73', 0, '纸状态未知', '检查打印纸是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR74', 0, '不支持该设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR75', 6, '纸被堵塞', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR80', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR81', 6, '回收箱将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR82', 6, '回收箱满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR83', 0, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR84', 0, '回收箱状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR90', 0, '色带满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR91', 3, '色带少', '添加色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR92', 4, '色带尽', '更换色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR93', 0, '不支持色带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPR94', 0, '色带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPRA0', 0, '墨水满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPRA1', 3, '墨水少', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPRA2', 4, '墨水尽', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPRA3', 0, '不支持墨水', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('SPRA4', 0, '墨水状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC50', 0, '读卡器正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC51', 13, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC52', 13, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC53', 13, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC54', 6, '使用错误', '检查是否有非法卡操作');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC55', 13, '无设备', '检查硬件联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC60', 0, '无卡', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC61', 6, '有卡', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC62', 6, '口有卡', '取走卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC63', 6, '卡被堵塞', '取出卡');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC64', 0, '未知状态', '检查模块是否离线');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC65', 0, '不支持Media', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC70', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC71', 6, '回收箱卡满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC72', 6, '回收箱卡将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('IDC73', 13, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN50', 0, '密码键盘设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN51', 13, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN52', 13, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN53', 13, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN54', 13, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('PIN55', 13, '无设备', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR50', 0, '凭条打印机正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR52', 12, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR54', 6, '使用错误', '检查是否卡纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR55', 12, '无设备', '检查联机是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR60', 0, '无凭条', '添加打印纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR61', 0, '有凭条', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR62', 0, '口有凭条', '清理出纸口和通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR63', 6, '凭条被堵塞', '清理凭条打印通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR64', 0, '未知状态', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR65', 0, '不支持设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR66', 0, '凭条复位已回收', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR70', 0, '纸满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR71', 7, '纸少', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR72', 8, '纸尽', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR73', 0, '打印机纸状态未知', '检查打印纸状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR74', 0, '不支持该设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR75', 6, '凭条被堵塞', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR80', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR81', 6, '回收箱将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR82', 6, '回收箱满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR83', 12, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR84', 0, '回收箱状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR90', 0, '色带满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR91', 3, '色带少', '添加色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR92', 4, '色带尽', '更换色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR93', 0, '不支持色带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPR94', 0, '色带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPRA0', 0, '墨水满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPRA1', 3, '墨水少', '加墨');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPRA2', 4, '墨水尽', '加墨');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPRA3', 0, '不支持墨水', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('RPRA4', 0, '墨水状态未知', '检查墨水状态');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR50', 0, '日志打印机设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR51', 12, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR52', 12, '未通电', '检查是否通电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR53', 12, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR54', 6, '使用错误', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR55', 12, '无设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR60', 0, '无打印纸', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR61', 0, '有打印纸', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR62', 0, '口有打印纸', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR63', 6, '打印纸被堵塞', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR64', 0, '未知状态', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR65', 0, '不支持', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR70', 0, '纸满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR71', 7, '纸少', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR72', 8, '纸尽', '加纸');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR73', 0, '纸状态未知', '检查打印纸是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR74', 0, '不支持该设备', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR75', 6, '纸被堵塞', '清理通道');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR80', 0, '回收箱正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR81', 6, '回收箱将满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR82', 6, '回收箱满', '清理回收箱');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR83', 0, '无回收箱', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR84', 0, '回收箱状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR90', 0, '色带满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR91', 3, '色带少', '添加色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR92', 4, '色带尽', '更换色带');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR93', 0, '不支持色带', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPR94', 0, '色带状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPRA0', 0, '墨水满', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPRA1', 3, '墨水少', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPRA2', 4, '墨水尽', '添加墨水');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPRA3', 0, '不支持墨水', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('JPRA4', 0, '墨水状态未知', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM41', 0, '系统事件硬件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM42', 0, '系统事件软件故障类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM43', 0, '系统事件状态变化类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM44', 0, '用户事件提醒类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM45', 0, '其它故障事件类型', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM50', 0, '设备正常', NULL);
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM51', 14, '未联机', '检查是否联机');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM52', 14, '未通电', '检查是否加电');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM53', 14, '硬件故障', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM54', 6, '使用错误', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM55', 14, '无设备', '检查硬件是否正常');
INSERT INTO FAULT_CODE (CODE, fault_level, description, solution) VALUES ('CDM60', 0, '安全门为闭合状态', NULL);
COMMIT;

-- 硬件模块信息表
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('CAM', '照相机');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('CDM', '取款');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('CHK', '支票读扫描');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('CIM', '存款');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('DEP', '信封');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('IDC', '读卡器');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('JPR', '日志打印机');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('PBK', '存折打印机');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('PIN', '密码键盘');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('RPR', '凭条打印机');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('SIU', '传感器');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('SPR', '结单打印');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('TTU', '文本终端单元');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('UPS', '不间断电源');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('NET', '网络通讯');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('DPR', '盖章模块');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('BCR', '二维码扫描仪模块');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('ICC', '插入式读卡器');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('ISC', '刷卡式读卡器');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('IRC', '二代证读卡器');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('FPI', '指纹扫描仪');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('CRD', '发卡器');
INSERT INTO MOD_CATALOG_TABLE (NO, NAME)VALUES ('CCD', '发卡器1');
COMMIT;

-- 角色职能表
INSERT INTO SYS_ROLE (NO, NAME, org_type, note)VALUES ('10001', '系统管理员', 'ZH', NULL);
COMMIT;

-- 菜单表
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('0', '紫金综合运管系统', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('A', '状态监控', NULL, '#00a8f3', NULL, NULL, 'zijin-icon-devMonitor', 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('A02', '设备监控', NULL, NULL, 'tile_devMonitor.png', '/monitor/devMonitor', NULL, 2);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('A06', '交易查询', NULL, NULL, 'tile_transSearch.png', '/monitor/transInfo', NULL, 6);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('A11', '发卡机监控', NULL, NULL, 'tile_crdMonitor.png', '/monitor/crdMonitor', NULL, 11);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('B', '远程控制', NULL, '#ffb11a', NULL, NULL, 'zijin-icon-devManage', 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('B01', '设备控制', NULL, NULL, 'tile_devControl.png', '/remote/devControl', NULL, 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('B02', '控制结果', NULL, NULL, 'tile_controlResult.png', '/remote/controlResult', NULL, 2);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('B03', '功能定义', NULL, NULL, 'tile_devControl.png', '/remote/atmFunction', NULL, 3);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('B04', '交易类型管理', NULL, NULL, 'tile_devControl.png', '/remote/atmFunctionDef', NULL, 4);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('C', '版本管理', NULL, '#ff7f27', NULL, NULL, 'zijin-icon-checklist', 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('C01', '应用管理', NULL, NULL, 'tile_appstore.png', '/version/appstore', NULL, 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('C02', '标杆管理', NULL, NULL, 'tile_benchmark.png', '/version/benchmark', NULL, 2);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('C04', '版本结果查询', NULL, NULL, 'tile_vision_result.png', '/version/appResult', NULL, 4);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('D', '广告管理', NULL, '#78c446', NULL, NULL, 'zijin-icon-icon_theme_setting', 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('D01', '资源管理', NULL, NULL, 'tile_resource.png', '/content/resourceManage', NULL, 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('D02', '广告位管理', NULL, NULL, 'tile_advSpace.png', '/content/advertisementSpace', NULL, 2);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('D03', '广告制作', NULL, NULL, 'tile_advMake.png', '/content/advMake', NULL, 3);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('D04', '广告投放', NULL, NULL, 'tile_advRemote.png', '/content/advValid', NULL, 4);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('D05', '广告投放情况', NULL, NULL, 'tile_advRemote_info.png', '/content/advValidResult', NULL, 5);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E', '报表统计', NULL, '#f2a000', NULL, NULL, 'zijin-icon-chart22', 1);
-- INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E01', '多维分析', NULL, NULL, 'tile_reportAnalysis.png', '/report/reportAnalysis', NULL, 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E02', '基础报表', NULL, NULL, 'tile_basic_statements.png', '/report/baseReport', NULL, 2);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E03', '统计报表', NULL, NULL, 'tile_statistical_reports.png', '/report/statisticReport', NULL, 3);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E04', '交易报表', NULL, NULL, 'Equipment-information.png', '/report/transReport', NULL, 4);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E05', '考核报表', NULL, NULL, 'Equipment-information.png', '/report/assessReport', NULL, 5);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('E06', '定制报表', NULL, NULL, 'Equipment-information.png', '/report/customReport', NULL, 6);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F', '参数配置', NULL, '#5ed8a9', NULL, NULL, 'zijin-icon-options', 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F01', '机构管理', NULL, NULL, 'tile_userOrg.png', '/system/org', NULL, 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F02', '用户管理', NULL, NULL, 'tile_userInfo.png', '/system/user', NULL, 2);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F03', '角色管理', NULL, NULL, 'tile_rolePrivilege.png', '/system/role', NULL, 3);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F04', '设备管理', NULL, NULL, 'tile_device_management.png', '/system/dev', NULL, 4);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F05', '设备责任人管理', NULL, NULL, 'tile_device_people_manage.png', '/system/devResponsible', NULL, 5);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F06', '故障响应设定', NULL, NULL, 'tile_dev_response.png', '/system/sysParam', NULL, 6);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F07', '网点人员管理', NULL, NULL, 'tile_Network_management.png', '/system/bank', NULL, 7);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F08', '维护商管理', NULL, NULL, 'tile_factoryMaintain.png', '/system/factory', NULL, 8);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F09', '维护员管理', NULL, NULL, 'tile_devMaintain.png', '/system/devServiceManager', NULL, 9);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F10', '设备品牌管理', NULL, NULL, 'tile_vendor.png', '/system/vendor', NULL, 10);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F11', '设备型号管理', NULL, NULL, 'tile_devtype.png', '/system/type', NULL, 11);
-- INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F12', '设备类型管理', NULL, NULL, 'tile_devcatalog.png', '/system/catalog', NULL, 12);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F13', '日志查询', NULL, NULL, 'tile_log.png', '/system/log', NULL, 13);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F14', '工作时间设定', NULL, NULL, 'tile_worktime.png', '/system/devWorkTime', NULL, 14);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F15', '用户密码', NULL, NULL, 'tile_passwd.png', '/system/password', NULL, 15);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F16', '设备模块', NULL, NULL, 'tile_modCatalog.png', '/system/modCatalog', NULL, 16);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F17', '信息通知模板', NULL, NULL, 'tile_notifyModel.png', '/system/notifyModel', NULL, 17);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F18', '公告管理', NULL, NULL, 'tile_bulletin.png', '/system/bulletin', NULL, 18);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F19', '设备停机管理', NULL, NULL, 'tile_devStop.png', '/system/devStop', NULL, 19);
-- INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F20', '机构工作时段', NULL, NULL, 'tile_worktime_range.png', '/system/orgWorkTime', NULL, 20);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F22', '卡表管理', NULL, NULL, 'tile_cardInfo.png', '/system/cardInfo', NULL, 22);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('F23', '参数管理', NULL, NULL, 'tile_globalCfg.png', '/system/globalCfg', NULL, 23);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('G', '日常维护', NULL, '#22b9e8', NULL, NULL, 'zijin-icon-Development-mode', 1);
INSERT INTO sys_menu (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('G01', 'CASE综合查询', NULL, NULL, 'title_fault_query.png', '/maintain/faultQuery', NULL, 1);
INSERT INTO SYS_MENU (`NO`, NAME, NOTE, BG_COLOR, TILE_IMAGE, LINK, ICON, MENU_ORDER) VALUES('G07', '停机明细查询', NULL, NULL, 'tile_devStop.png', '/system/devStopDetail', NULL, '07');
commit;
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F01');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F02');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F03');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F04');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F05');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F06');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F07');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F08');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F09');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F10');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F11');
-- INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F12');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F13');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F14');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F15');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F16');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F17');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F18');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F19');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F22');
INSERT INTO sys_role_menu (role_no, menu_no) VALUES('10001', 'F23');
commit;

-- 按钮表
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('1', '增加', 'F01', '机构', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('2', '修改', 'F01', '机构', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('3', '删除', 'F01', '机构', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('4', '审核', 'F01', '机构', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('5', '增加', 'F03', '角色', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('6', '修改', 'F03', '角色', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('7', '删除', 'F03', '角色', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('8', '审核', 'F03', '角色', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('9', '增加', 'F02', '用户', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('10', '修改', 'F02', '用户', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('11', '删除', 'F02', '用户', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('12', '重置密码', 'F02', '用户', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('13', '解锁', 'F02', '用户', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('14', '审核', 'F02', '用户', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('15', '增加', 'F04', '设备', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('16', '修改', 'F04', '设备', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('17', '删除', 'F04', '设备', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('18', '审核', 'F04', '设备', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('19', '增加', 'C01', '应用', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('20', '修改', 'C01', '应用', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('21', '删除', 'C01', '应用', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('22', '增加', 'C02', '标杆', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('23', '修改', 'C02', '标杆', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('24', '删除', 'C02', '标杆', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('25', '部署', 'C02', '标杆', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('26', '分配', 'C02', '标杆', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('27', '禁用', 'C01', '禁用', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('28', '删除文件', 'B01', '远程浏览删除文件', NULL, NULL, 'N');
INSERT INTO SYS_BUTTON (NO, NAME, menu, note, button_order, url, AUDIT_FLAG)VALUES ('29', '执行文件', 'B01', '远程浏览执行文件', NULL, NULL, 'N');

-- 机构类型表
INSERT INTO SYS_ORG_TYPE (NO, TYPE, grade)VALUES ('ZH', '总行', '1');
INSERT INTO SYS_ORG_TYPE (NO, TYPE, grade)VALUES ('FH', '分行', '2');
INSERT INTO SYS_ORG_TYPE (NO, TYPE, grade)VALUES ('ZHH', '支行', '3');
COMMIT;

-- 机构表
INSERT INTO sys_org (`NO`, NAME, parent_org, left_no, right_no, org_type, moneyorg_flag, X, Y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code, area_no_province, area_no_city, area_no_county, area_type, org_physics_catalog, note, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS) VALUES('0000', '台州银行', '', 1, 808, 'ZH', NULL, NULL, NULL, '台州市路桥区南官大道92号', NULL, NULL, NULL, NULL, NULL, 'dept', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tzb', NULL, NULL, NULL, NULL);
COMMIT;

-- 角色按钮权限表
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '1');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '2');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '3');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '4');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '5');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '6');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '7');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '8');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '9');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '10');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '11');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '12');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '13');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '14');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '15');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '16');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '17');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '18');
COMMIT;


-- 本地错误码对照表
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-EF', '在存款过程中，客户放钞后由于SP原因返回无钞的状态时，应用将钞币正常存储后需要记录可疑交易', '存款，SP返回无钞，钞币正常存储。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('00', '交易成功', '交易成功', '1');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('01', '交易失败，请联系发卡行', '交易失败，请联系发卡行', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('02', '特定条件下查询发卡方', '特定条件下查询发卡方', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('03', '无效商户', '无效商户', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('04', '没收卡', '没收卡', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('05', '不予承兑', '不予承兑', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('06', '出错', '出错', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('07', '特殊条件下没收卡', '特殊条件下没收卡', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('09', '请求正在处理中', '请求正在处理中', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('10', '部分金额批准', '部分金额批准', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('11', '重要人物批准（VIP）', '重要人物批准（VIP）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('12', '无效交易', '无效交易', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('13', '无效金额', '无效金额', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('14', '无效卡号', '无效卡号', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('15', '无此发卡行', '无此发卡行', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('16', '批准更新第三磁道', '批准更新第三磁道', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('20', '无效应答', '无效应答', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('21', '不作任何处理', '不作任何处理', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('22', '怀疑操作有误', '怀疑操作有误', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('23', '不可接受的交易费', '不可接受的交易费', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('25', '未能找到文件上记录', '未能找到文件上记录', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('30', '格式错误', '格式错误', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('31', '交换中心不支持的银行', '交换中心不支持的银行', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('33', '过期卡（没收卡）', '过期卡（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('34', '有作弊嫌疑（没收卡）', '有作弊嫌疑（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('35', '受卡方与安全保密部门联系（没收卡）', '受卡方与安全保密部门联系（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('36', '受限制的卡（没收卡）', '受限制的卡（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('37', '受卡方呼受理方安全保密部门（没收卡）', '受卡方呼受理方安全保密部门（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('38', '超过允许的个人识别号输入次数', '超过允许的个人识别号输入次数', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('39', '无此信用卡账户', '无此信用卡账户', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('40', '请求的功能尚不支持', '请求的功能尚不支持', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('41', '挂失卡（没收卡）', '挂失卡（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('42', '无此账户', '无此账户', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('43', '被窃卡（没收卡）', '被窃卡（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('44', '无此投资账户', '无此投资账户', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('51', '无足够的存款', '无足够的存款', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('52', '无此支票帐号', '无此支票帐号', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('53', '无此储蓄卡帐号', '无此储蓄卡帐号', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('54', '过期的卡', '过期的卡', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('55', '不正确的PIN', '不正确的PIN', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('56', '无此卡记录', '无此卡记录', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('57', '不允许持卡人进行的交易', '不允许持卡人进行的交易', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('58', '不允许终端处理的交易', '不允许终端处理的交易', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('59', '有作弊嫌疑', '有作弊嫌疑', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('60', '受卡方与安全保密部门联系', '受卡方与安全保密部门联系', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('61', '本日提款金额超限', '本日提款金额超限', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('62', '受限制的卡', '受限制的卡', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('63', '违反安全保密规定', '违反安全保密规定', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('64', '原始金额不正确', '原始金额不正确', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('65', '超出取款次数限制', '超出取款次数限制', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('66', '受卡方呼受理方安全保密部门', '受卡方呼受理方安全保密部门', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('67', '捕捉（没收卡）', '捕捉（没收卡）', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('68', '收到的回答太迟', '收到的回答太迟', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('75', '允许的输入PIN次数超限', '允许的输入PIN次数超限', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('79', 'ATM服务器和ATM对帐总数不符，要求传送交易明细。', 'ATM服务器和ATM对帐总数不符，要求传送交易明细。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('90', '日期切换正在处理', '日期切换正在处理', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('91', '发卡方或交换中心不能操作', '发卡方或交换中心不能操作', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('92', '金融机构或中间网络设施找不到或无法达到', '金融机构或中间网络设施找不到或无法达到', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('93', '交易违法、不能完成', '交易违法、不能完成', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('94', '重复交易', '重复交易', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('95', '调节控制错', '调节控制错', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('96', '系统异常、失效', '系统异常、失效', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('97', 'ATM/POS终端号找不到', 'ATM/POS终端号找不到', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('98', '交换中心收不到发卡方应答', '交换中心收不到发卡方应答', '3');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('99', 'PIN格式错', 'PIN格式错', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A0', 'MAC鉴别失败', 'MAC鉴别失败', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A1', '转帐货币不一致', '转帐货币不一致', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A2', '有缺陷的成功', '有缺陷的成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A3', '转入行无此帐户', '转入行无此帐户', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A4', '有缺陷的成功', '有缺陷的成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A5', '有缺陷的成功', '有缺陷的成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A6', '有缺陷的成功', '有缺陷的成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('A7', '安全处理失败', '安全处理失败', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('B1', '费用未缴或无欠费', '费用未缴或无欠费', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('C1', '受理方状态非法', '受理方状态非法', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D1', '机构状态错误', '机构状态错误', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D2', '日期错误', '日期错误', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D3', '无效的文件类型', '无效的文件类型', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D4', '已经处理过的文件', '已经处理过的文件', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D5', '无此文件', '无此文件', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D6', '接收者不支持', '接收者不支持', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D7', '文件锁定', '文件锁定', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D8', '为成功', '为成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('D9', '文件长度不符', '文件长度不符', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('DA', '文件解压缩错', '文件解压缩错', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('DB', '文件名称错', '文件名称错', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('DC', '无法接收文件', '无法接收文件', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('N1', '未登折帐目已超限，交易不成功', '未登折帐目已超限，交易不成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('Q1', '卡片认证失败', '卡片认证失败', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('Y1', '脱机交易成功', '脱机交易成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('Y3', '不能联机，脱机交易成功', '不能联机，脱机交易成功', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('Z1', '脱机交易失败', '脱机交易失败', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('Z3', '不能联机，脱机交易失败', '不能联机，脱机交易失败', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('ZZ', '需要重新写磁', '需要重新写磁', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-AT', '存款、取款、转账等交易通讯超时[交易报文发送成功，没有收到报主机返回报文] ，需要和主机核对帐务。', '交易发送成功，主机无返回。', '3');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-TF', '存款、取款、转账交易通讯故障[交易报文发送失败，和主机连接不上]。', '交易发送失败，通讯故障。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-AE', '存款、取款、转账等交易主机授权报文解析出错[报文信息不足、报文类型不存在、MAC码不正确、授权码不存在、关键域：流水号、设备号、交易代码、币种、金额不匹配]，需要和主机核对帐务。', '主机报文出错。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-DF', '取款时主机授权成功后，配钞或挖钞失败，但钞票未出设备[允许发送冲正交易]，需要和主机核对帐务。', '主机成功，挖钞失败。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-PF', '取款时送钞失败；取款时出钞成功，客户遗忘，纸币回收失败；取款超时遗忘回收时卡钞[不允许发送冲正交易]；属长款。', '出钞成功，客户遗忘回收卡钞。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-RT', '存款退钞正常，客户遗忘，回收正常；存款取消后，退钞正常，客户遗忘，回收正常；存款时退出拒钞，退钞正常，客户遗忘，回收正常；属长款。', '存款退钞，客户遗忘回收成功。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-VF', '存款验钞时卡钞，属长款。', '存款验钞卡钞。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-JF', '存款验钞成功，存款取消后退钞时卡钞；存款验钞成功，存款取消后，客户遗忘回收卡钞；存款交易通讯故障，退钞卡钞；存款时退出拒钞，退钞卡钞；属长款。', '存款退钞卡钞。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-RE', '存取款交易故障后，进行手工或机器自动复位[含机器重启自动]，正常回收纸币。这个错误代码是记录故障交易后机器复位回收钞票，一般不能单独出现。回收成功打印回收明细、钞箱张数 回收失败后只打印钞箱张数', '机器复位回收成功。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-JT', '读卡器故障夹卡；交易故障后夹卡，设备复位回收卡。', '读卡器卡口有卡。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-CT', '退卡后客户取卡遗忘，机器超时回收吞卡。', '客户遗忘，卡回收。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-SF', '存款主机记帐授权成功，钞票进入钞箱时卡钞。存款交易成功，钞票入钞箱时故障，该故障客户页面提示和凭条打印是按正常的交易处理的，不影响帐务问题。', '存款主机记账成功，机器卡钞。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-SC', '客户超时操作交易取消；客户选择取消交易；', '客户超时，交易取消。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-HF', '存款交易通讯超时，收钞时卡钞；存款交易报文解析错，收钞时卡钞；存款交易主机拒绝，收钞时卡钞；需要和主机核对帐务。', '存款收钞卡钞。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-EI', '密码输入无效，交易取消；金额输入无效，交易取消；帐号输入无效，交易取消；[一般应用的页面输入三次输入无效，交易取消，退卡]', '密码、金额、帐号输入次数过多，交易取消。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-P1', '密码输入错误，重新输入', '密码输入错误，重新输入。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-A1', '金额输入错误，重新输入', '金额输入错误，重新输入。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-T1', '帐号输入错误，重新输入', '帐号输入错误，重新输入。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-P2', '两次输入转入密码不一致，重新输入', '两次输入转入密码不一致，重新输入。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-A2', '两次输入转入金额不一致，重新输入', '两次输入转入金额不一致，重新输入。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-T2', '两次输入转入帐号不一致，重新输入', '两次输入转入帐号不一致，重新输入。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('OK', '交易成功。', '交易成功。', '1');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-DE', '取款出钞金额和设备出钞张数不符', '取款出钞金额和设备出钞张数不符。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-HT', '存款主机指示吞钞', '存款主机指示吞钞。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-PO', '机器异常重启后，在启动时打印错误码，便于无纸化统计可疑交易', '机器异常重启，启动时打印错误码。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-CO', '取款冲正交易超时', '取款冲正交易超时。', '3');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-CF', '取款冲正交易失败', '取款冲正交易失败。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-W1', '在出钞前的是否退卡页面操作超时[回收钞币，发起冲正交易，取消该笔取款交易]', '出钞前是否退卡页面操作超时。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-W2', '在出钞前选择先退卡，读卡器故障，退卡失败[回收钞币，发起冲正交易，取消该笔取款交易]', '出钞前选择退卡，退卡失败。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-W3', '在出钞前选择先退卡，退卡成功，客户取卡超时，卡被回收[回收钞币，发起冲正交易，取消该笔取款交易]', '出钞前选择退卡，退卡成功，卡超时回收。', '2');
INSERT INTO TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
VALUES ('LOC-PT', '取款时出钞成功，客户遗忘，纸币回收正常，属长款。', '出钞成功，客户遗忘回收成功。', '2');
COMMIT;

-- 交易类型表
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('CFR', '信用卡转账', '信用卡转账', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('COA', '自助开卡', '自助开卡', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('CPR', '信用卡还款', '信用卡还款', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('CSN', '综合签约', '综合签约（含单独转账签约）', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('DQN', '明细查询', '明细查询', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('DRG', '大额存单认购', '大额存单认购', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('DUR', '大额存单赎回', '大额存单赎回', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('DZH', '定转活', '定转活', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('EOA', '开电子账户', '开电子账户', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('HZD', '活转定', '活转定', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('JNQ', '金算子查询', '金算子查询', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('JSQ', '金算子签约', '金算子签约', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('JUS', '金算子解约', '金算子解约', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('MRG', '理财认购', '理财认购', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('MUR', '理财撤单', '理财撤单', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('NFR', '无卡转账', '无卡转账', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('PIM', '客户信息修改', '客户信息修改', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('PJF', '交警罚没', '交警罚没', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('TFR', '转账汇款', '转账汇款', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('ZNQ', '智多薪查询', '智多薪查询', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('ZSQ', '智多薪签约', '智多薪签约', 0, 0, 0, NULL);
INSERT INTO trans_type (`NO`, NAME, note, accounts_check_flag, cashflag, trans_value, category) VALUES('ZUQ', '智多薪解约', '智多薪解约', 0, 0, 0, NULL);

COMMIT;

-- 锁占用表
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('DEVPARAMSET_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('MINUTES_TASK_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('HOUR_TASK_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('DAY_TASK_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('MONTH_TASK_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('YEAR_TASK_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('ADSCANCELNOTIFYJOB_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('ADSINFOSYNCJOB_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('ADSMODELSYNCJOB_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('APPSMODELSYNCJOB_ACCESS', '0', NULL, NULL);
INSERT INTO DB_LOCKS (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('APPSVERSIONSYNCJOB_ACCESS', '0', NULL, NULL);

COMMIT;

-- 操作表
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.BankManagerController','add','网点人员管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.BankManagerController','del','网点人员管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.BankManagerController','mod','网点人员管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController','add','公告管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController','del','公告管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController','mod','公告管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.CaseCatalogController','mod','故障响应设定','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController','add','厂商维护商管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController','del','厂商维护商管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController','mod','厂商维护商管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevBaseController','add','设备管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevBaseController','del','设备管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevBaseController','mod','设备管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController','add','设备类型管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController','del','设备类型管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController','mod','设备类型管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController','add','设备维护商管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController','del','设备维护商管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController','mod','设备维护商管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevStopController','add','设备停机管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevStopController','mod','设备停机管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevTypeController','add','设备型号管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevTypeController','del','设备型号管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevTypeController','mod','设备型号管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevVendorController','add','设备品牌管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevVendorController','del','设备品牌管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.DevVendorController','mod','设备品牌管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.LoginController','login','用户登录','登录');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.OrgController','add','机构管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.OrgController','del','机构管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.OrgController','mod','机构管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.RoleController','add','角色管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.RoleController','del','角色管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.RoleController','mod','角色管理','修改');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.UserController','add','用户管理','添加');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.UserController','del','用户管理','删除');
INSERT INTO sys_operate (menu_no,btn_no,menu_name,btn_name) VALUES ('com.zjft.zhyg.system.controller.UserController','mod','用户管理','修改');
COMMIT;

-- 银行特色服务配置项
INSERT INTO service_prop_bankinterface (key_id, VALUE) VALUES ('doorOpenNotify', 'true');
INSERT INTO service_prop_business (key_id, VALUE) VALUES ('doorOpenNotify', 'true');
COMMIT;
-- 内容管理服务配置项
INSERT INTO service_prop_content (key_id, VALUE) VALUES ('adsResourceFilePath', '/app/zjbims_file/content/resource');
INSERT INTO service_prop_content (key_id, VALUE) VALUES ('adsFilePath', '/app/zjbims_file/content/version');
INSERT INTO service_prop_content (key_id, VALUE) VALUES ('versionFilePath', '/app/zjbims_file/content/version');
INSERT INTO service_prop_content (key_id, VALUE) VALUES ('logoFilePath', '/app/zjbims_file/content/logo');
COMMIT;

-- 远程控制服务配置
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('remotePort', '50006');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('remoteFilePort', '50053');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('remoteFilePath', '/app/zjbims_file/control/controlResult');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('remoteViewFilePath', '/app/zjbims_file/control/remoteView');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('msgEncrypt', '0');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('defaultAtmLogPath', 'C:/WSAP/DATA/{log_date}.J');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('wsntAtmLogPath', 'C:/WSAPNT/PUBLIC/data/{log_date}.J');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('zjuapAtmLogPath', 'C:/ZJUAPClient/PUBLIC/data/{log_date}.J');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('downloadBytesBuffer', '100');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('uploadBytesBuffer', '8');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('localFilePort', '50004');
INSERT INTO service_prop_control (key_id, VALUE) VALUES ('localIp', '127.0.0.1');
COMMIT;

-- 报表服务配置
DELETE FROM SERVICE_PROP_REPORTS;
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('tellerOrgDayTransTaskSwitch', 'false', '机构柜面每天交易量统计');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevTypeHourSwitch', 'false', '每台设备每小时各类型交易量(C端数据源)开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevTypeDaySwitch', 'false', '每台设备每天各类型交易量开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevDaySwitch', 'false', '每台设备每年交易量开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transOrgDaySwitch', 'false', '网点每天交易量开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transOrgMonthSwitch', 'false', '网点每月交易量开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transOrgYearSwitch', 'false', '网点每年交易量开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transWayTypeDaySwitch', 'false', '各渠道各交易类型每天交易量开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateDevDaySwitch', 'false', '每台每天开机率开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateDevMonthSwitch', 'false', '每台每月开机率开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateDevYearSwitch', 'false', '每台每年开机率开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateOrgDevDaySwitch', 'false', '网点台均日均开机率开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('devAmountVendorDaySwitch', 'false', '每天每个品牌设备的数量，工单数，新增吞卡张数');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevDayTaskSwitch', 'false', '故障每台每天开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevDayTypeCardFlagSwitch', 'false', '交易每台每天各卡种开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('pTransDevHourTypeTaskSwitch', 'false', '每台设备每小时各交易类型交易量（P端数据源）开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevHourTaskSwitch', 'false', '叫号机每小时统计开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevDayTaskSwitch', 'false', '叫号机每天统计开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevMonthTaskSwitch', 'false', '叫号机每月统计开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevMonthTaskSwitch', 'false', '每台每月故障统计开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevYearTaskSwitch', 'false', '每台每年故障统计开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevMonthModTaskSwitch', 'false', '每台每月各模块故障统计开关');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevStatusTaskSwitch', 'false', '叫号机每台各状态统计开关');
COMMIT;

-- 报文服务参数配置
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('workSheetAutoClose', 'Y', '工单自动关闭标志：Y-自动关');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('isF5', 'true', 'F5探测开启标志');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartBeatRequest', 'CONNTEST', 'F5探测报文');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartBeatResponse', 'SUCCESS', 'F5探测返回报文');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartIDELTimeOut', '60', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartBeatRate', '15', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('faultInfoSave', 'Y', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('messageEncrypt', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('systemLanguage', 'ATTR_zh_CN.properties', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('sensitiveMsg', 'PhoneNum,CustomerID,CustomerName,CheckOptName,CheckOptID', '敏感信息屏蔽规则');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('cashWarnAmount', '5000', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('txWarningTime', '120', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('txNoServiceTime', '240', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('localPort', '50003', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('localPortReceipt', '50008', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('caseOpenCloseNotifyFlag', 'YY', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('offlineInterval', '30', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('tcpSoTimeout', '20000', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('stopCheckStatus', 'STOP', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('localFilePort', '50004', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('multiCashType', '1', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('bankVersion', 'BANKCZ', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('faultInfoMonitor', 'N', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('faultUpdateNotifyFlag', 'N', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('activeMqQueueUrl', 'failover:tcp://127.0.0.1:61616', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('activeMqQueue', 'MONITOR', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('stopActualStartTime', null, null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('cashEmptyCount', '0', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('calcInoperative', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('changeActionTypeInTrans', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('netCaseCreateFlag', 'true', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('netStatusJobTime', '2', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('addClearIDInCashClear', 'true', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('caseHandlerbyRealtimeMsg', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('statusMsgChangeDevStartTime', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('txReversalisChangeOriginal', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('txReversalTransType', 'CWC|GWC|TWC', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('changeIPNotEqualsDB', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('tranHistFlag', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('IccFlag', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('crdTransFlag', 'true', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('minTcpMessageThreadNum', '5', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('maxTcpMessageThreadNum', '20', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('maxTransferThreadNum', '20', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('minTransferThreadNum', '5', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('transferQueueSize', '2000', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('threadWaitTime', '60', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('messageQueueSize', '10000', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('threadQueueSize', '5000', null);
commit;

INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('connTime', '20', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('delay4AppNotifyJob', '1', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('delay4VersionNotifyJob', '1', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isMessageEncrypt', 'false', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isRunAdsCancelNotifyJob', 'true', '是否执行广告撤销作业');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isRunAppNotifyJob', 'true', '是否同步标杆');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isRunVersionNotifyJob', 'true', '是否同步版本广告文件');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('logoFilePath', 'c:/zhyg/content/files/logo', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('maxModelNotifyTimes', '3', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('maxTransferThreadNum', '50', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('maxVersionNotifyTimes', '3', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('minTransferThreadNum', '10', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('remotePort', '50006', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('rvcFilePort', '50054', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('rvcPort', '50006', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('soTime', '60', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('threadWaitTime', '60', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('transferQueueSize', '1000', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('usepUrl', 'http://10.255.0.14:14010/versionAdsAndStandardSync', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('versionFilePath', 'c:/zhyg/content', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('F5Detect', 'T', 'T-true;F-false');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('F5DetectRequ', 'CONNTEST', '探测请求包(8字节内)');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('F5DetectResp', 'SUCCESS', '探测回复包');
commit;

insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('helpUrl', '/share/zjbims/help/综合运管帮助手册_cq.doc', '帮助手册');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('syncXlinkOrgFlag', 'N', '操作机构是否同步P端');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('syncXlinkDevFlag', 'N', '操作设备是否同步P端');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('devServiceCompany', '/share/zjbims/tempFile/devServiceCompany', '设备维护商上传的文件存放位置');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('devStopStartMinDays', '7', '设备停机设定开始时间距当前时间的最小期限');
commit;

insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('TransacationFileCatalog', '1', null);
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('pjsLogPrefix', '/share/zjbims/ejfile/', 'pjs日志位置前缀');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('pjsLogSuffix', '.J', 'pjs日志文件格式后缀');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transPushSwitch', 'false', '交易推送开关');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transPushIp', '10.0.3.182|10.0.3.183|10.10.3.23|10.10.3.24', '交易推送注册ip');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transPushPort', '5218', '交易推送注册端口');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transQueueSwitch', 'true', '交易推送队列开关');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transQueueSize', '500', '交易推送队列最大长度');
commit;

INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('1', '1', '接口松动/接触不良');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('2', '1', '突然断电');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('3', '2', '清洁，常规维护');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('4', '2', '更换硬件');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('5', '3', '响应很快');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('6', '4', '迅速解决问题');
commit;

insert into sys_user_devrole select no, 'all' from sys_user;
commit;