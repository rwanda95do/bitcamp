-- oracle
CREATE TABLE imageboard(
 seq NUMBER PRIMARY KEY, 
 imageId VARCHAR2(20) UNIQUE, -- 상품코드 
 imageName VARCHAR2(40) NOT NULL, -- 상품명
 imagePrice NUMBER NOT NULL, -- 단가
 imageQty NUMBER NOT NULL, -- 개수
 imageContent VARCHAR2(4000) NOT NULL, 
 image1 varchar2(200), 
 logtime DATE DEFAULT SYSDATE
);

create sequence seq_imageboard nocache nocycle;