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

   1. 등가 조인 : 테이블을 연결한 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 방식 
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

/* 2. 비등가 조인 :  동일 컬럼(열, 레코드)이 없이 다른 조건으로 사용하여 조인 할 때 사용 (일반적인 경우는 아님) */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- 오라클 조인 
SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S    -- 두 개의 테이블을 연결
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL; -- 비등가 조인 

-- ANSI 조인으로 변경 
SELECT ENAME, SAL, GRADE
FROM EMP E JOIN SALGRADE S
ON SAL BETWEEN LOSAL AND HISAL;

/* 자체 조인 : SELF 조인이라고도 함. 같은 테이블을 두 번 사용하여 자체 조인 
   EMP테이블에서 직속 상관의 사원번호는 MGR에 있음 . 
   MGR을 이용해서 상관의 이름을 알아내기 위해서 사용할 수 있음  */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
  E2.EMPNO AS 상관사원번호,
  E2.ENAME AS 상관이름
  FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

/* 외부 조인 : 동등 조인의 경우 한 쪽의 컬럼이 없으면 해당 행으로 표시되지 않음
   외부 조인은 내부 조인과 다르게 다른 한쪽의 값이 없어도 출력이 됨. 
   외부 조인은 동등 조인 조건을 만족하지 못해 누락되는 행을 출력하기 위해 사용 */

INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
  VALUES(9000, '장원영', 'SALESMAN', 7698, SYSDATE, 2000, 1000, NULL);

-- 왼쪽 외부 조인 사용하기
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+)
ORDER BY DEPTNO;

SELECT * FROM DEPT;

-- 오른쪽 외부 조인 사용하기    
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY E.DEPTNO

-------------------------------------------------------------------------------------------------------

/* SQL-99 표준문법으로 배우는 ANSI 조인 (3가지 모두 같은 문법)
   1. NATURAL JOIN : 등가 조인 대신 사용 (같은열끼리 조인), 자동으로 같은열을 찾아서 조인해 줌.  */
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO
FROM EMP NATURAL JOIN DEPT; 

-- 2. JOIN ~ USING : 등가 조인을 대신해서 사용, USING 키워드에 JOIN 기준 열을 명시하여 사용 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO
FROM EMP E JOIN DEPT D USING(DEPTNO)
ORDER BY DEPTNO;

-- 3. JOIN ~ ON : ANSI 등가 조인 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, E.DEPTNO
FROM EMP E JOIN DEPT D
ON E. DEPTNO = D.DEPTNO
ORDER BY DEPTNO;

-- 4. ANSI LEFT OUTER JOIN 
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP E LEFT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO;

-- 5. ANSI RIGHT OUTER JOIN
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;

---------------문제--------------------
/* (공통 요청. SQL-99 이전 방식과 SQL-99 방식을 각각 사용하여 작성하세요.)
/* 1. 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 출력하세요. */
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > 2000;

SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE E.SAL > 2000;


/* 2. 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력 */
SELECT DEPTNO, ROUND(AVG(SAL),2), MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP E JOIN DEPT D USING(DEPTNO)
GROUP BY DEPTNO;

SELECT D.DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

/* 3. 모든 부서 정보와 사원 정보를 부서번호, 사원 이름순으로 정렬하여 출력 */
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E RIGHT OUTER JOIN DEPT D 
  ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;


--0918 수업내용--  

