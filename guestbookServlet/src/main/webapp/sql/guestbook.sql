-- web_project :  guestbookServlet
-- Oracle

create table guestbook(
seq number primary key, -- 시퀀스 객체로부터 값을 얻어온다
name varchar2(30),
email varchar2(30),
homepage varchar2(35),
subject varchar2(500) not null,  -- 제목
content varchar2(4000) not null, -- 내용
logtime date);

create sequence seq_guestbook nocycle nocache;

-- DB에서 not null이 있으니 html에서 제목과 내용은 유효성 검사를해서 못 넘어가게 해야한다


insert into guestbook(seq, name, email, homepage, subject, content, logtime) values(seq_guestbook.nextval, '홍길동', 'aa@aaa.com', 'http://aa.com', 'subject', 'content', sysdate);

select * from guestbook;

-- 페이징------------------------
select * from
(select rownum rn, tt.* from
(select * from guestbook order by seq desc) tt)
where rn >=1 and rn<=3;



show autocommit;
set autocommit on;
set autocommit off;


