insert into CARD_TYPE_TABLE (no, card_type)
values ('001', '��ǿ�');
insert into CARD_TYPE_TABLE (no, card_type)
values ('002', '���');
insert into CARD_TYPE_TABLE (no, card_type)
values ('003', '���ÿ�');
commit;

insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10001', '�罻');
insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10002', '����');
commit;

insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 2, 'ӪҵԤ��', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 3, '��ԴԤ��', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 4, '��Դ�ľ�', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 5, '���֪ͨ', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 6, 'Ӫҵ����', 1, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 7, 'ֽ��', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 8, 'ֽ��', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 9, '����', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 10, '����', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 11, '�������', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0, '0');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 12, 'һ��Ӳ������', 2, 30, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0, '1');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 13, '����Ӳ������', 2, 30, 60, 60, 300, 300, 7200, 1, 1, 1, 0, '1');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 14, '�������', 3, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0, '1');
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod, task_sheet_flag)
values ('0000', 15, 'ͨѶ����', 1, 30, 60, 60, 120, 120, 7200, 1, 1, 1, 0, '0');
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
values ('CRS', '�Զ���ȡ���', '�Զ���ȡ���', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('CDM', '�Զ�����', '�Զ�����', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('ATM', '�Զ�ȡ���', '�Զ�ȡ���', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('BSM', '��ѯ��', '��ѯ��', '3', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('MTM', '����ȡ���', '����ȡ���', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('IST', '���������ն�', '���������ն�', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('BTS', '�ص���', '�ص���', '6', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('SFM', '���', '���', '7', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('CDT', '������', '������', '2', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('STM', '�ǻ۹�Ա��', '�ǻ۹�Ա��1', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('SQM', '�кŻ�', '�кŻ�', '3', '5');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('IAS', '���ܹ����', '���ܹ����', '4', '3');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type, channel_type)
values ('MDM', 'ʵ����ȡ��', 'ʵ����ȡ��', '4', '3');
commit;




insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10002', 'cash80AWI����ʽ', '10003', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10004', 'A5-08��ǽʽ', '10002', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10005', 'A4-08', '10002', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10006', 'K1-08��ǽʽ', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10007', 'K2-08', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10009', '21S', '10004', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10010', 'PC2000XE', '10008', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10011', 'PC2050', '10008', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10008', 'cash80AWG����ʽ', '10003', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10017', 'PC2050XEUSB', '10008', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10018', '21SEUSB', '10004', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10012', '21SE', '10004', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10013', 'cash80AWG��ǽʽ', '10003', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10014', 'cash80AWI��ǽʽ', '10003', 'ATM', null, null, null, '1');
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
values ('20015', '8000����', '20009', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20013', '8600R��ǽ', '20009', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20014', '8600F����', '20009', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20016', '8100��ǽ', '20009', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20008', 'BSM1511TN', '10009', 'BSM', null, null, null, '2');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20009', 'K4', '10002', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20010', 'cash80ALI', '10003', 'ATM', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('10021', '����', '10007', 'ATM', null, null, null, '1');
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
values ('20020', '�׹�ͨCRD-100��ǽʽ', '20011', 'CRS', null, null, null, '1');
insert into DEV_TYPE_TABLE (no, name, dev_vendor, dev_catalog, spec, weight, watt, cash_type)
values ('20021', '�׹�ͨICT-200����ʽ', '20011', 'CRS', null, null, null, '1');
commit;


insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10002', '����', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10003', '����', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10004', 'OKI', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10007', '���ݽ���', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10008', '������', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('10009', '�˳���ý���ѯ��', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20011', '��ʢ', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20007', '�廪ͬ��', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20009', '����', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20010', '��ά', null, null, null);
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20001', '��������', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20002', '����', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20003', '����', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20004', '��ŵ��', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20005', '�г��Ŵ�', null, null, '1');
insert into DEV_VENDOR_TABLE (no, name, address, hotline1, status)
values ('20006', '����', null, null, '1');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM61', 6, '��ȫ��Ϊ��״̬', '�رհ�ȫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM64', 0, '��ȫ��Ϊδ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM65', 0, '��֧�ְ�ȫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM70', 0, '��������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM71', 0, '����һ������ջ���', '�ӳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM72', 6, '���䲻�ܳ���', '��鳮�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM73', 0, '����״̬δ֪', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM80', 0, '�ݴ�������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM81', 6, '�ݴ����г�', 'ȡ���ݴ����ĳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM82', 0, '�ݴ���״̬δ֪', '����ݴ����Ƿ�������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM83', 0, '��֧���ݴ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM90', 6, '������Ϊ��״̬', '�رճ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM91', 0, '������Ϊ�պ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM92', 6, '������Ϊ������״̬', '���������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM93', 0, '������Ϊδ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM94', 0, '��֧�ֳ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA0', 0, '���ʹ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA1', 6, '���ʹ��쳣', '��鴫�ʹ���ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA2', 0, '���ʹ�״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMA3', 0, '��֧�ִ��ʹ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB0', 0, '�����ڿ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB1', 6, '�����ڷǿ�', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB2', 0, '������״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMB3', 0, '��֧�ֳ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC0', 0, '����״̬����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC1', 5, '��������', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC2', 14, '�����䲻����', '���������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC3', 14, '�����䲻�ɲ���', '���������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC4', 10, '�����', '�ӳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC5', 14, '���䲻����', '��鳮���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC6', 14, '���䲻�ɲ���', '��鳮���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC7', 9, '���䳮��', '�ӳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMF2', 0, 'ȡ�ʱ�̳�', '���������еķϳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM51', 14, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM52', 14, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM53', 14, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM54', 14, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM55', 14, '���豸', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM60', 0, '��������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM61', 0, '��һ������״̬�쳣', '���Ӵ��Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM62', 6, '���г��䶼���ɲ���', '��鳮���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM63', 0, '����״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM70', 0, '��ȫ��Ϊ�պ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM71', 6, '��ȫ��Ϊ��״̬', '�رհ�ȫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM72', 6, '��ȫ��Ϊ�쳣״̬', '�رհ�ȫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM73', 0, '��ȫ��Ϊδ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM74', 0, '��֧�ְ�ȫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM80', 0, '�鳮�ݴ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM81', 6, '�鳮�ݴ����ǿ�', '�����ݴ���');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM82', 6, '�鳮�ݴ�����', '�����ݴ���');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM83', 0, '�鳮�ݴ���״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM84', 0, '��֧���鳮�ݴ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM90', 6, '�볮��Ϊ��״̬', '�ر��볮��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM91', 0, '�볮��Ϊ�պ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM92', 6, '�볮��Ϊ������״̬', '�����볮ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM93', 0, '�볮��Ϊδ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIM94', 0, '��֧���볮��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA0', 0, '���ʹ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA1', 6, '���ʹ��쳣', '��鴫�ʹ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA2', 0, '���ʹ�״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMA3', 0, '��֧�ִ��ʹ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB0', 0, '�볮�ڿ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB1', 6, '�볮�ڷǿ�', '�����볮��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB2', 0, '�볮��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMB3', 0, '��֧���볮��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC0', 0, '����״̬����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC1', 5, '��������', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC2', 14, '�����䲻����', '���������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC3', 14, '�����䲻�ɲ���', '���������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC4', 11, '�������', '��������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC5', 14, '����䲻����', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMC6', 14, '����䲻�ɲ���', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMF1', 5, '�����մ�������', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CIMF2', 0, '��ʱ�̳�', '���������еķϳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU53', 12, 'Ӳ������', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU54', 12, 'ʹ�ô���', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('TTU55', 12, '���豸', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU54', 12, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SIU55', 12, '�޴��豸', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI54', 12, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('GUI55', 12, '���豸', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP54', 12, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP55', 12, '�޴��豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP60', 0, '���ʹ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP61', 0, '�޴��ʹ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP62', 12, '���ʹ����ɲ���', '��鴫�ʹ��Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP63', 12, '���ʹ�״̬�쳣', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP64', 0, '���ʹ�״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP70', 0, '�ŷ���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP71', 6, '�ŷ�������', '�����ŷ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP72', 6, '�ŷ���������', '�����ŷ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP73', 12, '�ŷ�����������', '����ŷ������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP74', 12, '�ŷ��������ɲ���', '����ŷ������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP75', 0, '�ŷ�����״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP76', 0, '��֧���ŷ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP80', 0, '�ŷ⹩Ӧ����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP81', 3, '�ŷ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP82', 4, '���ŷ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP83', 12, '�ŷ⹩Ӧģ�鶪ʧ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP84', 12, '���ɲ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP85', 12, '������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP86', 0, '��֧��ģ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP87', 0, '״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP90', 0, '�ŷ�ַ�������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP91', 8, '�ŷ�ַ������ɲ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP92', 0, '�ŷ�ַ���״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEP93', 0, '��֧���ŷ�ַ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA0', 0, '��ӡ������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA1', 8, '��ӡ�����ɲ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA2', 0, '��ӡ��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPA3', 0, '��֧�ִ�ӡ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB0', 0, '����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB1', 3, 'ī��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB2', 4, 'ī��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB3', 0, 'ī״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPB4', 0, '��֧��ī', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC0', 0, '�볮��Ϊ�ر�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC1', 6, '�볮��Ϊ��״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC2', 6, '�볮��Ϊ����״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC3', 0, '�볮��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DEPC4', 0, '��֧���볮��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK54', 12, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK55', 12, '���豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK60', 6, '��ƾ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK61', 0, '��ƾ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK62', 6, '����ƾ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK63', 6, '��ֽ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK64', 0, 'δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK65', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK66', 0, 'ƾ����λ�ѻ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK70', 0, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK71', 7, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK72', 8, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK73', 0, 'ֽ״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK74', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK75', 6, 'ƾ������', '�����ӡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK80', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK81', 0, '�����佫��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK82', 6, '��������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK83', 12, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK84', 0, '������״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK90', 0, 'ɫ����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK91', 3, 'ɫ����', '���ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK92', 4, 'ɫ����', '����ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK93', 0, '��֧��ɫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBK94', 0, 'ɫ��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA0', 0, 'īˮ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA1', 3, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA2', 4, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA3', 0, '��֧��īˮ', null);
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('PBKA4', 0, 'īˮ״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC9', 10, '����գ��г��䲻����', '��鳮����߼ӳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDMC8', 9, '���䳮�٣��г��䲻����', '��鳮����߼ӳ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC50', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC51', 13, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC52', 13, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC53', 13, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC54', 6, 'ʹ�ô���', '����Ƿ��зǷ�������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC55', 13, '���豸', '���Ӳ�������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC56', 13, '�޶��ŵ�����', '���Ӳ����SP�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC60', 0, '�޿�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC61', 6, '�п�', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC62', 6, '���п�', 'ȡ�߿�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC63', 6, '��������', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC64', 0, 'δ֪״̬', '���ģ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC65', 0, '��֧��Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC70', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC71', 6, '�����俨��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC72', 6, '�����俨����', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ICC73', 13, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC50', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC51', 13, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC52', 13, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC53', 13, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC54', 6, 'ʹ�ô���', '����Ƿ��зǷ�������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC55', 13, '���豸', '���Ӳ�������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC56', 13, '�޶��ŵ�����', '���Ӳ����SP�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC60', 0, '�޿�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC61', 6, '�п�', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC62', 6, '���п�', 'ȡ�߿�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC63', 6, '��������', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC64', 0, 'δ֪״̬', '���ģ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC65', 0, '��֧��Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC70', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC71', 6, '�����俨��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC72', 6, '�����俨����', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('ISC73', 13, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC50', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC51', 13, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC52', 13, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC53', 13, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC54', 6, 'ʹ�ô���', '����Ƿ��зǷ�������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC55', 13, '���豸', '���Ӳ�������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC56', 13, '�޶��ŵ�����', '���Ӳ����SP�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC60', 0, '�޿�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC61', 6, '�п�', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC62', 6, '���п�', 'ȡ�߿�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC63', 6, '��������', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC64', 0, 'δ֪״̬', '���ģ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC65', 0, '��֧��Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC70', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC71', 6, '�����俨��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC72', 6, '�����俨����', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IRC73', 13, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI51', 13, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('FPI52', 13, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD50', 0, '����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD52', 12, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD54', 6, 'ʹ�ô���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD55', 12, '���豸', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD60', 0, '���п�������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD61', 0, '������һ������״̬������', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD62', 12, '���п��䶼���ɲ���', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD63', 12, '����״̬δ֪', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD70', 0, '���ʹ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD71', 12, '���ʹ��쳣', '��鴫�ʹ�״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD72', 0, '���ʹ�״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD73', 0, '��֧�ִ��ʹ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD80', 0, '���������޿�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD81', 0, '���������п�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD82', 0, '���������п�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD83', 6, '�������п�', '��������');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD84', 0, 'δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD85', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD90', 0, '���崦�ڴ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD91', 0, '���崦�ڱպ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD92', 6, '���崦�ڿ�ס״̬', '��鵲��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD93', 0, '���崦��δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRD94', 0, '��֧�ֵ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA0', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA1', 3, '�����俨��', '�ӿ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA2', 4, '������Ϊ��', '�ӿ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA3', 6, '�����䲻����', '��鷢����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA4', 13, '�����䲻����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDA5', 0, '������δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB0', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB1', 3, '�����俨����', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB2', 5, '�����俨��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB3', 6, '�����䲻����', '��鷢����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB4', 13, '�����䲻����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CRDB5', 0, '������δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD50', 0, '����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD52', 12, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD54', 6, 'ʹ�ô���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD55', 12, '���豸', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD60', 0, '���п�������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD61', 0, '������һ������״̬������', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD62', 12, '���п��䶼���ɲ���', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD63', 12, '����״̬δ֪', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD70', 0, '���ʹ�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD71', 12, '���ʹ��쳣', '��鴫�ʹ�״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD72', 0, '���ʹ�״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD73', 0, '��֧�ִ��ʹ�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD80', 0, '���������޿�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD81', 0, '���������п�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD82', 0, '���������п�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD83', 6, '�������п�', '��������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD84', 0, 'δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD85', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD90', 0, '���崦�ڴ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD91', 0, '���崦�ڱպ�״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD92', 6, '���崦�ڿ�ס״̬', '��鵲��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD93', 0, '���崦��δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCD94', 0, '��֧�ֵ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA0', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA1', 3, '�����俨��', '�ӿ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA2', 4, '������Ϊ��', '�ӿ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA3', 6, '�����䲻����', '��鷢����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA4', 13, '�����䲻����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDA5', 0, '������δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB0', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB1', 3, '�����俨����', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB2', 5, '�����俨��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB3', 6, '�����䲻����', '��鷢����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB4', 13, '�����䲻����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CCDB5', 0, '������δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR50', 0, '����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR51', 12, '����ģ��δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR52', 12, '����ģ��δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR53', 12, '����ģ��Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR54', 6, '����ģ��ʹ�ô���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR55', 12, '�޴��豸ģ��', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR60', 0, '����ģ������ֽ', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR61', 0, '����ģ������ֽ', '��鿨��״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR62', 0, '����ģ�����ֽ', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR63', 6, '����ģ����ֽJammed', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR64', 0, 'δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR65', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR70', 0, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR71', 7, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR72', 8, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR73', 0, 'ֽ״̬δ֪', '����ӡֽ�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR74', 0, '��֧�ָ��豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR75', 6, 'ֽJammed', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR80', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR81', 6, '�����佫��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR82', 6, '��������', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR83', 0, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR84', 0, '������״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR90', 0, 'ɫ����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR91', 3, 'ɫ����', '���ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR92', 4, 'ɫ����', '����ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR93', 0, '��֧��ɫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPR94', 0, 'ɫ��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA0', 0, 'īˮ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA1', 3, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA2', 4, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA3', 0, '��֧��īˮ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('DPRA4', 0, 'īˮ״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR41', 0, 'ϵͳ�¼�Ӳ����������', null);
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR50', 0, '����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR51', 12, '��ά��ɨ����ģ��δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR52', 12, '��ά��ɨ����ģ��δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR53', 12, '��ά��ɨ����ģ��Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR54', 6, '��ά��ɨ����ģ��ʹ�ô���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR55', 12, '�޴��豸ģ��', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR60', 0, 'ɨ��������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR61', 0, 'ɨ���ǽ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR62', 12, 'ɨ���ǹ��ϲ�������', '���ɨ����״̬״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('BCR63', 12, 'ɨ����״̬δ֪', '���ɨ����״̬״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR50', 0, '��־��ӡ���豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR54', 6, 'ʹ�ô���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR55', 12, '���豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR60', 0, '�޴�ӡֽ', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR61', 0, '�д�ӡֽ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR62', 0, '���д�ӡֽ', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR63', 6, '��ӡֽ������', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR64', 0, 'δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR65', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR70', 0, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR71', 7, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR72', 8, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR73', 0, 'ֽ״̬δ֪', '����ӡֽ�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR74', 0, '��֧�ָ��豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR75', 6, 'ֽ������', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR80', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR81', 6, '�����佫��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR82', 6, '��������', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR83', 0, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR84', 0, '������״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR90', 0, 'ɫ����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR91', 3, 'ɫ����', '���ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR92', 4, 'ɫ����', '����ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR93', 0, '��֧��ɫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPR94', 0, 'ɫ��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA0', 0, 'īˮ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA1', 3, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA2', 4, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA3', 0, '��֧��īˮ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('SPRA4', 0, 'īˮ״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC50', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC51', 13, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC52', 13, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC53', 13, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC54', 6, 'ʹ�ô���', '����Ƿ��зǷ�������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC55', 13, '���豸', '���Ӳ�������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC56', 13, '�޶��ŵ�����', '���Ӳ����SP�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC60', 0, '�޿�', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC61', 6, '�п�', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC62', 6, '���п�', 'ȡ�߿�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC63', 6, '��������', 'ȡ����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC64', 0, 'δ֪״̬', '���ģ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC65', 0, '��֧��Media', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC70', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC71', 6, '�����俨��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC72', 6, '�����俨����', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('IDC73', 13, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN50', 0, '��������豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN51', 13, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN52', 13, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN53', 13, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN54', 13, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('PIN55', 13, '���豸', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR50', 0, 'ƾ����ӡ������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR52', 12, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR54', 6, 'ʹ�ô���', '����Ƿ�ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR55', 12, '���豸', '��������Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR60', 0, '��ƾ��', '��Ӵ�ӡֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR61', 0, '��ƾ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR62', 0, '����ƾ��', '�����ֽ�ں�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR63', 6, 'ƾ��������', '����ƾ����ӡͨ��');
commit;

insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR64', 0, 'δ֪״̬', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR65', 0, '��֧���豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR66', 0, 'ƾ����λ�ѻ���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR70', 0, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR71', 7, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR72', 8, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR73', 0, '��ӡ��ֽ״̬δ֪', '����ӡֽ״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR74', 0, '��֧�ָ��豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR75', 6, 'ƾ��������', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR80', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR81', 6, '�����佫��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR82', 6, '��������', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR83', 12, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR84', 0, '������״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR90', 0, 'ɫ����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR91', 3, 'ɫ����', '���ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR92', 4, 'ɫ����', '����ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR93', 0, '��֧��ɫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPR94', 0, 'ɫ��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA0', 0, 'īˮ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA1', 3, 'īˮ��', '��ī');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA2', 4, 'īˮ��', '��ī');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA3', 0, '��֧��īˮ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('RPRA4', 0, 'īˮ״̬δ֪', '���īˮ״̬');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR50', 0, '��־��ӡ���豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR51', 12, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR52', 12, 'δͨ��', '����Ƿ�ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR53', 12, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR54', 6, 'ʹ�ô���', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR55', 12, '���豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR60', 0, '�޴�ӡֽ', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR61', 0, '�д�ӡֽ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR62', 0, '���д�ӡֽ', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR63', 6, '��ӡֽ������', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR64', 0, 'δ֪״̬', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR65', 0, '��֧��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR70', 0, 'ֽ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR71', 7, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR72', 8, 'ֽ��', '��ֽ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR73', 0, 'ֽ״̬δ֪', '����ӡֽ�Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR74', 0, '��֧�ָ��豸', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR75', 6, 'ֽ������', '����ͨ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR80', 0, '����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR81', 6, '�����佫��', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR82', 6, '��������', '���������');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR83', 0, '�޻�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR84', 0, '������״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR90', 0, 'ɫ����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR91', 3, 'ɫ����', '���ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR92', 4, 'ɫ����', '����ɫ��');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR93', 0, '��֧��ɫ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPR94', 0, 'ɫ��״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA0', 0, 'īˮ��', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA1', 3, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA2', 4, 'īˮ��', '���īˮ');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA3', 0, '��֧��īˮ', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('JPRA4', 0, 'īˮ״̬δ֪', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM41', 0, 'ϵͳ�¼�Ӳ����������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM42', 0, 'ϵͳ�¼������������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM43', 0, 'ϵͳ�¼�״̬�仯����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM44', 0, '�û��¼���������', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM45', 0, '���������¼�����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM50', 0, '�豸����', null);
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM51', 14, 'δ����', '����Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM52', 14, 'δͨ��', '����Ƿ�ӵ�');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM53', 14, 'Ӳ������', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM54', 6, 'ʹ�ô���', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM55', 14, '���豸', '���Ӳ���Ƿ�����');
insert into FAULT_CODE (code, fault_level, description, solution)
values ('CDM60', 0, '��ȫ��Ϊ�պ�״̬', null);
commit;

insert into MOD_CATALOG_TABLE (no, name)
values ('CAM', '�����');
insert into MOD_CATALOG_TABLE (no, name)
values ('CDM', 'ȡ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('CHK', '֧Ʊ��ɨ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('CIM', '���');
insert into MOD_CATALOG_TABLE (no, name)
values ('DEP', '�ŷ�');
insert into MOD_CATALOG_TABLE (no, name)
values ('IDC', '������');
insert into MOD_CATALOG_TABLE (no, name)
values ('JPR', '��־��ӡ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('PBK', '���۴�ӡ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('PIN', '�������');
insert into MOD_CATALOG_TABLE (no, name)
values ('RPR', 'ƾ����ӡ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('SIU', '������');
insert into MOD_CATALOG_TABLE (no, name)
values ('SPR', '�ᵥ��ӡ');
insert into MOD_CATALOG_TABLE (no, name)
values ('TTU', '�ı��ն˵�Ԫ');
insert into MOD_CATALOG_TABLE (no, name)
values ('UPS', '����ϵ�Դ');
insert into MOD_CATALOG_TABLE (no, name)
values ('NET', '����ͨѶ');
insert into MOD_CATALOG_TABLE (no, name)
values ('DPR', '����ģ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('BCR', '��ά��ɨ����ģ��');
insert into MOD_CATALOG_TABLE (no, name)
values ('ICC', '����ʽ������');
insert into MOD_CATALOG_TABLE (no, name)
values ('ISC', 'ˢ��ʽ������');
insert into MOD_CATALOG_TABLE (no, name)
values ('IRC', '����֤������');
insert into MOD_CATALOG_TABLE (no, name)
values ('FPI', 'ָ��ɨ����');
insert into MOD_CATALOG_TABLE (no, name)
values ('CRD', '������');
insert into MOD_CATALOG_TABLE (no, name)
values ('CCD', '������1');
commit;

insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('0', '�Ͻ��ۺ��˹�ϵͳ', null, null, null, null, null, 0);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A', '�ۺϼ��', null, '#00a8f3', null, null, 'zijin-icon-devMonitor', 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A02', 'ATM���', null, null, 'tile_devMonitor.png', '/monitor/devMonitor', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A04', '�ص������', null, null, 'tile_btsMonitor.png', '/monitor/btsMonitor', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A07', '���׼��', null, null, 'tile_transMonitor.png', '/monitor/transMonitor', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A08', '���ײ�ѯ', null, null, 'tile_transSearch.png', '/monitor/transInfo', null, 8);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A10', 'ȫ�н��״���', null, null, 'tile_bankMonitor_a.png', '/monitor/bankMonitorA', null, 10);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A11', 'ȫ�й������', null, null, 'tile_bankMonitor_b.png', '/monitor/bankMonitorB', null, 11);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A12', '���׷���', null, null, 'tile_transactionAnalysis.png', '/monitor/transAnalysis', null, 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('A13', '���Ϸ���', null, null, 'tile_faultAnalysis.png', '/monitor/faultAnalysis', null, 13);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('B', 'Զ�̿���', null, '#ffb11a', null, null, 'zijin-icon-devManage', 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('B01', '�豸����', null, null, 'tile_devControl.png', '/remote/devControl', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('B02', '���ƽ��', null, null, 'tile_controlResult.png', '/remote/controlResult', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C', '�汾����', null, '#ff7f27', null, null, 'zijin-icon-checklist', 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C01', 'Ӧ�ù���', null, null, 'tile_appstore.png', '/version/appstore', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C02', '��˹���', null, null, 'tile_benchmark.png', '/version/benchmark', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('C04', '�汾�����ѯ', null, null, 'tile_vision_result.png', '/version/appResult', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D', '������', null, '#78c446', null, null, 'zijin-icon-icon_theme_setting', 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D01', '��Դ����', null, null, 'tile_resource.png', '/content/resourceManage', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D02', '���λ����', null, null, 'tile_advSpace.png', '/content/advertisementSpace', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D03', '�������', null, null, 'tile_advMake.png', '/content/advMake', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D04', '���Ͷ��', null, null, 'tile_advRemote.png', '/content/advValid', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('D05', '���Ͷ�����', null, null, 'tile_advRemote_info.png', '/content/advValidResult', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E', '����ͳ��', null, '#f2a000', null, null, 'zijin-icon-chart22', 14);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E02', '��������', null, null, 'tile_basic_statements.png', '/report/baseReport', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E03', 'ͳ�Ʊ���', null, null, 'tile_statistical_reports.png', '/report/statisticReport', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E04', '���ױ���', null, null, 'Equipment-information.png', '/report/transReport', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E05', '���˱���', null, null, 'Equipment-information.png', '/report/assessReport', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('E06', '���Ʊ���', null, null, 'Equipment-information.png', '/report/customReport', null, 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F', '��������', null, '#5ed8a9', null, null, 'zijin-icon-options', 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F01', '��������', null, null, 'tile_userOrg.png', '/system/org', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F02', '�������й���', null, null, 'tile_selfHelpBank.png', '/system/selfHelpBank', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F03', '��ɫ����', null, null, 'tile_rolePrivilege.png', '/system/role', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F04', '�û�����', null, null, 'tile_userInfo.png', '/system/user', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F05', '�û�����', null, null, 'tile_passwd.png', '/system/password', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F06', '������Ա����', null, null, 'tile_Network_management.png', '/system/bank', null, 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F07', '�豸ά���̹���', null, null, 'tile_factoryMaintain.png', '/system/devServiceManager', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F08', '�豸ά��Ա����', null, null, 'tile_devMaintain.png', '/system/factory', null, 8);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F09', '�豸����', null, null, 'tile_device_management.png', '/system/dev', null, 9);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F10', '�豸�����˹���', null, null, 'tile_device_people_manage.png', '/system/devResponsible', null, 10);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F11', '�豸���͹���', null, null, 'tile_devcatalog.png', '/system/catalog', null, 11);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F12', '�豸Ʒ�ƹ���', null, null, 'tile_vendor.png', '/system/vendor', null, 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F13', '�豸�ͺŹ���', null, null, 'tile_devtype.png', '/system/type', null, 13);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F14', '�豸ģ��', null, null, 'tile_modCatalog.png', '/system/modCatalog', null, 14);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('F15', '��־��ѯ', null, null, 'tile_log.png', '/system/log', null, 15);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G', '�ճ�ά��', null, '#22b9e8', null, null, 'zijin-icon-Development-mode', 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G01', '�����ۺϲ�ѯ', null, null, 'title_fault_query.png', '/maintain/faultQuery', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G02', '�̿�����', null, null, 'tile_csManager.png', '/maintain/retainCard', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G04', '�豸��������', null, null, 'tile_devparamSetting.png', '/maintain/devParam', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G07', '��Ϣ֪ͨģ��', null, null, 'tile_notifyModel.png', '/system/notifyModel', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G08', '������Ӧ�趨', null, null, 'tile_dev_response.png', '/system/sysParam', null, 8);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G09', '�豸ͣ������', null, null, 'tile_devStop.png', '/system/devStop', null, 9);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G10', '����������', null, null, 'tile_cardInfo.png', '/system/blackListInfo', null, 10);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G11', '��������ʱ��', null, null, 'tile_worktime_range.png', '/system/orgWorkTime', null, 11);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G12', '�������', null, null, 'tile_bulletin.png', '/system/bulletin', null, 12);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G13', '�������', null, null, 'tile_cardInfo.png', '/system/cardInfo', null, 13);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G14', '��������', null, null, 'tile_globalCfg.png', '/system/globalCfg', null, 14);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G15', '�ҵ�����', null, null, 'tile_myapply.png', '/system/myApply', null, 15);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G16', '�ҵ�����', null, null, 'tile_myaudit.png', '/system/myAudit', null, 16);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G17', 'ͣ����ϸ��ѯ', null, null, 'tile_devStop.png', '/system/devStopDetail', null, 17);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('G18', '��������', null, null, 'tile_workOrder.png', '/maintain/workOrder2', null, 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H', '�ص�������', null, '#22b9e8', null, null, 'zijin-icon-devManage', 9);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H01', '�ص����������', null, null, 'tile_cardInfo.png', '/returnManage/cardCollection', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H02', '�ص��������˻�', null, null, 'tile_btsMonitor.png', '/returnManage/associated', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('H03', '�ص�����ʧ����', null, null, 'tile_btsMonitor.png', '/returnManage/replaced', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M', '������ˮ', null, '#00a8f3', null, null, 'zijin-icon-devMonitor', 7);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M01', '������ˮ��ѯ', null, null, 'Equipment-information.png', '/monitor/pjsLogMonitor', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M02', '��ֽ�����', null, null, 'pjsTermMonitor.png', '/monitor/pjsTermMonitor', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('M03', '��ֽ����ˮ���', null, null, 'tile_wuzhihua_monitor.png', '/monitor/pjsMonitor', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N', '���ֺŹ���', null, '#5ed8a9', null, null, 'zijin-icon-devManage', 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N01', '���ײ���ֺ�', null, null, 'tile_nts_txQryNsn.png', '/ntsManage/txQryNsn', null, 1);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N02', '���ֺŲ齻��', null, null, 'tile_nts_nsnQryTx.png', '/ntsManage/nsnQryTx', null, 2);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N03', '�������汾����', null, null, 'tile_nts_version.png', '/ntsManage/version', null, 3);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N04', '����������', null, null, 'tile_nts_blank.png', '/ntsManage/blank', null, 4);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N05', '�������·�', null, null, 'tile_nts_issue.png', '/ntsManage/issue', null, 5);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N06', '�������·���¼', null, null, 'tile_nts_issueList.png', '/ntsManage/issueList', null, 6);
insert into SYS_MENU (no, name, note, bg_color, tile_image, link, icon, menu_order)
values ('N07', '���ɹ�������', null, null, 'tile_nts_susReg.png', '/ntsManage/susReg', null, 7);
commit;

insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('69', 'ִ���ļ�', 'B01', '�豸����', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('19', '����', 'C01', 'Ӧ��', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('20', '�޸�', 'C01', 'Ӧ��', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('21', 'ɾ��', 'C01', 'Ӧ��', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('1', '����', 'F01', '����', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('2', '�޸�', 'F01', '����', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('3', 'ɾ��', 'F01', '����', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('4', '���', 'F01', '����', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('5', '����', 'F03', '��ɫ', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('6', '�޸�', 'F03', '��ɫ', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('7', 'ɾ��', 'F03', '��ɫ', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('8', '���', 'F03', '��ɫ', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('9', '����', 'F04', '�û�', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('10', '�޸�', 'F04', '�û�', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('11', 'ɾ��', 'F04', '�û�', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('12', '��������', 'F04', '�û�', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('13', '����', 'F04', '�û�', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('14', '���', 'F04', '�û�', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('15', '����', 'F09', '�豸', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('16', '�޸�', 'F09', '�豸', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('17', 'ɾ��', 'F09', '�豸', null, null, 'Y');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('18', '���', 'F09', '�豸', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('22', '����', 'C02', '���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('23', '�޸�', 'C02', '���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('24', 'ɾ��', 'C02', '���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('25', '����', 'C02', '���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('26', '����', 'C02', '���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('27', '����', 'C01', 'Ӧ��', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('43', '�豸��Ӳ����Ϣ��', 'E02', '��������', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('44', '�豸�汾��Ϣ��', 'E02', '��������', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('42', '�豸������Ϣ��', 'E02', '��������', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('45', '�������ͳ�Ʊ�', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('46', '������ͳ�Ʊ���', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('47', '��������ϸ����', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('48', '�豸����ͳ�Ʊ���', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('49', '�̿���ϸ����', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('50', '�豸�ӳ���¼��', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('51', '�豸ȱֽȱ��ͳ�Ʊ�', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('52', '�豸ȱֽȱ����ϸ��', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('53', '������ͳ�Ʊ���', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('54', 'ATM�ӳ�ͳ�Ʊ���', 'E03', 'ͳ�Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('55', '֧�н��������', 'E04', '���ױ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('56', 'ATM���ɽ��ױ�', 'E04', '���ױ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('57', '������ϸ��', 'E04', '���ױ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('58', '����ͳ�Ʊ���', 'E04', '���ױ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('59', '���������������', 'E04', '���ױ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('60', 'ATM�ֽ������', 'E04', '���ױ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('61', '���Ϳ��˱���', 'E05', '���˱���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('62', '�ܻ�Ա���˱�', 'E05', '���˱���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('63', 'ά���̿���', 'E05', '���˱���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('64', '�ܻ�Ա������ϸ��', 'E05', '���˱���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('65', '����-�豸������Ϣ����', 'E06', '���Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('66', '����-������ͳ�Ʊ���', 'E06', '���Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('67', '����-����ͳ�Ʊ���', 'E06', '���Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('68', '����-������ͳ�Ʊ���', 'E06', '���Ʊ���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('70', 'ɾ���ļ�', 'B01', '�豸����', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('28', 'Զ��ץ��', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('29', 'Զ�����', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('30', '�豸����', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('31', '�ػ�', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('32', '��������', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('33', '��ͣ����', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('34', '��ȡ��־', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('35', '�����Ϣ', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('36', 'Ӳ����Ϣ', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('37', 'ϵͳ��Ϣ', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('38', '������Ϣ', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('39', 'ǿ�Ƹ�λ', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('40', '״̬���', 'B01', 'Զ�̿���', null, null, 'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url, audit_flag)
values ('41', '������', 'B01', 'Զ�̿���', null, null, 'N');

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


-- ��������(��������)
insert into SYS_ORG_TYPE (no, type, grade)
values ('FH', '����', '2');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZHH', '֧��', '3');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZHH2', '����֧��', '4');
insert into SYS_ORG_TYPE (no, type, grade)
values ('YYWD', 'Ӫҵ����', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZZWD', '��������', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('SQWD', '��������', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZH', '����', '1');
commit;

INSERT INTO SYS_ORG (NO, NAME, PARENT_ORG, LEFT_NO, RIGHT_NO, ORG_TYPE, MONEYORG_FLAG, X, Y, ADDRESS, LINKMAN, TELEPHONE, MOBILE, FAX, EMAIL, BUSINESS_RANGE, CUP_AREA_CODE, ADDRESS_CODE, AREA_NO_PROVINCE, AREA_NO_CITY, AREA_NO_COUNTY, AREA_TYPE, ORG_PHYSICS_CATALOG, NOTE, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS)
VALUES('0000', '����', NULL, 1, 6, 'ZH', NULL, NULL, NULL, '֣����', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO SYS_ORG (NO, NAME, PARENT_ORG, LEFT_NO, RIGHT_NO, ORG_TYPE, MONEYORG_FLAG, X, Y, ADDRESS, LINKMAN, TELEPHONE, MOBILE, FAX, EMAIL, BUSINESS_RANGE, CUP_AREA_CODE, ADDRESS_CODE, AREA_NO_PROVINCE, AREA_NO_CITY, AREA_NO_COUNTY, AREA_TYPE, ORG_PHYSICS_CATALOG, NOTE, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS)
VALUES('0100', '����01', '0000', 2, 5, 'FH', NULL, NULL, NULL, '֣���н�ˮ��', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO SYS_ORG (NO, NAME, PARENT_ORG, LEFT_NO, RIGHT_NO, ORG_TYPE, MONEYORG_FLAG, X, Y, ADDRESS, LINKMAN, TELEPHONE, MOBILE, FAX, EMAIL, BUSINESS_RANGE, CUP_AREA_CODE, ADDRESS_CODE, AREA_NO_PROVINCE, AREA_NO_CITY, AREA_NO_COUNTY, AREA_TYPE, ORG_PHYSICS_CATALOG, NOTE, IS_SELFHELP, IS_BANKOUTLET, AREA_NO, ORG_STATUS)
VALUES('0110', '֧��0101', '0100', 3, 4, 'ZHH', NULL, NULL, NULL, '֣���н�ˮ��', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);


INSERT INTO SYS_USER (NO, PASSWD, NAME, STATUS, ONLINE_FLAG, ROLE_NO, ORG_NO, PHONE, MOBILE, EMAIL, LOGIN_IP, LOGIN_TIME, PASSWD_EXPIRATION, PASSWD_ERROR)
VALUES('admin1', '3ac751c1478699664bcc11b5efc04fac', '��������Ա1', '1', '1', '10001', '0000', NULL, NULL, NULL, NULL, '2019-11-19 00:45:18', '2020-05-18', 0);
INSERT INTO SYS_USER (NO, PASSWD, NAME, STATUS, ONLINE_FLAG, ROLE_NO, ORG_NO, PHONE, MOBILE, EMAIL, LOGIN_IP, LOGIN_TIME, PASSWD_EXPIRATION, PASSWD_ERROR)
VALUES('admin2', '3ac751c1478699664bcc11b5efc04fac', '��������Ա2', '1', '1', '10001', '0000', NULL, NULL, NULL, NULL, '2019-11-19 00:43:49', '2020-05-18', 0);

insert into SYS_ROLE (no, name, org_type, note)
values ('10001', '���г�������Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10002', '����ϵͳ���Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1567128804305', '������ά����Ա', 'FH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1569050691980', '����ϵͳ����Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1569050691980|10002', '����ϵͳ����Ա,����ϵͳ���Ա', null, '��Ͻ�ɫ��1569050691980|10002');
insert into SYS_ROLE (no, name, org_type, note)
values ('1570849215296', '�����˾��ز���Ա', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571107123263', '����ATM���ݼ�ع���Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571107769804', '���й�������Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571108339626', '֧��ϵͳ����Ա', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571105709410', '���а汾����Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571127145493', '����ϵͳ����Ա', 'FH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571107280513', '���лص�������Ա', 'ZH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571110051529', '֧����ά����Ա', 'ZHH', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('10002|1569050691980', '����ϵͳ���Ա,����ϵͳ����Ա', null, '��Ͻ�ɫ��10002|1569050691980');
insert into SYS_ROLE (no, name, org_type, note)
values ('10001|1571105709410', '���г�������Ա,���а汾����Ա', null, '��Ͻ�ɫ��10001|1571105709410');
insert into SYS_ROLE (no, name, org_type, note)
values ('1571105709410|1569050691980', '���а汾����Ա,����ϵͳ����Ա', null, '��Ͻ�ɫ��1571105709410|1569050691980');
insert into SYS_ROLE (no, name, org_type, note)
values ('1569050691980|1571105709410', '����ϵͳ����Ա,���а汾����Ա', null, '��Ͻ�ɫ��1569050691980|1571105709410');
insert into SYS_ROLE (no, name, org_type, note)
values ('1571625033761', '����֧��ϵͳ����Ա', 'ZHH2', null);
insert into SYS_ROLE (no, name, org_type, note)
values ('1571642786109', '����֧����ά����Ա', 'ZHH2', null);
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
values ('00', '���׳ɹ�', '���׳ɹ�', '1');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('01', '����ʧ�ܣ�����ϵ������', '����ʧ�ܣ�����ϵ������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('02', '�ض������²�ѯ������', '�ض������²�ѯ������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('03', '��Ч�̻�', '��Ч�̻�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('04', 'û�տ�', 'û�տ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('05', '����ж�', '����ж�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('06', '����', '����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('07', '����������û�տ�', '����������û�տ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('09', '�������ڴ�����', '�������ڴ�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('10', '���ֽ����׼', '���ֽ����׼', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('11', '��Ҫ������׼��VIP��', '��Ҫ������׼��VIP��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('12', '��Ч����', '��Ч����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('13', '��Ч���', '��Ч���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('14', '��Ч����', '��Ч����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('15', '�޴˷�����', '�޴˷�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('16', '��׼���µ����ŵ�', '��׼���µ����ŵ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('20', '��ЧӦ��', '��ЧӦ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('21', '�����κδ���', '�����κδ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('22', '���ɲ�������', '���ɲ�������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('23', '���ɽ��ܵĽ��׷�', '���ɽ��ܵĽ��׷�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('25', 'δ���ҵ��ļ��ϼ�¼', 'δ���ҵ��ļ��ϼ�¼', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('30', '��ʽ����', '��ʽ����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('31', '�������Ĳ�֧�ֵ�����', '�������Ĳ�֧�ֵ�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('33', '���ڿ���û�տ���', '���ڿ���û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('34', '���������ɣ�û�տ���', '���������ɣ�û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('35', '�ܿ����밲ȫ���ܲ�����ϵ��û�տ���', '�ܿ����밲ȫ���ܲ�����ϵ��û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('36', '�����ƵĿ���û�տ���', '�����ƵĿ���û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('37', '�ܿ�����������ȫ���ܲ��ţ�û�տ���', '�ܿ�����������ȫ���ܲ��ţ�û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('38', '��������ĸ���ʶ����������', '��������ĸ���ʶ����������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('39', '�޴����ÿ��˻�', '�޴����ÿ��˻�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('40', '����Ĺ����в�֧��', '����Ĺ����в�֧��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('41', '��ʧ����û�տ���', '��ʧ����û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('42', '�޴��˻�', '�޴��˻�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('43', '���Կ���û�տ���', '���Կ���û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('44', '�޴�Ͷ���˻�', '�޴�Ͷ���˻�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('51', '���㹻�Ĵ��', '���㹻�Ĵ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('52', '�޴�֧Ʊ�ʺ�', '�޴�֧Ʊ�ʺ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('53', '�޴˴���ʺ�', '�޴˴���ʺ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('54', '���ڵĿ�', '���ڵĿ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('55', '����ȷ��PIN', '����ȷ��PIN', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('56', '�޴˿���¼', '�޴˿���¼', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('57', '������ֿ��˽��еĽ���', '������ֿ��˽��еĽ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('58', '�������ն˴���Ľ���', '�������ն˴���Ľ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('59', '����������', '����������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('60', '�ܿ����밲ȫ���ܲ�����ϵ', '�ܿ����밲ȫ���ܲ�����ϵ', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('61', '����������', '����������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('62', '�����ƵĿ�', '�����ƵĿ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('63', 'Υ����ȫ���ܹ涨', 'Υ����ȫ���ܹ涨', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('64', 'ԭʼ����ȷ', 'ԭʼ����ȷ', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('65', '����ȡ���������', '����ȡ���������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('66', '�ܿ�����������ȫ���ܲ���', '�ܿ�����������ȫ���ܲ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('67', '��׽��û�տ���', '��׽��û�տ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('68', '�յ��Ļش�̫��', '�յ��Ļش�̫��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('75', '���������PIN��������', '���������PIN��������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('79', 'ATM��������ATM��������������Ҫ���ͽ�����ϸ��', 'ATM��������ATM��������������Ҫ���ͽ�����ϸ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('90', '�����л����ڴ���', '�����л����ڴ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('91', '�������򽻻����Ĳ��ܲ���', '�������򽻻����Ĳ��ܲ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('92', '���ڻ������м�������ʩ�Ҳ������޷��ﵽ', '���ڻ������м�������ʩ�Ҳ������޷��ﵽ', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('93', '����Υ�����������', '����Υ�����������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('94', '�ظ�����', '�ظ�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('95', '���ڿ��ƴ�', '���ڿ��ƴ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('96', 'ϵͳ�쳣��ʧЧ', 'ϵͳ�쳣��ʧЧ', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('97', 'ATM/POS�ն˺��Ҳ���', 'ATM/POS�ն˺��Ҳ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('98', '���������ղ���������Ӧ��', '���������ղ���������Ӧ��', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('99', 'PIN��ʽ��', 'PIN��ʽ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EF', '�ڴ������У��ͻ��ų�������SPԭ�򷵻��޳���״̬ʱ��Ӧ�ý����������洢����Ҫ��¼���ɽ���', '���ʧ�ܣ���Ʊ��ȡ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A0', 'MAC����ʧ��', 'MAC����ʧ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A1', 'ת�ʻ��Ҳ�һ��', 'ת�ʻ��Ҳ�һ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A2', '��ȱ�ݵĳɹ�', '��ȱ�ݵĳɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A3', 'ת�����޴��ʻ�', 'ת�����޴��ʻ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A4', '��ȱ�ݵĳɹ�', '��ȱ�ݵĳɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A5', '��ȱ�ݵĳɹ�', '��ȱ�ݵĳɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A6', '��ȱ�ݵĳɹ�', '��ȱ�ݵĳɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('A7', '��ȫ����ʧ��', '��ȫ����ʧ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('B1', '����δ�ɻ���Ƿ��', '����δ�ɻ���Ƿ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('C1', '����״̬�Ƿ�', '����״̬�Ƿ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D1', '����״̬����', '����״̬����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D2', '���ڴ���', '���ڴ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D3', '��Ч���ļ�����', '��Ч���ļ�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D4', '�Ѿ���������ļ�', '�Ѿ���������ļ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D5', '�޴��ļ�', '�޴��ļ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D6', '�����߲�֧��', '�����߲�֧��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D7', '�ļ�����', '�ļ�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D8', 'Ϊ�ɹ�', 'Ϊ�ɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('D9', '�ļ����Ȳ���', '�ļ����Ȳ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('DA', '�ļ���ѹ����', '�ļ���ѹ����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('DB', '�ļ����ƴ�', '�ļ����ƴ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('DC', '�޷������ļ�', '�޷������ļ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('N1', 'δ������Ŀ�ѳ��ޣ����ײ��ɹ�', 'δ������Ŀ�ѳ��ޣ����ײ��ɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Q1', '��Ƭ��֤ʧ��', '��Ƭ��֤ʧ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Y1', '�ѻ����׳ɹ�', '�ѻ����׳ɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Y3', '�����������ѻ����׳ɹ�', '�����������ѻ����׳ɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Z1', '�ѻ�����ʧ��', '�ѻ�����ʧ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('Z3', '�����������ѻ�����ʧ��', '�����������ѻ�����ʧ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('ZZ', '��Ҫ����д��', '��Ҫ����д��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-AT', '�ܱ�Ǹ��ͨѶ���ϣ����ױ�ȡ��', 'ͨѶ��ʱ�����ױ�ȡ��,��Ҫ�������˶�����', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-TF', '�ܱ�Ǹ��ͨѶ���ϣ����ױ�ȡ��', 'ͨѶ���ϣ����ױ�ȡ��,��Ҫ�������˶�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-AE', '����ʧ�ܣ�����ϵ������', '������Ϣ�����������ױ�ȡ��,��Ҫ�������˶�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DF', '�ܱ�Ǹ���豸���ϣ������ѱ�ȡ��', 'ȡ��ʱ������Ȩ�ɹ����䳮���ڳ�ʧ�ܣ�����Ʊδ���豸,��Ҫ�������˶�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PF', '�ܱ�Ǹ���豸���ϣ�������ĳ�Ʊ�����գ�����������ϵ', 'ȡ��ʱ�ͳ�ʧ�ܻ�ֽ�һ���ʧ�ܻ򿨳���������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RT', '�ܱ�Ǹ��������ʱ����Ʊ�����գ�����������ϵ', '������ʱ����Ʊ������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-VF', '�ܱ�Ǹ���豸���ϣ�������ĳ�Ʊ���ݴ棬����������ϵ', '����鳮ʱ�����������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JF', '�ܱ�Ǹ���豸���ϣ�������ĳ�Ʊ�����գ�����������ϵ', '�˳�������ͻ��������տ����������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RE', '�豸��λ���ճ�Ʊʧ��', '�豸��λ���ճ�Ʊʧ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JT', '�豸���ϣ��ſ��˳�ʧ�ܣ�����������ϵ', '���������ϼп����׹��Ϻ�п����豸��λ���տ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CT', '������ʱ�����Ĵſ������գ�����������ϵ', '�˿���ͻ�ȡ��������������ʱ�����̿���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SF', '���׳ɹ�', '���׳ɹ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SC', '�ܱ�Ǹ���������δ����ɣ�����������ϵ', '�ͻ���ʱ��������ȡ����ͻ�ѡ��ȡ������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HF', '�ܱ�Ǹ���豸���ϣ�������ĳ�Ʊ���ݴ棬����������ϵ', '�����ճ�ʱ��������Ҫ�������˶�����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EI', '���������󣬽��ױ�ȡ��', '���������󣬽��ױ�ȡ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P1', '�������������������', '������������������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A1', '������������������', '�����������������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T1', 'ת���˺���Ч', '�ʺ��������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P2', '�����������벻һ��', '�����������벻һ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A2', '��������ת���һ�£���������', '��������ת���һ�£��������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T2', '��������ת���ʺŲ�һ��', '��������ת���ʺŲ�һ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('OK', '���׳ɹ���', '���׳ɹ���', '1');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DE', '�ܱ�Ǹ���������δ����ɣ�����������ϵ', 'ȡ����������豸������������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HT', '�ܱ�Ǹ���������δ����ɣ����ױ�ȡ��', '�������δ�����,����ʱ��ʾ��Ǯ���ݴ�,����������ϵ', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PO', '�����쳣������������ʱ��ӡ�����룬������ֽ��ͳ�ƿ��ɽ���', '�����쳣����������ʱ��ӡ�����롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CO', 'ȡ��������׳�ʱ', 'ȡ��������׳�ʱ��', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CF', 'ȡ���������ʧ��', 'ȡ���������ʧ�ܡ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-W1', '�ڳ���ǰ���Ƿ��˿�ҳ�������ʱ[���ճ��ң�����������ף�ȡ���ñ�ȡ���]', '����ǰ�Ƿ��˿�ҳ�������ʱ��', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-W2', '�ڳ���ǰѡ�����˿������������ϣ��˿�ʧ��[���ճ��ң�����������ף�ȡ���ñ�ȡ���]', '����ǰѡ���˿����˿�ʧ�ܡ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-W3', '�ڳ���ǰѡ�����˿����˿��ɹ����ͻ�ȡ����ʱ����������[���ճ��ң�����������ף�ȡ���ñ�ȡ���]', '����ǰѡ���˿����˿��ɹ�������ʱ���ա�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PT', '�ܱ�Ǹ��ȡ����ʱ����Ʊ�����գ�����������ϵ', 'ȡ��ʱ�����ɹ����ͻ�������ֽ�һ��������������', '2');
commit;

insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ADDCASH', '�ӳ�ȷ��', '�ӳ�ȷ��', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ADP', '�޿����', '�޿����', 0, 1, 2, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CDP', '���', '���', 0, 1, 3, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CERT', '֤�����', '֤�����', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CWC', 'ȡ�����', 'ȡ�����', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CWD', 'ȡ��', 'ȡ��', 0, 1, 1, '1', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('CXGYXX', '��Ա��Ϣ��ѯ', '��Ա��Ϣ��ѯ', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DGDZDXZ', '�Թ��ֻ��˶��˵���ѯ', '�Թ��ֻ��˶��˵���ѯ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DKHKJYPZCX', '�����ƾ֤��ѯ', '�����ƾ֤��ѯ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DXYZM', '������֤��', '������֤��', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('DZYZXZ', '����ӡ������', '����ӡ������', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('FCC', '��ָ��Ȧ�����', '��ָ��Ȧ�����', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('FSC', 'ˢ��ȡ�����', 'ˢ��ȡ�����', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('FSW', 'ˢ��ȡ��', 'ˢ��ȡ��', 0, 0, 1, '1', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('GRMXCX', '���˻�����ϸ���˵���ѯ', '���˻�����ϸ���˵���ѯ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('GYDLYZ', '��Ա��½��֤', '��Ա��½��֤', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('HDHZ', '�ص���ӡ��ִ', '�ص���ӡ��ִ', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ICQC', 'ָ���˻�Ȧ��', 'ָ���˻�Ȧ��', 0, 0, 1, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ICQCC', 'ָ���˻�Ȧ�����', 'ָ���˻�Ȧ�����', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ICS', 'д��֪ͨ', 'д��֪ͨ', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('IDI', '���֤��Ч�ڲ�ѯ', '���֤��Ч�ڲ�ѯ', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('IDV', '֤���Ա�', '֤���Ա�', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('IND', '��ѯ��ϸ', '��ѯ��ϸ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INH', '������ѯ', '������ѯ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INM', '���֤���˺�', '���֤���˺�', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INQ', '����ѯ', '����ѯ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('INQC', '��ѯ����', '��ѯ����', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ITFR', 'ת�˳���', 'ת�˳���', 0, 0, 1, '4', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ITFRR', 'ת�˳�����ѯ', 'ת�˳�����ѯ', 0, 0, 1, '4', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('ITFRS', 'ת��ǩԼ��ѯ', 'ת��ǩԼ��ѯ', 0, 0, 1, '4', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('LXQDPZCX', '�����Ϣ�嵥��ѯ', '�����Ϣ�嵥��ѯ', 0, 0, 1, '3', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('NCW', '�޿�ȡ��', '�޿�ȡ��', 0, 0, 1, '1', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('NFAQC', '��ָ���˻�Ȧ��', '��ָ���˻�Ȧ��', 0, 0, 1, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('PIN', '�޸�����', '�޸�����', 0, 0, 1, null, '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('PWDC', '������֤', '������֤', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('SUSP', '���ɽ���֪ͨ', '���ɽ���֪ͨ', 0, 0, 1, null, '0');
--�˴�C����BUG��Ŀǰת�˺�ת��ǩԼ�����͵�TFRS����ʱ����ת��ǩԼ�����ã�ֻ����TFRS-ת��
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('TFRS', 'ת��', 'ת��', 0, 1, 1, '4', '1');
--�˴�C����BUG��Ŀǰת�˺�ת��ǩԼ�����͵�TFRS����ʱ����ת��ǩԼ������
--insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
--values ('TFRS', 'ת��ǩԼ', 'ת��ǩԼ', 0, 0, 1, '4', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('TKTZ', '�̿�֪ͨ', '�̿�֪ͨ', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('WXYECX', '��ѯ��Աβ�����', '��ѯ��Աβ�����', 0, 0, 1, '3', '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('XCC', '�ֽ�Ȧ�����', '�ֽ�Ȧ�����', 0, 0, 1, null, '0');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('XJQC', '�ֽ�Ȧ��', '�ֽ�Ȧ��', 0, 0, 1, '2', '1');
insert into TRANS_TYPE (NO, NAME, NOTE, ACCOUNTS_CHECK_FLAG, CASHFLAG, TRANS_VALUE, CATEGORY, ISCUSTOMERTX)
values ('XZJYPZCX', '��ת����ƾ֤��ѯ', '��ת����ƾ֤��ѯ', 0, 0, 1, '3', '1');
commit;

--��ӱ���ʱ������ add by zhangyun
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
values (10001, 1, 1, 1, '���й�������֪ͨ,�豸��:${devNo},��������:${orgNo},��������:${catalogNo},�豸ģ��:${devModule},�豸Ʒ��:${devVendor},����ʱ��:${openTime}��');
insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10002, 2, 1, 1, '���й�������֪ͨ,�豸��:${devNo},��������:${orgNo},��������:${catalogNo},�豸ģ��:${devModule},�豸Ʒ��:${devVendor},Ԥ�ڹر�ʱ��:${preCloseTime}��');
insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10003, 3, 1, 1, '���й��Ϲر�֪ͨ,�豸��:${devNo},��������:${orgNo},��������:${catalogNo},�豸Ʒ��:${devVendor},ʵ�ʹر�ʱ��:${useCloseTime}��');
insert into NOTIFY_MODEL (model_id, notify_type, notify_way, model_by, info_set)
values (10004, 4, 1, 0, 'CASE����:�豸��:${devNo},�豸ģ��:${devModule},��ʱδ�����ѹ���');
commit;

insert into SERVICE_PROP_CONTENT (key_id, value, note)
values ('canIssueBySelf', 'N', '�Ƿ���·����������Ĺ�桢�汾');
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
values ('helpUrl', '/share/zjbims/help/�ۺ��˹ܰ����ֲ�_cq.doc', '�����ֲ�');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('syncXlinkOrgFlag', 'Y', '���������Ƿ�ͬ��P��');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('syncXlinkDevFlag', 'Y', '�����豸�Ƿ�ͬ��P��');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('devServiceCompany', '/share/zjbims/tempFile/devServiceCompany', '�豸ά�����ϴ����ļ����λ��');
insert into SERVICE_PROP_SYSTEM (key_id, value, note)
values ('devStopStartMinDays', '7', '�豸ͣ���趨��ʼʱ��൱ǰʱ�����С����');
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

insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('workSheetAutoClose', 'Y', '�����Զ��رձ�־��Y-�Զ���');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('isF5', 'true', 'F5̽�⿪����־');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartBeatRequest', 'CONNTEST', 'F5̽�ⱨ��');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartBeatResponse', 'SUCCESS', 'F5̽�ⷵ�ر���');
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartIDELTimeOut', '60', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('heartBeatRate', '15', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('faultInfoSave', 'Y', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('messageEncrypt', 'false', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('systemLanguage', 'ATTR_zh_CN.properties', null);
insert into SERVICE_PROP_DEVRMTSERVER (key_id, value, note) values ('sensitiveMsg', 'PhoneNum,CustomerID,CustomerName,CheckOptName,CheckOptID', '������Ϣ���ι���');
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
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isRunAdsCancelNotifyJob', 'true', '�Ƿ�ִ�й�泷����ҵ');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isRunAppNotifyJob', 'true', '�Ƿ�ͬ�����');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('isRunVersionNotifyJob', 'true', '�Ƿ�ͬ���汾����ļ�');
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
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('F5DetectRequ', 'CONNTEST', '̽�������(8�ֽ���)');
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('F5DetectResp', 'SUCCESS', '̽��ظ���');
commit;

insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('TransacationFileCatalog', '1', null);
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('pjsLogPrefix', '/share/zjbims/ejfile/', 'pjs��־λ��ǰ׺');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('pjsLogSuffix', '.J', 'pjs��־�ļ���ʽ��׺');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transPushSwitch', 'false', '�������Ϳ���');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transPushIp', '10.0.3.182|10.0.3.183|10.10.3.23|10.10.3.24', '��������ע��ip');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transPushPort', '5218', '��������ע��˿�');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transQueueSwitch', 'true', '�������Ͷ��п���');
insert into SERVICE_PROP_MONITOR (key_id, value, note) values ('transQueueSize', '500', '�������Ͷ�����󳤶�');
commit;

INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('1', '1', '�ӿ��ɶ�/�Ӵ�����');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('2', '1', 'ͻȻ�ϵ�');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('3', '2', '��࣬����ά��');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('4', '2', '����Ӳ��');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('5', '3', '��Ӧ�ܿ�');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('6', '4', 'Ѹ�ٽ������');

INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('FlexiDetailInQuiry', '��ѯ��ϸ', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('Inquiry', '��ѯ���', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('LifePayment', '����ɷ�', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('LiveToDHT', '����ת��', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('NTATMWithdrawal', 'ȡ��', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('PassbookAddRecord', '���۲���', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('PublicApp', '����APP', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('ReceiptPrint', '�ص���ӡ', '3', '10001', '1', NULL, 'wangtao', '2019-11-21 02:38:47', 'app����');
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('SMOpenPersonalAccount', '����', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('SMTransfer_HNZZ', '����ת��', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('SMTransfer_KHZZ', '����ת��', '3', '10002', '1', NULL, 'wangtao', '2019-09-12 09:40:29', NULL);
INSERT INTO APPS_INFO_TABLE (APPS_ID, APPS_NAME, APPS_TYPE, APPS_CATALOG, APPS_STATUS, LOGO_PATH, ADD_USER, ADD_TIME, DESCRIPTION) VALUES('ZJUAP', 'ȫ����ͳһƽ̨', '1', '10001', '1', NULL, 'admin1', NULL, 'ƽ̨');
commit;
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('bc078b35-596b-4bf7-89cb-ff9998e2230f', 'FlexiDetailInQuiry', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '��ѯ��ϸ', NULL, '001000000', '/home/shareDir/FlexiDetailInQuiry/FlexiDetailInQuiry_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('95c0b56a-8e3a-4ea0-9fcb-92998598969d', 'Inquiry', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '��ѯ���', NULL, '001000000', '/home/shareDir/Inquiry/Inquiry_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('2717cd2e-de79-4115-8a61-935ae1af5f37', 'LifePayment', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '����ɷ�', NULL, '001000000', '/home/shareDir/LifePayment/LifePayment_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('478238cc-888e-4d08-8b15-d033b2872940', 'LiveToDHT', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '����ת��', NULL, '001000000', '/home/shareDir/LiveToDHT/LiveToDHT_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('e1006e1f-134d-4a93-905b-8f2aa61e07cd', 'NTATMWithdrawal', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', 'ȡ��', NULL, '001000000', '/home/shareDir/NTATMWithdrawal/NTATMWithdrawal_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('b868b648-f42f-422d-9e0b-90845630215d', 'PassbookAddRecord', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '���۲���', NULL, '001000000', '/home/shareDir/PassbookAddRecord/PassbookAddRecord_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('08ecfe77-b274-4043-b059-00ad952c69a9', 'PublicApp', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '����APP', NULL, '001000000', '/home/shareDir/PublicApp/PublicApp_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('4b2e04a5-19c0-4d35-9106-64cf00c5fb8e', 'ReceiptPrint', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '�ص���ӡ', NULL, '001000000', '/home/shareDir/ReceiptPrint/ReceiptPrint_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('9cc0a94c-60ff-448d-af82-921c8822db60', 'SMOpenPersonalAccount', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '����', NULL, '001000000', '/home/shareDir/SMOpenPersonalAccount/SMOpenPersonalAccount_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('e460ceb4-d944-4974-929e-9ec7fc1dd327', 'SMTransfer_HNZZ', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '����ת��', NULL, '001000000', '/home/shareDir/SMTransfer_HNZZ/SMTransfer_HNZZ_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('e460ceb4-d944-4974-929e-9ec7fc1dd328', 'SMTransfer_KHZZ', '001S', '1.0.0', '1', NULL, 'wangtao', '2019-09-12 09:40:29', '����ת��', NULL, '001000000', '/home/shareDir/SMTransfer_KHZZ/SMTransfer_KHZZ_V1.0.0.zip', '2', NULL);
INSERT INTO APPS_VERSION_TABLE (LOGIC_ID, APPS_ID, VERSION_BUS_NO, VERSION_APP_NO, VERSION_STATUS, VERSION_CLIENT_PATH, ADD_USER, ADD_TIME, VERSION_DESCRIPTION, VERSION_FILE_MD5, VERSION_SEQ_NO, VERSIONFILEPATH, VERSIONNOTIFYFLAG, TAKETIME) VALUES('0cdae922-1925-4d8b-a791-b4bbb2a3553a', 'ZJUAP', '001S', '1.0.0', '1', 'C:/', 'admin1', '2019-06-23 22:00:00', 'ȫ����ͳһƽ̨', NULL, '001000000', NULL, '2', '2019-10-23 19:26:08');
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


insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('50', '����', '1', '', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('51', '�Ĵ�', '1', '', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('52', '����', '1', '', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('61', '����', '1', '', '');

insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5001', '��Ͻ��', '2', '50', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5002', '��', '2', '50', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5101', '�ɶ���', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5103', '�Թ���', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5104', '��֦����', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5105', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5106', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5107', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5108', '��Ԫ��', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5109', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5110', '�ڽ���', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5111', '��ɽ��', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5113', '�ϳ���', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5114', 'üɽ��', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5115', '�˱���', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5116', '�㰲��', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5117', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5118', '�Ű���', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5119', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5120', '������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5132', '���Ӳ���Ǽ��������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5133', '���β���������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5134', '��ɽ����������', '2', '51', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5201', '������', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5202', '����ˮ��', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5203', '������', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5204', '��˳��', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5205', '�Ͻ���', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5206', 'ͭ����', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5223', 'ǭ���ϲ���������������', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5226', 'ǭ�������嶱��������', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('5227', 'ǭ�ϲ���������������', '2', '52', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6101', '������', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6102', 'ͭ����', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6103', '������', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6104', '������', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6105', 'μ����', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6106', '�Ӱ���', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6107', '������', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6108', '������', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6109', '������', '2', '61', '');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('6110', '������', '2', '61', '');

insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510101', '��Ͻ��', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510104', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510105', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510106', '��ţ��', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510107', '�����', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510108', '�ɻ���', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510112', '��Ȫ����', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510113', '��׽���', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510114', '�¶���', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510115', '�½���', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510121', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510122', '˫����', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510124', 'ۯ��', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510129', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510131', '�ѽ���', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510132', '�½���', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510181', '��������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510182', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510183', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510184', '������', '3', '51', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510301', '��Ͻ��', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510302', '��������', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510303', '������', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510304', '����', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510311', '��̲��', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510321', '����', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510322', '��˳��', '3', '51', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510401', '��Ͻ��', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510402', '����', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510403', '����', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510411', '�ʺ���', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510421', '������', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510422', '�α���', '3', '51', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510501', '��Ͻ��', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510502', '������', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510503', '��Ϫ��', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510504', '����̶��', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510521', '����', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510522', '�Ͻ���', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510524', '������', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510525', '������', '3', '51', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510601', '��Ͻ��', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510603', '�����', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510623', '�н���', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510626', '�޽���', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510681', '�㺺��', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510682', 'ʲ����', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510683', '������', '3', '51', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510701', '��Ͻ��', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510703', '������', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510704', '������', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510722', '��̨��', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510723', '��ͤ��', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510724', '����', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510725', '������', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510726', '����Ǽ��������', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510727', 'ƽ����', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510781', '������', '3', '51', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510801', '��Ͻ��', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510802', '������', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510811', 'Ԫ����', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510812', '������', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510821', '������', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510822', '�ന��', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510823', '������', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510824', '��Ϫ��', '3', '51', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510901', '��Ͻ��', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510903', '��ɽ��', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510904', '������', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510921', '��Ϫ��', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510922', '�����', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('510923', '��Ӣ��', '3', '51', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511001', '��Ͻ��', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511002', '������', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511011', '������', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511024', '��Զ��', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511025', '������', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511028', '¡����', '3', '51', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511101', '��Ͻ��', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511102', '������', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511111', 'ɳ����', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511112', '��ͨ����', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511113', '��ں���', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511123', '��Ϊ��', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511124', '������', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511126', '�н���', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511129', '�崨��', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511132', '�������������', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511133', '�������������', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511181', '��üɽ��', '3', '51', '11');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511301', '��Ͻ��', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511302', '˳����', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511303', '��ƺ��', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511304', '������', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511321', '�ϲ���', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511322', 'Ӫɽ��', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511323', '���', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511324', '��¤��', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511325', '������', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511381', '������', '3', '51', '13');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511401', '��Ͻ��', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511402', '������', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511421', '������', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511422', '��ɽ��', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511423', '������', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511424', '������', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511425', '������', '3', '51', '14');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511501', '��Ͻ��', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511502', '������', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511503', '��Ϫ��', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511521', '�˱���', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511523', '������', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511524', '������', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511525', '����', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511526', '����', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511527', '������', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511528', '������', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511529', '��ɽ��', '3', '51', '15');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511601', '��Ͻ��', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511602', '�㰲��', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511621', '������', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511622', '��ʤ��', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511623', '��ˮ��', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511681', '������', '3', '51', '16');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511701', '��Ͻ��', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511702', 'ͨ����', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511721', '����', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511722', '������', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511723', '������', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511724', '������', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511725', '����', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511781', '��Դ��', '3', '51', '17');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511801', '��Ͻ��', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511802', '�����', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511803', '��ɽ��', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511822', '������', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511823', '��Դ��', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511824', 'ʯ����', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511825', '��ȫ��', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511826', '«ɽ��', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511827', '������', '3', '51', '18');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511901', '��Ͻ��', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511902', '������', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511921', 'ͨ����', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511922', '�Ͻ���', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('511923', 'ƽ����', '3', '51', '19');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512001', '��Ͻ��', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512002', '�㽭��', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512021', '������', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512022', '������', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('512081', '������', '3', '51', '20');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513221', '�봨��', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513222', '����', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513223', 'ï��', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513224', '������', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513225', '��կ����', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513226', '����', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513227', 'С����', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513228', '��ˮ��', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513229', '�������', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513230', '������', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513231', '������', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513232', '��������', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513233', '��ԭ��', '3', '51', '32');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513321', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513322', '����', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513323', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513324', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513325', '�Ž���', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513326', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513327', '¯����', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513328', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513329', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513330', '�¸���', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513331', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513332', 'ʯ����', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513333', 'ɫ����', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513334', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513335', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513336', '�����', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513337', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513338', '������', '3', '51', '33');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513401', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513422', 'ľ�����������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513423', '��Դ��', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513424', '�²���', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513425', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513426', '�ᶫ��', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513427', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513428', '�ո���', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513429', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513430', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513431', '�Ѿ���', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513432', 'ϲ����', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513433', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513434', 'Խ����', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513435', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513436', '������', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('513437', '�ײ���', '3', '51', '34');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520101', '��Ͻ��', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520102', '������', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520103', '������', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520111', '��Ϫ��', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520112', '�ڵ���', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520113', '������', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520114', 'С����', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520121', '������', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520122', 'Ϣ����', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520123', '������', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520181', '������', '3', '52', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520201', '��ɽ��', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520203', '��֦����', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520221', 'ˮ����', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520222', '����', '3', '52', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520301', '��Ͻ��', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520302', '�컨����', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520303', '�㴨��', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520321', '������', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520322', 'ͩ����', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520323', '������', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520324', '������', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520325', '��������������������', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520326', '������������������', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520327', '�����', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520328', '��̶��', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520329', '������', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520330', 'ϰˮ��', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520381', '��ˮ��', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520382', '�ʻ���', '3', '52', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520401', '��Ͻ��', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520402', '������', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520421', 'ƽ����', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520422', '�ն���', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520423', '��������������������', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520424', '���벼��������������', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520425', '�������岼����������', '3', '52', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520502', '���ǹ���', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520521', '����', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520522', 'ǭ����', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520523', '��ɳ��', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520524', '֯����', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520525', '��Ӻ��', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520526', '���������������������', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520527', '������', '3', '52', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520602', '�̽���', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520603', '��ɽ��', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520621', '������', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520622', '��������������', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520623', 'ʯ����', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520624', '˼����', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520625', 'ӡ������������������', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520626', '�½���', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520627', '�غ�������������', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('520628', '��������������', '3', '52', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522301', '������', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522322', '������', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522323', '�հ���', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522324', '��¡��', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522325', '�����', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522326', '������', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522327', '�����', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500109', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500110', '�뽭��', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500111', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500112', '�山��', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500113', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500114', 'ǭ����', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500115', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500116', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500117', '�ϴ���', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500118', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500119', '�ϴ���', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500223', '������', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500224', 'ͭ����', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500226', '�ٲ���', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500227', '�ɽ��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500228', '��ƽ��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500229', '�ǿ���', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500230', '�ᶼ��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500231', '�潭��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500232', '��¡��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500233', '����', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500234', '����', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500235', '������', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500236', '�����', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500237', '��ɽ��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500238', '��Ϫ��', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500240', 'ʯ��������������', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500241', '��ɽ����������������', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500242', '��������������������', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500243', '��ˮ����������������', '3', '50', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522328', '������', '3', '52', '23');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522601', '������', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522622', '��ƽ��', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522623', 'ʩ����', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522624', '������', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522625', '��Զ��', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522626', '᯹���', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522627', '������', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522628', '������', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522629', '������', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522630', '̨����', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522631', '��ƽ��', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522632', '�Ž���', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522633', '�ӽ���', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522634', '��ɽ��', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522635', '�齭��', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522636', '��կ��', '3', '52', '26');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522701', '������', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522702', '��Ȫ��', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522722', '����', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522723', '����', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522725', '�Ͱ���', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522726', '��ɽ��', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522727', 'ƽ����', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522728', '�޵���', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522729', '��˳��', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522730', '������', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522731', '��ˮ��', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('522732', '����ˮ��������', '3', '52', '27');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610101', '��Ͻ��', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610102', '�³���', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610103', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610104', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610111', '�����', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610112', 'δ����', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610113', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610114', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610115', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610116', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610122', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610124', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610125', '����', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610126', '������', '3', '61', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610201', '��Ͻ��', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610202', '������', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610203', 'ӡ̨��', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610204', 'ҫ����', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610222', '�˾���', '3', '61', '02');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610301', '��Ͻ��', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610302', 'μ����', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610303', '��̨��', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610304', '�²���', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610322', '������', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610323', '�ɽ��', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610324', '������', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610326', 'ü��', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610327', '¤��', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610328', 'ǧ����', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610329', '������', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610330', '����', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610331', '̫����', '3', '61', '03');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610401', '��Ͻ��', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610402', '�ض���', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610403', '������', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610404', 'μ����', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610422', '��ԭ��', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610423', '������', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610424', 'Ǭ��', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610425', '��Ȫ��', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610426', '������', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610427', '����', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610428', '������', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610429', 'Ѯ����', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610430', '������', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610431', '�书��', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610481', '��ƽ��', '3', '61', '04');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610501', '��Ͻ��', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610502', '��μ��', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610521', '����', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610522', '������', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610523', '������', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610524', '������', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610525', '�γ���', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610526', '�ѳ���', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610527', '��ˮ��', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610528', '��ƽ��', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610581', '������', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610582', '������', '3', '61', '05');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610601', '��Ͻ��', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610602', '������', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610621', '�ӳ���', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610622', '�Ӵ���', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610623', '�ӳ���', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610624', '������', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610625', '־����', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610626', '������', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610627', '��Ȫ��', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610628', '����', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610629', '�崨��', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610630', '�˴���', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610631', '������', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610632', '������', '3', '61', '06');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610701', '��Ͻ��', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610702', '��̨��', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610721', '��֣��', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610722', '�ǹ���', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610723', '����', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610724', '������', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610725', '����', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610726', '��ǿ��', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610727', '������', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610728', '�����', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610729', '������', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610730', '��ƺ��', '3', '61', '07');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610801', '��Ͻ��', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610802', '������', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610821', '��ľ��', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610822', '������', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610823', '��ɽ��', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610824', '������', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610825', '������', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610826', '�����', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610827', '��֬��', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610828', '����', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610829', '�Ɽ��', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610830', '�彧��', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610831', '������', '3', '61', '08');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610901', '��Ͻ��', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610902', '������', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610921', '������', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610922', 'ʯȪ��', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610923', '������', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610924', '������', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610925', '᰸���', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610926', 'ƽ����', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610927', '��ƺ��', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610928', 'Ѯ����', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('610929', '�׺���', '3', '61', '09');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611001', '��Ͻ��', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611002', '������', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611021', '������', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611022', '������', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611023', '������', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611024', 'ɽ����', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611025', '����', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('611026', '��ˮ��', '3', '61', '10');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500101', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500102', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500103', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500104', '��ɿ���', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500105', '������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500106', 'ɳƺ����', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500107', '��������', '3', '50', '01');
insert into PROVINCE_CITY_CODE (CODE, CODE_NAME, GRADE, PROVINCE_CODE, CITY_CODE) values ('500108', '�ϰ���', '3', '50', '01');

-- �豸����ģ��
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('SendStatusTimeSpace', '�������״̬��ʱ��', '1800000', '�������״̬��ʱ��', '^\d+$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('MaxWithdrawalCount', '�豸ȡ������������', '50', '�豸ȡ������������', '^\d+$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('CardTypeMaxAmount', '�������ȡ����', '001,5000|002,5000|998,2000', '��ͬ�����Ͷ�Ӧ�����ȫ����', '^001{1},\d*[0]{2,}\|002{1},\d*[0]{2,}\|998{1},\d*[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('SingleMaxInterTFRAmount', '�����������ת�˽��', '50000', 'Ĭ��ֵ', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('SingleMaxExternalTFRAmount', '����������ת�˽��', '50000', 'Ĭ��ֵ', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('WithdrawalAmount_001', '���н�ǿ�ȡ����ѡ������', '100,200,500,1000,2000,5000', '1.ȡ�������ʾ��ȡ�����С������ߴӴ�С�����ŷָ�����������6����2.���н�ǿ�ȡ����ѡ�����õ����ֵӦС�ڵ��ڱ��н�ǿ�����ȡ����', '^(([1-9]+[0]{2,},){5})([1-9]+[0]{2,}){1}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('WithdrawalAmount_002', '�������ÿ�ȡ����ѡ������', '100,200,500,1000,2000,5000', '1.ȡ�������ʾ��ȡ�����С������ߴӴ�С�����ŷָ�����������6����2.�������ÿ�ȡ����ѡ�����õ����ֵӦС�ڵ��ڱ������ÿ�����ȡ����', '^(([1-9]+[0]{2,},){5})([1-9]+[0]{2,}){1}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('WithdrawalAmount_998', '���п�ȡ����ѡ������', '100,200,500,1000,1500,2000', '1.ȡ�������ʾ��ȡ�����С������ߴӴ�С�����ŷָ�����������6����2.���п�ȡ����ѡ�����õ����ֵӦС�ڵ������п�����ȡ����', '^(([1-9]+[0]{2,},){5})([1-9]+[0]{2,}){1}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('maxCumwithdrawalamt', '�ۼ����ȡ����', '20000', 'Ĭ�ϣ�һ��Ϊ���Ŀ��ƣ�', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('maxwithdrawalamt', '�豸�������ȡ����', '2000', 'Ĭ��ֵ', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('TotalMaxInterTFRAmount', '�ۼ��������ת�˽��', '50000', 'Ĭ�ϣ�һ��Ϊ���Ŀ��ƣ�', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('TotalMaxExternalTFRAmount', '�ۼ�������ת�˽��', '50000', 'Ĭ�ϣ�һ��Ϊ���Ŀ��ƣ�', '^[1-9]{1,}[0]{2,}$');
INSERT INTO "PARAM_BUSINESS_TEMPLATE" VALUES ('maxdepositcount', '���������', '100', '��λ����', '^\d+$');
commit;

insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416900', '����');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417910', '����');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417010', '����');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416510', '�ɶ�');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416517', '�ɶ�����');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417090', '�����Ͻ�');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04418040', '�����Ӱ�');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416650', '�Ĵ�ʡ��ɽ��');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417020', '����ˮ');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04417030', '����');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04416690', '�Ĵ�ʡ�㰲��');
insert into UNIONPAY_AREACODE_TABLE(CODE_ID, AREA_NAME)
values ('04418888', '�Ĵ�ʡXX��');
commit;


--ģ�������־���ø��� mod by lipeng
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.LoginController', 'login', '�û���¼', '��¼');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.SelfHelpBankController', 'add', '�������й���ģ��', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.SelfHelpBankController', 'mod', '�������й���ģ��', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.SelfHelpBankController', 'del', '�������й���ģ��', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'add', '�û�����', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'mod', '�û�����', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'del', '�û�����', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevBaseController', 'add', '�豸����', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevBaseController', 'mod', '�豸����', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevBaseController', 'del', '�豸����', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BankManagerController', 'add', '������Ա����', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BankManagerController', 'mod', '������Ա����', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BankManagerController', 'del', '������Ա����', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.RoleController', 'add', '��ɫ����', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.RoleController', 'mod', '��ɫ����', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.RoleController', 'del', '��ɫ����', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CaseCatalogController', 'mod', '������Ӧ�趨', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController', 'add', '����ά���̹���', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController', 'del', '����ά���̹���', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.CompanyMaintainController', 'mod', '����ά���̹���', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController', 'add', '�豸���͹���', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController', 'mod', '�豸���͹���', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevCatalogController', 'del', '�豸���͹���', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController', 'add', '�豸ά���̹���', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController', 'del', '�豸ά���̹���', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevServiceCompanyController', 'mod', '�豸ά���̹���', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevStopController', 'add', '�豸ͣ������', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevStopController', 'mod', '�豸ͣ������', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevTypeController', 'mod', '�豸�ͺŹ���', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevTypeController', 'del', '�豸�ͺŹ���', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevVendorController', 'add', '�豸Ʒ�ƹ���', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevVendorController', 'mod', '�豸Ʒ�ƹ���', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevVendorController', 'del', '�豸Ʒ�ƹ���', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.OrgController', 'add', '��������', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.OrgController', 'mod', '��������', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.OrgController', 'del', '��������', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController', 'add', '�������', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController', 'mod', '�������', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.BulletinInfoController', 'del', '�������', 'ɾ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppModelController', 'addModel', '��˹���', '��ӱ��Ӧ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.control.controller.RemoteController', 'remoteControl', '�豸����', 'Զ�̿���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.control.controller.RemoteController', 'upload2Remote', '�豸����', '�ļ��ϴ�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdvertisementController', 'addAdv', '�������', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsResourceController', 'upload', '��Դ����', '�ļ��ϴ�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsResourceController', 'add', '��Դ����', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsResourceController', 'mod', '��Դ����', '�޸�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsSpaceController', 'add', '���λ����', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.UserController', 'modPasswd', '�û�����', '�޸�����');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.system.controller.DevTypeController', 'add', '�豸�ͺŹ���', '���');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppModelController', 'addModelApp', '��˹���', '��ӱ��Ӧ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppModelController', 'rangeModel', '��˹���', '�����˷�Χ');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppVersionController', 'commitVersion', 'Ӧ�ù���', '����汾��Ϣ');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppVersionController', 'resourceUpload', 'Ӧ�ù���', '�ļ��ϴ�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AppVersionController', 'checkVersion', 'Ӧ�ù���', 'У��汾�ļ�');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdsValidController', 'valid', '���Ͷ��', 'Ͷ��');
INSERT INTO SYS_OPERATE(MENU_NO,BTN_NO,MENU_NAME,BTN_NAME) VALUES ('com.zjft.zhyg.content.controller.AdvertisementController', 'delAdv', '�������', 'ɾ��');



--��Ӷ�ʱ���񿪹� add by zhangyun
DELETE FROM SERVICE_PROP_REPORTS;
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('tellerOrgDayTransTaskSwitch', 'false', '��������ÿ�콻����ͳ��');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevTypeHourSwitch', 'false', 'ÿ̨�豸ÿСʱ�����ͽ�����(C������Դ)����');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevTypeDaySwitch', 'false', 'ÿ̨�豸ÿ������ͽ���������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevDaySwitch', 'false', 'ÿ̨�豸ÿ�꽻��������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transOrgDaySwitch', 'false', '����ÿ�콻��������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transOrgMonthSwitch', 'false', '����ÿ�½���������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transOrgYearSwitch', 'false', '����ÿ�꽻��������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transWayTypeDaySwitch', 'false', '����������������ÿ�콻��������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateDevDaySwitch', 'false', 'ÿ̨ÿ�쿪���ʿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateDevMonthSwitch', 'false', 'ÿ̨ÿ�¿����ʿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateDevYearSwitch', 'false', 'ÿ̨ÿ�꿪���ʿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('openRateOrgDevDaySwitch', 'false', '����̨���վ������ʿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('devAmountVendorDaySwitch', 'false', 'ÿ��ÿ��Ʒ���豸���������������������̿�����');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevDayTaskSwitch', 'false', '����ÿ̨ÿ�쿪��');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('transDevDayTypeCardFlagSwitch', 'false', '����ÿ̨ÿ������ֿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('pTransDevHourTypeTaskSwitch', 'false', 'ÿ̨�豸ÿСʱ���������ͽ�������P������Դ������');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevHourTaskSwitch', 'false', '�кŻ�ÿСʱͳ�ƿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevDayTaskSwitch', 'false', '�кŻ�ÿ��ͳ�ƿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevMonthTaskSwitch', 'false', '�кŻ�ÿ��ͳ�ƿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevMonthTaskSwitch', 'false', 'ÿ̨ÿ�¹���ͳ�ƿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevYearTaskSwitch', 'false', 'ÿ̨ÿ�����ͳ�ƿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('faultDevMonthModTaskSwitch', 'false', 'ÿ̨ÿ�¸�ģ�����ͳ�ƿ���');
INSERT INTO SERVICE_PROP_REPORTS(KEY_ID, VALUE, NOTE) VALUES ('callDevStatusTaskSwitch', 'false', '�кŻ�ÿ̨��״̬ͳ�ƿ���');
COMMIT;

-- ��ʼ��һ���豸��Ϣ
insert into DEV_BASE_INFO (no, ip, org_no, account_org_no, away_flag, self_bank_no, dev_catalog, dev_vendor, dev_type, work_type, status, dev_service, terminal_no, serial, address, buy_date, install_date, start_date, stop_date, open_time, close_time, expire_date, patrol_period, cashbox_limit, os, atmc_soft, anti_virus_soft, sp, virtual_teller_no, care_level, last_pm_date, expire_pm_date, locate_no, note1, note2, note3, note4, note5, carrier, money_org, dev_status, environment, address_code, cash_type, setup_type, net_type, operate_status, registration_status, comm_packet, zip_type, dek_encoded, atmp_area, dev_log_path, trans_rate, x, y, comm_cst_no, area_no, term_account_no, management_name, account_type, card_flag, check_org, tradingvolume, encryptmode, cycle_flag, region, city, manage_org_no, route)
values ('11111111', '199.168.3.114', '0100', '0100', '2', null, 'ATM', '10002', '10004', '3', '2', '53915', null, '024253', '��������ͨ3����ţ����վ', null, '2011-12-05', '2012-06-06', null, '00:00:00', '23:59:59', '2017-06-05', '180', '50000', null, '10002', null, 'sp', '7275', null, null, null, null, '����', '2', null, null, null, null, null, '1', null, null, '1', '1', '1', '2', '1', '8000', '3', null, '04416900', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

insert into DEV_OPERATE_INFO (no, quarter_lease_amount, cooperation_number, selfbank, investment, area_div, belongarea, cooperation, change_date, use_status, assets_no, network_operator, remark, install_site, case_way)
values ('11111111', '6300', 2100, '1', '1', '1', '������', '53915', null, '1', null, '����', '��ͨ86185119', '���ţ����վ', '2');

insert into DEV_STATUS_TABLE (dev_no, dev_status, dev_tx_status, dev_net_status, dev_run_status, dev_cash_status, dev_crs_status, action_type, action_note, dev_cashbox_status, dev_mod_status, dev_potential_fault, status_last_time, status_expire_time, tx_type, tx_time, atm_type, cash_unit_type, status_info_type, combin_unit_type, idc_device_status, cim_device_status, cdm_device_status, dep_device_status, ups_device_status, spr_device_status, rpr_device_status, jpr_device_status, chk_device_status, ttu_device_status, pbk_device_status, pin_device_status, siu_device_status, cam_device_status, crd_device_status, ccd_device_status, idc_media_status, idc_capture_bin_status, idc_capture_bin_count, cim_accept_or_status, cim_escrow_status, cim_cash_units, cim_shutter_status, cim_transport_status, cim_inout_position, cim_input_output_status, cim_pu_id, cim_pu_count, cim_pu_cash_in_count, cim_pu_status, cim_pupos_name, cim_cu_id, cim_pcu_id, cim_cu_note_value, cim_cu_currency, cim_cu_count, cim_cu_cash_in_count, cim_cu_type, cim_cu_status, cdm_shutter_status, cdm_dispenser_status, cdm_safe_door_status, cdm_stacker_status, cdm_cash_units, cdm_transport_status, cdm_out_position, cdm_input_output_status, cdm_pu_status, cdm_pu_id, cdm_pu_initial_count, cdm_pu_current_count, cdm_pu_reject_count, cdm_pupos_name, cdm_cu_id, cdm_pcu_id, cdm_cu_note_value, cdm_cu_currency, cdm_cu_current_count, cdm_cu_initial_count, cdm_cu_reject_count, cdm_cu_type, cdm_cu_status, dep_deposit_status, dep_deposit_container_status, dep_envelope_supply_status, dep_envelope_status, dep_printer_status, dep_printer_ink, dep_deposited_items, dep_transport_status, dep_shutter_status, ups_low, ups_engaged, ups_powering, ups_recovered, spr_media_status, spr_paper_status, spr_retract_bin_status, spr_ink_status, spr_toner_status, spr_stack_count, chk_media_status, chk_ink_status, rpr_media_status, rpr_paper_status, rpr_retract_bin_status, rpr_ink_status, rpr_toner_status, jpr_media_status, jpr_paper_status, jpr_ink_status, jpr_toner_status, pbk_media_status, pbk_ink_status, pbk_toner_status, pbk_retract_bin_status, pbk_retract_bin_count, siu_operator_switch, siu_terminal_tamper, siu_alarm_tamper, siu_seismic, siu_proximity_detector, siu_heat, siu_ambient_light, siu_cabinet_state, siu_safe_state, siu_shield_state, siu_bill_acceptor_light, siu_card_reader_light, siu_cheque_unit_light, siu_coin_dispenser_light, siu_note_dispenser_light, siu_envelope_depository_light, siu_passbook_printer_light, siu_pinpad_light, siu_receipt_printer_light, siu_envelope_dispenser_light, cam_camera_area, cam_camera_area_status, cam_media_status, cam_picture_staken, icc_device_status, icc_media_status, isc_device_status, isc_media_status, irc_device_status, irc_media_status, fpi_device_status, dpr_device_status, bcr_device_status, pjc_ret_code, pjc_cru_status, pjc_ej_sendtime, pjc_ej_date, pjc_ej_nsend, cdm_cu_number, cim_cu_number)
values ('11111111', 'UNKNOWN', 'UNKNOWN', 'FATAL', 'UNKNOWN', null, null, 'U', null, 'UNKNOWN', 'UNKNOWN', null, null, null, null, null, null, null, null, null, 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'UNKNOWN', null, 'UNKNOWN', null, null, null, null, null, null, null, null, null, null, null);

insert into DEV_STATUS_TABLE_EXPAND (dev_no, crd_dispenser, crd_transport, crd_media, crd_shutter, crd_supplybin_status, crd_retainbin_status, crd_cu_id, crd_cu_name, crd_cu_status, crd_cu_type, crd_cu_count, crd_cu_initial_count, crd_cu_retain_count, ccd_dispenser, ccd_transport, ccd_media, ccd_shutter, ccd_supplybin_status, ccd_retainbin_status, ccd_cu_id, ccd_cu_name, ccd_cu_status, ccd_cu_type, ccd_cu_count, ccd_cu_initial_count, ccd_cu_retain_count, dpr_media_status, dpr_supply_level_status, dpr_supply_lower_status, dpr_supply_external_status, dpr_supply_aux_status, dpr_retract_bin_status, dpr_toner_status, dpr_ink_status, bcr_scanner_status, nts_cache_count, nts_last_build_time)
values ('11111111', null, null, null, null, 'UNKNOWN', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

INSERT INTO DEV_ATTRIBUTE_TABLE (DEV_NO, ATTRIBUTE_LAST_TIME, IDC_EXIST, CIM_EXIST, CDM_EXIST, DEP_EXIST, UPS_EXIST, SPR_EXIST, CHK_EXIST, RPR_EXIST, JPR_EXIST, TTU_EXIST, PBK_EXIST, PIN_EXIST, SIU_EXIST, CAM_EXIST, CRD_EXIST, CCD_EXIST, IDC_VARIANT, IDC_CAN_EJECT, IDC_CAN_CAPTURE, IDC_BIN_CAPACITY, IDC_CAN_DISPENSE, IDC_SECURITY, IDC_TRACK_1_READ, IDC_TRACK_1_WRITE, IDC_TRACK_2_READ, IDC_TRACK_2_WRITE, IDC_TRACK_3_READ, IDC_TRACK_3_WRITE, IDC_TRACK_JISII_READ, IDC_TRACK_JISII_WRITE, CIM_CAN_ESCROW, CIM_SHUTTER_CONTROL_SUPPORT, CIM_MAX_ACCEPT_ITEMS, CIM_CAN_DETECT_CASH_INSERTED, CIM_CAN_DETECT_CASH_TAKEN, CIM_RETRACT_AREA, CDM_HAS_STACKER, CDM_HAS_SHUTTER, CDM_CAN_RETRACT, CDM_CAN_DETECT_CASH_TAKEN, CDM_CAN_TEST_PHSICAL_UNITS, CDM_MAX_DISPENSE_BILLS, CDM_NUM_OF_LOGICAL_CASH_UNITS, CDM_NUM_OF_PHYSICAL_CASH_UNITS, CDM_NUM_OF_CURRENCIES, CDM_CURRENCIES, CDM_EXPONENTS, DEP_DEPOSIT_TYPE, DEP_CAN_DISPENSE, DEP_CAN_PRINT, DEP_CAN_PRINT_ON_RETRACTS, DEP_CAN_RETRACT, DEP_MAX_PRINT_LENGTH, UPS_CAN_DETECT_LOW, UPS_CAN_BE_ENGAGED, UPS_CAN_DETECT_POWING, UPS_CAN_DETECT_RECOVERED, UPS_CAN_POWER_OFF, UPS_CAN_POWER_CYCLE, SPR_VARIANT, SPR_CAN_EJECT, SPR_CAN_CAPTURE, SPR_CAN_STACK, SPR_MAX_RETRACT, SPR_MAX_STRACK, CHK_CAN_RAW_PRINT, CHK_CAN_EJECT, CHK_CAN_STACK, CHK_CAN_CAPTURE, CHK_CAN_STAMP, CHK_CAN_DETECT_MEDIA_TAKEN, CHK_CAN_READ_FRONT_IMAGE, CHK_CAN_READ_BACK_IMAGE, CHK_CAN_READ_CODE_LINE, CHK_CODE_LINE_FORMATS, CHK_MAX_RETRACT, CHK_MAX_ACCEPT_ITEMS, CHK_SUPPORTED_IMAGE_FORMATS, RPR_VARIANT, RPR_CAN_EJECT, RPR_CAN_CAPTURE, RPR_CAN_STACK, RPR_MAX_RETRACT, JPR_VARIANT, JPR_CAN_EJECT, JPR_CAN_CAPTURE, JPR_CAN_STACK, TTU_ALPHA_NUMERIC_KEYS_PRESENT, TTU_HEXADECIMAL_KEYS_PRESENT, TTU_NUMERIC_KEYS_PRESENT, TTU_KEYBOARD_LOCK_PRESENT, TTU_DISPLAY_LIGHT_PRESENT, TTU_NUMBER_OF_RESOLUTIONS, TTU_CURSOR_SUPPORTED, TTU_FORMS_SUPPORTED, TTU_RESOLUTION_X, TTU_RESOLUTION_Y, PBK_VARIANT, PBK_CAN_EJECT, PBK_CAN_CAPTURE, PBK_CAN_STACK, PBK_MAX_RETRACT, PIN_CAN_EBC, PIN_CAN_CBC, PIN_CAN_MAC, PIN_CAN_RSA, PIN_CAN_VERIFY_DES, PIN_CAN_VERIFY_EC, PIN_CAN_VERIFY_VISA, PIN_CAN_DES_OFFSET, PIN_CAN_TRIPLE_EBC, PIN_CAN_TRIPLE_CBC, PIN_CAN_TRIPLE_MAC, PIN_CAN_TRIPLE_CFB, PIN_FUNCTION_KEYS_SUPPORTED, SIU_CABINET_CAN_BOLT, SIU_SAFE_CAN_BOLT, SIU_SHIELD_CAN_KEYBOARD, SIU_SHIELD_CAN_OPEN, SIU_SHIELD_CAN_CLOSE, SIU_SHIELD_CAN_SERVICE, CAM_MAX_PICTURES, CAM_PICTURE_INFO, CAM_MAX_PICTURE_INFO_SIZE, ICC_VARIANT, ICC_CAN_EJECT, ICC_CAN_CAPTURE, ICC_BIN_CAPACITY, ICC_CAN_DISPENSE, ICC_SECURITY, ICC_TRACK_1_READ, ICC_TRACK_1_WRITE, ICC_TRACK_2_READ, ICC_TRACK_2_WRITE, ICC_TRACK_3_READ, ICC_TRACK_3_WRITE, ICC_TRACK_JISII_READ, ICC_TRACK_JISII_WRITE, ICC_EXIST, ISC_VARIANT, ISC_CAN_EJECT, ISC_CAN_CAPTURE, ISC_BIN_CAPACITY, ISC_CAN_DISPENSE, ISC_SECURITY, ISC_TRACK_1_READ, ISC_TRACK_1_WRITE, ISC_TRACK_2_READ, ISC_TRACK_2_WRITE, ISC_TRACK_3_READ, ISC_TRACK_3_WRITE, ISC_TRACK_JISII_READ, ISC_TRACK_JISII_WRITE, ISC_EXIST, IRC_VARIANT, IRC_CAN_EJECT, IRC_CAN_CAPTURE, IRC_BIN_CAPACITY, IRC_CAN_DISPENSE, IRC_SECURITY, IRC_TRACK_1_READ, IRC_TRACK_1_WRITE, IRC_TRACK_2_READ, IRC_TRACK_2_WRITE, IRC_TRACK_3_READ, IRC_TRACK_3_WRITE, IRC_TRACK_JISII_READ, IRC_TRACK_JISII_WRITE, IRC_EXIST, FPI_LOAD_STATUS, FPI_EXIST, CRD_DISPENSETO, CCD_DISPENSETO, DPR_EXIST, DPR_VARIANT, DPR_CAN_EJECT, DPR_CAN_CAPTURE, DPR_CAN_STACK, DPR_MAX_RETRACT, BCR_EXIST, BCR_VARIANT, PJC_EXIST, PJC_DATASOURCE, PJC_VDEV, PJC_REALJPR, PJC_MAC, PJC_IP, PJC_PKT, PJC_EJFILE, PJC_SPACESIZE, PJC_VERSION) VALUES('11111111', '20191120162914', 'Y', 'Y', 'Y', 'N', NULL, 'N', NULL, 'Y', 'Y', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'MOTORISED', 'TRUE', 'TRUE', '20', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'TRUE', '150', 'TRUE', 'TRUE', 'RETRACT', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', '40', '6', '7', '2', 'GBP,CNY', '0,0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Receipt', 'TRUE', 'FALSE', 'FALSE', '40', 'Journal', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', 'FALSE', 'TRUE', NULL, 'FALSE', 'TRUE', '32', '16', NULL, NULL, NULL, NULL, NULL, 'TRUE', 'Y', 'TRUE', 'FALSE', 'TRUE', 'TRUE', 'TRUE', 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', '0,1,2,3,4,6,7,8,9,ENTER,CANCEL,CLEAR,.,OEM1,OEM2,OEM3,OEM4,OEM5,OEM6,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO DEV_SOFTWARE_INFO (DEV_NO, OPERATING_SYS, OPERATING_VERSION, OPERATING_PATCH_VERSION, ANTIVIRUS_SYSTEM, ANTIVIRUS_VERSION, ANTIVIRUS_DEFINITION, SP_VERSION, APP_VERSION, CHK_CASH_DATA, SOFTWARE_LIST, SP_IDC, SP_CDM, SP_CIM, SP_PIN, SP_JPR, SP_RPR, SP_SIU, SP_TTU, SP_VDM, SETUPFLAG, TAKEEFFECTFLAG, VERSION, SP_ICC, SP_ISC, SP_IRC, SP_FPI, SP_CRD, SP_CCD, SP_DPR, SP_BCR, SERIAL_NO_INFO_STATUS, TXT_INFO_STATUS, CIMSRP_FLAG, CDMSRP_FLAG, NTS_SUPPORT_SNR, NTS_SNR_FLAG, NTS_SUPPORT_SERIAL_NUMBERS, NTS_OPEN_SERIAL_NUMBERS_JP, NTS_OPEN_SERIAL_NUMBERS_RP) VALUES('11111111', 'Microsoft Windows XP', 'WINNT 5.1', 'Service Pack 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '1', '1', '-1', '-1', '-1', '-1', '-1');

INSERT INTO DEV_HARDWARE_INFO (DEV_NO, BIOS_VERSION, HARDWARE_CPU, HARDWARE_MEMORY, HARDWARE_HARDISK, FIRMWARE_IDC, FIRMWARE_CDM, FIRMWARE_CIM, FIRMWARE_PIN, FIRMWARE_JPR, FIRMWARE_RPR, FIRMWARE_SIU, FIRMWARE_TTU, FIRMWARE_VDM, FIRMWARE_BV, FIRMWARE_ICC, FIRMWARE_ISC, FIRMWARE_IRC, FIRMWARE_FPI, FIRMWARE_CRD, FIRMWARE_CCD, FIRMWARE_DPR, FIRMWARE_BCR) VALUES('11111111', NULL, 'Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz', '511.42 MB', '40 GB(42935894016 Byte)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-6702376', '�ܻ�Ա1', '0100', '023-11111111', '13012341234', 'www.111@11.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-90998704', '�ܻ�Ա2', '0100', '023-11111111', '13012341234', '13527410963@135.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-91078224', '�ܻ�Ա3', '0100', '023-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-9180374', '�ܻ�Ա4', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-56995936', '�ܻ�Ա5', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-63394852', '�ܻ�Ա6', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-16336864', '�ܻ�Ա7', '0100', '0851-11111111', '13012341234', '11@qq.com', null, null, '1', null);
insert into BANK_MANAGER_PERSION (no, name, org_no, phone, mobile, email, is_leader, is_lobbymanager, is_devmanager, is_deskmanager)
values ('-27776920', '�ܻ�Ա8', '0100', '023-11111111', '13012341234', '11@qq.123456', null, null, '1', null);

insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-51278', '���ڴ�', '����Ȩ', null, null, '15086868808', null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-24448', '����', 'Ҷ��', null, null, '18969103419', null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('365', '����', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-61190', '�˳�', '������', null, '67704952', '13637971959', null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-75396', '���ݽ���', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('53915', '����', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-15128', '��ά', null, null, null, null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email, infofilepath, infofilename)
values ('-88652', '����������Ƽ���չ���޹�˾', 'Ԭ��', '��������������������¡�����A��13F', '023-63634780', '18696792847', '023-63863160', '28481312@qq.com', null, null);
commit;


insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-43967988', 'ά��Ա1', '365', '1', '023-11111111', '13012341234', '11@qq.com', null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-82416000', 'ά��Ա2', '53915', '1', '023-11111111', '13012341234', '11@qq.com', null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-51955120', 'ά��Ա3', '-51278', '1', '023-11111111', '13012341234', '11@qq.com', null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-92066880', 'ά��Ա4', '-61190', '1', '023-67704952', '13012341234', null, null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('-94010792', 'ά��Ա5', '-75396', '1', '023-11111111', '13012341234', '11@qq.com', null);
commit;

insert into sys_user_devrole select no, 'all' from sys_user;
commit;