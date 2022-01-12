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
SELECT ename, job, sal, sal*12 AS annsal, comm
 FROM emp
 ORDER BY sal ASC;  -- ASC �������� / DESC ��������