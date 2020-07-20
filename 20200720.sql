SELECT DECODE(GROUPING(job),1,'총계',0,job) job ,deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job,deptno);

SELECT job,mgr, SUM(sal)
FROM emp
GROUP BY ROLLUP(job, mgr);

SELECT job,mgr, GROUPING(job),GROUPING(mgr),SUM(sal)
FROM emp
GROUP BY ROLLUP(job, mgr);

SELECT DECODE(GROUPING(job),1,'총',job) job , DECODE(GROUPING(job) +  GROUPING(deptno),2,'계',1,'소계',deptno) deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job,deptno);


SELECT job, deptno,GROUPING(job), GROUPING(deptno), SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job,deptno);


SELECT deptno, job, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (deptno, job);


SELECT dname, job, SUM(sal + NVL(comm,0)) sal
FROM emp , dept
WHERE emp.deptno = dept.deptno
GROUP BY ROLLUP (dname, job)
ORDER BY dname;



SELECT (SELECT dname FROM dept WHERE emp.deptno = dept.deptno) dname, job, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (deptno, job);


SELECT DECODE(GROUPING(dname), 1,'총합',dname)dname , job, SUM(sal + NVL(comm,0)) sal
FROM emp , dept
WHERE emp.deptno = dept.deptno
GROUP BY ROLLUP (dname, job);



SELECT job, deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY GROUPING SETS (job,deptno);

SELECT job, null deptno,  SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY job

UNION ALL

SELECT null, deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY deptno;


SELECT job, deptno,mgr, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY GROUPING SETS ((job,deptno), mgr);

SELECT  job, deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY CUBE (job, deptno);

SELECT job, deptno,mgr, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY job, ROLLUP(job, deptno), cube(mgr);

그룹
ROLLUP 

job, deptno
job
"

CUBE

mgr
"



job  job deptno mgr
job  job mgr
job  '' mgr

job  job deptno ''
job  job ''
job  '' ''


job deptno mgr
job mgr
job deptno
job



DROP TABLE emp_test;

CREATE TABLE emp_test AS
SELECT *
FROM emp;

SELECT * FROM emp_test;

ALTER TABLE emp_test ADD (dname VARCHAR2(14));


SELECT empno, ename, deptno, (SELECT dname FROM dept WHERE dept.deptno = emp_test.deptno) dname
FROM emp_test;


UPDATE emp_test SET dname = 
            (SELECT dname FROM dept 
             WHERE dept.deptno = emp_test.deptno);
             
             
DROP TABLE dept_test;

CREATE TABLE dept_test AS
SELECT *
FROM dept;

ALTER TABLE dept_test ADD (empcnt NUMBER(5));

SELECT *
FROM dept_test;

SELECT COUNT(*)
FROM emp
GROUP BY deptno;

UPDATE dept_test SET empcnt = (SELECT cnt  FROM (SELECT deptno, COUNT(*) cnt
                                                        FROM emp    
                                                        GROUP BY deptno) a
                                WHERE a.deptno = dept_test.deptno );
            
UPDATE dept_test SET empcnt = (SELECT COUNT(ename)
                                 FROM emp    
                                 WHERE deptno = dept_test.deptno
                                 GROUP BY deptno) ;
                              
            
SELECT *
FROM dept_test;