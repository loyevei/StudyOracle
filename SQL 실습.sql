-- ������� ��ȸ�ϴ� ������
SELECT * FROM emp
 WHERE sal = 5000;
 
 SELECT * FROM emp
  WHERE job = 'CLERK';
  
SELECT * FROM emp
 WHERE comm = 0 OR comm IS NULL;

-- ���ʽ��� NULL�̰� ������ ANALYST(�ҹ���x)�� ����� ������ 
SELECT * FROM emp
 WHERE comm IS NULL AND job = 'ANALYST';
 
 -- �������� (���ϴ� �÷��� ���ڴ�)
SELECT empno, ename, deptno
 FROM emp
 WHERE deptno = 30;
 
-- ���� : �� �� �̻��� ���̺��� �ϳ��� ���̺�ó�� ��ȸ�ϴ� ���
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
  
--  DISTINCT(�ߺ�����) ����
SELECT job FROM emp;

SELECT DISTINCT job FROM emp;

-- ��Ī(ALIAS)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 ORDER BY sal ASC;  -- ASC �������� / DESC ��������
 
-- WHERE ���ǿ� ��Ī�� ���� �־ ����� �� ����
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal*12 >= 10000;
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal <> 1000;  -- <>, != ���� ����, ^=�� ���� �� ����

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
 
-- LIKE (���� ���ִ� �� ã��)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE 'J%';
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '%E%';   -- J%, %ER, %E%, __RD(_�� �ڸ���)
 

-- NULL, �Լ��� NVL() to be continue
SELECT ename, job, sal, comm
 FROM emp
 WHERE comm IS NOT NULL;
 
-- ���� (�÷�����, Ÿ���� ���ƾ� ��) UNION(�ߺ�����)/ UNION ALL(�ߺ�����)
SELECT empno, ename, job FROM emp
 WHERE comm IS NOT NULL
 UNION ALL
 SELECT deptno, dname, loc FROM dept;

