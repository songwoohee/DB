-- 1. 정렬을 위한 order by절 
SELECT * FROM EMP
ORDER BY SAL ASC;   -- ASC 는 오름차순

-- 사원번호로 오름차순 정렬
SELECT * FROM EMP
ORDER BY SAL ASC;

-- 사원번호 내림차순 정렬
SELECT * FROM EMP
ORDER BY SAL DESC;

-- 여러 컬럼 기준으로 정렬 
-- 정렬 조건을 넣지 않으면 기본적으로 오름차순 
SELECT * FROM EMP
ORDER BY SAL, ENAME;  

-- 급여순으로 정렬하고 급여가 같은 경우 이름순 정렬 (정렬 조건은 뒤에 기재)
SELECT * FROM EMP
ORDER BY SAL ASC, ENAME DESC;  -- 오름차순 정렬 이후 이름 기준 내림차순

-- 2. 연결 연산자: SELECT문 조회시 컬럼 사이에 특정한 문자를 넣고 싶을 때 사용함 
SELECT ENAME || 'S JOB IS ' || JOB as EMPLOYEE 
FROM EMP;

=------------------------------- 실습문제 1 ------------------------------------------

-- 1. 사원 이름이 S로 끝나는 사원 데이터 출력
SELECT * FROM EMP
WHERE ENAME LIKE '_%S';

-- 2. 30번 부서에서 근무하는 사원 중 직책이 
--    SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30 
AND JOB = 'SALESMAN';

-- 3. 20번, 30번 부서에 근무하는 사원 중 급여 2000 초과인 사원의
--    사원번호, 이름, 급여, 부서 번호 출력
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO IN(20,30)
AND SAL > 2000;

-- 4. BETWEEN 연산자 없이 급여가 2000 이상 3000 이하 데이터 출력 
SELECT * FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- 5. 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 
--    1000 ~ 2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서 번호 출력
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP
WHERE ENAME LIKE '%E%' 
AND DEPTNO = 30 
AND SAL NOT BETWEEN 1000 AND 2000;

-- 6. 추가 수당이 존재하지 않고 상급자가 있고, 직책이 MANAGER, CLERK인 사원중
--    사원 이름의 두번째 글자가 L이 아닌 경우 
SELECT * FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN('MANAGER','CLERK')
AND ENAME NOT LIKE '_L%';

---------------------------------------------------------------------------------

-- 1. EMP테이블에서 COMM의 값이 NULL이 아닌 정보 조회
SELECT * FROM EMP
WHERE COMM IS NOT NULL;

-- 2. EMP테이블에서 커미션을 받지 못하는 직원 조회
SELECT * FROM EMP
WHERE COMM IS NULL OR COMM = 0;

-- 3. EMP테이블에서 관리자가 없는 직원 정보 조회
SELECT * FROM EMP
WHERE MGR IS NULL;

-- 4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
SELECT * FROM EMP
ORDER BY SAL DESC;

-- 5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
SELECT * FROM EMP
ORDER BY SAL DESC, COMM DESC;

-- 6. EMP테이블에서 사원번호, 사원명, 직급, 입사일 조회(단, 입사일을 오름차순 정렬)
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP
ORDER BY HIREDATE ASC;

-- 7. EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
SELECT EMPNO, ENAME FROM EMP
ORDER BY EMPNO DESC;

-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회 
--    (부서번호가 빠른 순으로 같은 같은 부서번호일 때는 최근 입사일 순으로 처리)
SELECT EMPNO, HIREDATE, ENAME, SAL, DEPTNO FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

-- 함수 --
-- 오라클에서 함수는 내장 함수 사용자 정의 함수로 나누어 짐
-- 내장 함수는 단일행 함수와 다중행(집계)함수로 나누어 짐 
