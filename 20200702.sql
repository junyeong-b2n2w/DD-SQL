SELECT deptno,SUM(sal+comm),SUM(sal+NVL(comm,0)), SUM(sal) + SUM(comm)
FROM emp
GROUP BY deptno;

SELECT *
FROM emp;

SELECT MAX(sal) max_sal, MIN(sal) min_sal, ROUND(AVG(sal),2) avg_sal,SUM(sal) sum_sal, COUNT(sal) count_sal, COUNT(mgr) count_mgr, COUNT(*) count_all
FROM emp;

SELECT DECODE(deptno, 10 , 'ACCOUNTING',20,'RESERCH',30,'SALES') dname, MAX(sal) max_sal, MIN(sal) min_sal, ROUND(AVG(sal),2) avg_sal,SUM(sal) sum_sal, COUNT(sal) count_sal, COUNT(mgr) count_mgr, COUNT(*) count_all
FROM emp
GROUP BY deptno;

SELECT TO_CHAR(hiredate, 'YYYYMM') hire_YYYYMM, COUNT(*) cnt
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYYMM');

SELECT TO_CHAR(hiredate, 'YYYY') hire_YYYY, COUNT(*) cnt
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY');

SELECT count(*) cnt
FROM dept;

SELECT count(*) cnt
FROM (SELECT count(count(deptno))
      FROM emp
      GROUP BY deptno);
      
SELECT count(count(deptno)) cnt
      FROM emp
      GROUP BY deptno;


SELECT emp.empno, emp.ename, deptno, dept.dname
FROM emp NATURAL JOIN dept;

SELECT emp.*, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno != dept.deptno;


SELECT *
FROM emp JOIN dept USING (deptno);

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;


SELECT *
FROM emp JOIN dept ON (emp.deptno = dept.deptno);

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno);

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno)
WHERE e.empno BETWEEN 7369 AND 7698;

SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno AND (e.empno BETWEEN 7369 AND 7698) ;

SELECT *
FROM salgrade;

SELECT empno, ename, sal, salgrade.grade
FROM emp JOIN salgrade
ON sal BETWEEN salgrade.losal AND salgrade.hisal;
--

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND emp.deptno IN (10, 30);

SELECT empno, ename,sal, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND emp.sal > 2500;


SELECT empno, ename,sal, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND emp.sal > 2500 AND emp.empno > 7600;