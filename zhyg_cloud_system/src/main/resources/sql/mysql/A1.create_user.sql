create user 'zjbims'@'%' identified by 'zjbims';
drop database if exists zjbims;
create database zjbims;
grant all privileges on zjbims.* to 'zjbims'@'%' identified by 'zjbims';
flush privileges;
use zjbims;
