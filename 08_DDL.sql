/* 데이터 정의어(DDL) 
    2023-09-20 수업 진행  */

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4), 
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7, 2),   -- 7자리에서 2자리를 실수로 할당하겠다. 
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2)
); 

INSERT INTO EMP_DDL VALUES(9000, '이서','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9001, '장원영','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9002, '가을','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9003, '레이','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9004, '민지','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9005, '해린','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9006, '하니','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9007, '해인','아이돌', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9008, '안유진','아이돌', 9000, SYSDATE, 10000, 2000, 10);

INSERT INTO EMP_DDL VALUES(9009, '유나','잇지', 9000, SYSDATE, 10000, 2000, 10, '+82010-1234-5678');
INSERT INTO EMP_DDL VALUES(9010, '예지','잇지', 9000, SYSDATE, 10000, 2000, 1000, '+82010-1234-1234');

SELECT * FROM EMP_DDL;



/* 테이블 변경 하는 ALTER
   ADD : 테이블에 열을 추가 
   RENAME : 열의 이름을 변경
   MODIFY : 열의 데이터형을 변경 
   DROP :  열을 제거   */

-- 테이블에 열을 추가 : ADD
ALTER TABLE EMP_DDL
  ADD HP VARCHAR2(20); 

-- 테이블의 열 이름 변경 : RENAME
ALTER TABLE EMP_DDL
  RENAME COLUMN HP TO TEL;

-- 테이블 열의 자료형 변경 : MODIFY  
-- 데이터가 없거나 데이터가 입력 되어 있다면 바꾸려고하는 자리보다 작을 경우 변경 가능
ALTER TABLE EMP_DDL
  MODIFY TEL VARCHAR2(16);

ALTER TABLE EMP_DDL
  MODIFY DEPTNO NUMBER(4);

-- 테이블 열을 제거 : DROP 
-- 열의 데이터가 있어도 삭제함 
ALTER TABLE EMP_DDL
  DROP COLUMN TEL;

-- 테이블 이름을 변경하는 RENAME 
RENAME EMP_DDL TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

-- 테이블의 데이터를 삭제하는 TRUNCATE 
TRUNCATE TABLE EMP_RENAME;   -- DDL 명령어. ROLLBACK 불가

DELETE FROM EMP_RENAME;   -- DML 
-- 둘다 테이블에 있는 내용을 다 지움. 테이블만 남김 . 조건절이 있으면 일부만 지우기 가능 , 
-- 차이점은 TRUNCATE는 ROLLBACK 불가!!

-- 테이블을 삭제하는 DROP
DROP TABLE EMP_RENAME;

-- 빈값을 허용하지 않는 NOT NULL 
CREATE TABLE TABLE_NOTNULL (
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PW VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
); 

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PW, TEL) VALUES('WOOHEE', 'BAMBI00', NULL);
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PW, TEL) VALUES('WOOHEE', 'BAMBI00', '010-1234-5678');
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PW, TEL) VALUES('WOOHEE', NULL, '010-1234-5678');

SELECT * FROM TABLE_NOTNULL;

DROP TABLE TABLE_NOTNULL;

-- 중복되지 않는 값 : UNIQUE
-- 1. NULL 허용 2. 테이블 내에 여러 열에 존재 가능 
CREATE TABLE TABLE_UNIQUE (
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PW VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
); 

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PW, TEL) VALUES('WOOHEE', 'BAMBI00', NULL);
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PW, TEL) VALUES('WOOHEE2', 'BAMBI12', NULL);


SELECT * FROM TABLE_UNIQUE;
DROP TABLE TABLE_UNIQUE;

-- 다른 테이블과 관계를 맺는 FOREIGN KEY
-- 외래키는 서로 다른 테이블간 관계를 정의하는데 사용하는 제약 조건 
-- 참조하고 있는 기본키의 데이터 타입과 일치해야 하며 외래키에 참조 되는 기본 키는 삭제할 수 없다.
CREATE TABLE DEPT_FK(
  DEPTNO NUMBER(2) PRIMARY KEY,
  DNAME  VARCHAR2(14),
  LOC    VARCHAR2(13)
); 

CREATE TABLE EMP_FK (
  EMPNO  NUMBER(4) PRIMARY KEY,
  ENMAE  VARCHAR2(10) NOT NULL,
  JOB    VARCHAR2(9),
  MGR    NUMBER(4),
  SAL    NUMBER(7,2),
  COMM   NUMBER(7,2),
  DEPTNO NUMBER(2) REFERENCES DEPT_FK(DEPTNO)
); 

INSERT INTO DEPT_FK VALUES(10, '농구부', '서울');
INSERT INTO EMP_FK VALUES(9000, '강백호', '농구', 8000, 2300, 1200, 10);

SELECT * FROM 
EMP_FK E JOIN DEPT_FK D
ON E.DEPTNO = D.DEPTNO;

-- 데이터 형태와 범위를 정하는 CHECK
-- EX) ID 및 PASSWORD 길이 제한 
-- EX) 유효 값 범위 확인(나이 / 성적 / 전화번호 / 이메일)
CREATE TABLE TABLE_CHECK (
  LOGIN_ID VARCHAR2(20) PRIMARY KEY,
  LOGIN_PW VARCHAR2(20) CHECK(LENGTH(LOGIN_PW) >= 5),
  TEL VARCHAR2(20)  
);

INSERT INTO TABLE_CHECK VALUES('WOOHEE', 'BAMBI', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

-- DEFAULT 제약 조건 :  특정 열에 저장할 값이 지정되지 않은 경우 기본 값을 지정 
CREATE TABLE TABLE_DEFAULT (
  LOGIN_ID VARCHAR2(20) PRIMARY KEY,
  LOGIN_PW VARCHAR2(20) CHECK(LENGTH(LOGIN_PW) >= 5),
  TEL VARCHAR2(15) DEFAULT '010-0000-0000'
);

INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PW) VALUES('WOOHEE1','BAMBI');

SELECT * FROM TABLE_DEFAULT;

/* 시퀀스란?
   오라클에서 특정 규칙에 맞는 연속적인 숫자를 생성하는 객체  */
CREATE TABLE DEPT_SEQ(
  DEPTNO NUMBER(2) PRIMARY KEY,
  DNAME  VARCHAR2(14),
  LOC    VARCHAR2(13)
); 

CREATE SEQUENCE SEQ_DEPT_SEQUENCE 
INCREMENT BY 10  -- 증가값 
START WITH 10 -- 시작값
MAXVALUE 90  -- 최대값
MINVALUE 0  -- 최소값 
NOCYCLE  -- 한 번 돌면 다시 순회 안할게
CACHE 2;  -- 성능 

INSERT INTO DEPT_SEQ VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'FRONT','BUSAN');
SELECT * FROM DEPT_SEQ;