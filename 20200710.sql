INSERT INTO emp (empno, ename, job) values (9999 , 'brown','RANGER');

SELECT * FROM emp;


UPDATE emp 
SET deptno = (SELECT deptno FROM emp WHERE ename='SMITH') ,
    job = (SELECT job FROM emp WHERE ename='SMITH')
    WHERE empno=9999;


DELETE emp
WHERE empno=9999; 

ROLLBACK;


CREATE TABLE emp_copy AS
SELECT *
FROM emp;

SELECT *
FROM emp_copy;

TRUNCATE TABLE emp_copy;


CREATE TABLE ranger (
ranger_no NUMBER,
ranger_nm VARCHAR2(50),
reg_dt DATE DEFAULT SYSDATE);

INSERT INTO ranger(ranger_no, ranger_nm) VALUES (1,'brown');

SELECT *
FROM ranger;

desc emp;

DESC dept;

CREATE TABLE dept_test(
   DEPTNO    NUMBER(2)    PRIMARY KEY,
DNAME     VARCHAR2(14) ,
LOC       VARCHAR2(13)
);

INSERT INTO dept_test VALUES(null, 'ddit', 'deajeon');


INSERT INTO dept_test VALUES(99, 'ddit', 'deajeon');
INSERT INTO dept_test VALUES(99, 'ddit2', '대전');


SELECT *
FROM dept;


DROP TABLE dept_test;


CREATE TABLE dept_test(
   DEPTNO    NUMBER(2)  CONSTRAINT pk_dept_test PRIMARY KEY,
DNAME     VARCHAR2(14) ,
LOC       VARCHAR2(13)
);