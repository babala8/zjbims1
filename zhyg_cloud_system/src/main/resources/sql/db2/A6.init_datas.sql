
insert into SYS_USER (no, passwd, name, status, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error)
values ('admin1', '036927E762859B2681', '超级管理员1', '1', '1', '10001', '10001', null, null, null, null, '2019-01-21 10:30:49', null, 0);
insert into SYS_USER (no, passwd, name, status, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error)
values ('yqzhao', '036927E762859B2681', '赵益庆', '1', '1', '10005', '10001', null, null, null, null, '2019-03-02 17:52:09', null, 9);
insert into SYS_USER (no, passwd, name, status, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error)
values ('chenyue', '036927E762859B2681', '陈跃', '1', '0', '10005', '10001', null, null, null, null, null, null, 0);
commit;

insert into SYS_USER_DEVROLE (USER_NO, DEV_CATALOG)
values ('admin1', 'all');
commit;

insert into CARD_TYPE_TABLE (no, card_type)
values ('1', '借记卡');
insert into CARD_TYPE_TABLE (no, card_type)
values ('2', '储蓄卡');
insert into CARD_TYPE_TABLE (no, card_type)
values ('3', '信用卡');
commit;

insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10001', '社交');
insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10002', '购物');
commit;

insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 2, '营业预警', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 3, '资源预警', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 4, '资源耗尽', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 5, '清机通知', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 6, '营业故障', 1, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 7, '纸少', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 8, '纸空', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 9, '钞少', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 10, '钞空', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 11, '存款箱满', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 12, '一般硬件故障', 2, 30, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 13, '严重硬件故障', 2, 30, 60, 60, 300, 300, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 14, '钞箱故障', 3, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('00080000', 15, '通讯故障', 1, 30, 60, 60, 120, 120, 7200, 1, 1, 1, 0);
commit;

insert into CASE_GRADE (grade, notify_way, notify_times, send_interval)
values (1, 1, 3, 30);
insert into CASE_GRADE (grade, notify_way, notify_times, send_interval)
values (2, 1, 1, 0);
insert into CASE_GRADE (grade, notify_way, notify_times, send_interval)
values (3, 1, 1, 0);
insert into CASE_GRADE (grade, notify_way, notify_times, send_interval)
values (4, 1, 1, 0);
insert into CASE_GRADE (grade, notify_way, notify_times, send_interval)
values (5, 2, 1, 0);
commit;


insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('CRS', 'CRS', '自动存取款机', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('CDM', 'CDM', '自动存款机', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('ATM', 'ATM', '自动取款机', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('BSM', 'BSM', '查询机', '3', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('MTM', 'MTM', '大额存取款机', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('IST', 'IST', '智能自助终端', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('BTS', 'BTS', '回单机', '6', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('SFM', 'SFM', '填单机', '7', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('CDT', 'CDT', '发卡机', '2', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('STM', 'STM', '智慧柜员机', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('SQM', 'SQM', '叫号机', '3', '5');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('IAS', 'IAS', '智能广告屏', '4', '3');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('MDM', 'MDM', '实物领取机', '4', '3');
commit;

insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email)
values ('2', '迪堡', '林雪源', null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email)
values ('1', '日立', '汪珊', null, null, null, null, null);
commit;

insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('10001', '维护员1', '10001', '1', null, null, null, null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('10002', '维护员2', '10001', '1', null, null, null, null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('10003', '维护员3', '10001', '1', null, null, null, null);
commit;

insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10001', 'zijin', '10001', '10001', null, null, null, null);
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10002', 'KAFKA', '10001', '10001', null, null, null, null);
commit;

insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10001', 'zijin', null, null, null);
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM61', 6, '安全门为打开状态', '关闭安全门');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM64', 0, '安全门为未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM65', 0, '不支持安全门', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM70', 0, '钞箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM71', 0, '至少一个钞箱空或钞少', '加钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM72', 6, '钞箱不能出钞', '检查钞箱情况');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM73', 0, '钞箱状态未知', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM80', 0, '暂存器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM81', 6, '暂存器有钞', '取出暂存器的钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM82', 0, '暂存器状态未知', '检查暂存器是否有异物');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM83', 0, '不支持暂存器', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM90', 6, '出钞门为打开状态', '关闭出钞门');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM91', 0, '出钞门为闭合状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM92', 6, '出钞门为被堵塞状态', '检查出钞门是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM93', 0, '出钞门为未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM94', 0, '不支持出钞门', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA0', 0, '传送带正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA1', 6, '传送带异常', '检查传送带及通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA2', 0, '传送带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA3', 0, '不支持传送带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB0', 0, '出钞口空', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB1', 6, '出钞口非空', '清理出钞口');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB2', 0, '出钞口状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB3', 0, '不支持出钞口', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC0', 0, '钞箱状态正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC1', 5, '回收箱满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC2', 14, '回收箱不存在', '检查回收箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC3', 14, '回收箱不可操作', '检查回收箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC4', 10, '钞箱空', '加钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC5', 14, '钞箱不存在', '检查钞箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC6', 14, '钞箱不可操作', '检查钞箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC7', 9, '钞箱钞少', '加钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMF2', 0, '取款超时吞钞', '检查回收箱中的废钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM51', 14, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM52', 14, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM53', 14, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM54', 14, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM55', 14, '无设备', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM60', 0, '钞箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM61', 0, '有一个钞箱状态异常', '检查接触是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM62', 6, '所有钞箱都不可操作', '检查钞箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM63', 0, '存款钞箱状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM70', 0, '安全门为闭合状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM71', 6, '安全门为打开状态', '关闭安全门');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM72', 6, '安全门为异常状态', '关闭安全门');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM73', 0, '安全门为未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM74', 0, '不支持安全门', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM80', 0, '验钞暂存器空', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM81', 6, '验钞暂存器非空', '清理暂存器');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM82', 6, '验钞暂存器满', '清理暂存器');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM83', 0, '验钞暂存器状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM84', 0, '不支持验钞暂存器', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM90', 6, '入钞门为打开状态', '关闭入钞门');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM91', 0, '入钞门为闭合状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM92', 6, '入钞门为被堵塞状态', '清理入钞通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM93', 0, '入钞门为未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM94', 0, '不支持入钞门', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA0', 0, '传送带正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA1', 6, '传送带异常', '检查传送带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA2', 0, '传送带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA3', 0, '不支持传送带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB0', 0, '入钞口空', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB1', 6, '入钞口非空', '清理入钞口');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB2', 0, '入钞口状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB3', 0, '不支持入钞口', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC0', 0, '钞箱状态正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC1', 5, '回收箱满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC2', 14, '回收箱不存在', '检查回收箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC3', 14, '回收箱不可操作', '检查回收箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC4', 11, '存款箱满', '清理存款箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC5', 14, '存款箱不存在', '检查存款箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC6', 14, '存款箱不可操作', '检查存款箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMF1', 5, '存款回收次数超限', '检查存款箱是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMF2', 0, '存款超时吞钞', '检查回收箱中的废钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU53', 12, '硬件故障', '检查是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU54', 12, '使用错误', '检查是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU55', 12, '无设备', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU53', 12, '硬件故障', '检查硬件是否正常');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU54', 12, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU55', 12, '无此设备', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI54', 12, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI55', 12, '无设备', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP54', 12, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP55', 12, '无此设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP60', 0, '传送带正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP61', 0, '无传送带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP62', 12, '传送带不可操作', '检查传送带是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP63', 12, '传送带状态异常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP64', 0, '传送带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP70', 0, '信封容器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP71', 6, '信封容器满', '清理信封容器');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP72', 6, '信封容器将满', '清理信封容器');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP73', 12, '信封容器不存在', '检查信封容器是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP74', 12, '信封容器不可操作', '检查信封容器是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP75', 0, '信封容器状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP76', 0, '不支持信封容器', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP80', 0, '信封供应正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP81', 3, '信封少', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP82', 4, '无信封', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP83', 12, '信封供应模块丢失', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP84', 12, '不可操作', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP85', 12, '已锁定', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP86', 0, '不支持模块', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP87', 0, '状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP90', 0, '信封分发器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP91', 8, '信封分发器不可操作', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP92', 0, '信封分发器状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP93', 0, '不支持信封分发器', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA0', 0, '打印机正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA1', 8, '打印机不可操作', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA2', 0, '打印机状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA3', 0, '不支持打印机', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB0', 0, '正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB1', 3, '墨少', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB2', 4, '墨尽', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB3', 0, '墨状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB4', 0, '不支持墨', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC0', 0, '入钞门为关闭状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC1', 6, '入钞门为打开状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC2', 6, '入钞门为堵塞状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC3', 0, '入钞门状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC4', 0, '不支持入钞门', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK54', 12, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK55', 12, '无设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK60', 6, '无凭条', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK61', 0, '有凭条', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK62', 6, '口有凭条', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK63', 6, '卡纸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK64', 0, '未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK65', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK66', 0, '凭条复位已回收', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK70', 0, '纸满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK71', 7, '纸少', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK72', 8, '纸尽', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK73', 0, '纸状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK74', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK75', 6, '凭条堵塞', '清理打印机口');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK80', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK81', 0, '回收箱将满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK82', 6, '回收箱满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK83', 12, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK84', 0, '回收箱状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK90', 0, '色带满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK91', 3, '色带少', '添加色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK92', 4, '色带尽', '更换色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK93', 0, '不支持色带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK94', 0, '色带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA0', 0, '墨水满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA1', 3, '墨水少', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA2', 4, '墨水尽', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA3', 0, '不支持墨水', null);
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA4', 0, '墨水状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC9', 10, '钞箱空，有钞箱不可用', '检查钞箱或者加钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC8', 9, '钞箱钞少，有钞箱不可用', '检查钞箱或者加钞');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC50', 0, '读卡器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC51', 13, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC52', 13, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC53', 13, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC54', 6, '使用错误', '检查是否有非法卡操作');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC55', 13, '无设备', '检查硬件联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC60', 0, '无卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC61', 6, '有卡', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC62', 6, '口有卡', '取走卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC63', 6, '卡被堵塞', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC64', 0, '未知状态', '检查模块是否离线');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC65', 0, '不支持Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC70', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC71', 6, '回收箱卡满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC72', 6, '回收箱卡将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC73', 13, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC50', 0, '读卡器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC51', 13, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC52', 13, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC53', 13, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC54', 6, '使用错误', '检查是否有非法卡操作');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC55', 13, '无设备', '检查硬件联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC60', 0, '无卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC61', 6, '有卡', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC62', 6, '口有卡', '取走卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC63', 6, '卡被堵塞', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC64', 0, '未知状态', '检查模块是否离线');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC65', 0, '不支持Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC70', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC71', 6, '回收箱卡满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC72', 6, '回收箱卡将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC73', 13, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC50', 0, '读卡器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC51', 13, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC52', 13, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC53', 13, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC54', 6, '使用错误', '检查是否有非法卡操作');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC55', 13, '无设备', '检查硬件联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC60', 0, '无卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC61', 6, '有卡', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC62', 6, '口有卡', '取走卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC63', 6, '卡被堵塞', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC64', 0, '未知状态', '检查模块是否离线');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC65', 0, '不支持Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC70', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC71', 6, '回收箱卡满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC72', 6, '回收箱卡将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC73', 13, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI51', 13, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI52', 13, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD50', 0, '正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD52', 12, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD54', 6, '使用错误', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD55', 12, '无设备', '检查联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD60', 0, '所有卡箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD61', 0, '至少有一个卡箱状态不正常', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD62', 12, '所有卡箱都不可操作', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD63', 12, '卡箱状态未知', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD70', 0, '传送带正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD71', 12, '传送带异常', '检查传送带状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD72', 0, '传送带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD73', 0, '不支持传送带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD80', 0, '发卡器中无卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD81', 0, '发卡器中有卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD82', 0, '发卡器口有卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD83', 6, '发卡器夹卡', '清理发卡器');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD84', 0, '未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD85', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD90', 0, '挡板处于打开状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD91', 0, '挡板处于闭合状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD92', 6, '挡板处于卡住状态', '检查挡板');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD93', 0, '挡板处于未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD94', 0, '不支持挡板', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA0', 0, '发卡箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA1', 3, '发卡箱卡少', '加卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA2', 4, '发卡箱为空', '加卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA3', 6, '发卡箱不可用', '检查发卡箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA4', 13, '发卡箱不存在', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA5', 0, '发卡箱未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB0', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB1', 3, '回收箱卡将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB2', 5, '回收箱卡满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB3', 6, '回收箱不可用', '检查发卡箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB4', 13, '回收箱不存在', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB5', 0, '回收箱未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD50', 0, '正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD52', 12, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD54', 6, '使用错误', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD55', 12, '无设备', '检查联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD60', 0, '所有卡箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD61', 0, '至少有一个卡箱状态不正常', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD62', 12, '所有卡箱都不可操作', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD63', 12, '卡箱状态未知', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD70', 0, '传送带正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD71', 12, '传送带异常', '检查传送带状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD72', 0, '传送带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD73', 0, '不支持传送带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD80', 0, '发卡器中无卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD81', 0, '发卡器中有卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD82', 0, '发卡器口有卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD83', 6, '发卡器夹卡', '清理发卡器');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD84', 0, '未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD85', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD90', 0, '挡板处于打开状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD91', 0, '挡板处于闭合状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD92', 6, '挡板处于卡住状态', '检查挡板');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD93', 0, '挡板处于未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD94', 0, '不支持挡板', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA0', 0, '发卡箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA1', 3, '发卡箱卡少', '加卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA2', 4, '发卡箱为空', '加卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA3', 6, '发卡箱不可用', '检查发卡箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA4', 13, '发卡箱不存在', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA5', 0, '发卡箱未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB0', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB1', 3, '回收箱卡将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB2', 5, '回收箱卡满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB3', 6, '回收箱不可用', '检查发卡箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB4', 13, '回收箱不存在', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB5', 0, '回收箱未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR50', 0, '正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR51', 12, '盖章模块未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR52', 12, '盖章模块未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR53', 12, '盖章模块硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR54', 6, '盖章模块使用错误', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR55', 12, '无此设备模块', '检查联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR60', 0, '盖章模块中无纸', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR61', 0, '盖章模块中有纸', '检查卡箱状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR62', 0, '盖章模块口有纸', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR63', 6, '盖章模块中纸Jammed', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR64', 0, '未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR65', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR70', 0, '纸满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR71', 7, '纸少', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR72', 8, '纸尽', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR73', 0, '纸状态未知', '检查打印纸是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR74', 0, '不支持该设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR75', 6, '纸Jammed', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR80', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR81', 6, '回收箱将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR82', 6, '回收箱满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR83', 0, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR84', 0, '回收箱状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR90', 0, '色带满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR91', 3, '色带少', '添加色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR92', 4, '色带尽', '更换色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR93', 0, '不支持色带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR94', 0, '色带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA0', 0, '墨水满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA1', 3, '墨水少', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA2', 4, '墨水尽', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA3', 0, '不支持墨水', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA4', 0, '墨水状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR41', 0, '系统事件硬件故障类型', null);
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR50', 0, '正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR51', 12, '二维码扫描仪模块未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR52', 12, '二维码扫描仪模块未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR53', 12, '二维码扫描仪模块硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR54', 6, '二维码扫描仪模块使用错误', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR55', 12, '无此设备模块', '检查联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR60', 0, '扫描仪启用', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR61', 0, '扫描仪禁用', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR62', 12, '扫描仪故障不启作用', '检查扫描仪状态状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR63', 12, '扫描仪状态未知', '检查扫描仪状态状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR50', 0, '日志打印机设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR54', 6, '使用错误', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR55', 12, '无设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR60', 0, '无打印纸', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR61', 0, '有打印纸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR62', 0, '口有打印纸', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR63', 6, '打印纸被堵塞', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR64', 0, '未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR65', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR70', 0, '纸满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR71', 7, '纸少', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR72', 8, '纸尽', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR73', 0, '纸状态未知', '检查打印纸是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR74', 0, '不支持该设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR75', 6, '纸被堵塞', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR80', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR81', 6, '回收箱将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR82', 6, '回收箱满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR83', 0, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR84', 0, '回收箱状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR90', 0, '色带满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR91', 3, '色带少', '添加色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR92', 4, '色带尽', '更换色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR93', 0, '不支持色带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR94', 0, '色带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA0', 0, '墨水满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA1', 3, '墨水少', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA2', 4, '墨水尽', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA3', 0, '不支持墨水', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA4', 0, '墨水状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC50', 0, '读卡器正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC51', 13, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC52', 13, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC53', 13, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC54', 6, '使用错误', '检查是否有非法卡操作');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC55', 13, '无设备', '检查硬件联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC56', 13, '无读磁道能力', '检查硬件或SP是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC60', 0, '无卡', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC61', 6, '有卡', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC62', 6, '口有卡', '取走卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC63', 6, '卡被堵塞', '取出卡');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC64', 0, '未知状态', '检查模块是否离线');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC65', 0, '不支持Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC70', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC71', 6, '回收箱卡满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC72', 6, '回收箱卡将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC73', 13, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN50', 0, '密码键盘设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN51', 13, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN52', 13, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN53', 13, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN54', 13, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN55', 13, '无设备', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR50', 0, '凭条打印机正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR52', 12, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR54', 6, '使用错误', '检查是否卡纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR55', 12, '无设备', '检查联机是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR60', 0, '无凭条', '添加打印纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR61', 0, '有凭条', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR62', 0, '口有凭条', '清理出纸口和通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR63', 6, '凭条被堵塞', '清理凭条打印通道');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR64', 0, '未知状态', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR65', 0, '不支持设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR66', 0, '凭条复位已回收', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR70', 0, '纸满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR71', 7, '纸少', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR72', 8, '纸尽', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR73', 0, '打印机纸状态未知', '检查打印纸状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR74', 0, '不支持该设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR75', 6, '凭条被堵塞', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR80', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR81', 6, '回收箱将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR82', 6, '回收箱满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR83', 12, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR84', 0, '回收箱状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR90', 0, '色带满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR91', 3, '色带少', '添加色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR92', 4, '色带尽', '更换色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR93', 0, '不支持色带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR94', 0, '色带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA0', 0, '墨水满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA1', 3, '墨水少', '加墨');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA2', 4, '墨水尽', '加墨');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA3', 0, '不支持墨水', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA4', 0, '墨水状态未知', '检查墨水状态');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR50', 0, '日志打印机设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR51', 12, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR52', 12, '未通电', '检查是否通电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR53', 12, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR54', 6, '使用错误', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR55', 12, '无设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR60', 0, '无打印纸', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR61', 0, '有打印纸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR62', 0, '口有打印纸', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR63', 6, '打印纸被堵塞', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR64', 0, '未知状态', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR65', 0, '不支持', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR70', 0, '纸满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR71', 7, '纸少', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR72', 8, '纸尽', '加纸');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR73', 0, '纸状态未知', '检查打印纸是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR74', 0, '不支持该设备', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR75', 6, '纸被堵塞', '清理通道');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR80', 0, '回收箱正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR81', 6, '回收箱将满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR82', 6, '回收箱满', '清理回收箱');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR83', 0, '无回收箱', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR84', 0, '回收箱状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR90', 0, '色带满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR91', 3, '色带少', '添加色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR92', 4, '色带尽', '更换色带');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR93', 0, '不支持色带', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR94', 0, '色带状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA0', 0, '墨水满', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA1', 3, '墨水少', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA2', 4, '墨水尽', '添加墨水');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA3', 0, '不支持墨水', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA4', 0, '墨水状态未知', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM41', 0, '系统事件硬件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM42', 0, '系统事件软件故障类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM43', 0, '系统事件状态变化类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM44', 0, '用户事件提醒类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM45', 0, '其它故障事件类型', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM50', 0, '设备正常', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM51', 14, '未联机', '检查是否联机');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM52', 14, '未通电', '检查是否加电');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM53', 14, '硬件故障', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM54', 6, '使用错误', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM55', 14, '无设备', '检查硬件是否正常');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM60', 0, '安全门为闭合状态', null);
commit;

insert into MOD_CATALOG_TABLE (no, name)
values ('CAM', '照相机');
insert into MOD_CATALOG_TABLE (no, name)
values ('CDM', '取款');
insert into MOD_CATALOG_TABLE (no, name)
values ('CHK', '支票读扫描');
insert into MOD_CATALOG_TABLE (no, name)
values ('CIM', '存款');
insert into MOD_CATALOG_TABLE (no, name)
values ('DEP', '信封');
insert into MOD_CATALOG_TABLE (no, name)
values ('IDC', '读卡器');
insert into MOD_CATALOG_TABLE (no, name)
values ('JPR', '日志打印机');
insert into MOD_CATALOG_TABLE (no, name)
values ('PBK', '存折打印机');
insert into MOD_CATALOG_TABLE (no, name)
values ('PIN', '密码键盘');
insert into MOD_CATALOG_TABLE (no, name)
values ('RPR', '凭条打印机');
insert into MOD_CATALOG_TABLE (no, name)
values ('SIU', '传感器');
insert into MOD_CATALOG_TABLE (no, name)
values ('SPR', '结单打印');
insert into MOD_CATALOG_TABLE (no, name)
values ('TTU', '文本终端单元');
insert into MOD_CATALOG_TABLE (no, name)
values ('UPS', '不间断电源');
insert into MOD_CATALOG_TABLE (no, name)
values ('NET', '网络通讯');
insert into MOD_CATALOG_TABLE (no, name)
values ('DPR', '盖章模块');
insert into MOD_CATALOG_TABLE (no, name)
values ('BCR', '二维码扫描仪模块');
insert into MOD_CATALOG_TABLE (no, name)
values ('ICC', '插入式读卡器');
insert into MOD_CATALOG_TABLE (no, name)
values ('ISC', '刷卡式读卡器');
insert into MOD_CATALOG_TABLE (no, name)
values ('IRC', '二代证读卡器');
insert into MOD_CATALOG_TABLE (no, name)
values ('FPI', '指纹扫描仪');
insert into MOD_CATALOG_TABLE (no, name)
values ('CRD', '发卡器');
insert into MOD_CATALOG_TABLE (no, name)
values ('CCD', '发卡器1');
commit;


INSERT INTO SYS_MENU VALUES ('A08', '大屏展示A', NULL, NULL, 'tile_bankMonitor_a.png', '/monitor/bankMonitorA', NULL, '8');
INSERT INTO SYS_MENU VALUES ('A09', '大屏展示B', NULL, NULL, 'tile_bankMonitor_b.png', '/monitor/bankMonitorB', NULL, '9');
INSERT INTO SYS_MENU VALUES ('A07', '无纸化解绑', NULL, NULL, 'pjsTermMonitor.png', '/monitor/pjsTermMonitor', NULL, '7');
INSERT INTO SYS_MENU VALUES ('A10', '无纸化流水监控', NULL, NULL, 'tile_wuzhihua_monitor.png', '/monitor/pjsMonitor', NULL, '10');
INSERT INTO SYS_MENU VALUES ('A11', '发卡机监控', NULL, NULL, 'tile_crdMonitor.png', '/monitor/crdMonitor', NULL, '11');
INSERT INTO SYS_MENU VALUES ('A16', '交易分析', NULL, NULL, 'tile_transactionAnalysis.png', '/monitor/transAnalysis', NULL, '15');
INSERT INTO SYS_MENU VALUES ('A17', '故障分析', NULL, NULL, 'tile_faultAnalysis.png', '/monitor/faultAnalysis', NULL, '16');
INSERT INTO SYS_MENU VALUES ('A13', '回单机监控', NULL, NULL, 'tile_btsMonitor.png', '/monitor/btsMonitor', NULL, '12');
INSERT INTO SYS_MENU VALUES ('A14', '填单机监控', NULL, NULL, 'tile_sfmMonitor.png', '/monitor/sfmMonitor', NULL, '13');
INSERT INTO SYS_MENU VALUES ('A15', '智能终端监控', NULL, NULL, 'tile_istMonitor.png', '/monitor/istMonitor', NULL, '14');
INSERT INTO SYS_MENU VALUES ('E03', '统计报表', NULL, NULL, 'tile_statistical_reports.png', '/report/statisticReport', NULL, '3');
INSERT INTO SYS_MENU VALUES ('E04', '交易报表', NULL, NULL, 'Equipment-information.png', '/report/transReport', NULL, '4');
INSERT INTO SYS_MENU VALUES ('E05', '考核报表', NULL, NULL, 'Equipment-information.png', '/report/assessReport', NULL, '5');
INSERT INTO SYS_MENU VALUES ('F15', '用户密码', NULL, NULL, 'tile_passwd.png', '/system/password', NULL, '15');
INSERT INTO SYS_MENU VALUES ('F16', '设备模块', NULL, NULL, 'tile_modCatalog.png', '/system/modCatalog', NULL, '16');
INSERT INTO SYS_MENU VALUES ('F17', '信息通知模板', NULL, NULL, 'tile_notifyModel.png', '/system/notifyModel', NULL, '17');
INSERT INTO SYS_MENU VALUES ('F18', '公告管理', NULL, NULL, 'tile_bulletin.png', '/system/bulletin', NULL, '18');
INSERT INTO SYS_MENU VALUES ('F19', '设备停机管理', NULL, NULL, 'tile_devStop.png', '/system/devStop', NULL, '19');
INSERT INTO SYS_MENU VALUES ('F20', '机构工作时段', NULL, NULL, 'tile_worktime_range.png', '/system/orgWorkTime', NULL, '20');
INSERT INTO SYS_MENU VALUES ('F21', '自助银行管理', NULL, NULL, 'tile_selfHelpBank.png', '/system/selfHelpBank', NULL, '21');
INSERT INTO SYS_MENU VALUES ('F22', '卡表管理', NULL, NULL, 'tile_cardInfo.png', '/system/cardInfo', NULL, '22');
INSERT INTO SYS_MENU VALUES ('F23', '参数管理', NULL, NULL, 'tile_globalCfg.png', '/system/globalCfg', NULL, '23');
INSERT INTO SYS_MENU VALUES ('F24', '我的申请', NULL, NULL, 'tile_myapply.png', '/system/myApply', NULL, '24');
INSERT INTO SYS_MENU VALUES ('F25', '我的审批', NULL, NULL, 'tile_myaudit.png', '/system/myAudit', NULL, '25');
INSERT INTO SYS_MENU VALUES ('B03', '功能定义', NULL, NULL, 'tile_devControl.png', '/remote/atmFunction', NULL, '3');
INSERT INTO SYS_MENU VALUES ('G02', '吞卡管理', NULL, NULL, 'tile_csManager.png', '/maintain/cs', NULL, '2');
INSERT INTO SYS_MENU VALUES ('G03', '工单管理', NULL, NULL, 'tile_workOrder.png', '/maintain/workOrder', NULL, '3');
INSERT INTO SYS_MENU VALUES ('G04', '设备参数设置', NULL, NULL, 'tile_devparamSetting.png', '/maintain/devParam', NULL, '4');
INSERT INTO SYS_MENU VALUES ('0', '紫金综合运管系统', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO SYS_MENU VALUES ('E', '报表统计', NULL, '#f2a000', NULL, NULL, 'zijin-icon-chart22', '1');
INSERT INTO SYS_MENU VALUES ('I', '高层决策', NULL, '#22b9e8', NULL, NULL, 'zijin-icon-user-tie', '1');
INSERT INTO SYS_MENU VALUES ('A', '状态监控', NULL, '#00a8f3', NULL, NULL, 'zijin-icon-devMonitor', '1');
INSERT INTO SYS_MENU VALUES ('B', '远程控制', NULL, '#ffb11a', NULL, NULL, 'zijin-icon-devManage', '1');
INSERT INTO SYS_MENU VALUES ('C', '版本管理', NULL, '#ff7f27', NULL, NULL, 'zijin-icon-checklist', '1');
INSERT INTO SYS_MENU VALUES ('D', '内容管理', NULL, '#78c446', NULL, NULL, 'zijin-icon-icon_theme_setting', '1');
INSERT INTO SYS_MENU VALUES ('F', '参数配置', NULL, '#5ed8a9', NULL, NULL, 'zijin-icon-options', '1');
INSERT INTO SYS_MENU VALUES ('G', '日常维护', NULL, '#22b9e8', NULL, NULL, 'zijin-icon-Development-mode', '1');
INSERT INTO SYS_MENU VALUES ('H', '交易价值', NULL, '#605ad8', NULL, NULL, 'zijin-icon-purse', '1');
INSERT INTO SYS_MENU VALUES ('J', '锁具管理', NULL, '#f86846', NULL, NULL, 'zijin-icon-options', '1');
INSERT INTO SYS_MENU VALUES ('A06', '交易查询', NULL, NULL, 'tile_transSearch.png', '/monitor/transInfo', NULL, '6');
INSERT INTO SYS_MENU VALUES ('E02', '基础报表', NULL, NULL, 'tile_basic_statements.png', '/report/baseReport', NULL, '2');
INSERT INTO SYS_MENU VALUES ('F10', '设备品牌管理', NULL, NULL, 'tile_vendor.png', '/system/vendor', NULL, '10');
INSERT INTO SYS_MENU VALUES ('F11', '设备型号管理', NULL, NULL, 'tile_devtype.png', '/system/type', NULL, '11');
INSERT INTO SYS_MENU VALUES ('F12', '设备类型管理', NULL, NULL, 'tile_devcatalog.png', '/system/catalog', NULL, '12');
INSERT INTO SYS_MENU VALUES ('F14', '工作时间设定', NULL, NULL, 'tile_worktime.png', '/system/devWorkTime', NULL, '14');
INSERT INTO SYS_MENU VALUES ('J01', '锁具信息管理', NULL, NULL, 'tile_elockInfo.png', '/elock/elockInfoManager', NULL, '1');
INSERT INTO SYS_MENU VALUES ('J02', '开锁任务管理', NULL, NULL, 'tile_unelockTask.png', '/elock/unelockTaskManager', NULL, '2');
INSERT INTO SYS_MENU VALUES ('A03', '机构监控', NULL, NULL, 'tile_orgMonitor.png', '/monitor/orgMonitor', NULL, '3');
INSERT INTO SYS_MENU VALUES ('D03', '广告制作', NULL, NULL, 'tile_advMake.png', '/content/advMake', NULL, '3');
INSERT INTO SYS_MENU VALUES ('F07', '网点人员管理', NULL, NULL, 'tile_Network_staff_management.', '/system/bank', NULL, '7');
INSERT INTO SYS_MENU VALUES ('F08', '厂商维护商管理', NULL, NULL, 'tile_factoryMaintain.png', '/system/factory', NULL, '8');
INSERT INTO SYS_MENU VALUES ('F09', '设备维护商管理', NULL, NULL, 'tile_devMaintain.png', '/system/devServiceManager', NULL, '9');
INSERT INTO SYS_MENU VALUES ('I01', '目标设置', NULL, NULL, 'tile_setTarget.png', '/decision/target', NULL, '1');
INSERT INTO SYS_MENU VALUES ('I02', '业务数据分析', NULL, NULL, 'tile_data_analysis.png', '/decision/business', NULL, '2');
INSERT INTO SYS_MENU VALUES ('E01', '多维分析', NULL, NULL, 'tile_reportAnalysis.png', '/report/reportAnalysis', NULL, '1');
INSERT INTO SYS_MENU VALUES ('A01', '交易监控', NULL, NULL, 'tile_transMonitor.png', '/monitor/transMonitor', NULL, '1');
INSERT INTO SYS_MENU VALUES ('A02', '设备监控', NULL, NULL, 'tile_devMonitor.png', '/monitor/devMonitor', NULL, '2');
INSERT INTO SYS_MENU VALUES ('B01', '设备控制', NULL, NULL, 'tile_devControl.png', '/remote/devControl', NULL, '1');
INSERT INTO SYS_MENU VALUES ('B02', '控制结果', NULL, NULL, 'tile_controlResult.png', '/remote/controlResult', NULL, '2');
INSERT INTO SYS_MENU VALUES ('C01', '应用管理', NULL, NULL, 'tile_appstore.png', '/version/appstore', NULL, '1');
INSERT INTO SYS_MENU VALUES ('D02', '广告位管理', NULL, NULL, 'tile_advSpace.png', '/content/advertisementSpace', NULL, '2');
INSERT INTO SYS_MENU VALUES ('C02', '标杆管理', NULL, NULL, 'tile_benchmark.png', '/version/benchmark', NULL, '2');
INSERT INTO SYS_MENU VALUES ('F01', '机构管理', NULL, NULL, 'tile_userOrg.png', '/system/org', NULL, '1');
INSERT INTO SYS_MENU VALUES ('F03', '角色管理', NULL, NULL, 'tile_rolePrivilege.png', '/system/role', NULL, '3');
INSERT INTO SYS_MENU VALUES ('F02', '用户管理', NULL, NULL, 'tile_userInfo.png', '/system/user', NULL, '2');
INSERT INTO SYS_MENU VALUES ('F04', '设备管理', NULL, NULL, 'tile_device_management.png', '/system/dev', NULL, '4');
INSERT INTO SYS_MENU VALUES ('F05', '设备责任人管理', NULL, NULL, 'tile_device_people_manage.png', '/system/devResponsible', NULL, '5');
INSERT INTO SYS_MENU VALUES ('C03', '参数管理', NULL, NULL, 'Parameter-management.png', '/version/parameter', NULL, '3');
INSERT INTO SYS_MENU VALUES ('G01', 'CASE综合查询', NULL, NULL, 'title_fault_query.png', '/maintain/faultQuery', NULL, '1');
INSERT INTO SYS_MENU VALUES ('A05', 'GIS展示', NULL, NULL, 'tile_gis.png', '/monitor/gisMonitor', NULL, '5');
INSERT INTO SYS_MENU VALUES ('F06', '故障响应设定', NULL, NULL, 'tile_dev_response.png', '/system/sysParam', NULL, '6');
INSERT INTO SYS_MENU VALUES ('H01', '动态指标', NULL, NULL, 'tile_transDynamic.png', '/transWorth/dynamicInd', NULL, '1');
INSERT INTO SYS_MENU VALUES ('H02', '静态指标', NULL, NULL, 'tile_transStatic.png', '/transWorth/staticInd', NULL, '2');
INSERT INTO SYS_MENU VALUES ('H03', '交易价值报告', NULL, NULL, 'tile_transValueAnalysis.png', '/transWorth/transValueAnalysis', NULL, '3');
INSERT INTO SYS_MENU VALUES ('D04', '广告投放', NULL, NULL, 'tile_advRemote.png', '/content/advValid', NULL, '4');
INSERT INTO SYS_MENU VALUES ('D01', '资源管理', NULL, NULL, 'tile_resource.png', '/content/resourceManage', NULL, '1');
INSERT INTO SYS_MENU VALUES ('F13', '日志查询', NULL, NULL, 'tile_log.png', '/system/log', NULL, '13');
INSERT INTO SYS_MENU VALUES ('C04', '版本结果查询', NULL, NULL, 'tile_vision_result.png', '/version/appResult', NULL, '4');
INSERT INTO SYS_MENU VALUES ('D05', '广告投放情况', NULL, NULL, 'tile_advRemote_info.png', '/content/advValidResult', NULL, '5');
INSERT INTO SYS_MENU VALUES ('B04', '交易类型管理', NULL, NULL, 'tile_devControl.png', '/remote/atmFunctionDef', NULL, '4');
INSERT INTO SYS_MENU VALUES ('G05', '加钞预测', NULL, NULL, 'tile_devparamSetting.png', '/maintain/cashForcast', NULL, '5');
INSERT INTO SYS_MENU VALUES ('G06', '对账查询', NULL, NULL, 'tile_devparamSetting.png', '/maintain/reconcile', NULL, '6');
INSERT INTO SYS_MENU VALUES ('A04', '交易流水查询', NULL, NULL, 'Equipment-information.png', '/monitor/pjsLogMonitor', NULL, '4');
INSERT INTO SYS_MENU VALUES ('K', '叫号机管理', NULL, '#605ad8', NULL, NULL, 'zijin-icon-devManage', '1');
INSERT INTO SYS_MENU VALUES ('K01', '设备信息管理', NULL, NULL, 'tile_callDev_info.png', '/callDev/devManager', NULL, '1');
INSERT INTO SYS_MENU VALUES ('K02', '总行业务配置', NULL, NULL, 'tile_businessConfig_total.png', '/callDev/businessConfig', NULL, '2');
INSERT INTO SYS_MENU VALUES ('K03', '叫号机业务配置', NULL, NULL, 'tile_callDev_business.png', '/callDev/business', NULL, '3');
INSERT INTO SYS_MENU VALUES ('K04', '预约查询', NULL, NULL, 'tile_callDev_reserveSearch.png', '/callDev/reserveSearch', NULL, '4');
INSERT INTO SYS_MENU VALUES ('N', '冠字号管理', NULL, '#5ed8a9', NULL, NULL, 'zijin-icon-devManage', '1');
INSERT INTO SYS_MENU VALUES ('N01', '黑名单版本管理', NULL, NULL, 'tile_nts_version.png', '/ntsManage/version', NULL, '1');
INSERT INTO SYS_MENU VALUES ('N02', '黑名单配置', NULL, NULL, 'tile_nts_blank.png', '/ntsManage/blank', NULL, '2');
INSERT INTO SYS_MENU VALUES ('N03', '黑名单下发', NULL, NULL, 'tile_nts_issue.png', '/ntsManage/issue', NULL, '3');
INSERT INTO SYS_MENU VALUES ('N04', '黑名单下发记录', NULL, NULL, 'tile_nts_issueList.png', '/ntsManage/issueList', NULL, '4');
INSERT INTO SYS_MENU VALUES ('N05', '可疑规则配置', NULL, NULL, 'tile_nts_susReg.png', '/ntsManage/susReg', NULL, '5');
INSERT INTO SYS_MENU VALUES ('N06', '冠字号查交易', NULL, NULL, 'tile_nts_nsnQryTx.png', '/ntsManage/nsnQryTx', NULL, '6');
INSERT INTO SYS_MENU VALUES ('N07', '交易查冠字号', NULL, NULL, 'tile_nts_txQryNsn.png', '/ntsManage/txQryNsn', NULL, '7');
INSERT INTO SYS_MENU VALUES ('L', '智慧宣传', NULL, '#ffb11a', NULL, NULL, 'zijin-icon-icon_theme_setting', '1');
INSERT INTO SYS_MENU VALUES ('L01', '智慧设备', NULL, NULL, 'tile_publicity_devManager.png', '/publicity/devManager', NULL, '1');
COMMIT;

insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('19', '增加', 'C01', '应用', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('20', '修改', 'C01', '应用', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('21', '删除', 'C01', '应用', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('1', '增加', 'F01', '机构', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('2', '修改', 'F01', '机构', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('3', '删除', 'F01', '机构', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('4', '审核', 'F01', '机构', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('5', '增加', 'F03', '角色', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('6', '修改', 'F03', '角色', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('7', '删除', 'F03', '角色', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('8', '审核', 'F03', '角色', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('9', '增加', 'F02', '用户', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('10', '修改', 'F02', '用户', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('11', '删除', 'F02', '用户', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('12', '重置密码', 'F02', '用户', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('13', '解锁', 'F02', '用户', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('14', '审核', 'F02', '用户', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('15', '增加', 'F04', '设备', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('16', '修改', 'F04', '设备', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('17', '删除', 'F04', '设备', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('18', '审核', 'F04', '设备', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('22', '增加', 'C02', '标杆', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('23', '修改', 'C02', '标杆', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('24', '删除', 'C02', '标杆', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('25', '部署', 'C02', '标杆', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('26', '分配', 'C02', '标杆', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('27', '禁用', 'C01', '禁用', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('28', '删除文件', 'B01', '远程浏览删除文件', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('29', '执行文件', 'B01', '远程浏览执行文件', null, null,'N');
commit;

insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-08', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-07', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-06', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-05', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-04', 0, '1');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-03', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-02', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-01', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-31', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-30', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-29', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-28', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-23', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-22', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-27', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2018-12-26', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-13', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-12', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-11', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-14', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-09', 1, '0');
insert into SYS_JOB (job, date_time, status, note)
values ('com.zjft.bpe.shepherdstd.components.scheduling.GenerateReportDataJob', '2019-01-10', 1, '0');
commit;


insert into SYS_ORG_TYPE (no, type, grade)
values ('FH', '分行', '2');
insert into SYS_ORG_TYPE (no, type, grade)
values ('FH2', '二级分行', '3');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZHH', '支行', '4');
insert into SYS_ORG_TYPE (no, type, grade)
values ('YYWD', '营业网点', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZZWD', '自助网点', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('SQWD', '社区网点', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZH', '总行', '1');
commit;

insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10001', '总行', null, 1, 40, 'ZH', null, null, null, '南京市鼓楼区', null, '13862276896', '0516-8771824', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10002', '江苏分行', '10001', 12, 39, 'FH', null, null, null, '南京市建邺区', null, null, '13862276892', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10005', '苏州支行', '10001', 4, 11, 'ZHH', null, null, null, '常州市天宁区', null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10004', '南京支行', '10002', 31, 38, 'ZHH', null, null, null, '扬州市邗江区', null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10003', '浙江分行', '10002', 13, 30, 'FH', null, null, null, '常州市新北区', null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10006', '绍兴支行', '10003', 22, 29, 'FH2', null, '100', '200', '绍兴', '18752744521', '187521', null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10007', '合肥支行', '10003', 14, 21, 'ZHH', null, '17.9867', '16.8976', null, null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10008', '建邺区网点', '10004', 36, 37, 'YYWD', null, '118.722403', '16.98', null, null, '13862276899', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10009', '苏州工业园区网点', '10005', 9, 10, 'YYWD', null, '19.8', '16.987', '南京市建邺区11号', null, '13862276890', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10010', '西湖区网点', '10006', 27, 28, 'ZZWD', null, '19.867', '16', '苏州工业园区', null, '13862276899', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10011', '肥西区网点', '10007', 19, 20, 'SQWD', null, '19.8', '16', '西湖', null, '13862276899', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10012', '安徽分行', '10001', 2, 3, 'FH', null, '20', '20', '安徽', null, '18189951647', '012-0927112', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10013', '南京远通网点', '10004', 34, 35, 'YYWD', null, '19.8098', '16', '南京远通', null, '15276687998', '012-0927117', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10014', '南京油坊桥网点', '10004', 32, 33, 'SQWD', null, '118.717229', '31.987591', '南京油坊桥', null, '15290826782', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10015', '苏大网点', '10005', 7, 8, 'YYWD', null, '29.8', '16.0012', '苏州大学', null, '15298609890', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10016', '苏科技网点', '10005', 5, 6, 'ZZWD', null, '17.8', '15.789', '苏州科技大学', null, '13907826398', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10017', '阿里网点', '10006', 25, 26, 'YYWD', null, '19.898', '16.0189', '阿里科技', null, '13907826333', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10018', '网易网点', '10006', 23, 24, 'SQWD', null, '18.987', '15.989', '网易科技', null, '13907826444', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10019', '安科大网点', '10007', 17, 18, 'ZZWD', null, '18.8', '16.876', '安徽科技大学', null, '13907826555', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10020', '安农网点', '10007', 15, 16, 'ZZWD', null, '19.098', '16.178', '安徽农业大学', null, '13907826378', '012-0927114', null, null, null, null, null, null, null, null);
commit;

insert into SYS_ROLE (no, name, org_type, note)
values ('10002', 'role2', 'FH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10003', 'role3', 'ZH', '456');
insert into SYS_ROLE (no, name, org_type, note)
values ('10004', 'role4', 'FH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10005', 'role5', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10006', 'role6', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10007', 'linxueyuan', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10008', 'sony', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10009', 'tshang', 'FH', '123456798');
insert into SYS_ROLE (no, name, org_type, note)
values ('10001', 'limengrd', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10010', 'tshang1', 'FH', null);
commit;

INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '1');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '10');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '11');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '12');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '13');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '14');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '15');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '16');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '17');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '18');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '19');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '2');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '20');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '21');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '22');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '23');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '24');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '25');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '26');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '27');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '3');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '4');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '5');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '6');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '7');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '8');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10001', '9');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '19');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '20');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '21');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '22');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '23');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '24');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '25');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '26');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10002', '27');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '1');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '10');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '11');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '12');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '13');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '14');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '15');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '16');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '17');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '18');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '19');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '2');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '20');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '21');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '22');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '23');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '24');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '25');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '26');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '27');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '28');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '29');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '3');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '4');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '5');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '6');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '7');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '8');
INSERT INTO SYS_ROLE_BUTTON (ROLE_NO, BUTTON_NO) VALUES ('10005', '9');
commit;

INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10001', 'E');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10001', 'E01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10001', 'I');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10001', 'I01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10001', 'J');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10001', 'J02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10002', 'C');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10002', 'C01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10002', 'C02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'A');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'A01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'A02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'A03');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'A04');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'A05');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'B');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'B01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'B02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'C');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'C01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'C02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'D');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'D01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'D02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'D03');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'D04');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'E');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'E01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F03');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F04');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F05');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F06');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F07');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F08');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F09');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F10');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F11');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F12');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'F13');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'G');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'G01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'H');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'H01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'H02');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'H03');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'I');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'I01');
INSERT INTO SYS_ROLE_MENU (ROLE_NO, MENU_NO) VALUES ('10005', 'I02');
commit;


insert into TRANS_VALUE_ITEM (no, name, type)
values ('12', '金额转出', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('13', '日期范围', 1);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('14', '时间范围', 1);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('1', '现金收入', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('2', '现金支出', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('3', '手续费收入', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('4', '手续费支出', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('5', '新型交易', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('6', '获客', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('7', '线上渠道互动', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('8', '中间业务', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('9', '复杂交易', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('10', '长周期产品', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('11', '金额转入', 0);
commit;


insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EF', '在存款过程中，客户放钞后由于SP原因返回无钞的状态时，应用将钞币正常存储后需要记录可疑交易', '存款，SP返回无钞，钞币正常存储。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('00', '交易成功', '交易成功', '1');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('01', '交易失败，请联系发卡行', '交易失败，请联系发卡行', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('02', '特定条件下查询发卡方', '特定条件下查询发卡方', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('03', '无效商户', '无效商户', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('04', '没收卡', '没收卡', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('05', '不予承兑', '不予承兑', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('06', '出错', '出错', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('07', '特殊条件下没收卡', '特殊条件下没收卡', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('09', '请求正在处理中', '请求正在处理中', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('10', '部分金额批准', '部分金额批准', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('11', '重要人物批准（VIP）', '重要人物批准（VIP）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('12', '无效交易', '无效交易', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('13', '无效金额', '无效金额', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('14', '无效卡号', '无效卡号', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('15', '无此发卡行', '无此发卡行', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('16', '批准更新第三磁道', '批准更新第三磁道', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('20', '无效应答', '无效应答', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('21', '不作任何处理', '不作任何处理', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('22', '怀疑操作有误', '怀疑操作有误', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('23', '不可接受的交易费', '不可接受的交易费', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('25', '未能找到文件上记录', '未能找到文件上记录', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('30', '格式错误', '格式错误', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('31', '交换中心不支持的银行', '交换中心不支持的银行', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('33', '过期卡（没收卡）', '过期卡（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('34', '有作弊嫌疑（没收卡）', '有作弊嫌疑（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('35', '受卡方与安全保密部门联系（没收卡）', '受卡方与安全保密部门联系（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('36', '受限制的卡（没收卡）', '受限制的卡（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('37', '受卡方呼受理方安全保密部门（没收卡）', '受卡方呼受理方安全保密部门（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('38', '超过允许的个人识别号输入次数', '超过允许的个人识别号输入次数', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('39', '无此信用卡账户', '无此信用卡账户', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('40', '请求的功能尚不支持', '请求的功能尚不支持', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('41', '挂失卡（没收卡）', '挂失卡（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('42', '无此账户', '无此账户', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('43', '被窃卡（没收卡）', '被窃卡（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('44', '无此投资账户', '无此投资账户', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('51', '无足够的存款', '无足够的存款', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('52', '无此支票帐号', '无此支票帐号', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('53', '无此储蓄卡帐号', '无此储蓄卡帐号', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('54', '过期的卡', '过期的卡', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('55', '不正确的PIN', '不正确的PIN', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('56', '无此卡记录', '无此卡记录', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('57', '不允许持卡人进行的交易', '不允许持卡人进行的交易', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('58', '不允许终端处理的交易', '不允许终端处理的交易', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('59', '有作弊嫌疑', '有作弊嫌疑', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('60', '受卡方与安全保密部门联系', '受卡方与安全保密部门联系', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('61', '本日提款金额超限', '本日提款金额超限', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('62', '受限制的卡', '受限制的卡', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('63', '违反安全保密规定', '违反安全保密规定', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('64', '原始金额不正确', '原始金额不正确', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('65', '超出取款次数限制', '超出取款次数限制', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('66', '受卡方呼受理方安全保密部门', '受卡方呼受理方安全保密部门', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('67', '捕捉（没收卡）', '捕捉（没收卡）', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('68', '收到的回答太迟', '收到的回答太迟', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('75', '允许的输入PIN次数超限', '允许的输入PIN次数超限', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('79', 'ATM服务器和ATM对帐总数不符，要求传送交易明细。', 'ATM服务器和ATM对帐总数不符，要求传送交易明细。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('90', '日期切换正在处理', '日期切换正在处理', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('91', '发卡方或交换中心不能操作', '发卡方或交换中心不能操作', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('92', '金融机构或中间网络设施找不到或无法达到', '金融机构或中间网络设施找不到或无法达到', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('93', '交易违法、不能完成', '交易违法、不能完成', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('94', '重复交易', '重复交易', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('95', '调节控制错', '调节控制错', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('96', '系统异常、失效', '系统异常、失效', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('97', 'ATM/POS终端号找不到', 'ATM/POS终端号找不到', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('98', '交换中心收不到发卡方应答', '交换中心收不到发卡方应答', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('99', 'PIN格式错', 'PIN格式错', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A0', 'MAC鉴别失败', 'MAC鉴别失败', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A1', '转帐货币不一致', '转帐货币不一致', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A2', '有缺陷的成功', '有缺陷的成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A3', '转入行无此帐户', '转入行无此帐户', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A4', '有缺陷的成功', '有缺陷的成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A5', '有缺陷的成功', '有缺陷的成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A6', '有缺陷的成功', '有缺陷的成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A7', '安全处理失败', '安全处理失败', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('B1', '费用未缴或无欠费', '费用未缴或无欠费', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('C1', '受理方状态非法', '受理方状态非法', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D1', '机构状态错误', '机构状态错误', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D2', '日期错误', '日期错误', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D3', '无效的文件类型', '无效的文件类型', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D4', '已经处理过的文件', '已经处理过的文件', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D5', '无此文件', '无此文件', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D6', '接收者不支持', '接收者不支持', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D7', '文件锁定', '文件锁定', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D8', '为成功', '为成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D9', '文件长度不符', '文件长度不符', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('DA', '文件解压缩错', '文件解压缩错', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('DB', '文件名称错', '文件名称错', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('DC', '无法接收文件', '无法接收文件', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('N1', '未登折帐目已超限，交易不成功', '未登折帐目已超限，交易不成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Q1', '卡片认证失败', '卡片认证失败', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Y1', '脱机交易成功', '脱机交易成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Y3', '不能联机，脱机交易成功', '不能联机，脱机交易成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Z1', '脱机交易失败', '脱机交易失败', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Z3', '不能联机，脱机交易失败', '不能联机，脱机交易失败', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('ZZ', '需要重新写磁', '需要重新写磁', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-AT', '存款、取款、转账等交易通讯超时[交易报文发送成功，没有收到报主机返回报文] ，需要和主机核对帐务。', '交易发送成功，主机无返回。', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-TF', '存款、取款、转账交易通讯故障[交易报文发送失败，和主机连接不上]。', '交易发送失败，通讯故障。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-AE', '存款、取款、转账等交易主机授权报文解析出错[报文信息不足、报文类型不存在、MAC码不正确、授权码不存在、关键域：流水号、设备号、交易代码、币种、金额不匹配]，需要和主机核对帐务。', '主机报文出错。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DF', '取款时主机授权成功后，配钞或挖钞失败，但钞票未出设备[允许发送冲正交易]，需要和主机核对帐务。', '主机成功，挖钞失败。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PF', '取款时送钞失败；取款时出钞成功，客户遗忘，纸币回收失败；取款超时遗忘回收时卡钞[不允许发送冲正交易]；属长款。', '出钞成功，客户遗忘回收卡钞。', '2');
commit;

insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RT', '存款退钞正常，客户遗忘，回收正常；存款取消后，退钞正常，客户遗忘，回收正常；存款时退出拒钞，退钞正常，客户遗忘，回收正常；属长款。', '存款退钞，客户遗忘回收成功。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-VF', '存款验钞时卡钞，属长款。', '存款验钞卡钞。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JF', '存款验钞成功，存款取消后退钞时卡钞；存款验钞成功，存款取消后，客户遗忘回收卡钞；存款交易通讯故障，退钞卡钞；存款时退出拒钞，退钞卡钞；属长款。', '存款退钞卡钞。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RE', '存取款交易故障后，进行手工或机器自动复位[含机器重启自动]，正常回收纸币。这个错误代码是记录故障交易后机器复位回收钞票，一般不能单独出现。回收成功打印回收明细、钞箱张数 回收失败后只打印钞箱张数', '机器复位回收成功。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JT', '读卡器故障夹卡；交易故障后夹卡，设备复位回收卡。', '读卡器卡口有卡。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CT', '退卡后客户取卡遗忘，机器超时回收吞卡。', '客户遗忘，卡回收。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SF', '存款主机记帐授权成功，钞票进入钞箱时卡钞。存款交易成功，钞票入钞箱时故障，该故障客户页面提示和凭条打印是按正常的交易处理的，不影响帐务问题。', '存款主机记账成功，机器卡钞。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SC', '客户超时操作交易取消；客户选择取消交易；', '客户超时，交易取消。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HF', '存款交易通讯超时，收钞时卡钞；存款交易报文解析错，收钞时卡钞；存款交易主机拒绝，收钞时卡钞；需要和主机核对帐务。', '存款收钞卡钞。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EI', '密码输入无效，交易取消；金额输入无效，交易取消；帐号输入无效，交易取消；[一般应用的页面输入三次输入无效，交易取消，退卡]', '密码、金额、帐号输入次数过多，交易取消。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P1', '密码输入错误，重新输入', '密码输入错误，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A1', '金额输入错误，重新输入', '金额输入错误，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T1', '帐号输入错误，重新输入', '帐号输入错误，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P2', '两次输入转入密码不一致，重新输入', '两次输入转入密码不一致，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A2', '两次输入转入金额不一致，重新输入', '两次输入转入金额不一致，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T2', '两次输入转入帐号不一致，重新输入', '两次输入转入帐号不一致，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('OK', '交易成功。', '交易成功。', '1');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DE', '取款出钞金额和设备出钞张数不符', '取款出钞金额和设备出钞张数不符。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HT', '存款主机指示吞钞', '存款主机指示吞钞。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PO', '机器异常重启后，在启动时打印错误码，便于无纸化统计可疑交易', '机器异常重启，启动时打印错误码。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CO', '取款冲正交易超时', '取款冲正交易超时。', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CF', '取款冲正交易失败', '取款冲正交易失败。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-W1', '在出钞前的是否退卡页面操作超时[回收钞币，发起冲正交易，取消该笔取款交易]', '出钞前是否退卡页面操作超时。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-W2', '在出钞前选择先退卡，读卡器故障，退卡失败[回收钞币，发起冲正交易，取消该笔取款交易]', '出钞前选择退卡，退卡失败。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-W3', '在出钞前选择先退卡，退卡成功，客户取卡超时，卡被回收[回收钞币，发起冲正交易，取消该笔取款交易]', '出钞前选择退卡，退卡成功，卡超时回收。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PT', '取款时出钞成功，客户遗忘，纸币回收正常，属长款。', '出钞成功，客户遗忘回收成功。', '2');
commit;

insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('IND', '明细查询', '查询明细', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('OC', '开户', '开户', 0, 0, 5);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('INQ', '查询', '查询', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CWD', '取款', '取款', 0, 1, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CWC', '取款冲正', '取款冲正', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CDC', '存款确认', '存款确认', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ICQCC', '圈存冲正', '指定账户圈存冲正', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ICXJQCC', '现金圈存冲正', '现金圈存冲正', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('PSW', '改密', '改密', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CDP', '存款', '存款', 0, 1, 3);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ADP', '无卡存款', '无卡存款', 0, 1, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('BTFR', '行内转账', '行内转账', 0, 1, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('KTFR', '跨行转账', '跨行转账', 0, 1, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('FTLT', '定期转活期', '定期转活期', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('LTFT', '活期转定期', '活期转定期', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('LT1T', '活期转1天', '活期转1天', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('LT7T', '活期转7天', '活期转7天', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ICQC', '圈存', '圈存', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('TFR', '转账', '转账', 0, 1, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CASHIN', '加钞', '加钞', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('BFWD', '刷脸取款', '刷脸取款', 0, 1, 3);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('QRCWD', '二维码取款', '二维码取款', 0, 1, 3);
commit;


insert into USR_MONITOR_SELECT (user_no, monitor_type, org_no, monitor_status, sort, dev_no, dev_catalog, dev_vendor, dev_work_type, dev_away_flag, dev_atmc, dev_os, care_level, dev_location, monitor_interval, row_select, row_unselect, note, group_method, status_relationship, monitor_status_type, defined_monitor_status, dev_cash_flag)
values ('10001', '1', '10001', '11111111111111111111111111', '10', null, 0, 0, 0, 0, '0', '0', null, null, '20', 'dev_Run_Status|dev_Mod_Status|dev_Cashbox_Status|dev_Net_Status|devType|orgNo|ip|case', 'address|awayFlag|workType|idcCaptureBinCount|control|cashSum', '0', 0, 1, 1, '111111111000000000', null);
insert into USR_MONITOR_SELECT (user_no, monitor_type, org_no, monitor_status, sort, dev_no, dev_catalog, dev_vendor, dev_work_type, dev_away_flag, dev_atmc, dev_os, care_level, dev_location, monitor_interval, row_select, row_unselect, note, group_method, status_relationship, monitor_status_type, defined_monitor_status, dev_cash_flag)
values ('10001', '2', '10001', '11111111111111111111111111111', '10', null, 0, 0, 0, 0, '0', '0', null, null, '20', 'devRunStatus|devModStatus|devNetStatus|devType|orgNo|ip|case', 'address|awayFlag|workType|idcCaptureBinCount|control', '0', 0, 1, 1, '111111111000000000', null);
insert into USR_MONITOR_SELECT (user_no, monitor_type, org_no, monitor_status, sort, dev_no, dev_catalog, dev_vendor, dev_work_type, dev_away_flag, dev_atmc, dev_os, care_level, dev_location, monitor_interval, row_select, row_unselect, note, group_method, status_relationship, monitor_status_type, defined_monitor_status, dev_cash_flag)
values ('yqzhao', '1', '10001', '11111111111111111111111111', '10', null, 0, 0, 0, 0, '0', '0', null, null, null, 'null', 'null', '0', 1, 0, 0, null, null);
insert into USR_MONITOR_SELECT (user_no, monitor_type, org_no, monitor_status, sort, dev_no, dev_catalog, dev_vendor, dev_work_type, dev_away_flag, dev_atmc, dev_os, care_level, dev_location, monitor_interval, row_select, row_unselect, note, group_method, status_relationship, monitor_status_type, defined_monitor_status, dev_cash_flag)
values ('10001', '3', '10001', '11111111111111111111', '10', null, 0, 0, 0, 0, '0', '0', null, null, '20', 'devRunStatus|devModStatus|devNetStatus|devType|orgNo|ip|case', 'address|awayFlag|workType|idcCaptureBinCount|control', '0', 0, 1, 1, '1111111100000000', null);
commit;

INSERT INTO db_locks (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('ADSCANCELNOTIFYJOB_ACCESS', '0', '1971-01-01 00:00:00.000', '');
INSERT INTO db_locks (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('ADSINFOSYNCJOB_ACCESS', '0', '1971-01-01 00:00:00.000', '');
INSERT INTO db_locks (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('ADSMODELSYNCJOB_ACCESS', '0', '1971-01-01 00:00:00.000', '');
INSERT INTO db_locks (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('APPSMODELSYNCJOB_ACCESS', '0', '1971-01-01 00:00:00.000', '');
INSERT INTO db_locks (LOCKNAME, TAKEFLAG, TAKEUPTIME, TAKEUSER) VALUES('APPSVERSIONSYNCJOB_ACCESS', '0', '1971-01-01 00:00:00.000', '');


INSERT INTO notify_model  VALUES  (10001,1,1,0,'CASE:设备号:${devNo},设备地址:${address},设备模块:${devModule}');
INSERT INTO notify_model  VALUES  (10002,2,1,0,'CASE升级:设备号:${devNo},设备模块:${devModule},预期到场时间:${preOnsiteTime},预期关闭时间:${preCloseTime}。');                                              
INSERT INTO notify_model  VALUES  (10003,3,1,0,'CASE关闭:设备号:${devNo},设备模块:${devModule},实际关闭时长(分钟):${useCloseTime}分钟。');             
INSERT INTO notify_model  VALUES  (10004,4,1,0,'CASE挂起:设备号:${devNo},设备模块:${devModule},超时未处理，已挂起。');   
INSERT INTO notify_model  VALUES  (10005,1,1,1,'CASE:设备号:${devNo},设备地址:${address},设备模块:${devModule}');
INSERT INTO notify_model  VALUES  (10006,2,1,1,'CASE升级:设备号:${devNo},设备模块:${devModule},预期到场时间:${preOnsiteTime},预期关闭时间:${preCloseTime}。');                                              
INSERT INTO notify_model  VALUES  (10007,3,1,1,'CASE关闭:设备号:${devNo},设备模块:${devModule},实际关闭时长(分钟):${useCloseTime}分钟。');             
INSERT INTO notify_model  VALUES  (10008,4,1,1,'CASE挂起:设备号:${devNo},设备模块:${devModule},超时未处理，已挂起。');   
INSERT INTO notify_model  VALUES  (10010,1,2,1,'CASE创建通知:CASE号:${caseNo},设备号:${devNo},设备类型:${devType},故障类型:${catalogNo},故障模块:${devModule},故障代码:${faultCode},描述:${description},解决方法:${solution},所属机构:${orgNo},设备地址:${address},设备厂商:${devVendor},生成时间:${openTime},预期到场时间:${preOnsiteTime},预期关闭时间:${preCloseTime},实际关闭时长:${useCloseTime}');
INSERT INTO notify_model  VALUES  (10011,2,2,1,'CASE升级通知:CASE号:${caseNo},设备号:${devNo},设备类型:${devType},故障类型:${catalogNo},故障模块:${devModule},故障代码:${faultCode},描述:${description},解决方法:${solution},所属机构:${orgNo},设备地址:${address},设备厂商:${devVendor},生成时间:${openTime},预期到场时间:${preOnsiteTime},预期关闭时间:${preCloseTime},实际关闭时长:${useCloseTime}');
INSERT INTO notify_model  VALUES  (10012,3,2,1,'CASE关闭通知:CASE号:${caseNo},设备号:${devNo},设备类型:${devType},故障类型:${catalogNo},故障模块:${devModule},故障代码:${faultCode},描述:${description},解决方法:${solution},所属机构:${orgNo},设备地址:${address},设备厂商:${devVendor},生成时间:${openTime},预期到场时间:${preOnsiteTime},预期关闭时间:${preCloseTime},实际关闭时长:${useCloseTime}');
INSERT INTO notify_model  VALUES  (10013,4,2,1,'CASE挂起通知:CASE号:${caseNo},设备号:${devNo},设备类型:${devType},故障类型:${catalogNo},故障模块:${devModule},故障代码:${faultCode},描述:${description},解决方法:${solution},所属机构:${orgNo},设备地址:${address},设备厂商:${devVendor},生成时间:${openTime},预期到场时间:${preOnsiteTime},预期关闭时间:${preCloseTime},实际关闭时长:${useCloseTime}');

INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('adsFilePath', 'c:/zhyg/content/files/adv', NULL);
INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('adsResourceFilePath', 'c:/zhyg/content/files/resource', NULL);
INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('logoFilePath', 'c:/zhyg/content/files/logo', NULL);
INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('versionFilePath', 'c:/zhyg/content/files/version', NULL);

INSERT INTO SERVICE_PROP_SYSTEM(key_id, VALUE,NOTE) VALUES('syncXlinkOrgFlag','N','操作机构是否同步P端');
INSERT INTO SERVICE_PROP_SYSTEM(key_id, VALUE,NOTE) VALUES('syncXlinkDevFlag','N','操作设备是否同步P端');
INSERT INTO SERVICE_PROP_SYSTEM(key_id, VALUE,NOTE) VALUES('devServiceCompany','C:/servicePropSystem/devServiceCompany','设备维护商上传的文件存放位置');

commit;
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('remotePort', '50006');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('remoteFilePort', '50053');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('remoteFilePath', 'c:/zhyg/control/controlResult');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('remoteViewFilePath', 'c:/zhyg/control/remoteView');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('msgEncrypt', '0');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('defaultAtmLogPath', 'C:/WSAP/DATA/{log_date}.J');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('wsntAtmLogPath', 'C:/WSAPNT/PUBLIC/data/{log_date}.J');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('downloadBytesBuffer', '8');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('uploadBytesBuffer', '8');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('localFilePort', '50004');
insert into SERVICE_PROP_CONTROL (key_id, value)
values ('localIp', '10.2.6.139');
commit;
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('faultInfoSave', 'Y');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('activeCount', '0');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('dbAlias', 'shepherd');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('dbDriver', 'oracle.jdbc.driver.OracleDriver');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('dbUrl', 'jdbc:oracle:thin:@127.0.0.1:1521:orcl');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('dbUser', 'zhyg');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('dbPwd', 'zhyg');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('minConn', '3');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('maxConn', '100');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('simultaneousBuildThrottle', '10');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('houseKeepingTestSql', 'select sysdate from DUAL');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('messageEncrypt', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('systemLanguage', 'ATTR_zh_CN.properties');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('sensitiveMsg', 'PhoneNum,CustomerID,CustomerName,CheckOptName,CheckOptID');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('cashWarnAmount', '5000');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('txWarningTime', '120');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('txNoServiceTime', '240');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('localPort', '50003');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('localPortReceipt', '50008');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('caseOpenCloseNotifyFlag', 'YY');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('offlineInterval', '30');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('tcpSoTimeout', '20000');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('stopCheckStatus', 'STOP');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('localFilePort', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('multiCashType', '1');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('bankVersion', 'BANKCZ');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('faultInfoMonitor', 'N');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('faultUpdateNotifyFlag', 'N');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('activeMqQueueUrl', 'failover:tcp://127.0.0.1:61616');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('activeMqQueue', 'MONITOR');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('stopActualStartTime', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('cashEmptyCount', '0');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('calcInoperative', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('changeActionTypeInTrans', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('netCaseCreateFlag', 'true');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('netStatusJobTime', '2');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('addClearIDInCashClear', 'true');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('caseHandlerbyRealtimeMsg', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('statusMsgChangeDevStartTime', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('txReversalisChangeOriginal', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('txReversalTransType', 'CWC|GWC|TWC');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('changeIPNotEqualsDB', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('tranHistFlag', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('IccFlag', 'false');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('crdTransFlag', 'true');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('minTcpMessageThreadNum', '5');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('maxTcpMessageThreadNum', '20');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('maxTransferThreadNum', '20');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('minTransferThreadNum', '5');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('transferQueueSize', '2000');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('threadWaitTime', '60');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('messageQueueSize', '10000');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value)
values ('threadQueueSize', '5000');
commit;

INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('connTime', '20', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('delay4AppNotifyJob', '1', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('delay4VersionNotifyJob', '1', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isMessageEncrypt', 'true', NULL);
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
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('usepUrl', 'http://192.168.43.107:9111/versionAdsAndStandardSync', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('versionFilePath', 'c:/zhyg/content', NULL);

INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transPushSwitch', 'false', '交易推送开关');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transPushIp', '127.0.0.1', '交易推送注册ip');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transPushPort', '2000', '交易推送注册端口');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transQueueSwitch', 'true', '交易推送队列开关');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transQueueSize', '500', '交易推送队列最大长度');

INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('1', '1', '接口松动/接触不良');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('2', '1', '突然断电');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('3', '2', '清洁，常规维护');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('4', '2', '更换硬件');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('5', '3', '响应很快');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('6', '4', '迅速解决问题');


INSERT INTO apps_info_table (apps_id, apps_name, apps_type, apps_catalog, apps_status, logo_path, add_user, add_time, description) VALUES('ZJUAP', '全渠道统一平台', '1', '10001', '1', '', 'admin1', NULL, '平台');
INSERT INTO apps_version_table (logic_id, apps_id, version_bus_no, version_app_no, version_status, version_client_path, add_user, add_time, version_description, version_file_md5, version_seq_no, versionfilepath, VERSIONNOTIFYFLAG, TAKETIME) VALUES('0cdae922-1925-4d8b-a791-b4bbb2a3553a', 'ZJUAP', '001S', '1.0.1', '1', 'C:\\', 'admin1', '2019-06-23 22:00:00', '虚拟版本', NULL, '001000001', NULL, '2', '2019-07-01 19:26:08');

commit;
