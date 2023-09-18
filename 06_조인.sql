/* 조인(JOIN) : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는 데 사용하는 SQL의 기능
RDMS에서는 테이블 설계시 무결성 원칙으로 인해 동일한 정보가 여러 군데 존재하면 안되기 때문에
필연적으로 테이블을 관리 목적에 맞게 설계함. */ 

SELECT * FROM EMP, DEPT;
/* EMP와 DEPT 테이블이 어떻게 조인되는지에 대한 조건이 지정되어 있지 않기 때문에, 
일반적으로 CROSS JOIN(카테시안 곱)으로 간주되며, 
EMP 테이블의 모든 레코드와 DEPT 테이블의 모든 레코드가 결합*/

-- 열 이름을 비교하는 조건식으로 조인하기 
SELECT * 
  FROM EMP, DEPT
  WHERE EMP. DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO; 

-- 테이블 별칭 사용하기 
SELECT * 
FROM EMP E, DEPT D 
  WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

/* 조인 종류 :  두 개 이상의 테이블을 하나의 테이블처럼 가로로 늘려서 출력하기 위해 사용
   조인은 대상 데이터를 어떻게 연결 하느냐에 따라 등가, 비등가, 자체, 외부 조인으로 구분 
   
   등가 조인 : 테이블을 연결한 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 방식 
   등가 조인에는 안시(ANSI) 조인과 오라클 조인이 있음. */
  
-- 오라클 조인
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E, DEPT D 
  WHERE E.DEPTNO = D.DEPTNO
  ORDER BY D.DEPTNO;

-- 안시 조인 JOIN - ON
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D 
  ON E.DEPTNO = D.DEPTNO
  ORDER BY D.DEPTNO;

-- 안시 조인에서 WHERE절로 조건을 건다면? DEPTNO 10만
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D 
  ON E.DEPTNO = D.DEPTNO
  WHERE E.DEPTNO = 10
  ORDER BY D.DEPTNO;

-- 안시 조인으로 할 시 AND로 표기 
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D 
  ON E.DEPTNO = D.DEPTNO
  AND E.DEPTNO = 10
  ORDER BY D.DEPTNO;

-- 급여가 3000인 사람 출력 ->오라클
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, SAL, LOC
  FROM EMP E, DEPT D 
  WHERE E.DEPTNO = D.DEPTNO
  AND SAL >= 3000 
  ORDER BY D.DEPTNO;

-- 급여 3000인 사람 출력 -> 안시, JOIN 
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, SAL, LOC
  FROM EMP E JOIN DEPT D 
  ON E.DEPTNO = D.DEPTNO
  WHERE SAL >= 3000 
  ORDER BY D.DEPTNO;

/* EMP테이블 별칭을 E로, DEPT 테이블 별칭을 D로 하여 다음과 같이 등가 조인 했을 때  
   급여가 2500이하 이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성(1. ANSI 2. ORACLE 두가지조인으로 출력) 
   중복되는 열만 가저오기  */ 

-- 1. ANSI JOIN
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE SAL <= 2500
  AND EMPNO <= 9999
  ORDER BY EMPNO;

-- 2. ORACLE JOIN 
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
  FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO  -- 동등 조인, 이너 조인 (두 테이블이 일치하는 데이터만 선택) 
  AND SAL <= 2500 
  AND EMPNO <= 9999
  ORDER BY EMPNO;

