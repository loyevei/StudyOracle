-- ���ڿ� �Լ�


-- �빮��
SELECT * FROM emp
 WHERE job = UPPER('analyst');
 
SELECT UPPER('analyst') FROM dual;


SELECT LOWER(ename) ename , 
           INITCAP(job) job  
 FROM emp
 WHERE comm IS NOT NULL;
 
-- LENGTH ���� / LENGTHB (����Ʈ�� ����)
SELECT ename, LENGTH(ename) ���ڼ�, LENGTHB(ename) ����Ʈ��
 FROM emp;
 
-- SUBSTRING (���� �߶� ����) -> SUBSTR('����', �����ϴ� ��ġ, ������ ��ġ)
SELECT SUBSTR('�ȳ��ϼ���, �Ѱ���IT�����п� �����͹��Դϴ�.', 18, 4) phase FROM dual;

-- REPLACE (���� ��ü) -> REPLACE('����', '������ ����', '������ ����')
SELECT REPLACE('�ȳ��ϼ���, �Ѱ���IT�����п� �����͹��Դϴ�.', '�ȳ��ϼ���', '����������') phase 
 FROM dual;
 
-- CONCAT (���� ��ġ��) = ||
SELECT 'A' || 'B' FROM dual;
SELECT CONCAT('A', 'B') FROM dual;

-- TRIM (���� ����) but, ���ڿ� ���� ������ ������ �������� �� ��
SELECT '     �ȳ��ϼ���     ' FROM dual;
SELECT LTRIM('     �ȳ��ϼ���     ') FROM dual;
SELECT RTRIM('     �ȳ��ϼ���     ') FROM dual;
SELECT TRIM('     �ȳ��ϼ���     ') res FROM dual;
SELECT TRIM('     �ȳ�  �ϼ���     ') res FROM dual;

-- ROUND (�ݿø�) / TRUNC (������ ����)
SELECT ROUND(15.193, 1) FROM dual;
SELECT TRUNC(15.193, 1) FROM dual;


-- SYSDATE
SELECT SYSDATE FROM dual;

-- TO_CHAR
SELECT ename, hiredate, TO_CHAR(hiredate, 'yyyy-mm-dd'), TO_CHAR(sal) || '$' FROM emp;

-- TO_NUMBER
SELECT TO_NUMBER(REPLACE('2400$', '$', '')) + 100 FROM dual;
SELECT TO_NUMBER('��õ���') + 100 FROM dual;   -- -> �̰� �� ��

-- TO_DATE
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE('01/12/22') FROM dual;
SELECT TO_DATE('01/12/22', 'mm/dd/yy') FROM dual;


-- NVL (NULL��)
SELECT ename, job, sal, NVL(comm, 0) comm, 
           (sal*12) + NVL(comm, 0) AS annsal 
 FROM emp
 ORDER BY sal DESC;
 
 -- ���� �Լ� SUM, COUNT, MIN, MAX, AVG
SELECT sal, NVL(comm, 0) comm FROM emp;
SELECT SUM(sal) totalsalary FROM emp;
SELECT SUM(comm) totalcommision FROM emp;
SELECT MAX(sal) FROM emp;
SELECT MIN(sal) FROM emp;
SELECT AVG(sal) FROM emp;  -- -> �� ��, ROUND�� ����ؾ� ��(��½�, �ʹ� ��� ����� �Ҽ����� ���� �ʿ���� ����)
SELECT ROUND(AVG(sal), 0) sal_avg FROM emp;


-- GROUP BY
SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
 FROM emp
 GROUP BY job;

-- HAVING
SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
 FROM emp
 GROUP BY job
 HAVING MAX(sal) > 4000; 


-- ���� ����
SELECT deptno, job, AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(*)
 FROM emp
 GROUP BY deptno, job
 HAVING AVG(sal) >= 1000
 ORDER BY deptno ASC, job ASC;


-- <����>
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY


-- �߿� ROLLUP (�׷�ȭ �������� �հ�) / GROUP BY ROLLUP 
SELECT deptno, NVL(job, '�հ�') JOB, 
           ROUND(AVG(sal), 2) �޿����, MAX(sal) �޿��ִ�, 
           SUM(sal) �޿��հ�, COUNT(*) �׷캰������
 FROM emp
 GROUP BY ROLLUP(deptno, job);
 


