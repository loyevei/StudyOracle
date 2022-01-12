-- 문자열 함수


-- 대문자
SELECT * FROM emp
 WHERE job = UPPER('analyst');
 
SELECT UPPER('analyst') FROM dual;


SELECT LOWER(ename) ename , 
           INITCAP(job) job  
 FROM emp
 WHERE comm IS NOT NULL;
 
-- LENGTH 길이 / LENGTHB (바이트의 길이)
SELECT ename, LENGTH(ename) 글자수, LENGTHB(ename) 바이트수
 FROM emp;
 
-- SUBSTRING (글자 잘라서 리턴) -> SUBSTR('문장', 시작하는 위치, 끝나는 위치)
SELECT SUBSTR('안녕하세요, 한가람IT전문학원 빅데이터반입니다.', 18, 4) phase FROM dual;

-- REPLACE (글자 대체) -> REPLACE('문장', '수정할 글자', '수정된 글자')
SELECT REPLACE('안녕하세요, 한가람IT전문학원 빅데이터반입니다.', '안녕하세요', '저리가세요') phase 
 FROM dual;
 
-- CONCAT (글자 합치기) = ||
SELECT 'A' || 'B' FROM dual;
SELECT CONCAT('A', 'B') FROM dual;

-- TRIM (여백 제거) but, 글자와 글자 사이의 여백은 없애주지 못 함
SELECT '     안녕하세요     ' FROM dual;
SELECT LTRIM('     안녕하세요     ') FROM dual;
SELECT RTRIM('     안녕하세요     ') FROM dual;
SELECT TRIM('     안녕하세요     ') res FROM dual;
SELECT TRIM('     안녕  하세요     ') res FROM dual;

-- ROUND (반올림) / TRUNC (무조건 버림)
SELECT ROUND(15.193, 1) FROM dual;
SELECT TRUNC(15.193, 1) FROM dual;


-- SYSDATE
SELECT SYSDATE FROM dual;

-- TO_CHAR
SELECT ename, hiredate, TO_CHAR(hiredate, 'yyyy-mm-dd'), TO_CHAR(sal) || '$' FROM emp;

-- TO_NUMBER
SELECT TO_NUMBER(REPLACE('2400$', '$', '')) + 100 FROM dual;
SELECT TO_NUMBER('이천사백') + 100 FROM dual;   -- -> 이건 안 됨

-- TO_DATE
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE('01/12/22') FROM dual;
SELECT TO_DATE('01/12/22', 'mm/dd/yy') FROM dual;


-- NVL (NULL값)
SELECT ename, job, sal, NVL(comm, 0) comm, 
           (sal*12) + NVL(comm, 0) AS annsal 
 FROM emp
 ORDER BY sal DESC;
 
 -- 집계 함수 SUM, COUNT, MIN, MAX, AVG
SELECT sal, NVL(comm, 0) comm FROM emp;
SELECT SUM(sal) totalsalary FROM emp;
SELECT SUM(comm) totalcommision FROM emp;
SELECT MAX(sal) FROM emp;
SELECT MIN(sal) FROM emp;
SELECT AVG(sal) FROM emp;  -- -> 이 때, ROUND를 사용해야 함(출력시, 너무 길고 평균은 소수점이 거의 필요없기 때문)
SELECT ROUND(AVG(sal), 0) sal_avg FROM emp;


-- GROUP BY
SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
 FROM emp
 GROUP BY job;

-- HAVING
SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
 FROM emp
 GROUP BY job
 HAVING MAX(sal) > 4000; 


-- 같이 쓰기
SELECT deptno, job, AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(*)
 FROM emp
 GROUP BY deptno, job
 HAVING AVG(sal) >= 1000
 ORDER BY deptno ASC, job ASC;


-- <순서>
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY


-- 중요 ROLLUP (그룹화 데이터의 합계) / GROUP BY ROLLUP 
SELECT deptno, NVL(job, '합계') JOB, 
           ROUND(AVG(sal), 2) 급여평균, MAX(sal) 급여최대, 
           SUM(sal) 급여합계, COUNT(*) 그룹별직원수
 FROM emp
 GROUP BY ROLLUP(deptno, job);
 


