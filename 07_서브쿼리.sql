/* 서브쿼리 : 어떤 상황이나 조건에 따라 변할 수 있는 데이터 값을 비교하기 위해 
   SQL문 안에 작성하는 작은 SELECT문을 의미한다. */

-- KING 이라는 이름을 가진 사원의 부서 이름을 찾기 위한 쿼리 
SELECT DNAME FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP
                WHERE ENAME = 'KING');
-- 사원 JONES의 급여 보다 높은 급여를 받는 사원 정보 출력하기
SELECT * 
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP
            WHERE ENAME = 'JONES' );   -- 서브쿼리 먼저 돌고, 그 다음 존의 급여보다 높은 사원 찾음

-- [문제] --
--1. EMP테이블의 사원 정보 중에서 사원 이름이 ALLEN인 사원의 추가 수당 보다 많은 추가 수당을 받는 사원
SELECT * 
FROM EMP
WHERE COMM > (SELECT COMM FROM EMP
              WHERE ENAME = 'ALLEN');

-- 2. JAMES보다 먼저 입사한 사원 출력
SELECT * 
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP
                  WHERE ENAME = 'JAMES');
-- 3. 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
--    사원 정보와 소속 부서 정보를 조회하는 경우에 대한 쿼리를 작성 
SELECT EMPNO, ENAME, JOB, SAL, D.DEPTNO, DNAME, LOC 
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20 -- HERE E.DEPTNO = 20 AND SAL 20번 부서의 급여 
AND SAL >  (SELECT AVG(SAL) FROM EMP);  -- (SELECT AVG(SAL) FROM EMP) 전체 급여의 평균

-- 다중행 서브쿼리 :  서브쿼리의 실행 결과 행이 여러 개로 나오는 서브쿼리
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 TRUE
SELECT * 
FROM EMP
WHERE SAL IN(SELECT MAX(SAL)   
             FROM EMP
             GROUP BY DEPTNO); -- 각 부서별 최대 급여가 나와서 총 4개 출력 부서번호 10,20,30,40.. 그룹으로 안묶으면 통틀어 1개만 출력됨.

-- 같은 결과 출력 
-- ANY : 메인 쿼리의 비교 조건이 서브 쿼리의 여러 검색 결과 중 하나 이상 만족되면 반환 (조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true)
SELECT * 
FROM EMP
WHERE SAL = ANY(SELECT MAX(SAL)   
             FROM EMP
             GROUP BY DEPTNO); 

SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL > ANY(SELECT SAL
                FROM EMP
                WHERE JOB = 'SALESMAN');

SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL IN(SELECT SAL
                FROM EMP
                WHERE JOB = 'SALESMAN');

-- 30번 부서 사원들의 급여보다 적은 급여를 받는 사원 정보 출력
-- ALL :  모든 조건을 만족하는 경우에 성립
SELECT *
FROM EMP
WHERE SAL < ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO = 30);

-- MANAGER보다 급여 높은 사람 
SELECT EMPNO, ENAME, SAL
FROM EMP 
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE JOB = 'MANAGER');

-- EXISTS 연산자 :  서브쿼리의 결과 값이 하나 이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 모두 FALSE
-- 10번 부서에 이름이 하나라도 있으면 EMP내 모든 결과를 모두 출력
SELECT * 
FROM EMP
WHERE EXISTS(SELECT DNAME
              FROM DEPT
              WHERE DEPTNO = 10);

SELECT * 
FROM EMP
WHERE EXISTS(SELECT DNAME
              FROM DEPT
              WHERE DEPTNO = 50);  -- 없는 부서라 FALSE이니 no rows selected 출력

-- 다중열 서브 쿼리 : 서브쿼리의 결과가 두 개 이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리
SELECT EMPNO,ENAME, SAL, DEPTNO
FROM EMP 
WHERE (DEPTNO, SAL) IN(SELECT DEPTNO, SAL
                       FROM EMP
                       WHERE DEPTNO = 30); 

-- GROUP BY절이 포함된 다중열 서브쿼리
SELECT *
FROM EMP
WHERE(DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);

----- 0918 수업 내용 -----


----- 0919 수업 시작 ------

/* FROM절에 사용하는 서브쿼리 : 인라인뷰
FROM절에 직접 테이블을 명시하여 사용하기에는 테이블 내 데이터 규모가 너무 큰 경우 사용 
보안이나 특정 목적으로 정보를 제공하는 경우  */ 

-- 10번 부서에 해당하는 테이블만 가지고 오기 
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP 
         WHERE DEPTNO = 10) E10 JOIN (SELECT * FROM DEPT) D 
ON E10.DEPTNO = D.DEPTNO; 

-- 먼저 정렬하고 해당 갯수만 가져오기
-- ROWNUM : 오라클에서 제공하는 문법으로, 행번호를 자동으로 매겨 준다. 
SELECT ROWNUM, ENAME, SAL
FROM (SELECT * FROM EMP    
         ORDER BY SAL DESC)  
WHERE ROWNUM <= 3;   -- 연봉 TOP 3 를 정렬해줌. 
/* 1. ORDER BY절은 순서상 맨 마지막 실행되기 때문에 정렬하고 자를수가 없음
그러기 때문에 정렬한 상태로 가져와서 ROWNUM을 통해 상위 3개만 출력 함. 
2. 선생님 설명 : 정렬된 결과에서 상위 3개를 뽑을려면 테이블을 가져올 때 정렬된 상태로 가져와야 함. 
일반적인 SELECT문에서는 ORDER BY절이 맨 나중에 수행되기 때문 */ 


/* SELECT절에 사용하는 서브쿼리 : 스칼라 서브쿼리라고도 부름
   1. 반드시 하나의 결과만 나와야 한다. 2. 단일행으로 와야함. */

SELECT EMPNO, ENAME, JOB, SAL, (SELECT GRADE 
                                FROM SALGRADE
                                WHERE E.SAL BETWEEN LOSAL AND HISAL) AS 급여등급,
                                DEPTNO,
                                (SELECT DNAME
                                 FROM DEPT
                                 WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

-- 매 행마다 부서번호가 각 행의 부서번호와 동일한 사원들의 SAL 평균을 구해서 반환
SELECT ENAME, DEPTNO, SAL, 
      (SELECT TRUNC(AVG(SAL))
       FROM EMP
       WHERE DEPTNO = E.DEPTNO) AS 부서별평균급여
FROM EMP E;

-- 부서 위치가 NEWYORK인 경우에 본사로, 그 외 부서는 분점으로 출력
SELECT EMPNO, ENAME, 
      CASE WHEN DEPTNO = (SELECT DEPTNO
                          FROM DEPT
                          WHERE LOC = 'NEW YORK')
           THEN '본사'
           ELSE '분점'
           END AS 소속
FROM EMP
ORDER BY 소속;

--- [문제] ---
-- 1. 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원 정보, 
--    부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
-- (1) JOIN (2) 서브쿼리(알렌의 직책) 필요

-- 1번째 방법
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = (SELECT JOB
             FROM EMP   
             WHERE ENAME = 'ALLEN');

-- 2번째 방법 
SELECT E.JOB, E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
WHERE E.JOB = (SELECT JOB
               FROM EMP
               WHERE ENAME = 'ALLEN');


-- 2. 전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 
--    급여 등급 정보를 출력하는 SQL문을 작성하세요
--    (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- EMP, DEPT, SALGRADE 3개의 테이블이 서로 조인 

-- 1번째 방법 
SELECT E.EMPNO, E.DEPTNO, D.DNAME, E.HIREDATE, D.LOC,E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
   AND E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > (SELECT AVG(SAL)
              FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

-- 2번째 방법 
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC, E.SAL, S.GRADE
FROM EMP E 
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL 
WHERE E.SAL > (SELECT AVG(SAL)
               FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO;


-- 3. 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 
--    사원 정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10 AND JOB NOT IN (SELECT DISTINCT JOB
                                    FROM EMP
                                    WHERE DEPTNO = 30);


-- 4. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 
--    사원 정보, 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요
--   (단 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 
--    통해 사원 번호를 기준으로 오름차순으로 정렬하세요).
-- 1. 다중행 없이 풀기 
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.SAL > (SELECT MAX(SAL)
               FROM EMP
               WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO; 

-- 2. 다중행 사용
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.SAL > ALL (SELECT E.SAL
                   FROM EMP
                   WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

/* DML(Data Manupulation Language) : 데이터를 조회(SELECT), 삭제(DELETE), 입력(INSERT), 변경(UPDATE)
   테이블이 아니고 *데이터를 조작*하는 것.  */

CREATE TABLE DEPT_TEMP  -- DML을 하기 위해서 임시 테이블 생성 
AS SELECT * FROM DEPT;  -- 기존의 DEPT TABLE을 복사해서 DEPT_TEMP 테이블 생성 

SELECT * FROM DEPT_TEMP;

-- DROP TABLE DEPT_TEMP; -- 테이블 삭제 할 때 사용 

-- 테이블에 데이터를 추가하기
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(50, 'DATEBASE', '서울');  -- 1 row created.
INSERT INTO DEPT_TEMP(DEPTNO, LOC, DNAME) VALUES(60, '부산', 'Development');
INSERT INTO DEPT_TEMP(DEPTNO, LOC, DNAME) VALUES(70, '인천', NULL);

-- 데이터 추가 2번째 방법
INSERT INTO DEPT_TEMP VALUES(80, '프론트', NULL);  -- 열 이름 생략 가능한 대신 열 순서를 지켜줘야한다. 
INSERT INTO DEPT_TEMP(DEPTNO,DNAME) VALUES(90, '백엔드'); -- 열 이름을 명시해주면 명시한 열 이름 갯수만큼 추가 가능 

-- 업데이트 > 내용 수정 하는 방법 
-- UPDATE DEPT_TEMP
--    SET DEPTNO = 60
--    WHERE LOC = '부산';


CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP
WHERE 1 != 1;   -- 테이블을 복사해 새로운 테이블을 만들 때 데이터는 복사하지 않고 싶을 때 사용 

DROP TABLE EMP_TEMP;


SELECT * FROM EMP_TEMP;
-- 테이블에 날짜 데이터 입력하기 
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
   VALUES(9001, '안유진', 'MANAGER', 9000, TO_DATE('2023/09/23','YYYY/MM/DD'), 2000, 1000, 10); 


INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
   VALUES(9004, '가을', 'MANAGER', 9000, SYSDATE, 2000, 1000, 10); 

-- 서브쿼리를 이용한 INSERT
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
   SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
   FROM EMP E JOIN SALGRADE S
   ON E.SAL BETWEEN S.LOSAL AND S.HISAL
   WHERE S.GRADE = 1;

/* UPDATE : 행의 정보를 변경할 때 사용 
   UPDATE '테이블이름' SET '변경할 열의 이름과 데이터' WHERE '조건식  */
SELECT * FROM DEPT_TEMP2;

CREATE TABLE DEPT_TEMP2
AS SELECT * FROM DEPT_TEMP;

UPDATE DEPT_TEMP2
   SET DNAME = '백엔드'
    LOC = '광주'
   WHERE DEPTNO = 30;

-- 테이블에 있는 데이터 삭제 하기
CREATE TABLE EMP_TEMP2
AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- 조건절없이 사용하면 모든 데이터 지워짐 
-- DELETE FROM EMP_TEMP2;

-- 조건절 만들어줘서 해당 부분만 삭제 
DELETE FROM EMP_TEMP2
WHERE JOB = 'SALESMAN';


-- 트랜잭션

CREATE TABLE DEPT_TCL
AS SELECT *
FROM DEPT;

SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50,'DATEBASE','SEOUL');

COMMIT;

UPDATE DEPT_TCL 
SET LOC = 'SEOUL'
WHERE DEPTNO = 30;

--- 0919 수업내용 ---

