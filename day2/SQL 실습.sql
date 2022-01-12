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
SELECT ename, job, sal, sal*12 AS annsal, comm
 FROM emp
 ORDER BY sal ASC;  -- ASC 오름차순 / DESC 내림차순