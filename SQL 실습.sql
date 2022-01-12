-- 행단위로 조회하는 셀렉션
SELECT * FROM emp
 WHERE sal = 5000;
 
 SELECT * FROM emp
  WHERE job = 'CLERK';
  
SELECT * FROM emp
 WHERE comm = 0 OR comm IS NULL;

-- 보너스가 NULL이고 직업이 ANALYST(소문자x)인 사람만 셀렉션 
SELECT * FROM emp
 WHERE comm IS NULL AND job = 'ANALYST';
 
 -- 프로젝션 (원하는 컬럼만 보겠다)
SELECT empno, ename, deptno
 FROM emp
 WHERE deptno = 30;
 
-- 조인 : 두 개 이상의 테이블을 하나의 테이블처럼 조회하는 방법
SELECT * FROM emp
 JOIN dept
  ON emp.deptno = dept.deptno;

SELECT * FROM emp e
 JOIN dept d
  ON e.deptno = d.deptno;
  
SELECT e.empno, e.ename, e.job, e.hiredate, e.sal, d.deptno, d.dname
 FROM emp e
  JOIN dept d
   ON e.deptno = d.deptno;
  
--  DISTINCT(중복제거) 복습
SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

-- 별칭(ALIAS)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 ORDER BY sal ASC;  -- ASC 오름차순 / DESC 내림차순
 
-- WHERE 조건에 별칭을 아직 넣어서 사용할 수 없음
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal*12 >= 10000;
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal <> 1000;  -- <>, != 많이 쓰임, ^=는 거의 안 쓰임

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE NOT sal = 1000;  
 
-- IN
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal IN (800, 1600, 5000);
 
-- BETWEEN A AND B
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal >= 1600 AND sal <=2975;
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal BETWEEN 1600 AND 2975;
 
-- LIKE (뭐가 들어가있는 거 찾기)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE 'J%';
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '%E%';   -- J%, %ER, %E%, __RD(_는 자릿수)
 

-- NULL, 함수명 NVL() to be continue
SELECT ename, job, sal, comm
 FROM emp
 WHERE comm IS NOT NULL;
 
-- 집합 (컬럼갯수, 타입이 같아야 함) UNION(중복제거)/ UNION ALL(중복포함)
SELECT empno, ename, job FROM emp
 WHERE comm IS NOT NULL
 UNION ALL
 SELECT deptno, dname, loc FROM dept;

