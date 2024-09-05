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

select * from member;