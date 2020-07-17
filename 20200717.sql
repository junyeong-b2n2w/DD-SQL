DROP TABLE emp_test2;

CREATE TABLE emp_test2 AS
SELECT empno, ename
FROM emp
WHERE 1 !=1;

SELECT *
FROM emp_test2;



SELECT 9999 empno, 'brown' ename FROM dual
UNION ALL
SELECT 9998 empno, 'sally' ename FROM dual;

INSERT ALL
    INTO emp_test VALUES (empno, ename)
    INTO emp_test2 (empno) VALUES (empno)
SELECT 9999 empno, 'brown' ename FROM dual
UNION ALL
SELECT 9998 empno, 'sally' ename FROM dual;   

SELECT *
FROM emp_test2
;

RollBACK;

INSERT ALL
    WHEN empno >= 9999 THEN
        INTO emp_test  VALUES (empno, ename)
    WHEN empno >= 9998 THEN
        INTO emp_test2  VALUES (empno, ename)
    ELSE
        INTO emp_test2 (empno) VALUES (empno)
SELECT 9999 empno, 'brown' ename FROM dual
UNION ALL
SELECT 9998 empno, 'sally' ename FROM dual;   


SELECT *
FROM emp_test2;


INSERT FIRST
    WHEN empno >= 9999 THEN
        INTO emp_test  VALUES (empno, ename)
    WHEN empno >= 9998 THEN
        INTO emp_test2  VALUES (empno, ename)
    ELSE
        INTO emp_test2 (empno) VALUES (empno)
SELECT 9999 empno, 'brown' ename FROM dual
UNION ALL
SELECT 9998 empno, 'sally' ename FROM dual;   

SELECT *
FROM emp_test;

ROLLBACK;

INSERT INTO emp_test
SELECT empno, ename
FROM emp
WHERE empno=7369;

SELECT *
FROM emp;


MERGE INTO emp_test a
USING emp b
    ON (a.empno = b.empno)
    WHEN MATCHED THEN
        UPDATE SET a.ename = b.ename || '_m'
    WHEN NOT MATCHED THEN
        INSERT (empno, ename)
        VALUES (b.empno, b.ename);
        
SELECT *
FROM emp_test;

MERGE INTO emp_test
USING dual
   ON (emp_test.empno =:empno)
WHEN MATCHED THEN
    UPDATE SET ename = :ename
WHEN NOT MATCHED THEN
    INSERT VALUES (:empno ,:ename);
    
    
CREATE TABLE dept_test3 AS
SELECT *
FROM dept
WHERE deptno IN (10,20);

SELECT *
FROM dept_test3;

MERGE INTO dept_test3 
USING dept
  ON (dept_test3.deptno = dept.deptno)
    WHEN MATCHED THEN
        UPDATE SET dept_test3.loc = dept.loc || '_m'
    WHEN NOT MATCHED THEN
        INSERT VALUES (dept.deptno, dept.dname, dept.loc);
        
        
MERGE INTO dept_test3 
USING dual
  ON (dept_test3.deptno = :deptno)
    WHEN MATCHED THEN
        UPDATE SET dept_test3.dname = :dname, dept_test3.loc = :loc
    WHEN NOT MATCHED THEN
        INSERT VALUES (:deptno, :dname, :loc);
        
SELECT *
FROM dept_test3;

SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
UNION
SELECT null deptno, SUM(sal)
FROM emp;



SELECT DECODE(rn, 1, deptno, 2, null) deptno, SUM(sum_sal)
FROM 
    (SELECT deptno, SUM(sal) sum_sal
        FROM emp
    GROUP BY deptno) a,
    (SELECT ROWNUM rn
        FROM dept
        WHERE ROWNUM <=2) b
GROUP BY DECODE(rn, 1, deptno, 2, null);


SELECT job, deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job, deptno);


SELECT deptno, SUM(sal)
FROM emp
GROUP BY ROLLUP(deptno);


SELECT job, deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job, deptno);

SELECT job, deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (deptno,job);

SELECT job, deptno,GROUPING(job), GROUPING(deptno), SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job,deptno);

SELECT DECODE(GROUPING(job) +  GROUPING(deptno),2,'총계',job) job ,deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job,deptno);


SELECT DECODE(GROUPING(job) +  GROUPING(deptno),2,'총',job) job , DECODE(GROUPING(job) +  GROUPING(deptno),2,'계',1,'소계',deptno) deptno, SUM(sal + NVL(comm,0)) sal
FROM emp
GROUP BY ROLLUP (job,deptno);

