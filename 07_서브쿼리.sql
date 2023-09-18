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

-- 문제 1. EMP테이블의 사원 정보 중에서 사원 이름이 ALLEN인 사원의 추가 수당 보다 많은 추가 수당을 받는 사원
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
