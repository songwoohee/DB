-- 게시판 목록
CREATE TABLE BOARD (
  BOARD_NUMBER NUMBER(10) PRIMARY KEY,
  BOARD_NAME VARCHAR2(30) UNIQUE 
);