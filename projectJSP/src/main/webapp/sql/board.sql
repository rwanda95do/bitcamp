 -- web_project :  projectJSP
-- Oracle

 -- board 
 CREATE TABLE board(
 seq NUMBER NOT NULL, -- 글번호 (시퀀스 객체 이용)
 id VARCHAR2(20) NOT NULL, -- 아이디
 name VARCHAR2(40) NOT NULL, -- 이름
 email VARCHAR2(40), -- 이메일
 subject VARCHAR2(255) NOT NULL, -- 제목
 content VARCHAR2(4000) NOT NULL, -- 내용 
 
 
 ref NUMBER NOT NULL, -- 그룹번호
 lev NUMBER DEFAULT 0 NOT NULL, -- 단계
 step NUMBER DEFAULT 0 NOT NULL, -- 글순서
 pseq NUMBER DEFAULT 0 NOT NULL, -- 원글번호
 reply NUMBER DEFAULT 0 NOT NULL, -- 답변수
 hit NUMBER DEFAULT 0, -- 조회수
 logtime DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq_board NOCACHE NOCYCLE;
-- ---------------------------------------
select * from board;
-- ---------------------------------------

-- 글 작성(원글)
insert into board(seq, id, name, email, subject, content, ref) 
values(seq_board.nextval, 'sim', '심슨', 'sim@gmail.com', '심슨이 적은글', '딱히 적는 이유는 없습니다.', seq_board.nextval);

-- 답글용
insert into board(seq, id, name, email, subject, content, ref, step) 
values(seq_board.nextval, 'sim', '심슨', 'sim@gmail.com', '심슨이 적은글', '딱히 적는 이유는 없습니다.', 2, 1);
commit;


-- 글 목록 
select * from
(select rownum rn, tt.*from
(select * from board order by ref desc, step asc)tt
)where rn >=1 and rn<=5;

select * from board order by ref desc, step asc;

select count(*) from board;    --총글수