-- 함수연습 

-- ROUND : 반올림(숫자, 반올림할 위치)  
SELECT ROUND(1234.5678) AS TRUNC,
  ROUND(1234.5678,0) AS ROUND_1,
  ROUND(1234.5678,1) AS ROUND_2,
  ROUND(1234.5678,2) AS ROUND_3,
  ROUND(1234.5678,-1) AS ROUND_MINUS1,
  ROUND(1234.5678,-2) AS ROUUND_MINUS2
FROM DUAL;

-- TRUNC : 버림한 결과를 반환하는 함수 (숫자, 버림할 위치)
SELECT TRUNC(1234.5678) AS TRUNC,
  TRUNC(1234.5678,0) AS TRUNC_1,
  TRUNC(1234.5678,1) AS TRUNC_2,
  TRUNC(1234.5678,2) AS TRUNC_3,
  TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
  TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;

-- SUBSTR / SUBSTRB (글자, 위치, 가져올 글자 수) , 글자를 가져올 때 
-- 3번째 매개 변수를 생략하면 끝까지 가져옴
-- 데이터베이스 시작 위치는 1
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- 음수값은 뒤에서부터 계산, 길이에 대한 음수값으로 역순 접근
SELECT JOB,
  SUBSTR(JOB, -LENGTH(JOB)),
  SUBSTR(JOB, -LENGTH(JOB),2),
  SUBSTR(JOB,-3)
FROM EMP;

-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 알고자 할 때 사용
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1,
  INSTR('HELLO,ORACLE!','L',5) AS INSTR_2,
  INSTR('HELLO,ORACLE!','L',2,2) AS INSTR_3
FROM DUAL;

-- 특정 문자가 포함된 행 찾기
SELECT * FROM EMP
WHERE INSTR(ENAME,'S') > 0;

SELECT * FROM EMP
WHERE ENAME LIKE '%S%' ;  
-- 위 아래는 같은 결과를 출력 

-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체, 넣지 않으면 삭제됨
-- (문자열, 바꾸고 싶은 문자, 바꿀 문자)
SELECT '010-1234-5678' AS BEFORE,
  REPLACE('010-1234-5678','-',' ') AS REPLACE1,
  REPLACE('010-1234-5678','-') AS REPLACE2
FROM DUAL;

-- LPAD / RAPD :  기준 공간의 칸 수를 특정 문자로 채우는 함수
-- LPAD : 특정 문자를 앞에서부터 채워줌
-- RPAD : 특정 문자를 뒤에서부터 채워줌 
SELECT LPAD('ORACLE',10,'*')
FROM DUAL;
SELECT RPAD('ORACLE',10,'*')
FROM DUAL;
-- 개인정보 뒤자리 *로 표시하기
SELECT
  RPAD('920108-',14,'*') AS JUMIN,
  RPAD('010-1234-',13,'*') AS PHONE
FROM DUAL;

-- 날짜 데이터
-- SYSDATE : 운영체제로부터 현재 날짜와 시간 정보를 가져옴 
SELECT SYSDATE FROM DUAL; 
-- 몇개월 이후 날짜를 구하는 ADD_MONTH 함수
SELECT SYSDATE,
  ADD_MONTHS(SYSDATE,3)
FROM DUAL;

-- 입사 10주년이 되는 사원 
SELECT EMPNO, ENAME, HIREDATE, 
  ADD_MONTHS(HIREDATE, 12*10) AS 입사10주년
FROM EMP;

-- SYSDATE와 ADD_MONTHS 함수를 이용하여 현재 날짜와 6개월 후 날짜
SELECT SYSDATE,
  ADD_MONTHS(SYSDATE,6)
FROM DUAL; 

-- 두 날짜간의 개월 수 차이 구하기 MONTHS_BETWEEN 함수
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
  MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH_1,
  MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH_2,
  TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTH_3
FROM EMP;

-- 날짜 정보 추출 함수 
-- EXTRACT : 날짜 유형의 데이터로부터 날짜 정보를 분리하여 새로운 컬럼의 형태로 추출
-- EXTRACT(분리 받을 정보 FROM 받을 날짜 정보)
SELECT EXTRACT(YEAR FROM DATE '2023-09-15') AS 연도추출
FROM DUAL;

-- 입사월만 추출 
SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 12; 

SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 1;

-- [문제] --
-- 1. EMP테이블에서 사번, 사원명, 급여 조회 
--     (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
SELECT EMPNO, ENAME, ROUND(SAL, -2) 
FROM EMP
ORDER BY SAL DESC; 

-- 2. EMP테이블에서 사원번호가 홀수인 사원들을 조회 
SELECT * FROM EMP
WHERE MOD(EMPNO, 2) = 1;

-- 3. EMP테이블에서 사원명, 입사일 조회(단, 입사일은 년도와 월을 분리 추출해서 출력) 
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE)
FROM EMP;

-- 4. EMP테이블에서 9월에 입사한 직원의 정보 조회
SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;

-- 5. EMP테이블에서 81년도에 입사한 직원 조회
SELECT * FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;

-- 6. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT * FROM EMP
WHERE ENAME LIKE '%E';

-- 7. EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
SELECT * FROM EMP
WHERE ENAME LIKE '__R%';

-- 8. EMP테이블에서 사번, 사원명, 입사일로부터 40년된 되는 날짜 조회
SELECT EMPNO, ENAME, HIREDATE,
  ADD_MONTHS(HIREDATE,12*40) AS 입사40주년
FROM EMP;

-- 9. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT * 
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) / 12 >= 38;

-- 10. 오늘 날짜에서 년도만 추출 
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
-- 주로 날짜 데이터를 문자 데이터로 변환하는데 사용
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;

-- 다양한 형식으로 출력
SELECT SYSDATE,
  TO_CHAR(SYSDATE,'CC') AS 세기,
  TO_CHAR(SYSDATE,'YY') AS 연도,
  TO_CHAR(SYSDATE,'Q') AS 쿼터
FROM DUAL;

-- NULL 처리 함수 : NULL은 값이 없음, 즉 할당되지 않은걸 의미
-- NULL은 0이나 공백과는 다른 의미로 연산 불가.
-- NVL(NULL인지를 검사할 열, 1번자리 열 데이터 NULL인 경우 반환할 데이터)

-- NVL2 : NULL이 아닌 경우와 NULL인 경우 모두에 대해서 값을 지정할 수 있음.
SELECT EMPNO, ENAME, COMM, SAL, 
   NVL2(COMM, 'O', 'X') AS 성과급유무,
   NVL2(COMM, SAL*12+COMM, SAL*12) AS 연봉
FROM EMP;

-- NULLIF() : 두값이 동일하면 NULL반환, 아니면 첫 번째 값 반환
SELECT NULLIF(10,10), NULLIF('A','B')
FROM DUAL;

-- CASE문
SELECT EMPNO, ENAME, JOB, SAL,
  CASE JOB  
      WHEN 'MANAGER' THEN SAL*1.1
      WHEN 'SALESMAN' THEN SAL*1.05
      WHEN 'ASALYSY' THEN SAL
      ELSE SAL*1.03
    END AS 연봉인상
FROM EMP;

-- 1. EMPNO열에는 EMP테이블에서 사원 이름이 다섯글자 이상이며, 여섯글자 미만인 사원 정보 출력
-- MASKING_EMPNO 열에는 사원번호 앞 두자리 외 뒷자리를 * 기호로 출력
-- MASKING_ENAME 열에는 사원 이름의 첫 글자만 보여주고 나머지 글자 * 기호로 출력 

SELECT EMPNO,
    RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;

-- 2. EMP테이블 사원들의 월 평균 근무일수는 21.5일. 하루 근무를 8시간으로 보았을 때
-- 사원들의 하루 급여(DAY-PAY)와 시급(TIME-PAY)을 계산하여 결과 출력.
-- 단, 하루 급여는 소수점 세 번째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림  

SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL / 21.5, 2)  AS 일급여,
    TRUNC(SAL / 21.5 / 8, 2) AS 시급
FROM EMP;

-- 금일 수업 복습 다중행 함수
-- 여러행에 대한 함수가 적용되어 하나의 결과를 나타내는 함수 (집계)
-- 여러행이 입력 되어 결과가 하나의 행으로 출력
SELECT SUM(SAL)
FROM EMP;

SELECT SUM(SAL), ENAME
FROM EMP
GROUP BY ENAME;

-- GROUP BY : 여러 데이터에서 의미 있는 하나의 결과를 특정 열 값별로 묶어서 출력할 때 사용
SELECT DEPTNO, SUM(SAL), COUNT(*), ROUND(AVG(SAL)), MAX(SAL),MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT ROUND(AVG(SAL)) AS  사원전체평균
FROM EMP;

-- 부서별 사원 평균
SELECT DEPTNO, ROUND(AVG(SAL), 2) AS 부서별평균
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서코드, 급여 합계, 부서 평균, 부서 코드 순으로 정렬 (AS 빼도 별칭 사용가능)
SELECT DEPTNO 부서코드, 
    SUM(SAL) 합계,
    ROUND(AVG(SAL),2) 평균,
    COUNT(*) 인원수
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- HAVING절 : GROUP BY절이 존재하는 경우에만 사용 가능 
SELECT DEPTNO, JOB, ROUND(AVG(SAL),2)
FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- WHERE절 사용
SELECT DEPTNO, JOB, ROUND(AVG(SAL),2)
FROM EMP
WHERE SAL >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- 1. 부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 부서별 직책의 평균 급여 출력
SELECT DEPTNO, JOB, ROUND(AVG(SAL),2)
FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;

-- 2. 부서번호, 평균급여, 최고급여, 최저급여, 사원수를 출력
--    단, 평균 급여를 출력할 때는 소수점 제외하고 부서 번호별로 출력

SELECT DEPTNO 부서번호, 
    TRUNC(AVG(SAL)) 평균급여,
    MAX(SAL) 최고급여,
    MIN(SAL) 최저급여,
    COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 3. 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원을 출력

SELECT JOB 직책,
  COUNT(*) 사원수
FROM EMP
GROUP BY JOB
  HAVING COUNT(*) >= 3;

-- 4. 사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사 했는지 출력

SELECT DEPTNO 부서번호,
  EXTRACT(YEAR FROM HIREDATE) 입사연도
FROM EMP
GROUP BY DEPTNO, HIREDATE
ORDER BY DEPTNO, HIREDATE;
-- TO CAHR 사용

SELECT DEPTNO 부서번호,
  TO_CHAR(HIREDATE, 'YYYY') 입사일,
  COUNT(*) 사원수
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY TO_CHAR(HIREDATE, 'YYYY');

-- 5. 추가 수당을 받는 사원 수와 받지 않는 사원수를 출력(O,X로 표기 필요)
-- NLV2(NULL이 아닌 경우, NULL인 경우 찾음)
SELECT NVL2(COMM, 'O', 'X') 추가수당,
   COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

-- 6. 각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력 
SELECT DEPTNO,
  TO_CHAR(HIREDATE,'YYYY') 입사연도,
  COUNT(*) 사원수,
  MAX(SAL) 최고급여,
  SUM(SAL) 합계,
  TRUNC(AVG(SAL)) 평균
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE,'YYYY')
ORDER BY DEPTNO;

-- 조인 : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는 데 사용하는 SQL의 기능 DELETE
SELECT * FROM EMP, DEPT;

-- 열 이름을 비교하는 조건식으로 조인
SELECT *
  FROM EMP, DEPT
  WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

-- 테이블 별칭 이용 
SELECT * 
FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- 등가 조인 : 특정 열에 일치한 데이터를 기준으로 선정, ANSI조인과 오라클 조인이 있음.
-- 오라클 조인
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO
  ORDER BY D.DEPTNO;

-- 안시 조인 JOIN ON 
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D 
  ON E.DEPTNO = D.DEPTNO
  ORDER BY D.DEPTNO;

-- 안시 조인에서 WHERE절로 조건 걸어주기 
SELECT  EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE E.DEPTNO = 10
  ORDER BY D.DEPTNO;

-- AND로도 조건 추가 가능
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  AND E.DEPTNO = 10
  ORDER BY D.DEPTNO;

-- 급여가 3000인 사람 출력 오라클로
SELECT EMPNO, ENAME, D.DEPTNO, DNAME, SAL, LOC
  FROM EMP E , DEPT D
  WHERE E.DEPTNO = D.DEPTNO
  AND SAL >= 3000
  ORDER BY D.DEPTNO;

-- 안시로 출력 한다면
SELECT EMPNO, ENAME,D.DEPTNO, DNAME, SAL, LOC
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE SAL >= 3000
  ORDER BY D.DEPTNO;

  /* EMP테이블 별칭을 E로, DEPT 테이블 별칭을 D로 하여 다음과 같이 등가 조인 했을 때  
   급여가 2500이하 이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 작성(1. ANSI 2. ORACLE 두가지조인으로 출력) 
   중복되는 열만 가저오기  */ 

   -- 1. ANSI

SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, D.LOC
  FROM EMP E JOIN DEPT D
  ON E.DEPTNO = D.DEPTNO
  WHERE SAL <= 2500
  AND EMPNO <= 9999
  ORDER BY EMPNO;

 -- 2. ORACLE JOIN 
SELECT EMPNO, ENAME, SAL, E.DEPTNO, DNAME, LOC
  FROM EMP E, DEPT D
  WHERE E.DEPTNO = D.DEPTNO 
  AND SAL <= 2500
  AND EMPNO <= 9999
  ORDER BY EMPNO;

-- 비등가조인 :  동일 컬럼(열,레코드)이 없이 다른 조건으로 사용하여 조인 할 때 
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- 오라클 조인
SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN LOSAL AND HISAL;

-- ANSI
SELECT E.ENAME, SAL, GRADE
FROM EMP E JOIN SALGRADE S
ON SAL BETWEEN LOSAL AND HISAL;

-- 자체조인 :  SLEF 조인, 같은 테이블을 두 번 사용하여 자체 조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
  E2.EMPNO AS 상관사원번호,
  E2.ENAME AS 상관이름
  FROM EMP E1, EMP E2 
WHERE E1.MGR = E2.EMPNO;

-- 외부조인 :  동등 조인의 경우 한 쪽의 컬럼이 없으면 해당 행으로 표시되지 않음.
-- 외부 조인은 내부 조인과 다르게 다른 한쪽의 값이 없어도 출력이 됨. 누락되는 행을 출력하기 위해 사용

-- 왼쪽 외부 조인 사용하기
SELECT ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+)
ORDER BY DEPTNO;

SELECT * FROM DEPT;

-- 오른쪽 외부
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY E.DEPTNO; 

-- SQL-99 표준문법으로 배우는 ANSI 조인
-- 1. NATURAL JOIN : 등가 조인 대신 사용(같은열끼리 조인), 자동으로 같은열을 찾아서 조인해줌
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO
FROM EMP NATURAL JOIN DEPT;

-- 2. JOIN ~ USING : 등가 조인을 대신해서 사용
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO
FROM EMP E JOIN DEPT D USING(DEPTNO)
ORDER BY DEPTNO;

-- 3. JOIN ~ IN : ANSI 등가 조인 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, E.DEPTNO
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO;

-- 4. ANSI LEFT 