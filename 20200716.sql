SELECT count(*)
FROM dept

CREATE UNIQUE INDEX idx_u_emp_0001 ON emp (empno);
CREATE INDEX idx_u_emp_0002 ON emp (deptno);
CREATE UNIQUE INDEX idx_u_dept_0001 ON dept (deptno);


SELECt /* plan_test*/ *
FROM emp;


SELECT *
FROM all_tables;

SELECT *
FROM user_tables;

SELECT *
FROM dba_tables;

SELECT *
FROM v$_tables;