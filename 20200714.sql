CREATE OR REPLACE VIEW v_emp AS
SELECT empno, ename, job, mgr, hiredate, deptno
FROM emp;

SELECT *
FROM v_emp;

GRANT SELECT ON v_emp TO hr;

CREATE OR REPLACE VIEW v_emp_dept AS
SELECT dname, empno, ename, job ,hiredate
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT *
FROM v_emp_dept;

SELECT *
FROM dept;

CREATE SEQUENCE seq_emp;

SELECT seq_emp.nextval
FROM dual;

SELECT seq_emp.currval
FROM dual;


SELECT ROWID, emp.* 행의 아이디
FROM emp
WHERE empno = 7698;

SELECT * 
FROM emp
WHERE ROWID = 'AAAE5dAAFAAAACPAAF';

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7698;

SELECT *
FROM TABLE(dbms_xplan.display);


EXPLAIN PLAN FOR
SELECT empno
FROM emp
WHERE empno = 7698;

CREATE INDEX IDX_NU_emp_01 ON emp (empno);


ALTER TABLE emp DROP CONSTRAINT fk_emp_dept;
ALTER TABLE emp DROP CONSTRAINT pk_emp;

CREATE INDEX IDX_NU_emp_01 ON emp (empno);

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7698;

SELECT *
FROM TABLE(dbms_xplan.display);