
insert into SYS_USER (no, passwd, name, status, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error)
values ('admin1', '036927E762859B2681', '��������Ա1', '1', '1', '10001', '10001', null, null, null, null, '2019-01-21 10:30:49', null, 0);
insert into SYS_USER (no, passwd, name, status, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error)
values ('yqzhao', '036927E762859B2681', '������', '1', '1', '10005', '10001', null, null, null, null, '2019-03-02 17:52:09', null, 9);
insert into SYS_USER (no, passwd, name, status, online_flag, role_no, org_no, phone, mobile, email, login_ip, login_time, passwd_expiration, passwd_error)
values ('chenyue', '036927E762859B2681', '��Ծ', '1', '0', '10005', '10001', null, null, null, null, null, null, 0);
commit;

insert into SYS_USER_DEVROLE (USER_NO, DEV_CATALOG)
values ('admin1', 'all');
commit;

insert into CARD_TYPE_TABLE (no, card_type)
values ('1', '��ǿ�');
insert into CARD_TYPE_TABLE (no, card_type)
values ('2', '���');
insert into CARD_TYPE_TABLE (no, card_type)
values ('3', '���ÿ�');
commit;

insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10001', '�罻');
insert into APPS_CATALOG_TABLE (logic_id, apps_catalog)
values ('10002', '����');
commit;

insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 2, 'ӪҵԤ��', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 3, '��ԴԤ��', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 4, '��Դ�ľ�', 1, 60, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 5, '���֪ͨ', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 6, 'Ӫҵ����', 1, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 7, 'ֽ��', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 8, 'ֽ��', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 9, '����', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 10, '����', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 11, '�������', 1, 60, 720, 720, 1440, 1440, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 12, 'һ��Ӳ������', 2, 30, 1440, 1440, 2880, 2880, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 13, '����Ӳ������', 2, 30, 60, 60, 300, 300, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('10001', 14, '�������', 3, 30, 180, 180, 300, 300, 7200, 1, 1, 1, 0);
insert into CASE_CATALOG_TABLE (org_no, catalog_no, catalog_name, responsor_catalog, reply_interval, onsite_interval, onsite_interval1, close_interval, close_interval1, expire_interval, max_grade, respond_grade, notify_way, sendmsgmethod)
values ('00080000', 15, 'ͨѶ����', 1, 30, 60, 60, 120, 120, 7200, 1, 1, 1, 0);
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


insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('CRS', 'CRS', '�Զ���ȡ���', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('CDM', 'CDM', '�Զ�����', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('ATM', 'ATM', '�Զ�ȡ���', '1', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('BSM', 'BSM', '��ѯ��', '3', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('MTM', 'MTM', '����ȡ���', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('IST', 'IST', '���������ն�', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('BTS', 'BTS', '�ص���', '6', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('SFM', 'SFM', '���', '7', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('CDT', 'CDT', '������', '2', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('STM', 'STM', '�ǻ۹�Ա��', '5', '1');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('SQM', 'SQM', '�кŻ�', '3', '5');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('IAS', 'IAS', '���ܹ����', '4', '3');
insert into DEV_CATALOG_TABLE (no, name, enname, monitor_type,channel_type) values ('MDM', 'MDM', 'ʵ����ȡ��', '4', '3');
commit;

insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email)
values ('2', '�ϱ�', '��ѩԴ', null, null, null, null, null);
insert into DEV_SERVICE_COMPANY (no, name, linkman, address, phone, mobile, fax, email)
values ('1', '����', '��ɺ', null, null, null, null, null);
commit;

insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('10001', 'ά��Ա1', '10001', '1', null, null, null, null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('10002', 'ά��Ա2', '10001', '1', null, null, null, null);
insert into DEV_SERVICE_PERSON (no, name, belongto, status, phone, mobile, email, leader)
values ('10003', 'ά��Ա3', '10001', '1', null, null, null, null);
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


INSERT INTO SYS_MENU VALUES ('A08', '����չʾA', NULL, NULL, 'tile_bankMonitor_a.png', '/monitor/bankMonitorA', NULL, '8');
INSERT INTO SYS_MENU VALUES ('A09', '����չʾB', NULL, NULL, 'tile_bankMonitor_b.png', '/monitor/bankMonitorB', NULL, '9');
INSERT INTO SYS_MENU VALUES ('A07', '��ֽ�����', NULL, NULL, 'pjsTermMonitor.png', '/monitor/pjsTermMonitor', NULL, '7');
INSERT INTO SYS_MENU VALUES ('A10', '��ֽ����ˮ���', NULL, NULL, 'tile_wuzhihua_monitor.png', '/monitor/pjsMonitor', NULL, '10');
INSERT INTO SYS_MENU VALUES ('A11', '���������', NULL, NULL, 'tile_crdMonitor.png', '/monitor/crdMonitor', NULL, '11');
INSERT INTO SYS_MENU VALUES ('A16', '���׷���', NULL, NULL, 'tile_transactionAnalysis.png', '/monitor/transAnalysis', NULL, '15');
INSERT INTO SYS_MENU VALUES ('A17', '���Ϸ���', NULL, NULL, 'tile_faultAnalysis.png', '/monitor/faultAnalysis', NULL, '16');
INSERT INTO SYS_MENU VALUES ('A13', '�ص������', NULL, NULL, 'tile_btsMonitor.png', '/monitor/btsMonitor', NULL, '12');
INSERT INTO SYS_MENU VALUES ('A14', '������', NULL, NULL, 'tile_sfmMonitor.png', '/monitor/sfmMonitor', NULL, '13');
INSERT INTO SYS_MENU VALUES ('A15', '�����ն˼��', NULL, NULL, 'tile_istMonitor.png', '/monitor/istMonitor', NULL, '14');
INSERT INTO SYS_MENU VALUES ('E03', 'ͳ�Ʊ���', NULL, NULL, 'tile_statistical_reports.png', '/report/statisticReport', NULL, '3');
INSERT INTO SYS_MENU VALUES ('E04', '���ױ���', NULL, NULL, 'Equipment-information.png', '/report/transReport', NULL, '4');
INSERT INTO SYS_MENU VALUES ('E05', '���˱���', NULL, NULL, 'Equipment-information.png', '/report/assessReport', NULL, '5');
INSERT INTO SYS_MENU VALUES ('F15', '�û�����', NULL, NULL, 'tile_passwd.png', '/system/password', NULL, '15');
INSERT INTO SYS_MENU VALUES ('F16', '�豸ģ��', NULL, NULL, 'tile_modCatalog.png', '/system/modCatalog', NULL, '16');
INSERT INTO SYS_MENU VALUES ('F17', '��Ϣ֪ͨģ��', NULL, NULL, 'tile_notifyModel.png', '/system/notifyModel', NULL, '17');
INSERT INTO SYS_MENU VALUES ('F18', '�������', NULL, NULL, 'tile_bulletin.png', '/system/bulletin', NULL, '18');
INSERT INTO SYS_MENU VALUES ('F19', '�豸ͣ������', NULL, NULL, 'tile_devStop.png', '/system/devStop', NULL, '19');
INSERT INTO SYS_MENU VALUES ('F20', '��������ʱ��', NULL, NULL, 'tile_worktime_range.png', '/system/orgWorkTime', NULL, '20');
INSERT INTO SYS_MENU VALUES ('F21', '�������й���', NULL, NULL, 'tile_selfHelpBank.png', '/system/selfHelpBank', NULL, '21');
INSERT INTO SYS_MENU VALUES ('F22', '�������', NULL, NULL, 'tile_cardInfo.png', '/system/cardInfo', NULL, '22');
INSERT INTO SYS_MENU VALUES ('F23', '��������', NULL, NULL, 'tile_globalCfg.png', '/system/globalCfg', NULL, '23');
INSERT INTO SYS_MENU VALUES ('F24', '�ҵ�����', NULL, NULL, 'tile_myapply.png', '/system/myApply', NULL, '24');
INSERT INTO SYS_MENU VALUES ('F25', '�ҵ�����', NULL, NULL, 'tile_myaudit.png', '/system/myAudit', NULL, '25');
INSERT INTO SYS_MENU VALUES ('B03', '���ܶ���', NULL, NULL, 'tile_devControl.png', '/remote/atmFunction', NULL, '3');
INSERT INTO SYS_MENU VALUES ('G02', '�̿�����', NULL, NULL, 'tile_csManager.png', '/maintain/cs', NULL, '2');
INSERT INTO SYS_MENU VALUES ('G03', '��������', NULL, NULL, 'tile_workOrder.png', '/maintain/workOrder', NULL, '3');
INSERT INTO SYS_MENU VALUES ('G04', '�豸��������', NULL, NULL, 'tile_devparamSetting.png', '/maintain/devParam', NULL, '4');
INSERT INTO SYS_MENU VALUES ('0', '�Ͻ��ۺ��˹�ϵͳ', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO SYS_MENU VALUES ('E', '����ͳ��', NULL, '#f2a000', NULL, NULL, 'zijin-icon-chart22', '1');
INSERT INTO SYS_MENU VALUES ('I', '�߲����', NULL, '#22b9e8', NULL, NULL, 'zijin-icon-user-tie', '1');
INSERT INTO SYS_MENU VALUES ('A', '״̬���', NULL, '#00a8f3', NULL, NULL, 'zijin-icon-devMonitor', '1');
INSERT INTO SYS_MENU VALUES ('B', 'Զ�̿���', NULL, '#ffb11a', NULL, NULL, 'zijin-icon-devManage', '1');
INSERT INTO SYS_MENU VALUES ('C', '�汾����', NULL, '#ff7f27', NULL, NULL, 'zijin-icon-checklist', '1');
INSERT INTO SYS_MENU VALUES ('D', '���ݹ���', NULL, '#78c446', NULL, NULL, 'zijin-icon-icon_theme_setting', '1');
INSERT INTO SYS_MENU VALUES ('F', '��������', NULL, '#5ed8a9', NULL, NULL, 'zijin-icon-options', '1');
INSERT INTO SYS_MENU VALUES ('G', '�ճ�ά��', NULL, '#22b9e8', NULL, NULL, 'zijin-icon-Development-mode', '1');
INSERT INTO SYS_MENU VALUES ('H', '���׼�ֵ', NULL, '#605ad8', NULL, NULL, 'zijin-icon-purse', '1');
INSERT INTO SYS_MENU VALUES ('J', '���߹���', NULL, '#f86846', NULL, NULL, 'zijin-icon-options', '1');
INSERT INTO SYS_MENU VALUES ('A06', '���ײ�ѯ', NULL, NULL, 'tile_transSearch.png', '/monitor/transInfo', NULL, '6');
INSERT INTO SYS_MENU VALUES ('E02', '��������', NULL, NULL, 'tile_basic_statements.png', '/report/baseReport', NULL, '2');
INSERT INTO SYS_MENU VALUES ('F10', '�豸Ʒ�ƹ���', NULL, NULL, 'tile_vendor.png', '/system/vendor', NULL, '10');
INSERT INTO SYS_MENU VALUES ('F11', '�豸�ͺŹ���', NULL, NULL, 'tile_devtype.png', '/system/type', NULL, '11');
INSERT INTO SYS_MENU VALUES ('F12', '�豸���͹���', NULL, NULL, 'tile_devcatalog.png', '/system/catalog', NULL, '12');
INSERT INTO SYS_MENU VALUES ('F14', '����ʱ���趨', NULL, NULL, 'tile_worktime.png', '/system/devWorkTime', NULL, '14');
INSERT INTO SYS_MENU VALUES ('J01', '������Ϣ����', NULL, NULL, 'tile_elockInfo.png', '/elock/elockInfoManager', NULL, '1');
INSERT INTO SYS_MENU VALUES ('J02', '�����������', NULL, NULL, 'tile_unelockTask.png', '/elock/unelockTaskManager', NULL, '2');
INSERT INTO SYS_MENU VALUES ('A03', '�������', NULL, NULL, 'tile_orgMonitor.png', '/monitor/orgMonitor', NULL, '3');
INSERT INTO SYS_MENU VALUES ('D03', '�������', NULL, NULL, 'tile_advMake.png', '/content/advMake', NULL, '3');
INSERT INTO SYS_MENU VALUES ('F07', '������Ա����', NULL, NULL, 'tile_Network_staff_management.', '/system/bank', NULL, '7');
INSERT INTO SYS_MENU VALUES ('F08', '����ά���̹���', NULL, NULL, 'tile_factoryMaintain.png', '/system/factory', NULL, '8');
INSERT INTO SYS_MENU VALUES ('F09', '�豸ά���̹���', NULL, NULL, 'tile_devMaintain.png', '/system/devServiceManager', NULL, '9');
INSERT INTO SYS_MENU VALUES ('I01', 'Ŀ������', NULL, NULL, 'tile_setTarget.png', '/decision/target', NULL, '1');
INSERT INTO SYS_MENU VALUES ('I02', 'ҵ�����ݷ���', NULL, NULL, 'tile_data_analysis.png', '/decision/business', NULL, '2');
INSERT INTO SYS_MENU VALUES ('E01', '��ά����', NULL, NULL, 'tile_reportAnalysis.png', '/report/reportAnalysis', NULL, '1');
INSERT INTO SYS_MENU VALUES ('A01', '���׼��', NULL, NULL, 'tile_transMonitor.png', '/monitor/transMonitor', NULL, '1');
INSERT INTO SYS_MENU VALUES ('A02', '�豸���', NULL, NULL, 'tile_devMonitor.png', '/monitor/devMonitor', NULL, '2');
INSERT INTO SYS_MENU VALUES ('B01', '�豸����', NULL, NULL, 'tile_devControl.png', '/remote/devControl', NULL, '1');
INSERT INTO SYS_MENU VALUES ('B02', '���ƽ��', NULL, NULL, 'tile_controlResult.png', '/remote/controlResult', NULL, '2');
INSERT INTO SYS_MENU VALUES ('C01', 'Ӧ�ù���', NULL, NULL, 'tile_appstore.png', '/version/appstore', NULL, '1');
INSERT INTO SYS_MENU VALUES ('D02', '���λ����', NULL, NULL, 'tile_advSpace.png', '/content/advertisementSpace', NULL, '2');
INSERT INTO SYS_MENU VALUES ('C02', '��˹���', NULL, NULL, 'tile_benchmark.png', '/version/benchmark', NULL, '2');
INSERT INTO SYS_MENU VALUES ('F01', '��������', NULL, NULL, 'tile_userOrg.png', '/system/org', NULL, '1');
INSERT INTO SYS_MENU VALUES ('F03', '��ɫ����', NULL, NULL, 'tile_rolePrivilege.png', '/system/role', NULL, '3');
INSERT INTO SYS_MENU VALUES ('F02', '�û�����', NULL, NULL, 'tile_userInfo.png', '/system/user', NULL, '2');
INSERT INTO SYS_MENU VALUES ('F04', '�豸����', NULL, NULL, 'tile_device_management.png', '/system/dev', NULL, '4');
INSERT INTO SYS_MENU VALUES ('F05', '�豸�����˹���', NULL, NULL, 'tile_device_people_manage.png', '/system/devResponsible', NULL, '5');
INSERT INTO SYS_MENU VALUES ('C03', '��������', NULL, NULL, 'Parameter-management.png', '/version/parameter', NULL, '3');
INSERT INTO SYS_MENU VALUES ('G01', 'CASE�ۺϲ�ѯ', NULL, NULL, 'title_fault_query.png', '/maintain/faultQuery', NULL, '1');
INSERT INTO SYS_MENU VALUES ('A05', 'GISչʾ', NULL, NULL, 'tile_gis.png', '/monitor/gisMonitor', NULL, '5');
INSERT INTO SYS_MENU VALUES ('F06', '������Ӧ�趨', NULL, NULL, 'tile_dev_response.png', '/system/sysParam', NULL, '6');
INSERT INTO SYS_MENU VALUES ('H01', '��ָ̬��', NULL, NULL, 'tile_transDynamic.png', '/transWorth/dynamicInd', NULL, '1');
INSERT INTO SYS_MENU VALUES ('H02', '��ָ̬��', NULL, NULL, 'tile_transStatic.png', '/transWorth/staticInd', NULL, '2');
INSERT INTO SYS_MENU VALUES ('H03', '���׼�ֵ����', NULL, NULL, 'tile_transValueAnalysis.png', '/transWorth/transValueAnalysis', NULL, '3');
INSERT INTO SYS_MENU VALUES ('D04', '���Ͷ��', NULL, NULL, 'tile_advRemote.png', '/content/advValid', NULL, '4');
INSERT INTO SYS_MENU VALUES ('D01', '��Դ����', NULL, NULL, 'tile_resource.png', '/content/resourceManage', NULL, '1');
INSERT INTO SYS_MENU VALUES ('F13', '��־��ѯ', NULL, NULL, 'tile_log.png', '/system/log', NULL, '13');
INSERT INTO SYS_MENU VALUES ('C04', '�汾�����ѯ', NULL, NULL, 'tile_vision_result.png', '/version/appResult', NULL, '4');
INSERT INTO SYS_MENU VALUES ('D05', '���Ͷ�����', NULL, NULL, 'tile_advRemote_info.png', '/content/advValidResult', NULL, '5');
INSERT INTO SYS_MENU VALUES ('B04', '�������͹���', NULL, NULL, 'tile_devControl.png', '/remote/atmFunctionDef', NULL, '4');
INSERT INTO SYS_MENU VALUES ('G05', '�ӳ�Ԥ��', NULL, NULL, 'tile_devparamSetting.png', '/maintain/cashForcast', NULL, '5');
INSERT INTO SYS_MENU VALUES ('G06', '���˲�ѯ', NULL, NULL, 'tile_devparamSetting.png', '/maintain/reconcile', NULL, '6');
INSERT INTO SYS_MENU VALUES ('A04', '������ˮ��ѯ', NULL, NULL, 'Equipment-information.png', '/monitor/pjsLogMonitor', NULL, '4');
INSERT INTO SYS_MENU VALUES ('K', '�кŻ�����', NULL, '#605ad8', NULL, NULL, 'zijin-icon-devManage', '1');
INSERT INTO SYS_MENU VALUES ('K01', '�豸��Ϣ����', NULL, NULL, 'tile_callDev_info.png', '/callDev/devManager', NULL, '1');
INSERT INTO SYS_MENU VALUES ('K02', '����ҵ������', NULL, NULL, 'tile_businessConfig_total.png', '/callDev/businessConfig', NULL, '2');
INSERT INTO SYS_MENU VALUES ('K03', '�кŻ�ҵ������', NULL, NULL, 'tile_callDev_business.png', '/callDev/business', NULL, '3');
INSERT INTO SYS_MENU VALUES ('K04', 'ԤԼ��ѯ', NULL, NULL, 'tile_callDev_reserveSearch.png', '/callDev/reserveSearch', NULL, '4');
INSERT INTO SYS_MENU VALUES ('N', '���ֺŹ���', NULL, '#5ed8a9', NULL, NULL, 'zijin-icon-devManage', '1');
INSERT INTO SYS_MENU VALUES ('N01', '�������汾����', NULL, NULL, 'tile_nts_version.png', '/ntsManage/version', NULL, '1');
INSERT INTO SYS_MENU VALUES ('N02', '����������', NULL, NULL, 'tile_nts_blank.png', '/ntsManage/blank', NULL, '2');
INSERT INTO SYS_MENU VALUES ('N03', '�������·�', NULL, NULL, 'tile_nts_issue.png', '/ntsManage/issue', NULL, '3');
INSERT INTO SYS_MENU VALUES ('N04', '�������·���¼', NULL, NULL, 'tile_nts_issueList.png', '/ntsManage/issueList', NULL, '4');
INSERT INTO SYS_MENU VALUES ('N05', '���ɹ�������', NULL, NULL, 'tile_nts_susReg.png', '/ntsManage/susReg', NULL, '5');
INSERT INTO SYS_MENU VALUES ('N06', '���ֺŲ齻��', NULL, NULL, 'tile_nts_nsnQryTx.png', '/ntsManage/nsnQryTx', NULL, '6');
INSERT INTO SYS_MENU VALUES ('N07', '���ײ���ֺ�', NULL, NULL, 'tile_nts_txQryNsn.png', '/ntsManage/txQryNsn', NULL, '7');
INSERT INTO SYS_MENU VALUES ('L', '�ǻ�����', NULL, '#ffb11a', NULL, NULL, 'zijin-icon-icon_theme_setting', '1');
INSERT INTO SYS_MENU VALUES ('L01', '�ǻ��豸', NULL, NULL, 'tile_publicity_devManager.png', '/publicity/devManager', NULL, '1');
COMMIT;

insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('19', '����', 'C01', 'Ӧ��', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('20', '�޸�', 'C01', 'Ӧ��', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('21', 'ɾ��', 'C01', 'Ӧ��', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('1', '����', 'F01', '����', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('2', '�޸�', 'F01', '����', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('3', 'ɾ��', 'F01', '����', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('4', '���', 'F01', '����', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('5', '����', 'F03', '��ɫ', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('6', '�޸�', 'F03', '��ɫ', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('7', 'ɾ��', 'F03', '��ɫ', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('8', '���', 'F03', '��ɫ', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('9', '����', 'F02', '�û�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('10', '�޸�', 'F02', '�û�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('11', 'ɾ��', 'F02', '�û�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('12', '��������', 'F02', '�û�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('13', '����', 'F02', '�û�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('14', '���', 'F02', '�û�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('15', '����', 'F04', '�豸', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('16', '�޸�', 'F04', '�豸', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('17', 'ɾ��', 'F04', '�豸', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('18', '���', 'F04', '�豸', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('22', '����', 'C02', '���', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('23', '�޸�', 'C02', '���', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('24', 'ɾ��', 'C02', '���', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('25', '����', 'C02', '���', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('26', '����', 'C02', '���', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('27', '����', 'C01', '����', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('28', 'ɾ���ļ�', 'B01', 'Զ�����ɾ���ļ�', null, null,'N');
insert into SYS_BUTTON (no, name, menu, note, button_order, url,AUDIT_FLAG)
values ('29', 'ִ���ļ�', 'B01', 'Զ�����ִ���ļ�', null, null,'N');
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
values ('FH', '����', '2');
insert into SYS_ORG_TYPE (no, type, grade)
values ('FH2', '��������', '3');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZHH', '֧��', '4');
insert into SYS_ORG_TYPE (no, type, grade)
values ('YYWD', 'Ӫҵ����', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZZWD', '��������', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('SQWD', '��������', '5');
insert into SYS_ORG_TYPE (no, type, grade)
values ('ZH', '����', '1');
commit;

insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10001', '����', null, 1, 40, 'ZH', null, null, null, '�Ͼ��й�¥��', null, '13862276896', '0516-8771824', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10002', '���շ���', '10001', 12, 39, 'FH', null, null, null, '�Ͼ��н�����', null, null, '13862276892', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10005', '����֧��', '10001', 4, 11, 'ZHH', null, null, null, '������������', null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10004', '�Ͼ�֧��', '10002', 31, 38, 'ZHH', null, null, null, '������������', null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10003', '�㽭����', '10002', 13, 30, 'FH', null, null, null, '�������±���', null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10006', '����֧��', '10003', 22, 29, 'FH2', null, '100', '200', '����', '18752744521', '187521', null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10007', '�Ϸ�֧��', '10003', 14, 21, 'ZHH', null, '17.9867', '16.8976', null, null, null, null, null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10008', '����������', '10004', 36, 37, 'YYWD', null, '118.722403', '16.98', null, null, '13862276899', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10009', '���ݹ�ҵ԰������', '10005', 9, 10, 'YYWD', null, '19.8', '16.987', '�Ͼ��н�����11��', null, '13862276890', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10010', '����������', '10006', 27, 28, 'ZZWD', null, '19.867', '16', '���ݹ�ҵ԰��', null, '13862276899', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10011', '����������', '10007', 19, 20, 'SQWD', null, '19.8', '16', '����', null, '13862276899', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10012', '���շ���', '10001', 2, 3, 'FH', null, '20', '20', '����', null, '18189951647', '012-0927112', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10013', '�Ͼ�Զͨ����', '10004', 34, 35, 'YYWD', null, '19.8098', '16', '�Ͼ�Զͨ', null, '15276687998', '012-0927117', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10014', '�Ͼ��ͷ�������', '10004', 32, 33, 'SQWD', null, '118.717229', '31.987591', '�Ͼ��ͷ���', null, '15290826782', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10015', '�մ�����', '10005', 7, 8, 'YYWD', null, '29.8', '16.0012', '���ݴ�ѧ', null, '15298609890', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10016', '�տƼ�����', '10005', 5, 6, 'ZZWD', null, '17.8', '15.789', '���ݿƼ���ѧ', null, '13907826398', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10017', '��������', '10006', 25, 26, 'YYWD', null, '19.898', '16.0189', '����Ƽ�', null, '13907826333', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10018', '��������', '10006', 23, 24, 'SQWD', null, '18.987', '15.989', '���׿Ƽ�', null, '13907826444', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10019', '���ƴ�����', '10007', 17, 18, 'ZZWD', null, '18.8', '16.876', '���տƼ���ѧ', null, '13907826555', '012-0927114', null, null, null, null, null, null, null, null);
insert into SYS_ORG (no, name, parent_org, left_no, right_no, org_type, moneyorg_flag, x, y, address, linkman, telephone, mobile, fax, email, business_range, cup_area_code, address_code,  area_type, org_physics_catalog, note)
values ('10020', '��ũ����', '10007', 15, 16, 'ZZWD', null, '19.098', '16.178', '����ũҵ��ѧ', null, '13907826378', '012-0927114', null, null, null, null, null, null, null, null);
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
values ('12', '���ת��', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('13', '���ڷ�Χ', 1);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('14', 'ʱ�䷶Χ', 1);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('1', '�ֽ�����', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('2', '�ֽ�֧��', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('3', '����������', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('4', '������֧��', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('5', '���ͽ���', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('6', '���', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('7', '������������', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('8', '�м�ҵ��', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('9', '���ӽ���', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('10', '�����ڲ�Ʒ', 0);
insert into TRANS_VALUE_ITEM (no, name, type)
values ('11', '���ת��', 0);
commit;


insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EF', '�ڴ������У��ͻ��ų�������SPԭ�򷵻��޳���״̬ʱ��Ӧ�ý����������洢����Ҫ��¼���ɽ���', '��SP�����޳������������洢��', '2');
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
values ('LOC-AT', '��ȡ�ת�˵Ƚ���ͨѶ��ʱ[���ױ��ķ��ͳɹ���û���յ����������ر���] ����Ҫ�������˶�����', '���׷��ͳɹ��������޷��ء�', '3');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-TF', '��ȡ�ת�˽���ͨѶ����[���ױ��ķ���ʧ�ܣ����������Ӳ���]��', '���׷���ʧ�ܣ�ͨѶ���ϡ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-AE', '��ȡ�ת�˵Ƚ���������Ȩ���Ľ�������[������Ϣ���㡢�������Ͳ����ڡ�MAC�벻��ȷ����Ȩ�벻���ڡ��ؼ�����ˮ�š��豸�š����״��롢���֡���ƥ��]����Ҫ�������˶�����', '�������ĳ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DF', 'ȡ��ʱ������Ȩ�ɹ����䳮���ڳ�ʧ�ܣ�����Ʊδ���豸[�����ͳ�������]����Ҫ�������˶�����', '�����ɹ����ڳ�ʧ�ܡ�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-PF', 'ȡ��ʱ�ͳ�ʧ�ܣ�ȡ��ʱ�����ɹ����ͻ�������ֽ�һ���ʧ�ܣ�ȡ�ʱ��������ʱ����[�������ͳ�������]�������', '�����ɹ����ͻ��������տ�����', '2');
commit;

insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RT', '����˳��������ͻ��������������������ȡ�����˳��������ͻ��������������������ʱ�˳��ܳ����˳��������ͻ����������������������', '����˳����ͻ��������ճɹ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-VF', '����鳮ʱ�����������', '����鳮������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JF', '����鳮�ɹ������ȡ�����˳�ʱ����������鳮�ɹ������ȡ���󣬿ͻ��������տ���������ͨѶ���ϣ��˳����������ʱ�˳��ܳ����˳������������', '����˳�������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-RE', '��ȡ��׹��Ϻ󣬽����ֹ�������Զ���λ[�����������Զ�]����������ֽ�ҡ������������Ǽ�¼���Ͻ��׺������λ���ճ�Ʊ��һ�㲻�ܵ������֡����ճɹ���ӡ������ϸ���������� ����ʧ�ܺ�ֻ��ӡ��������', '������λ���ճɹ���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-JT', '���������ϼп������׹��Ϻ�п����豸��λ���տ���', '�����������п���', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-CT', '�˿���ͻ�ȡ��������������ʱ�����̿���', '�ͻ������������ա�', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SF', '�������������Ȩ�ɹ�����Ʊ���볮��ʱ���������׳ɹ�����Ʊ�볮��ʱ���ϣ��ù��Ͽͻ�ҳ����ʾ��ƾ����ӡ�ǰ������Ľ��״���ģ���Ӱ���������⡣', '����������˳ɹ�������������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-SC', '�ͻ���ʱ��������ȡ�����ͻ�ѡ��ȡ�����ף�', '�ͻ���ʱ������ȡ����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HF', '����ͨѶ��ʱ���ճ�ʱ���������ױ��Ľ������ճ�ʱ���������������ܾ����ճ�ʱ��������Ҫ�������˶�����', '����ճ�������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-EI', '����������Ч������ȡ�������������Ч������ȡ�����ʺ�������Ч������ȡ����[һ��Ӧ�õ�ҳ����������������Ч������ȡ�����˿�]', '���롢���ʺ�����������࣬����ȡ����', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P1', '�������������������', '������������������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A1', '������������������', '�����������������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T1', '�ʺ����������������', '�ʺ���������������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-P2', '��������ת�����벻һ�£���������', '��������ת�����벻һ�£��������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-A2', '��������ת���һ�£���������', '��������ת���һ�£��������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-T2', '��������ת���ʺŲ�һ�£���������', '��������ת���ʺŲ�һ�£��������롣', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('OK', '���׳ɹ���', '���׳ɹ���', '1');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-DE', 'ȡ����������豸������������', 'ȡ����������豸��������������', '2');
insert into TRANS_RET_CODE (ret_code, detail_explain, briefly_explain, trans_status)
values ('LOC-HT', '�������ָʾ�̳�', '�������ָʾ�̳���', '2');
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
values ('LOC-PT', 'ȡ��ʱ�����ɹ����ͻ�������ֽ�һ��������������', '�����ɹ����ͻ��������ճɹ���', '2');
commit;

insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('IND', '��ϸ��ѯ', '��ѯ��ϸ', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('OC', '����', '����', 0, 0, 5);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('INQ', '��ѯ', '��ѯ', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CWD', 'ȡ��', 'ȡ��', 0, 1, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CWC', 'ȡ�����', 'ȡ�����', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CDC', '���ȷ��', '���ȷ��', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ICQCC', 'Ȧ�����', 'ָ���˻�Ȧ�����', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ICXJQCC', '�ֽ�Ȧ�����', '�ֽ�Ȧ�����', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('PSW', '����', '����', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CDP', '���', '���', 0, 1, 3);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ADP', '�޿����', '�޿����', 0, 1, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('BTFR', '����ת��', '����ת��', 0, 1, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('KTFR', '����ת��', '����ת��', 0, 1, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('FTLT', '����ת����', '����ת����', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('LTFT', '����ת����', '����ת����', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('LT1T', '����ת1��', '����ת1��', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('LT7T', '����ת7��', '����ת7��', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('ICQC', 'Ȧ��', 'Ȧ��', 0, 0, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('TFR', 'ת��', 'ת��', 0, 1, 1);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('CASHIN', '�ӳ�', '�ӳ�', 0, 0, 2);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('BFWD', 'ˢ��ȡ��', 'ˢ��ȡ��', 0, 1, 3);
insert into TRANS_TYPE (no, name, note, accounts_check_flag, cashflag, trans_value)
values ('QRCWD', '��ά��ȡ��', '��ά��ȡ��', 0, 1, 3);
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


INSERT INTO notify_model  VALUES  (10001,1,1,0,'CASE:�豸��:${devNo},�豸��ַ:${address},�豸ģ��:${devModule}');
INSERT INTO notify_model  VALUES  (10002,2,1,0,'CASE����:�豸��:${devNo},�豸ģ��:${devModule},Ԥ�ڵ���ʱ��:${preOnsiteTime},Ԥ�ڹر�ʱ��:${preCloseTime}��');                                              
INSERT INTO notify_model  VALUES  (10003,3,1,0,'CASE�ر�:�豸��:${devNo},�豸ģ��:${devModule},ʵ�ʹر�ʱ��(����):${useCloseTime}���ӡ�');             
INSERT INTO notify_model  VALUES  (10004,4,1,0,'CASE����:�豸��:${devNo},�豸ģ��:${devModule},��ʱδ�����ѹ���');   
INSERT INTO notify_model  VALUES  (10005,1,1,1,'CASE:�豸��:${devNo},�豸��ַ:${address},�豸ģ��:${devModule}');
INSERT INTO notify_model  VALUES  (10006,2,1,1,'CASE����:�豸��:${devNo},�豸ģ��:${devModule},Ԥ�ڵ���ʱ��:${preOnsiteTime},Ԥ�ڹر�ʱ��:${preCloseTime}��');                                              
INSERT INTO notify_model  VALUES  (10007,3,1,1,'CASE�ر�:�豸��:${devNo},�豸ģ��:${devModule},ʵ�ʹر�ʱ��(����):${useCloseTime}���ӡ�');             
INSERT INTO notify_model  VALUES  (10008,4,1,1,'CASE����:�豸��:${devNo},�豸ģ��:${devModule},��ʱδ�����ѹ���');   
INSERT INTO notify_model  VALUES  (10010,1,2,1,'CASE����֪ͨ:CASE��:${caseNo},�豸��:${devNo},�豸����:${devType},��������:${catalogNo},����ģ��:${devModule},���ϴ���:${faultCode},����:${description},�������:${solution},��������:${orgNo},�豸��ַ:${address},�豸����:${devVendor},����ʱ��:${openTime},Ԥ�ڵ���ʱ��:${preOnsiteTime},Ԥ�ڹر�ʱ��:${preCloseTime},ʵ�ʹر�ʱ��:${useCloseTime}');
INSERT INTO notify_model  VALUES  (10011,2,2,1,'CASE����֪ͨ:CASE��:${caseNo},�豸��:${devNo},�豸����:${devType},��������:${catalogNo},����ģ��:${devModule},���ϴ���:${faultCode},����:${description},�������:${solution},��������:${orgNo},�豸��ַ:${address},�豸����:${devVendor},����ʱ��:${openTime},Ԥ�ڵ���ʱ��:${preOnsiteTime},Ԥ�ڹر�ʱ��:${preCloseTime},ʵ�ʹر�ʱ��:${useCloseTime}');
INSERT INTO notify_model  VALUES  (10012,3,2,1,'CASE�ر�֪ͨ:CASE��:${caseNo},�豸��:${devNo},�豸����:${devType},��������:${catalogNo},����ģ��:${devModule},���ϴ���:${faultCode},����:${description},�������:${solution},��������:${orgNo},�豸��ַ:${address},�豸����:${devVendor},����ʱ��:${openTime},Ԥ�ڵ���ʱ��:${preOnsiteTime},Ԥ�ڹر�ʱ��:${preCloseTime},ʵ�ʹر�ʱ��:${useCloseTime}');
INSERT INTO notify_model  VALUES  (10013,4,2,1,'CASE����֪ͨ:CASE��:${caseNo},�豸��:${devNo},�豸����:${devType},��������:${catalogNo},����ģ��:${devModule},���ϴ���:${faultCode},����:${description},�������:${solution},��������:${orgNo},�豸��ַ:${address},�豸����:${devVendor},����ʱ��:${openTime},Ԥ�ڵ���ʱ��:${preOnsiteTime},Ԥ�ڹر�ʱ��:${preCloseTime},ʵ�ʹر�ʱ��:${useCloseTime}');

INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('adsFilePath', 'c:/zhyg/content/files/adv', NULL);
INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('adsResourceFilePath', 'c:/zhyg/content/files/resource', NULL);
INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('logoFilePath', 'c:/zhyg/content/files/logo', NULL);
INSERT INTO service_prop_content (key_id, VALUE, NOTE) VALUES('versionFilePath', 'c:/zhyg/content/files/version', NULL);

INSERT INTO SERVICE_PROP_SYSTEM(key_id, VALUE,NOTE) VALUES('syncXlinkOrgFlag','N','���������Ƿ�ͬ��P��');
INSERT INTO SERVICE_PROP_SYSTEM(key_id, VALUE,NOTE) VALUES('syncXlinkDevFlag','N','�����豸�Ƿ�ͬ��P��');
INSERT INTO SERVICE_PROP_SYSTEM(key_id, VALUE,NOTE) VALUES('devServiceCompany','C:/servicePropSystem/devServiceCompany','�豸ά�����ϴ����ļ����λ��');

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
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('usepUrl', 'http://192.168.43.107:9111/versionAdsAndStandardSync', NULL);
INSERT INTO service_prop_rvcserver (key_id, VALUE, NOTE) VALUES('versionFilePath', 'c:/zhyg/content', NULL);

INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transPushSwitch', 'false', '�������Ϳ���');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transPushIp', '127.0.0.1', '��������ע��ip');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transPushPort', '2000', '��������ע��˿�');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transQueueSwitch', 'true', '�������Ͷ��п���');
INSERT INTO SERVICE_PROP_MONITOR (key_id, value,note) VALUES ('transQueueSize', '500', '�������Ͷ�����󳤶�');

INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('1', '1', '�ӿ��ɶ�/�Ӵ�����');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('2', '1', 'ͻȻ�ϵ�');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('3', '2', '��࣬����ά��');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('4', '2', '����Ӳ��');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('5', '3', '��Ӧ�ܿ�');
INSERT INTO TASK_LABEL_CATALOG (no, catalog,Label_Name) VALUES ('6', '4', 'Ѹ�ٽ������');


INSERT INTO apps_info_table (apps_id, apps_name, apps_type, apps_catalog, apps_status, logo_path, add_user, add_time, description) VALUES('ZJUAP', 'ȫ����ͳһƽ̨', '1', '10001', '1', '', 'admin1', NULL, 'ƽ̨');
INSERT INTO apps_version_table (logic_id, apps_id, version_bus_no, version_app_no, version_status, version_client_path, add_user, add_time, version_description, version_file_md5, version_seq_no, versionfilepath, VERSIONNOTIFYFLAG, TAKETIME) VALUES('0cdae922-1925-4d8b-a791-b4bbb2a3553a', 'ZJUAP', '001S', '1.0.1', '1', 'C:\\', 'admin1', '2019-06-23 22:00:00', '����汾', NULL, '001000001', NULL, '2', '2019-07-01 19:26:08');

commit;
