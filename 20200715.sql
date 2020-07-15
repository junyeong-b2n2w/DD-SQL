CREATE INDEX idx_nu_emp_02 ON emp (job);

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE job='MANAGER'
AND ename LIKE 'C%';

SELECT *
FROM TABLE(dbms_xplan.display);

CREATE INDEX idx_nu_emp_03 ON emp (job, ename);

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE job='MANAGER'
AND ename LIKE 'C%';

SELECT *
FROM TABLE(dbms_xplan.display);


EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE job='MANAGER'
AND ename LIKE '%C';

SELECT *
FROM TABLE(dbms_xplan.display);


CREATE INDEX ipx_nu_emp_04 ON emp (ename,job);

SELECT ename, job, rowid
FROM emp
ORDER BY ename, job;

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE ename LIKE 'C%'
AND job= 'MANANGER';

SELECT *
FROM TABLE(dbms_xplan.display);

DROP INDEX idx_nu_emp_03;

ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno);
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY (deptno) REFERENCES dept (deptno);


EXPLAIN PLAN FOR
SELECT *
FROM emp,dept
WHERE emp.deptno = dept.deptno
AND emp.empno =  7788;


SELECT *
FROM TABLE (dbms_xplan.display);

Plan hash value: 999219729
 
-----------------------------------------------------------------------------------------------
| Id  | Operation                     | Name          | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT              |               |     1 |   117 |     2   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                 |               |       |       |            |          |
|   2 |   NESTED LOOPS                |               |     1 |   117 |     2   (0)| 00:00:01 |
|   3 |    TABLE ACCESS BY INDEX ROWID| EMP           |     1 |    87 |     1   (0)| 00:00:01 |
|*  4 |     INDEX RANGE SCAN          | IDX_NU_EMP_01 |     1 |       |     0   (0)| 00:00:01 |
|*  5 |    INDEX UNIQUE SCAN          | PK_DEPT       |     1 |       |     0   (0)| 00:00:01 |
|   6 |   TABLE ACCESS BY INDEX ROWID | DEPT          |   409 | 12270 |     1   (0)| 00:00:01 |
-----------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   4 - access("EMP"."EMPNO"=7788)
   5 - access("EMP"."DEPTNO"="DEPT"."DEPTNO")
   
4 - 3 - 5 -2 -6 -1 - 0

;

DROP TABLE DEPT_TEST;

CREATE TABLE DEPT_TEST AS
SELECT *
FROM DEPT
WHERE 1=1;


CREATE UNIQUE INDEX idx_u_dept_test_01 ON dept_test (deptno);

CREATE INDEX idx_nu_dept_test_02 ON dept_test (dname);

CREATE INDEX idx_nu_dept_test_03 ON dept_test (deptno, dname);

DROP INDEX idx_u_dept_test_01;
DROP INDEX idx_nu_dept_test_02;
DROP INDEX idx_nu_dept_test_03;


EXPLAIN PLAN FOR
SELECT deptno, TO_CHAR(hiredate, 'yyyymm'), COUNT(*) cnt
FROM emp
GROUP BY deptno, TO_CHAR(hiredate, 'yyyymm');

SELECT *
FROM TABLE (dbms_xplan.display);


EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE sal BETWEEN 0 AND 10000
AND deptno = 30;

