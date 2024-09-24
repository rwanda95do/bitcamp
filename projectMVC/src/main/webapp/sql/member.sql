-- web_project :  projectJSP
-- Oracle

-- 기존 member테이블 때문에 사전 작업
select * from tab;
drop table member PURGE;
PURGE RECYCLEBIN;
commit; 
--  ----------------------
create table member(
name varchar2(30) not null,
id varchar2(30) primary key, -- 기본키, unique, not null, 무결성 제약 조건
pwd varchar2(70) not null,
gender varchar2(3),
email1 varchar2(20),
email2 varchar2(20),
tel1 varchar2(10),
tel2 varchar2(10),
tel3 varchar2(10),
zipcode varchar2(10),
addr1 varchar2(100),
addr2 varchar2(100),
logtime date);

-- -----------------------
select * from member;

-- -----------------------
insert into member(name, id, pwd) VALUES ('홍길동', 'hong', '111');
select * from member where id='fff';
select name from member where id='hong' and pwd='111';
update member 
set name='홍길동', pwd='111', gender='1', email1='hong', email2='gmail.com', tel1='011', tel2='4312', tel3='4325', zipcode='54721', addr1='대한민국', addr2='어딘가', logtime=sysdate
where id='hong';
commit;





-- /////////////////////////////////////////////////////////////
-- mysql 
use mydb;

create table member(
name varchar(30) not null,
id varchar(30) primary key, -- 기본키, unique, not null, 무결성 제약 조건
pwd varchar(70) not null,
gender varchar(3),
email1 varchar(20),
email2 varchar(20),
tel1 varchar(10),
tel2 varchar(10),
tel3 varchar(10),
zipcode varchar(10),
addr1 varchar(100),
addr2 varchar(100),
logtime date);
