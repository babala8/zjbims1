insert into CARD_TYPE_TABLE (no, card_type)
values ('001', '借记卡');
insert into CARD_TYPE_TABLE (no, card_type)
values ('002', '储蓄卡');
insert into CARD_TYPE_TABLE (no, card_type)
values ('003', '信用卡');
commit;

insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10001', '社交');
insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10002', '购物');
commit;

insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 2, '营业预警', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 3, '资源预警', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 4, '资源耗尽', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 5, '清机通知', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 6, '营业故障', 1, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 7, '纸少', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 8, '纸空', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 9, '钞少', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 10, '钞空', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 11, '存款箱满', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 12, '一般硬件故障', 2, 30, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0, '1');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 13, '严重硬件故障', 2, 30, 60, 60, 300, 300, 7200, 1, 1, 1, 0, '1');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 14, '钞箱故障', 3, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0, '1');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 15, '通讯故障', 1, 30, 60, 60, 120, 120, 7200, 1, 1, 1, 0, '0');
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


insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('CRS', '自动存取款机', '自动存取款机', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('CDM', '自动存款机', '自动存款机', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('ATM', '自动取款机', '自动取款机', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('BSM', '查询机', '查询机', '3', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('MTM', '大额存取款机', '大额存取款机', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('IST', '智能自助终端', '智能自助终端', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('BTS', '回单机', '回单机', '6', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('SFM', '填单机', '填单机', '7', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('CDT', '发卡机', '发卡机', '2', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('STM', '智慧柜员机', '智慧柜员机1', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('SQM', '叫号机', '叫号机', '3', '5');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('IAS', '智能广告屏', '智能广告屏', '4', '3');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('MDM', '实物领取机', '实物领取机', '4', '3');
commit;




insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10002', 'cash80AWI大堂式', '10003', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10004', 'A5-08穿墙式', '10002', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10005', 'A4-08', '10002', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10006', 'K1-08穿墙式', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10007', 'K2-08', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10009', '21S', '10004', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10010', 'PC2000XE', '10008', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10011', 'PC2050', '10008', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10008', 'cash80AWG大堂式', '10003', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10017', 'PC2050XEUSB', '10008', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10018', '21SEUSB', '10004', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10012', '21SE', '10004', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10013', 'cash80AWG穿墙式', '10003', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10014', 'cash80AWI穿墙式', '10003', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10019', 'CASH80ALN', '10003', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10015', 'BSM1511TF', '10009', 'BSM', null, null, null, '2');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10016', 'BSM1711TF', '10009', 'BSM', null, null, null, '2');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10020', 'CASH90ALN', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20018', '8500F', '20009', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20017', 'CWEA53', '20010', '10007', null, null, null, '2');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20019', '8500R', '20009', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10022', 'K3F', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20011', 'CS-80CN', '20007', 'SOR', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20015', '8000大堂', '20009', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20013', '8600R穿墙', '20009', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20014', '8600F大堂', '20009', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20016', '8100穿墙', '20009', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20008', 'BSM1511TN', '10009', 'BSM', null, null, null, '2');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20009', 'K4', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20010', 'cash80ALI', '10003', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10021', '神州', '10007', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20001', 'JBYD-LY3012(A)', '20001', 'COU', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20002', 'UV-500CNS', '20002', 'SOR', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20003', 'HT9000A', '20003', 'COU', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20004', 'QFJ-HT611', '20004', 'SOR', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20005', 'JBYDXD20108(A)', '20005', 'COU', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20006', 'JBYDXD2179(A)', '20005', 'SOR', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20007', 'JL-305', '20006', 'SOR', null, null, null, '0');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20020', '易柜通CRD-100穿墙式', '20011', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20021', '易柜通ICT-200大堂式', '20011', 'CRS', null, null, null, '1');
commit;


insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10002', '御银', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10003', '恒银', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10004', 'OKI', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10007', '神州金信', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10008', '西门子', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10009', '浪潮多媒体查询机', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20011', '弘盛', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20007', '清华同方', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20009', '东信', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20010', '兆维', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20001', '灵岳电子', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20002', '光荣', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20003', '康艺', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20004', '伊诺特', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20005', '中钞信达', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20006', '聚龙', null, null, '1');
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

insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('0', '紫金综合运管系统', null, null, null, null, null, 0);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A', '综合监控', null, '#00a8f3', null, null, 'zijin-icon-devMonitor', 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A02', 'ATM监控', null, null, 'tile_devMonitor.png', '/monitor/devMonitor', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A04', '回单机监控', null, null, 'tile_btsMonitor.png', '/monitor/btsMonitor', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A07', '交易监控', null, null, 'tile_transMonitor.png', '/monitor/transMonitor', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A08', '交易查询', null, null, 'tile_transSearch.png', '/monitor/transInfo', null, 8);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A10', '全行交易大屏', null, null, 'tile_bankMonitor_a.png', '/monitor/bankMonitorA', null, 10);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A11', '全行管理大屏', null, null, 'tile_bankMonitor_b.png', '/monitor/bankMonitorB', null, 11);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A12', '交易分析', null, null, 'tile_transactionAnalysis.png', '/monitor/transAnalysis', null, 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A13', '故障分析', null, null, 'tile_faultAnalysis.png', '/monitor/faultAnalysis', null, 13);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('B', '远程控制', null, '#ffb11a', null, null, 'zijin-icon-devManage', 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('B01', '设备控制', null, null, 'tile_devControl.png', '/remote/devControl', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('B02', '控制结果', null, null, 'tile_controlResult.png', '/remote/controlResult', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C', '版本管理', null, '#ff7f27', null, null, 'zijin-icon-checklist', 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C01', '应用管理', null, null, 'tile_appstore.png', '/version/appstore', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C02', '标杆管理', null, null, 'tile_benchmark.png', '/version/benchmark', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C04', '版本结果查询', null, null, 'tile_vision_result.png', '/version/appResult', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D', '广告管理', null, '#78c446', null, null, 'zijin-icon-icon_theme_setting', 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D01', '资源管理', null, null, 'tile_resource.png', '/content/resourceManage', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D02', '广告位管理', null, null, 'tile_advSpace.png', '/content/advertisementSpace', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D03', '广告制作', null, null, 'tile_advMake.png', '/content/advMake', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D04', '广告投放', null, null, 'tile_advRemote.png', '/content/advValid', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D05', '广告投放情况', null, null, 'tile_advRemote_info.png', '/content/advValidResult', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E', '报表统计', null, '#f2a000', null, null, 'zijin-icon-chart22', 14);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E02', '基础报表', null, null, 'tile_basic_statements.png', '/report/baseReport', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E03', '统计报表', null, null, 'tile_statistical_reports.png', '/report/statisticReport', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E04', '交易报表', null, null, 'Equipment-information.png', '/report/transReport', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E05', '考核报表', null, null, 'Equipment-information.png', '/report/assessReport', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E06', '定制报表', null, null, 'Equipment-information.png', '/report/customReport', null, 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F', '参数配置', null, '#5ed8a9', null, null, 'zijin-icon-options', 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F01', '机构管理', null, null, 'tile_userOrg.png', '/system/org', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F02', '自助银行管理', null, null, 'tile_selfHelpBank.png', '/system/selfHelpBank', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F03', '角色管理', null, null, 'tile_rolePrivilege.png', '/system/role', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F04', '用户管理', null, null, 'tile_userInfo.png', '/system/user', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F05', '用户密码', null, null, 'tile_passwd.png', '/system/password', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F06', '网点人员管理', null, null, 'tile_Network_management.png', '/system/bank', null, 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F07', '设备维护商管理', null, null, 'tile_factoryMaintain.png', '/system/devServiceManager', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F08', '设备维护员管理', null, null, 'tile_devMaintain.png', '/system/factory', null, 8);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F09', '设备管理', null, null, 'tile_device_management.png', '/system/dev', null, 9);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F10', '设备责任人管理', null, null, 'tile_device_people_manage.png', '/system/devResponsible', null, 10);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F11', '设备类型管理', null, null, 'tile_devcatalog.png', '/system/catalog', null, 11);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F12', '设备品牌管理', null, null, 'tile_vendor.png', '/system/vendor', null, 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F13', '设备型号管理', null, null, 'tile_devtype.png', '/system/type', null, 13);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F14', '设备模块', null, null, 'tile_modCatalog.png', '/system/modCatalog', null, 14);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F15', '日志查询', null, null, 'tile_log.png', '/system/log', null, 15);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G', '日常维护', null, '#22b9e8', null, null, 'zijin-icon-Development-mode', 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G01', '故障综合查询', null, null, 'title_fault_query.png', '/maintain/faultQuery', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G02', '吞卡管理', null, null, 'tile_csManager.png', '/maintain/retainCard', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G04', '设备参数设置', null, null, 'tile_devparamSetting.png', '/maintain/devParam', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G07', '信息通知模板', null, null, 'tile_notifyModel.png', '/system/notifyModel', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G08', '故障响应设定', null, null, 'tile_dev_response.png', '/system/sysParam', null, 8);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G09', '设备停机管理', null, null, 'tile_devStop.png', '/system/devStop', null, 9);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G10', '黑名单管理', null, null, 'tile_cardInfo.png', '/system/blackListInfo', null, 10);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G11', '机构工作时间', null, null, 'tile_worktime_range.png', '/system/orgWorkTime', null, 11);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G12', '公告管理', null, null, 'tile_bulletin.png', '/system/bulletin', null, 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G13', '卡表管理', null, null, 'tile_cardInfo.png', '/system/cardInfo', null, 13);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G14', '参数管理', null, null, 'tile_globalCfg.png', '/system/globalCfg', null, 14);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G15', '我的申请', null, null, 'tile_myapply.png', '/system/myApply', null, 15);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G16', '我的审批', null, null, 'tile_myaudit.png', '/system/myAudit', null, 16);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G17', '停机明细查询', null, null, 'tile_devStop.png', '/system/devStopDetail', null, 17);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G18', '工单管理', null, null, 'tile_workOrder.png', '/maintain/workOrder2', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H', '回单卡管理', null, '#22b9e8', null, null, 'zijin-icon-devManage', 9);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H01', '回单卡领入管理', null, null, 'tile_cardInfo.png', '/returnManage/cardCollection', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H02', '回单卡关联账户', null, null, 'tile_btsMonitor.png', '/returnManage/associated', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H03', '回单卡挂失换卡', null, null, 'tile_btsMonitor.png', '/returnManage/replaced', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M', '电子流水', null, '#00a8f3', null, null, 'zijin-icon-devMonitor', 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M01', '交易流水查询', null, null, 'Equipment-information.png', '/monitor/pjsLogMonitor', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M02', '无纸化解绑', null, null, 'pjsTermMonitor.png', '/monitor/pjsTermMonitor', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M03', '无纸化流水监控', null, null, 'tile_wuzhihua_monitor.png', '/monitor/pjsMonitor', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N', '冠字号管理', null, '#5ed8a9', null, null, 'zijin-icon-devManage', 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N01', '交易查冠字号', null, null, 'tile_nts_txQryNsn.png', '/ntsManage/txQryNsn', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N02', '冠字号查交易', null, null, 'tile_nts_nsnQryTx.png', '/ntsManage/nsnQryTx', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N03', '黑名单版本管理', null, null, 'tile_nts_version.png', '/ntsManage/version', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N04', '黑名单配置', null, null, 'tile_nts_blank.png', '/ntsManage/blank', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N05', '黑名单下发', null, null, 'tile_nts_issue.png', '/ntsManage/issue', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N06', '黑名单下发记录', null, null, 'tile_nts_issueList.png', '/ntsManage/issueList', null, 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N07', '可疑规则配置', null, null, 'tile_nts_susReg.png', '/ntsManage/susReg', null, 7);
commit;

insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('69', '执行文件', 'B01', '设备控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('19', '增加', 'C01', '应用', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('20', '修改', 'C01', '应用', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('21', '删除', 'C01', '应用', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('1', '增加', 'F01', '机构', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('2', '修改', 'F01', '机构', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('3', '删除', 'F01', '机构', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('4', '审核', 'F01', '机构', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('5', '增加', 'F03', '角色', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('6', '修改', 'F03', '角色', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('7', '删除', 'F03', '角色', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('8', '审核', 'F03', '角色', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('9', '增加', 'F04', '用户', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('10', '修改', 'F04', '用户', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('11', '删除', 'F04', '用户', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('12', '重置密码', 'F04', '用户', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('13', '解锁', 'F04', '用户', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('14', '审核', 'F04', '用户', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('15', '增加', 'F09', '设备', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('16', '修改', 'F09', '设备', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('17', '删除', 'F09', '设备', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('18', '审核', 'F09', '设备', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('22', '增加', 'C02', '标杆', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('23', '修改', 'C02', '标杆', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('24', '删除', 'C02', '标杆', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('25', '部署', 'C02', '标杆', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('26', '分配', 'C02', '标杆', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('27', '禁用', 'C01', '应用', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('43', '设备软硬件信息表', 'E02', '基础报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('44', '设备版本信息表', 'E02', '基础报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('42', '设备基本信息表', 'E02', '基础报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('45', '故障情况统计表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('46', '开机率统计报表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('47', '开机率明细报表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('48', '设备数量统计报表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('49', '吞卡明细报表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('50', '设备加钞记录表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('51', '设备缺纸缺钞统计表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('52', '设备缺纸缺钞明细表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('53', '手续费统计报表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('54', 'ATM加钞统计报表', 'E03', '统计报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('55', '支行交易排序表', 'E04', '交易报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('56', 'ATM可疑交易表', 'E04', '交易报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('57', '交易明细表', 'E04', '交易报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('58', '交易统计报表', 'E04', '交易报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('59', '机构收益调整报表', 'E04', '交易报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('60', 'ATM现金存量表', 'E04', '交易报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('61', '机型考核报表', 'E05', '考核报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('62', '管机员考核表', 'E05', '考核报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('63', '维护商考核', 'E05', '考核报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('64', '管机员考核明细表', 'E05', '考核报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('65', '定制-设备基本信息报表', 'E06', '定制报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('66', '定制-开机率统计报表', 'E06', '定制报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('67', '定制-交易统计报表', 'E06', '定制报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('68', '定制-手续费统计报表', 'E06', '定制报表', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('70', '删除文件', 'B01', '设备控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('28', '远程抓屏', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('29', '远程浏览', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('30', '设备重启', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('31', '关机', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('32', '开启服务', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('33', '暂停服务', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('34', '提取日志', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('35', '软件信息', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('36', '硬件信息', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('37', '系统信息', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('38', '进程信息', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('39', '强制复位', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('40', '状态检测', 'B01', '远程控制', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('41', '网络检测', 'B01', '远程控制', null, null, 'N');

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


-- 机构级别(重庆银行)
insert into SYS_ORG_TYPE (no, type, grade)
values ('FH', '分行', '2');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZHH', '支行', '3');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZHH2', '二级支行', '4');
insert into SYS_ORG_TYPE (no, type, grade)
values ('YYWD', '营业网点', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZZWD', '自助网点', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('SQWD', '社区网点', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZH', '总行', '1');
commit;

INSERT INTO SYS_ORG (NO, NAME, PARENT_ORG, LEFT_NO, RIGHT_NO, ORG_TYPE, MONEYORG_FLAG, X, Y, ADDRESS, LINKMAN, TELEPHONE, MOBILE, FAX, EMAIL, BUSINESS_RANGE, CUP_AREA_CODE, ADDRESS_CODE, AREA_NO_PROVINCE, AREA_NO_CITY, AREA_NO_COUNTY, AREA_TYPE, ORG_PHYSICS_CATALOG, NOTE, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS)
VALUES('0000', '总行', NULL, 1, 6, 'ZH', NULL, NULL, NULL, '郑州市', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO SYS_ORG (NO, NAME, PARENT_ORG, LEFT_NO, RIGHT_NO, ORG_TYPE, MONEYORG_FLAG, X, Y, ADDRESS, LINKMAN, TELEPHONE, MOBILE, FAX, EMAIL, BUSINESS_RANGE, CUP_AREA_CODE, ADDRESS_CODE, AREA_NO_PROVINCE, AREA_NO_CITY, AREA_NO_COUNTY, AREA_TYPE, ORG_PHYSICS_CATALOG, NOTE, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS)
VALUES('0100', '分行01', '0000', 2, 5, 'FH', NULL, NULL, NULL, '郑州市金水区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO SYS_ORG (NO, NAME, PARENT_ORG, LEFT_NO, RIGHT_NO, ORG_TYPE, MONEYORG_FLAG, X, Y, ADDRESS, LINKMAN, TELEPHONE, MOBILE, FAX, EMAIL, BUSINESS_RANGE, CUP_AREA_CODE, ADDRESS_CODE, AREA_NO_PROVINCE, AREA_NO_CITY, AREA_NO_COUNTY, AREA_TYPE, ORG_PHYSICS_CATALOG, NOTE, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS)
VALUES('0110', '支行0101', '0100', 3, 4, 'ZHH', NULL, NULL, NULL, '郑州市金水区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);


INSERT INTO SYS_USER (NO, PASSWD, NAME, STATUS, ONLINE_FLAG, ROLE_NO, ORG_NO, PHONE, MOBILE, EMAIL, LOGIN_IP, LOGIN_TIME, PASSWD_EXPIRATION, PASSWD_ERROR)
VALUES('admin1', '3ac751c1478699664bcc11b5efc04fac', '超级管理员1', '1', '1', '10001', '0000', NULL, NULL, NULL, NULL, '2019-11-19 00:45:18', '2020-05-18', 0);
INSERT INTO SYS_USER (NO, PASSWD, NAME, STATUS, ONLINE_FLAG, ROLE_NO, ORG_NO, PHONE, MOBILE, EMAIL, LOGIN_IP, LOGIN_TIME, PASSWD_EXPIRATION, PASSWD_ERROR)
VALUES('admin2', '3ac751c1478699664bcc11b5efc04fac', '超级管理员2', '1', '1', '10001', '0000', NULL, NULL, NULL, NULL, '2019-11-19 00:43:49', '2020-05-18', 0);

insert into SYS_ROLE (no, name, org_type, note)
values ('10001', '总行超级管理员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10002', '总行系统审核员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1567128804305', '分行运维管理员', 'FH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1569050691980', '总行系统管理员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1569050691980|10002', '总行系统管理员,总行系统审核员', null, '组合角色：1569050691980|10002');
insert into SYS_ROLE (no, name, org_type, note)
values ('1570849215296', '外包公司监控操作员', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571107123263', '总行ATM数据监控管理员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571107769804', '总行广告机管理员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571108339626', '支行系统管理员', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571105709410', '总行版本管理员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571127145493', '分行系统管理员', 'FH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571107280513', '总行回单机管理员', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571110051529', '支行运维管理员', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10002|1569050691980', '总行系统审核员,总行系统管理员', null, '组合角色：10002|1569050691980');
insert into SYS_ROLE (no, name, org_type, note)
values ('10001|1571105709410', '总行超级管理员,总行版本管理员', null, '组合角色：10001|1571105709410');
insert into SYS_ROLE (no, name, org_type, note)
values ('1571105709410|1569050691980', '总行版本管理员,总行系统管理员', null, '组合角色：1571105709410|1569050691980');
insert into SYS_ROLE (no, name, org_type, note)
values ('1569050691980|1571105709410', '总行系统管理员,总行版本管理员', null, '组合角色：1569050691980|1571105709410');
insert into SYS_ROLE (no, name, org_type, note)
values ('1571625033761', '二级支行系统管理员', 'ZHH2', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571642786109', '二级支行运维管理员', 'ZHH2', null);
commit;


insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '1');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '2');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '3');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '4');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '5');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '6');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '7');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '8');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '9');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '10');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '11');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '12');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '13');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '14');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '15');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '16');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '17');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10001', '18');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '10');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '11');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '14');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '15');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '16');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '17');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '18');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '5');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '6');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '7');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '8');
insert into SYS_ROLE_BUTTON (role_no, button_no)
values ('10002', '9');

insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F01');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F02');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F03');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F04');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F05');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F06');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F07');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F08');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F09');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F10');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F11');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F12');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F13');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F14');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'F15');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'G');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'G15');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10001', 'G15');

insert into SYS_ROLE_MENU (role_no, menu_no) values ('10002', 'F');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10002', 'F03');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10002', 'G');
insert into SYS_ROLE_MENU (role_no, menu_no) values ('10002', 'G16');

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
values ('LOC-EF', '在存款过程中，客户放钞后由于SP原因返回无钞的状态时，应用将钞币正常存储后需要记录可疑交易', '存款失败，钞票被取走', '2');
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
values ('LOC-AT', '很抱歉，通讯故障，交易被取消', '通讯超时，交易被取消,需要和主机核对帐务', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-TF', '很抱歉，通讯故障，交易被取消', '通讯故障，交易被取消,需要和主机核对帐务', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-AE', '交易失败，请联系发卡行', '交易信息解析出错，交易被取消,需要和主机核对帐务', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DF', '很抱歉，设备故障，交易已被取消', '取款时主机授权成功后，配钞或挖钞失败，但钞票未出设备,需要和主机核对帐务。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PF', '很抱歉，设备故障，如果您的钞票被回收，请与银行联系', '取款时送钞失败或纸币回收失败或卡钞，属长款', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RT', '很抱歉，操作超时，钞票被回收，请与银行联系', '操作超时，钞票被回收', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-VF', '很抱歉，设备故障，如果您的钞票被暂存，请与银行联系', '存款验钞时卡钞，属长款。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JF', '很抱歉，设备故障，如果您的钞票被回收，请与银行联系', '退钞卡钞或客户遗忘回收卡钞，属长款。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RE', '设备复位回收钞票失败', '设备复位回收钞票失败', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JT', '设备故障，磁卡退出失败，请与银行联系', '读卡器故障夹卡或交易故障后夹卡，设备复位回收卡', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CT', '操作超时，您的磁卡被回收，请与银行联系', '退卡后客户取卡遗忘，机器超时回收吞卡。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SF', '交易成功', '交易成功', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SC', '很抱歉，交易因故未能完成，请与银行联系', '客户超时操作交易取消或客户选择取消交易', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HF', '很抱歉，设备故障，如果您的钞票被暂存，请与银行联系', '存款交易收钞时卡钞，需要和主机核对帐务。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EI', '多次输入错误，交易被取消', '多次输入错误，交易被取消', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P1', '密码输入错误，重新输入', '密码输入错误，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A1', '金额输入错误，重新输入', '金额输入错误，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T1', '转入账号无效', '帐号输入错误', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P2', '两次输入密码不一致', '两次输入密码不一致', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A2', '两次输入转入金额不一致，重新输入', '两次输入转入金额不一致，重新输入。', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T2', '两次输入转入帐号不一致', '两次输入转入帐号不一致', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('OK', '交易成功。', '交易成功。', '1');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DE', '很抱歉，交易因故未能完成，请与银行联系', '取款出钞金额和设备出钞张数不符', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HT', '很抱歉，交易因故未能完成，交易被取消', '交易因故未能完成,存款交易时表示：钱已暂存,请与银行联系', '2');
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
values ('LOC-PT', '很抱歉，取钞超时，钞票被回收，请与银行联系', '取款时出钞成功，客户遗忘，纸币回收正常，属长款。', '2');
commit;

insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ADDCASH', '加钞确认', '加钞确认', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ADP', '无卡存款', '无卡存款', 0, 1, 2, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CDP', '存款', '存款', 0, 1, 3, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CERT', '证书更新', '证书更新', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CWC', '取款冲正', '取款冲正', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CWD', '取款', '取款', 0, 1, 1, '1', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CXGYXX', '柜员信息查询', '柜员信息查询', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DGDZDXZ', '对公分户账对账单查询', '对公分户账对账单查询', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DKHKJYPZCX', '贷款还款凭证查询', '贷款还款凭证查询', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DXYZM', '短信验证码', '短信验证码', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DZYZXZ', '电子印章下载', '电子印章下载', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('FCC', '非指账圈存冲正', '非指账圈存冲正', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('FSC', '刷脸取款冲正', '刷脸取款冲正', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('FSW', '刷脸取款', '刷脸取款', 0, 0, 1, '1', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('GRMXCX', '个人活期明细对账单查询', '个人活期明细对账单查询', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('GYDLYZ', '柜员登陆验证', '柜员登陆验证', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('HDHZ', '回单打印回执', '回单打印回执', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ICQC', '指定账户圈存', '指定账户圈存', 0, 0, 1, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ICQCC', '指定账户圈存冲正', '指定账户圈存冲正', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ICS', '写卡通知', '写卡通知', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('IDI', '身份证有效期查询', '身份证有效期查询', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('IDV', '证脸对比', '证脸对比', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('IND', '查询明细', '查询明细', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INH', '户名查询', '户名查询', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INM', '身份证查账号', '身份证查账号', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INQ', '余额查询', '余额查询', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INQC', '查询积分', '查询积分', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ITFR', '转账撤销', '转账撤销', 0, 0, 1, '4', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ITFRR', '转账撤销查询', '转账撤销查询', 0, 0, 1, '4', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ITFRS', '转账签约查询', '转账签约查询', 0, 0, 1, '4', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('LXQDPZCX', '存款利息清单查询', '存款利息清单查询', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('NCW', '无卡取款', '无卡取款', 0, 0, 1, '1', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('NFAQC', '非指定账户圈存', '非指定账户圈存', 0, 0, 1, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('PIN', '修改密码', '修改密码', 0, 0, 1, null, '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('PWDC', '验密认证', '验密认证', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('SUSP', '可疑交易通知', '可疑交易通知', 0, 0, 1, null, '0');
--此处C端有BUG，目前转账和转账签约都是送的TFRS，暂时屏蔽转账签约的配置，只保留TFRS-转账
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('TFRS', '转账', '转账', 0, 1, 1, '4', '1');
--此处C端有BUG，目前转账和转账签约都是送的TFRS，暂时屏蔽转账签约的配置
--insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
--values ('TFRS', '转账签约', '转账签约', 0, 0, 1, '4', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('TKTZ', '吞卡通知', '吞卡通知', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('WXYECX', '查询柜员尾箱余额', '查询柜员尾箱余额', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('XCC', '现金圈存冲正', '现金圈存冲正', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('XJQC', '现金圈存', '现金圈存', 0, 0, 1, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('XZJYPZCX', '现转交易凭证查询', '现转交易凭证查询', 0, 0, 1, '3', '1');
commit;

--添加报表定时任务锁 add by zhangyun
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('DEVPARAMSET_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('DAY_TASK_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('HOUR_TASK_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('MINUTES_TASK_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('MONTH_TASK_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('YEAR_TASK_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('ADSCANCELNOTIFYJOB_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('ADSINFOSYNCJOB_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('ADSMODELSYNCJOB_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('APPSMODELSYNCJOB_ACCESS', '0', null, null);
insert into DB_LOCKS (lockname, takeflag, takeuptime, takeuser)
values ('APPSVERSIONSYNCJOB_ACCESS', '0', null, null);
commit;


insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10001, 1, 1, 1, '银行故障生成通知,设备号:${devNo},所属机构:${orgNo},故障类型:${catalogNo},设备模块:${devModule},设备品牌:${devVendor},生成时间:${openTime}。');
insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10002, 2, 1, 1, '银行故障升级通知,设备号:${devNo},所属机构:${orgNo},故障类型:${catalogNo},设备模块:${devModule},设备品牌:${devVendor},预期关闭时间:${preCloseTime}。');
insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10003, 3, 1, 1, '银行故障关闭通知,设备号:${devNo},所属机构:${orgNo},故障类型:${catalogNo},设备品牌:${devVendor},实际关闭时间:${useCloseTime}。');
insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10004, 4, 1, 0, 'CASE挂起:设备号:${devNo},设备模块:${devModule},超时未处理，已挂起。');
commit;

insert into SERVICE_PROP_CONTENT (key_id, value, note)
values ('canIssueBySelf', 'N', '是否可下发本人制作的广告、版本');
insert into SERVICE_PROP_CONTENT (key_id, value, note)
values ('adsFilePath', '/share/zjuap/ShareDir/', null);
insert into SERVICE_PROP_CONTENT (key_id, value, note)
values ('adsResourceFilePath', '/share/zjbims/content/', null);
insert into SERVICE_PROP_CONTENT (key_id, value, note)
values ('logoFilePath', '/share/zjbims/content/', null);
insert into SERVICE_PROP_CONTENT (key_id, value, note)
values ('versionFilePath', '/share/zjuap/ShareDir/', null);
commit;

insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('helpUrl', '/share/zjbims/help/综合运管帮助手册_cq.doc', '帮助手册');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('syncXlinkOrgFlag', 'Y', '操作机构是否同步P端');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('syncXlinkDevFlag', 'Y', '操作设备是否同步P端');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('devServiceCompany', '/share/zjbims/tempFile/devServiceCompany', '设备维护商上传的文件存放位置');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('devStopStartMinDays', '7', '设备停机设定开始时间距当前时间的最小期限');
commit;

insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('remotePort', '50006', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('remoteFilePort', '50053', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('remoteFilePath', '/share/zjbims/control/controlResult', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('remoteViewFilePath', '/share/zjbims/control/remoteView', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('msgEncrypt', '0', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('defaultAtmLogPath', 'C:/WSAP/DATA/{log_date}.J', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('wsntAtmLogPath', 'C:/WSAPNT/PUBLIC/data/{log_date}.J', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('downloadBytesBuffer', '100', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('uploadBytesBuffer', '8', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('localFilePort', '50004', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('localIp', '10.255.0.14', null);
insert into SERVICE_PROP_CONTROL (key_id, value, note)
values ('zjuapAtmLogPath', 'C:/ZJUAPClient/PUBLIC/data/{log_date}.J', null);
commit;

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

INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('FlexiDetailInQuiry', '查询明细', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('Inquiry', '查询余额', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('LifePayment', '生活缴费', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('LiveToDHT', '活期转定', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('NTATMWithdrawal', '取款', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('PassbookAddRecord', '存折补登', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('PublicApp', '公共APP', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('ReceiptPrint', '回单打印', '3', '10001', '1', NULL, 'wangtao', '2019-11-21 02:38:47', 'app描述');
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('SMOpenPersonalAccount', '发卡', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('SMTransfer_HNZZ', '行内转账', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('SMTransfer_KHZZ', '跨行转账', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('ZJUAP', '全渠道统一平台', '1', '10001', '1', NULL, 'admin1', NULL, '平台');
commit;
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('bc078b35-596b-4bf7-89cb-ff9998e2230f', 'FlexiDetailInQuiry', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '查询明细', NULL, '001000000', '/home/shareDir/FlexiDetailInQuiry/FlexiDetailInQuiry_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('95c0b56a-8e3a-4ea0-9fcb-92998598969d', 'Inquiry', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '查询余额', NULL, '001000000', '/home/shareDir/Inquiry/Inquiry_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('2717cd2e-de79-4115-8a61-935ae1af5f37', 'LifePayment', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '生活缴费', NULL, '001000000', '/home/shareDir/LifePayment/LifePayment_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('478238cc-888e-4d08-8b15-d033b2872940', 'LiveToDHT', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '活期转定', NULL, '001000000', '/home/shareDir/LiveToDHT/LiveToDHT_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('e1006e1f-134d-4a93-905b-8f2aa61e07cd', 'NTATMWithdrawal', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '取款', NULL, '001000000', '/home/shareDir/NTATMWithdrawal/NTATMWithdrawal_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('b868b648-f42f-422d-9e0b-90845630215d', 'PassbookAddRecord', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '存折补登', NULL, '001000000', '/home/shareDir/PassbookAddRecord/PassbookAddRecord_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('08ecfe77-b274-4043-b059-00ad952c69a9', 'PublicApp', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '公共APP', NULL, '001000000', '/home/shareDir/PublicApp/PublicApp_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('4b2e04a5-19c0-4d35-9106-64cf00c5fb8e', 'ReceiptPrint', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '回单打印', NULL, '001000000', '/home/shareDir/ReceiptPrint/ReceiptPrint_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('9cc0a94c-60ff-448d-af82-921c8822db60', 'SMOpenPersonalAccount', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '发卡', NULL, '001000000', '/home/shareDir/SMOpenPersonalAccount/SMOpenPersonalAccount_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('e460ceb4-d944-4974-929e-9ec7fc1dd327', 'SMTransfer_HNZZ', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '行内转账', NULL, '001000000', '/home/shareDir/SMTransfer_HNZZ/SMTransfer_HNZZ_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('e460ceb4-d944-4974-929e-9ec7fc1dd328', 'SMTransfer_KHZZ', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '跨行转账', NULL, '001000000', '/home/shareDir/SMTransfer_KHZZ/SMTransfer_KHZZ_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('0cdae922-1925-4d8b-a791-b4bbb2a3553a', 'ZJUAP', '001S', '1.0.0', '1', 'C:/', 'admin1', '2019-06-23 22:00:00', '全渠道统一平台', NULL, '001000000', NULL, '2', '2019-10-23 19:26:08');
commit;
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('4d4c7bbc-f61e-4311-ae07-913f2cb56d58', 'Inquiry', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('a8e6f8e5-03fa-48be-a4e4-7889c975032f', 'LifePayment', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('81730f69-a27c-4b21-b24a-c56d74d6390f', 'ZJUAP', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('fbc78475-8cc9-4468-83b0-7ed72b92457b', 'ZJUAP', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('82d609e2-5eb8-4a91-aecc-2a050fc2e600', 'FlexiDetailInQuiry', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('493fa290-9ce1-4f30-97ac-c9ca97c84933', 'FlexiDetailInQuiry', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('c9561e76-c4b4-4106-8340-90b69b626cd2', 'Inquiry', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('3b5c0604-c05a-4b9c-b2b8-1e14dcac23f2', 'LifePayment', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('778fcb29-c6e8-49a0-9092-4c1d1feee436', 'LiveToDHT', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('c1a64337-5598-4529-95ea-b041f8624859', 'LiveToDHT', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('07a77ffb-b3e5-40e3-852c-31e314394f67', 'NTATMWithdrawal', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('448ff91d-e7eb-4c2d-8e63-6a6fb432e8dc', 'NTATMWithdrawal', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('a74eb782-43db-4444-b443-8797a815227e', 'PassbookAddRecord', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('12d98f01-b3d3-4c3b-a62e-11991f9b4690', 'PassbookAddRecord', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('8ce6eeec-ded3-4966-a1e7-c952a7e6064b', 'PublicApp', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('5fc77fc3-3a9d-449a-b489-50a292bb2d87', 'PublicApp', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('1f54c0aa-f8b6-4154-be4e-9148edee00c3', 'SMOpenPersonalAccount', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('7581f84b-1f37-4090-94f4-7b05a9d8f30f', 'SMOpenPersonalAccount', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('c4c6a281-7c2f-42fc-8a79-e9a5ebb9bf1d', 'SMTransfer_HNZZ', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('7b908b7d-7758-47e4-a890-a76dde93bdd0', 'SMTransfer_HNZZ', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('5f5048c3-7d40-4552-8bd6-d93d015e3315', 'SMTransfer_KHZZ', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('5b2f5a50-7245-4eed-be2f-160f11599636', 'SMTransfer_KHZZ', 'BSM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('048208f3-3183-4209-93eb-dfc67eda150b', 'CreditPayment', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('050733ba-5092-4411-bb02-9f459168287c', 'CreditTransfer', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('1aed26d5-206a-4d82-9951-07d229ad6c38', 'PersonalInformationModification', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('4b9e1636-a3c3-4985-942a-d2180715aac4', 'FinancialServicesDan', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('6f564e40-4881-46b5-9699-23e20dd315e0', 'FinancialServicesJin', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('7cf7d02e-507a-4b1d-955a-e04b836a0bc3', 'Details', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('98dba930-ad2f-4c33-b4e9-7f2e83edfa4a', 'HandleNewCard', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('990c54e0-1b3b-4a4c-b220-99e0a249d86e', 'ComprehensiveContract', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('c020c12e-fd22-4451-a012-671789046b31', 'Financial', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('c2bf1f9c-626c-4278-9f96-33aae38c433c', 'PayTrafficFine', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('e0b2a18f-1973-4ebb-a943-6b973166963a', 'Transfer', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('f5770889-4c9f-43d7-9746-aa39efdfc775', 'NoCardTransfer', 'CDT');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('c43a5b9a-9927-43b6-a29d-8173af4dea9c', 'ReceiptPrint', 'ATM');
INSERT INTO APPS_PROJ_APPLY_RANGE (LOGICID, APPSID, LIMIT_CATALOG) VALUES('6590623d-5d8b-49ed-bcc3-986864da364a', 'ReceiptPrint', 'CDT');
commit;
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('d1487dba-b6f3-4f1f-885d-13565a95267d', 'FlexiDetailInQuiry', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('75c94f38-be20-4108-bf70-6d8fb8c892c0', 'Inquiry', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('7602973e-102f-4566-9e7c-d931406f1559', 'LifePayment', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('531821ef-c57c-4570-b84c-4c8f7562f6d9', 'LiveToDHT', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('7be5f47f-4634-47e5-9682-4bf168d0fb0a', 'NTATMWithdrawal', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('6ca72abc-9aef-4661-86e9-5572f0cdff50', 'PassbookAddRecord', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('b44c0ba6-0e2a-4696-8811-85e6c6d2d1d9', 'PublicApp', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('95ef3b6c-f0fe-4e38-bf0c-b3e934abf11a', 'ReceiptPrint', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('5c8fc03a-a669-42c4-aa75-1176633a7bf2', 'SMOpenPersonalAccount', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('4e0c3d17-9f0a-4be9-a5f2-2c934b08d80b', 'SMTransfer_HNZZ', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('8e1ef314-43f8-4249-8a2c-13b2f088feae', 'SMTransfer_KHZZ', '1.0.0', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
INSERT INTO APPS_VER_APPLY_DEPEND (LOGICID, APPSID, VERSIONAPPNO, RANGETYPE, PERVERAPPNO, PERVERSEQNO, PEROTHERAPPSID, PERMINOTHERVERAPPNO, PERMINOTHERVERSEQNO) VALUES('4d2f9048-ac2d-4231-8490-28a9c5672451', 'ReceiptPrint', '1.0.1', '2', NULL, NULL, 'ZJUAP', '1.0.0', '001000000');
commit;


insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('50', '重庆', '1', '', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('51', '四川', '1', '', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('52', '贵州', '1', '', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('61', '陕西', '1', '', '');

insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5001', '市辖区', '2', '50', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5002', '县', '2', '50', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5101', '成都市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5103', '自贡市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5104', '攀枝花市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5105', '泸州市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5106', '德阳市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5107', '绵阳市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5108', '广元市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5109', '遂宁市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5110', '内江市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5111', '乐山市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5113', '南充市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5114', '眉山市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5115', '宜宾市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5116', '广安市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5117', '达州市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5118', '雅安市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5119', '巴中市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5120', '资阳市', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5132', '阿坝藏族羌族自治州', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5133', '甘孜藏族自治州', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5134', '凉山彝族自治州', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5201', '贵阳市', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5202', '六盘水市', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5203', '遵义市', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5204', '安顺市', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5205', '毕节市', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5206', '铜仁市', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5223', '黔西南布依族苗族自治州', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5226', '黔东南苗族侗族自治州', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5227', '黔南布依族苗族自治州', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6101', '西安市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6102', '铜川市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6103', '宝鸡市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6104', '咸阳市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6105', '渭南市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6106', '延安市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6107', '汉中市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6108', '榆林市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6109', '安康市', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6110', '商洛市', '2', '61', '');

insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510101', '市辖区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510104', '锦江区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510105', '青羊区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510106', '金牛区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510107', '武侯区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510108', '成华区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510112', '龙泉驿区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510113', '青白江区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510114', '新都区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510115', '温江区', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510121', '金堂县', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510122', '双流县', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510124', '郫县', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510129', '大邑县', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510131', '蒲江县', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510132', '新津县', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510181', '都江堰市', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510182', '彭州市', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510183', '邛崃市', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510184', '崇州市', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510301', '市辖区', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510302', '自流井区', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510303', '贡井区', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510304', '大安区', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510311', '沿滩区', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510321', '荣县', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510322', '富顺县', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510401', '市辖区', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510402', '东区', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510403', '西区', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510411', '仁和区', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510421', '米易县', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510422', '盐边县', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510501', '市辖区', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510502', '江阳区', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510503', '纳溪区', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510504', '龙马潭区', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510521', '泸县', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510522', '合江县', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510524', '叙永县', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510525', '古蔺县', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510601', '市辖区', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510603', '旌阳区', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510623', '中江县', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510626', '罗江县', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510681', '广汉市', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510682', '什邡市', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510683', '绵竹市', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510701', '市辖区', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510703', '涪城区', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510704', '游仙区', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510722', '三台县', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510723', '盐亭县', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510724', '安县', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510725', '梓潼县', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510726', '北川羌族自治县', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510727', '平武县', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510781', '江油市', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510801', '市辖区', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510802', '利州区', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510811', '元坝区', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510812', '朝天区', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510821', '旺苍县', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510822', '青川县', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510823', '剑阁县', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510824', '苍溪县', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510901', '市辖区', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510903', '船山区', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510904', '安居区', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510921', '蓬溪县', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510922', '射洪县', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510923', '大英县', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511001', '市辖区', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511002', '市中区', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511011', '东兴区', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511024', '威远县', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511025', '资中县', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511028', '隆昌县', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511101', '市辖区', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511102', '市中区', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511111', '沙湾区', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511112', '五通桥区', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511113', '金口河区', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511123', '犍为县', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511124', '井研县', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511126', '夹江县', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511129', '沐川县', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511132', '峨边彝族自治县', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511133', '马边彝族自治县', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511181', '峨眉山市', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511301', '市辖区', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511302', '顺庆区', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511303', '高坪区', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511304', '嘉陵区', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511321', '南部县', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511322', '营山县', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511323', '蓬安县', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511324', '仪陇县', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511325', '西充县', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511381', '阆中市', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511401', '市辖区', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511402', '东坡区', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511421', '仁寿县', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511422', '彭山县', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511423', '洪雅县', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511424', '丹棱县', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511425', '青神县', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511501', '市辖区', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511502', '翠屏区', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511503', '南溪区', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511521', '宜宾县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511523', '江安县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511524', '长宁县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511525', '高县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511526', '珙县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511527', '筠连县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511528', '兴文县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511529', '屏山县', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511601', '市辖区', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511602', '广安区', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511621', '岳池县', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511622', '武胜县', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511623', '邻水县', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511681', '华蓥市', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511701', '市辖区', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511702', '通川区', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511721', '达县', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511722', '宣汉县', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511723', '开江县', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511724', '大竹县', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511725', '渠县', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511781', '万源市', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511801', '市辖区', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511802', '雨城区', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511803', '名山区', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511822', '荥经县', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511823', '汉源县', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511824', '石棉县', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511825', '天全县', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511826', '芦山县', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511827', '宝兴县', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511901', '市辖区', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511902', '巴州区', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511921', '通江县', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511922', '南江县', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511923', '平昌县', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512001', '市辖区', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512002', '雁江区', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512021', '安岳县', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512022', '乐至县', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512081', '简阳市', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513221', '汶川县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513222', '理县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513223', '茂县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513224', '松潘县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513225', '九寨沟县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513226', '金川县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513227', '小金县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513228', '黑水县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513229', '马尔康县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513230', '壤塘县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513231', '阿坝县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513232', '若尔盖县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513233', '红原县', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513321', '康定县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513322', '泸定县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513323', '丹巴县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513324', '九龙县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513325', '雅江县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513326', '道孚县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513327', '炉霍县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513328', '甘孜县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513329', '新龙县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513330', '德格县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513331', '白玉县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513332', '石渠县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513333', '色达县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513334', '理塘县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513335', '巴塘县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513336', '乡城县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513337', '稻城县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513338', '得荣县', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513401', '西昌市', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513422', '木里藏族自治县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513423', '盐源县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513424', '德昌县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513425', '会理县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513426', '会东县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513427', '宁南县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513428', '普格县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513429', '布拖县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513430', '金阳县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513431', '昭觉县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513432', '喜德县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513433', '冕宁县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513434', '越西县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513435', '甘洛县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513436', '美姑县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513437', '雷波县', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520101', '市辖区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520102', '南明区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520103', '云岩区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520111', '花溪区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520112', '乌当区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520113', '白云区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520114', '小河区', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520121', '开阳县', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520122', '息烽县', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520123', '修文县', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520181', '清镇市', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520201', '钟山区', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520203', '六枝特区', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520221', '水城县', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520222', '盘县', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520301', '市辖区', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520302', '红花岗区', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520303', '汇川区', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520321', '遵义县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520322', '桐梓县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520323', '绥阳县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520324', '正安县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520325', '道真仡佬族苗族自治县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520326', '务川仡佬族苗族自治县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520327', '凤冈县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520328', '湄潭县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520329', '余庆县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520330', '习水县', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520381', '赤水市', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520382', '仁怀市', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520401', '市辖区', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520402', '西秀区', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520421', '平坝县', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520422', '普定县', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520423', '镇宁布依族苗族自治县', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520424', '关岭布依族苗族自治县', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520425', '紫云苗族布依族自治县', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520502', '七星关区', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520521', '大方县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520522', '黔西县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520523', '金沙县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520524', '织金县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520525', '纳雍县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520526', '威宁彝族回族苗族自治县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520527', '赫章县', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520602', '碧江区', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520603', '万山区', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520621', '江口县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520622', '玉屏侗族自治县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520623', '石阡县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520624', '思南县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520625', '印江土家族苗族自治县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520626', '德江县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520627', '沿河土家族自治县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520628', '松桃苗族自治县', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522301', '兴义市', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522322', '兴仁县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522323', '普安县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522324', '晴隆县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522325', '贞丰县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522326', '望谟县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522327', '册亨县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500109', '北碚区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500110', '綦江区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500111', '大足区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500112', '渝北区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500113', '巴南区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500114', '黔江区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500115', '长寿区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500116', '江津区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500117', '合川区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500118', '永川区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500119', '南川区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500223', '潼南县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500224', '铜梁县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500226', '荣昌县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500227', '璧山县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500228', '梁平县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500229', '城口县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500230', '丰都县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500231', '垫江县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500232', '武隆县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500233', '忠县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500234', '开县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500235', '云阳县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500236', '奉节县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500237', '巫山县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500238', '巫溪县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500240', '石柱土家族自治县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500241', '秀山土家族苗族自治县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500242', '酉阳土家族苗族自治县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500243', '彭水苗族土家族自治县', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522328', '安龙县', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522601', '凯里市', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522622', '黄平县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522623', '施秉县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522624', '三穗县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522625', '镇远县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522626', '岑巩县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522627', '天柱县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522628', '锦屏县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522629', '剑河县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522630', '台江县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522631', '黎平县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522632', '榕江县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522633', '从江县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522634', '雷山县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522635', '麻江县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522636', '丹寨县', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522701', '都匀市', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522702', '福泉市', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522722', '荔波县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522723', '贵定县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522725', '瓮安县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522726', '独山县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522727', '平塘县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522728', '罗甸县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522729', '长顺县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522730', '龙里县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522731', '惠水县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522732', '三都水族自治县', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610101', '市辖区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610102', '新城区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610103', '碑林区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610104', '莲湖区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610111', '灞桥区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610112', '未央区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610113', '雁塔区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610114', '阎良区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610115', '临潼区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610116', '长安区', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610122', '蓝田县', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610124', '周至县', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610125', '户县', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610126', '高陵县', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610201', '市辖区', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610202', '王益区', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610203', '印台区', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610204', '耀州区', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610222', '宜君县', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610301', '市辖区', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610302', '渭滨区', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610303', '金台区', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610304', '陈仓区', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610322', '凤翔县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610323', '岐山县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610324', '扶风县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610326', '眉县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610327', '陇县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610328', '千阳县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610329', '麟游县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610330', '凤县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610331', '太白县', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610401', '市辖区', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610402', '秦都区', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610403', '杨陵区', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610404', '渭城区', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610422', '三原县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610423', '泾阳县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610424', '乾县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610425', '礼泉县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610426', '永寿县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610427', '彬县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610428', '长武县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610429', '旬邑县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610430', '淳化县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610431', '武功县', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610481', '兴平市', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610501', '市辖区', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610502', '临渭区', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610521', '华县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610522', '潼关县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610523', '大荔县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610524', '合阳县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610525', '澄城县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610526', '蒲城县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610527', '白水县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610528', '富平县', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610581', '韩城市', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610582', '华阴市', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610601', '市辖区', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610602', '宝塔区', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610621', '延长县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610622', '延川县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610623', '子长县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610624', '安塞县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610625', '志丹县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610626', '吴起县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610627', '甘泉县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610628', '富县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610629', '洛川县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610630', '宜川县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610631', '黄龙县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610632', '黄陵县', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610701', '市辖区', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610702', '汉台区', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610721', '南郑县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610722', '城固县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610723', '洋县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610724', '西乡县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610725', '勉县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610726', '宁强县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610727', '略阳县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610728', '镇巴县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610729', '留坝县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610730', '佛坪县', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610801', '市辖区', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610802', '榆阳区', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610821', '神木县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610822', '府谷县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610823', '横山县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610824', '靖边县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610825', '定边县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610826', '绥德县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610827', '米脂县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610828', '佳县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610829', '吴堡县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610830', '清涧县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610831', '子洲县', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610901', '市辖区', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610902', '汉滨区', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610921', '汉阴县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610922', '石泉县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610923', '宁陕县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610924', '紫阳县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610925', '岚皋县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610926', '平利县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610927', '镇坪县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610928', '旬阳县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610929', '白河县', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611001', '市辖区', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611002', '商州区', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611021', '洛南县', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611022', '丹凤县', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611023', '商南县', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611024', '山阳县', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611025', '镇安县', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611026', '柞水县', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500101', '万州区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500102', '涪陵区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500103', '渝中区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500104', '大渡口区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500105', '江北区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500106', '沙坪坝区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500107', '九龙坡区', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500108', '南岸区', '3', '50', '01');

-- 设备参数模版
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('SendStatusTimeSpace', '间隔发送状态包时长', '1800000', '间隔发送状态包时长', '^\d+$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('MaxWithdrawalCount', '设备取款最大出钞张数', '50', '设备取款最大出钞张数', '^\d+$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('CardTypeMaxAmount', '单笔最大取款金额', '001,5000|002,5000|998,2000', '不同卡类型对应的最大全款金额', '^001{1},\d*[0]{2,}\|002{1},\d*[0]{2,}\|998{1},\d*[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('SingleMaxInterTFRAmount', '单笔最大行内转账金额', '50000', '默认值', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('SingleMaxExternalTFRAmount', '单笔最大跨行转账金额', '50000', '默认值', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('WithdrawalAmount_001', '本行借记卡取款金额选项配置', '100,200,500,1000,2000,5000', '1.取款界面显示的取款金额，从小到大或者从大到小，逗号分隔，最多可设置6个。2.本行借记卡取款金额选项配置的最大值应小于等于本行借记卡单笔取款金额', '^(([1-9]+[0]{2,},){5})([1-9]+[0]{2,}){1}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('WithdrawalAmount_002', '本行信用卡取款金额选项配置', '100,200,500,1000,2000,5000', '1.取款界面显示的取款金额，从小到大或者从大到小，逗号分隔，最多可设置6个。2.本行信用卡取款金额选项配置的最大值应小于等于本行信用卡单笔取款金额', '^(([1-9]+[0]{2,},){5})([1-9]+[0]{2,}){1}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('WithdrawalAmount_998', '他行卡取款金额选项配置', '100,200,500,1000,1500,2000', '1.取款界面显示的取款金额，从小到大或者从大到小，逗号分隔，最多可设置6个。2.他行卡取款金额选项配置的最大值应小于等于他行卡单笔取款金额', '^(([1-9]+[0]{2,},){5})([1-9]+[0]{2,}){1}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('maxCumwithdrawalamt', '累计最大取款金额', '20000', '默认（一般为核心控制）', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('maxwithdrawalamt', '设备单笔最大取款金额', '2000', '默认值', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('TotalMaxInterTFRAmount', '累计最大行内转账金额', '50000', '默认（一般为核心控制）', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('TotalMaxExternalTFRAmount', '累计最大跨行转账金额', '50000', '默认（一般为核心控制）', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('maxdepositcount', '最大存款张数', '100', '单位：张', '^\d+$');
commit;

insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416900', '重庆');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417910', '西安');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417010', '贵阳');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416510', '成都');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416517', '成都崇州');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417090', '贵阳毕节');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04418040', '西安延安');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416650', '四川省乐山市');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417020', '六盘水');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417030', '遵义');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416690', '四川省广安市');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04418888', '四川省XX市');
commit;


--模块操作日志配置更新 mod by lipeng
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.LoginController', 'login', '用户登录', '登录');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.SelfHelpBankController', 'add', '自助银行管理模块', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.SelfHelpBankController', 'mod', '自助银行管理模块', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.SelfHelpBankController', 'del', '自助银行管理模块', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'add', '用户管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'mod', '用户管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'del', '用户管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevBaseController', 'add', '设备管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevBaseController', 'mod', '设备管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevBaseController', 'del', '设备管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BankManagerController', 'add', '网点人员管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BankManagerController', 'mod', '网点人员管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BankManagerController', 'del', '网点人员管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.RoleController', 'add', '角色管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.RoleController', 'mod', '角色管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.RoleController', 'del', '角色管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CaseCatalogController', 'mod', '故障响应设定', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController', 'add', '厂商维护商管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController', 'del', '厂商维护商管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController', 'mod', '厂商维护商管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController', 'add', '设备类型管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController', 'mod', '设备类型管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController', 'del', '设备类型管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController', 'add', '设备维护商管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController', 'del', '设备维护商管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController', 'mod', '设备维护商管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevStopController', 'add', '设备停机管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevStopController', 'mod', '设备停机管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevTypeController', 'mod', '设备型号管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevTypeController', 'del', '设备型号管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevVendorController', 'add', '设备品牌管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevVendorController', 'mod', '设备品牌管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevVendorController', 'del', '设备品牌管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.OrgController', 'add', '机构管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.OrgController', 'mod', '机构管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.OrgController', 'del', '机构管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController', 'add', '公告管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController', 'mod', '公告管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController', 'del', '公告管理', '删除');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppModelController', 'addModel', '标杆管理', '添加标杆应用');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.control.controller.RemoteController', 'remoteControl', '设备控制', '远程控制');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.control.controller.RemoteController', 'upload2Remote', '设备控制', '文件上传');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdvertisementController', 'addAdv', '广告制作', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsResourceController', 'upload', '资源管理', '文件上传');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsResourceController', 'add', '资源管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsResourceController', 'mod', '资源管理', '修改');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsSpaceController', 'add', '广告位管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'modPasswd', '用户管理', '修改密码');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevTypeController', 'add', '设备型号管理', '添加');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppModelController', 'addModelApp', '标杆管理', '添加标杆应用');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppModelController', 'rangeModel', '标杆管理', '保存标杆范围');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppVersionController', 'commitVersion', '应用管理', '保存版本信息');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppVersionController', 'resourceUpload', '应用管理', '文件上传');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppVersionController', 'checkVersion', '应用管理', '校验版本文件');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsValidController', 'valid', '广告投放', '投放');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdvertisementController', 'delAdv', '广告制作', '删除');



--添加定时任务开关 add by zhangyun
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

-- 初始化一条设备信息
insert into DEV_BASE_INFO (no, ip, org_no, account_org_no, away_flag, self_bank_no, dev_catalog, dev_vendor, dev_type, work_type, status, dev_service, terminal_no, serial, address, buy_date, install_date, start_date, stop_date, open_time, close_time, expire_date, patrol_period, cashbox_limit, os, atmc_soft, anti_virus_soft, sp, virtual_teller_no, care_level, last_pm_date, expire_pm_date, locate_no, note1, note2, note3, note4, note5, carrier, money_org, dev_status, environment, address_code, cash_type, setup_type, net_type, operate_status, registration_status, comm_packet, zip_type, dek_encoded, atmp_area, dev_log_path, trans_rate, x, y, comm_cst_no, area_no, term_account_no, management_name, account_type, card_flag, check_org, tradingvolume, encryptmode, cycle_flag, region, city, manage_org_no, route)
values ('11111111', '199.168.3.114', '0100', '0100', '2', null, 'ATM', '10002', '10004', '3', '2', '53915', null, '024253', '重庆轨道交通3号线牛角沱站', null, '2011-12-05', '2012-06-06', null, '00:00:00', '23:59:59', '2017-06-05', '180', '50000', null, '10002', null, 'sp', '7275', null, null, null, null, '电信', '2', null, null, null, null, null, '1', null, null, '1', '1', '1', '2', '1', '8000', '3', null, '04416900', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

insert into DEV_OPERATE_INFO (no, quarter_lease_amount, cooperation_number, selfbank, investment, area_div, belongarea, cooperation, change_date, use_status, assets_no, network_operator, remark, install_site, case_way)
values ('11111111', '6300', 2100, '1', '1', '1', '渝中区', '53915', null, '1', null, '电信', '联通86185119', '轻轨牛角沱站', '2');

insert into DEV_STATUS_TABLE (dev_no, dev_status, dev_tx_status, dev_net_status, dev_run_status, dev_cash_status, dev_crs_status, action_type, action_note, dev_cashbox_status, dev_mod_status, dev_potential_fault, status_last_time, status_expire_time, tx_type, tx_time, atm_type, cash_unit_type, status_info_type, combin_unit_type, idc_device_status, cim_device_status, cdm_device_status, dep_device_status, ups_device_status, spr_device_status, rpr_device_status, jpr_device_status, chk_device_status, ttu_device_status, pbk_device_status, pin_device_status, siu_device_status, cam_device_status, crd_device_status, ccd_device_status, idc_media_status, idc_capture_bin_status, idc_capture_bin_count, cim_accept_or_status, cim_escrow_status, cim_cash_units, cim_shutter_status, cim_transport_status, cim_inout_position, cim_input_output_status, cim_pu_id, cim_pu_count, cim_pu_cash_in_count, cim_pu_status, cim_pupos_name, cim_cu_id, cim_pcu_id, cim_cu_note_value, cim_cu_currency, cim_cu_count, cim_cu_cash_in_count, cim_cu_type, cim_cu_status, cdm_shutter_status, cdm_dispenser_status, cdm_safe_door_status, cdm_stacker_status, cdm_cash_units, cdm_transport_status, cdm_out_position, cdm_input_output_status, cdm_pu_status, cdm_pu_id, cdm_pu_initial_count, cdm_pu_current_count, cdm_pu_reject_count, cdm_pupos_name, cdm_cu_id, cdm_pcu_id, cdm_cu_note_value, cdm_cu_currency, cdm_cu_current_count, cdm_cu_initial_count, cdm_cu_reject_count, cdm_cu_type, cdm_cu_status, dep_deposit_status, dep_deposit_container_status, dep_envelope_supply_status, dep_envelope_status, dep_printer_status, dep_printer_ink, dep_deposited_items, dep_transport_status, dep_shutter_status, ups_low, ups_engaged, ups_powering, ups_recovered, spr_media_status, spr_paper_status, spr_retract_bin_status, spr_ink_status, spr_toner_status, spr_stack_count, chk_media_status, chk_ink_status, rpr_media_status, rpr_paper_status, rpr_retract_bin_status, rpr_ink_status, rpr_toner_status, jpr_media_status, jpr_paper_status, jpr_ink_status, jpr_toner_status, pbk_media_status, pbk_ink_status, pbk_toner_status, pbk_retract_bin_status, pbk_retract_bin_count, siu_operator_switch, siu_terminal_tamper, siu_alarm_tamper, siu_seismic, siu_proximity_detector, siu_heat, siu_ambient_light, siu_cabinet_state, siu_safe_state, siu_shield_state, siu_bill_acceptor_light, siu_card_reader_light, siu_cheque_unit_light, siu_coin_dispenser_light, siu_note_dispenser_light, siu_envelope_depository_light, siu_passbook_printer_light, siu_pinpad_light, siu_receipt_printer_light, siu_envelope_dispenser_light, cam_camera_area, cam_camera_area_status, cam_media_status, cam_picture_staken, icc_device_status, icc_media_status, isc_device_status, isc_media_status, irc_device_status, irc_media_status, fpi_device_status, dpr_device_status, bcr_device_status, pjc_ret_code, pjc_cru_status, pjc_ej_sendtime, pjc_ej_date, pjc_ej_nsend, cdm_cu_number, cim_cu_number)
values ('11111111', 'UNKNOWN', 'UNKNOWN', 'FATAL', 'UNKNOWN', null, null, 'U', null, 'UNKNOWN', 'UNKNOWN', null, null, null, null, null, null, null, null, null, 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'UNKNOWN', null, 'UNKNOWN', null, null, null, null, null, null, null, null, null, null, null);

insert into DEV_STATUS_TABLE_EXPAND (dev_no, crd_dispenser, crd_transport, crd_media, crd_shutter, crd_supplybin_status, crd_retainbin_status, crd_cu_id, crd_cu_name, crd_cu_status, crd_cu_type, crd_cu_count, crd_cu_initial_count, crd_cu_retain_count, ccd_dispenser, ccd_transport, ccd_media, ccd_shutter, ccd_supplybin_status, ccd_retainbin_status, ccd_cu_id, ccd_cu_name, ccd_cu_status, ccd_cu_type, ccd_cu_count, ccd_cu_initial_count, ccd_cu_retain_count, dpr_media_status, dpr_supply_level_status, dpr_supply_lower_status, dpr_supply_external_status, dpr_supply_aux_status, dpr_retract_bin_status, dpr_toner_status, dpr_ink_status, bcr_scanner_status, nts_cache_count, nts_last_build_time)
values ('11111111', null, null, null, null, 'UNKNOWN', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

INSERT INTO DEV_ATTRIBUTE_TABLE (DEV_NO, ATTRIBUTE_LAST_TIME, IDC_EXIST, CIM_EXIST, CDM_EXIST, DEP_EXIST, UPS_EXIST, SPR_EXIST, CHK_EXIST, RPR_EXIST, JPR_EXIST, TTU_EXIST, PBK_EXIST, PIN_EXIST, SIU_EXIST, CAM_EXIST, CRD_EXIST, CCD_EXIST, IDC_VARIANT, IDC_CAN_EJECT, IDC_CAN_CAPTURE, IDC_BIN_CAPACITY, IDC_CAN_DISPENSE, IDC_SECURITY, IDC_TRACK_1_READ, IDC_TRACK_1_WRITE, IDC_TRACK_2_READ, IDC_TRACK_2_WRITE, IDC_TRACK_3_READ, IDC_TRACK_3_WRITE, IDC_TRACK_JISII_READ, IDC_TRACK_JISII_WRITE, CIM_CAN_ESCROW, CIM_SHUTTER_CONTROL_SUPPORT, CIM_MAX_ACCEPT_ITEMS, CIM_CAN_DETECT_CASH_INSERTED, CIM_CAN_DETECT_CASH_TAKEN, CIM_RETRACT_AREA, CDM_HAS_STACKER, CDM_HAS_SHUTTER, CDM_CAN_RETRACT, CDM_CAN_DETECT_CASH_TAKEN, CDM_CAN_TEST_PHSICAL_UNITS, CDM_MAX_DISPENSE_BILLS, CDM_NUM_OF_LOGICAL_CASH_UNITS, CDM_NUM_OF_PHYSICAL_CASH_UNITS, CDM_NUM_OF_CURRENCIES, CDM_CURRENCIES, CDM_EXPONENTS, DEP_DEPOSIT_TYPE, DEP_CAN_DISPENSE, DEP_CAN_PRINT, DEP_CAN_PRINT_ON_RETRACTS, DEP_CAN_RETRACT, DEP_MAX_PRINT_LENGTH, UPS_CAN_DETECT_LOW, UPS_CAN_BE_ENGAGED, UPS_CAN_DETECT_POWING, UPS_CAN_DETECT_RECOVERED, UPS_CAN_POWER_OFF, UPS_CAN_POWER_CYCLE, SPR_VARIANT, SPR_CAN_EJECT, SPR_CAN_CAPTURE, SPR_CAN_STACK, SPR_MAX_RETRACT, SPR_MAX_STRACK, CHK_CAN_RAW_PRINT, CHK_CAN_EJECT, CHK_CAN_STACK, CHK_CAN_CAPTURE, CHK_CAN_STAMP, CHK_CAN_DETECT_MEDIA_TAKEN, CHK_CAN_READ_FRONT_IMAGE, CHK_CAN_READ_BACK_IMAGE, CHK_CAN_READ_CODE_LINE, CHK_CODE_LINE_FORMATS, CHK_MAX_RETRACT, CHK_MAX_ACCEPT_ITEMS, CHK_SUPPORTED_IMAGE_FORMATS, RPR_VARIANT, RPR_CAN_EJECT, RPR_CAN_CAPTURE, RPR_CAN_STACK, RPR_MAX_RETRACT, JPR_VARIANT, JPR_CAN_EJECT, JPR_CAN_CAPTURE, JPR_CAN_STACK, TTU_ALPHA_NUMERIC_KEYS_PRESENT, TTU_HEXADECIMAL_KEYS_PRESENT, TTU_NUMERIC_KEYS_PRESENT, TTU_KEYBOARD_LOCK_PRESENT, TTU_DISPLAY_LIGHT_PRESENT, TTU_NUMBER_OF_RESOLUTIONS, TTU_CURSOR_SUPPORTED, TTU_FORMS_SUPPORTED, TTU_RESOLUTION_X, TTU_RESOLUTION_Y, PBK_VARIANT, PBK_CAN_EJECT, PBK_CAN_CAPTURE, PBK_CAN_STACK, PBK_MAX_RETRACT, PIN_CAN_EBC, PIN_CAN_CBC, PIN_CAN_MAC, PIN_CAN_RSA, PIN_CAN_VERIFY_DES, PIN_CAN_VERIFY_EC, PIN_CAN_VERIFY_VISA, PIN_CAN_DES_OFFSET, PIN_CAN_TRIPLE_EBC, PIN_CAN_TRIPLE_CBC, PIN_CAN_TRIPLE_MAC, PIN_CAN_TRIPLE_CFB, PIN_FUNCTION_KEYS_SUPPORTED, SIU_CABINET_CAN_BOLT, SIU_SAFE_CAN_BOLT, SIU_SHIELD_CAN_KEYBOARD, SIU_SHIELD_CAN_OPEN, SIU_SHIELD_CAN_CLOSE, SIU_SHIELD_CAN_SERVICE, CAM_MAX_PICTURES, CAM_PICTURE_INFO, CAM_MAX_PICTURE_INFO_SIZE, ICC_VARIANT, ICC_CAN_EJECT, ICC_CAN_CAPTURE, ICC_BIN_CAPACITY, ICC_CAN_DISPENSE, ICC_SECURITY, ICC_TRACK_1_READ, ICC_TRACK_1_WRITE, ICC_TRACK_2_READ, ICC_TRACK_2_WRITE, ICC_TRACK_3_READ, ICC_TRACK_3_WRITE, ICC_TRACK_JISII_READ, ICC_TRACK_JISII_WRITE, ICC_EXIST, ISC_VARIANT, ISC_CAN_EJECT, ISC_CAN_CAPTURE, ISC_BIN_CAPACITY, ISC_CAN_DISPENSE, ISC_SECURITY, ISC_TRACK_1_READ, ISC_TRACK_1_WRITE, ISC_TRACK_2_READ, ISC_TRACK_2_WRITE, ISC_TRACK_3_READ, ISC_TRACK_3_WRITE, ISC_TRACK_JISII_READ, ISC_TRACK_JISII_WRITE, ISC_EXIST, IRC_VARIANT, IRC_CAN_EJECT, IRC_CAN_CAPTURE, IRC_BIN_CAPACITY, IRC_CAN_DISPENSE, IRC_SECURITY, IRC_TRACK_1_READ, IRC_TRACK_1_WRITE, IRC_TRACK_2_READ, IRC_TRACK_2_WRITE, IRC_TRACK_3_READ, IRC_TRACK_3_WRITE, IRC_TRACK_JISII_READ, IRC_TRACK_JISII_WRITE, IRC_EXIST, FPI_LOAD_STATUS, FPI_EXIST, CRD_DISPENSETO, CCD_DISPENSETO, DPR_EXIST, DPR_VARIANT, DPR_CAN_EJECT, DPR_CAN_CAPTURE, DPR_CAN_STACK, DPR_MAX_RETRACT, BCR_EXIST, BCR_VARIANT, PJC_EXIST, PJC_DATASOURCE, PJC_VDEV, PJC_REALJPR, PJC_MAC, PJC_IP, PJC_PKT, PJC_EJFILE, PJC_SPACESIZE, PJC_VERSION) VALUES('11111111', '20191120162914', 'Y', 'Y', 'Y', 'N', NULL, 'N', NULL, 'Y', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'MOTORISED', 'TRUE', 'TRUE', '20', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', '150', 'TRUE', 'TRUE', 'RETRACT', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', '40', '6', '7', '2', 'GBP,CNY', '0,0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Receipt', 'TRUE', 'FALSE', 'FALSE', '40', 'Journal', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', NULL, 'FALSE', 'TRUE', '32', '16', NULL, NULL, NULL, NULL, NULL, 'TRUE', 'Y', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0,1,2,3,4,6,7,8,9,ENTER,CANCEL,CLEAR,.,OEM1,OEM2,OEM3,OEM4,OEM5,OEM6,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO DEV_SOFTWARE_INFO (DEV_NO, OPERATING_SYS, OPERATING_VERSION, OPERATING_PATCH_VERSION, ANTIVIRUS_SYSTEM, ANTIVIRUS_VERSION, ANTIVIRUS_DEFINITION, SP_VERSION, APP_VERSION, CHK_CASH_DATA, SOFTWARE_LIST, SP_IDC, SP_CDM, SP_CIM, SP_PIN, SP_JPR, SP_RPR, SP_SIU, SP_TTU, SP_VDM, SETUPFLAG, TAKEEFFECTFLAG, VERSION, SP_ICC, SP_ISC, SP_IRC, SP_FPI, SP_CRD, SP_CCD, SP_DPR, SP_BCR, SERIAL_NO_INFO_STATUS, TXT_INFO_STATUS, CIMSRP_FLAG, CDMSRP_FLAG, NTS_SUPPORT_SNR, NTS_SNR_FLAG, NTS_SUPPORT_SERIAL_NUMBERS, NTS_OPEN_SERIAL_NUMBERS_JP, NTS_OPEN_SERIAL_NUMBERS_RP) VALUES('11111111', 'Microsoft Windows XP', 'WINNT 5.1', 'Service Pack 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '1', '1', '-1', '-1', '-1', '-1', '-1');

INSERT INTO DEV_HARDWARE_INFO (DEV_NO, BIOS_VERSION, HARDWARE_CPU, HARDWARE_MEMORY, HARDWARE_HARDISK, FIRMWARE_IDC, FIRMWARE_CDM, FIRMWARE_CIM, FIRMWARE_PIN, FIRMWARE_JPR, FIRMWARE_RPR, FIRMWARE_SIU, FIRMWARE_TTU, FIRMWARE_VDM, FIRMWARE_BV, FIRMWARE_ICC, FIRMWARE_ISC, FIRMWARE_IRC, FIRMWARE_FPI, FIRMWARE_CRD, FIRMWARE_CCD, FIRMWARE_DPR, FIRMWARE_BCR) VALUES('11111111', NULL, 'Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz', '511.42 MB', '40 GB(42935894016 Byte)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-6702376', '管机员1', '0100', '023-11111111', '13012341234', 'www.111@11.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-90998704', '管机员2', '0100', '023-11111111', '13012341234', '13527410963@135.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-91078224', '管机员3', '0100', '023-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-9180374', '管机员4', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-56995936', '管机员5', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-63394852', '管机员6', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-16336864', '管机员7', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-27776920', '管机员8', '0100', '023-11111111', '13012341234', '11@qq.123456', null, null, '1', null);

insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-51278', '奔腾达', '刘政权', null, null, '15086868808', null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-24448', '东信', '叶洋骄', null, null, '18969103419', null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('365', '恒银', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-61190', '浪潮', '黄如想', null, '67704952', '13637971959', null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-75396', '神州金信', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('53915', '御银', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-15128', '兆维', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-88652', '重庆汇德明序科技发展有限公司', '袁娜', '重庆市渝中区上清寺鑫隆达大厦A座13F', '023-63634780', '18696792847', '023-63863160', '28481312@qq.com', null, null);
commit;


insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-43967988', '维护员1', '365', '1', '023-11111111', '13012341234', '11@qq.com', null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-82416000', '维护员2', '53915', '1', '023-11111111', '13012341234', '11@qq.com', null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-51955120', '维护员3', '-51278', '1', '023-11111111', '13012341234', '11@qq.com', null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-92066880', '维护员4', '-61190', '1', '023-67704952', '13012341234', null, null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-94010792', '维护员5', '-75396', '1', '023-11111111', '13012341234', '11@qq.com', null);
commit;

insert into sys_user_devrole select no, 'all' from sys_user;
commit;