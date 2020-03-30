#
#1.���޸ı����ļ�·��
#2.���޸����ݿ����ơ��û���������
#3.��ʹ��crontab -e����shell����ϵͳ�Զ�ִ��
#�磺0 6 * * * /shepherd/file/database/mysql_shepherd.sh >> /tmp/mysql_shepherd.log
#����ÿ�������Զ�ִ�У�����ִ�н��д��/tmp/mysql_shepherd.log�ļ���

DBUSER=zjbims
DBPWD=zjbims
DBNAME=zjbims
BACKUPDIR=/mysql/backup/zjbims

if [ ! -d $BACKUPDIR ]; then
  mkdir -p $BACKUPDIR
fi

date750=$(date -d "750 days ago" +%Y-%m-%d)

echo begin `date +%Y-%m-%d" "%H:%M:%S`
echo "date750 is "$date750

mysql -u$DBUSER -p$DBPWD -D$DBNAME -e "delete from CASE_TABLE where open_time < '$date750';
delete from FAULT_TABLE where fault_time < '$date750';
delete from CASE_NOTIFY where create_time < '$date750';
delete from CASE_TRACE where trace_time < '$date750';
delete from RUN_STATUS_TABLE where date_time < '$date750';
delete from SHORTEN_TABLE where lack_date < '$date750';
commit;"

mv $BACKUPDIR/db_bak_6.sql $BACKUPDIR/db_bak_7.sql
mv $BACKUPDIR/db_bak_5.sql $BACKUPDIR/db_bak_6.sql
mv $BACKUPDIR/db_bak_4.sql $BACKUPDIR/db_bak_5.sql
mv $BACKUPDIR/db_bak_3.sql $BACKUPDIR/db_bak_4.sql
mv $BACKUPDIR/db_bak_2.sql $BACKUPDIR/db_bak_3.sql
mv $BACKUPDIR/db_bak_1.sql $BACKUPDIR/db_bak_2.sql

#���ݱ�ṹ
mysqldump -h localhost -u$DBUSER -p$DBPWD -d --databases $DBNAME > $BACKUPDIR/db_bak_1.sql
echo end `date +%Y-%m-%d" "%H:%M:%S`
echo 