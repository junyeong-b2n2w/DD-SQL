DROP TABLE dept_test;

CREATE TABLE dept_test(
   DEPTNO    NUMBER(2),
    DNAME     VARCHAR2(14) ,
    LOC       VARCHAR2(13),

CONSTRAINT pk_dept_test PRIMARY KEY (DEPTNO)
);

INSERT INTO dept_test VALUES(99, 'ddit', 'deajeon');  -- 정상실행
INSERT INTO dept_test VALUES(99, 'ddit2', '대전');

DROP TABLE dept_test;

CREATE TABLE dept_test(
   DEPTNO    NUMBER(2) CONSTRAINT pk_dept_test PRIMARY KEY,
DNAME     VARCHAR2(14),
LOC       VARCHAR2(13)
);

select *
from dept_test;


desc dept_test;

CREATE TABLE dept_test(
   DEPTNO    NUMBER(2),
DNAME     VARCHAR2(14),
LOC       VARCHAR2(13),
 CONSTRAINT uk_dept_test_dname UNIQUE (dname,loc)
);

INSERT INTO dept_test VALUES(90, 'ddit', 'daejeon');  -- 정상실행
INSERT INTO dept_test VALUES(90, 'ddit', '대전');


DROP TABLE dept_test;

CREATE TABLE dept_test(
   DEPTNO    NUMBER(2),
DNAME     VARCHAR2(14) ,
LOC       VARCHAR2(13),
CONSTRAINT pk_dept_test PRIMARY KEY (deptno)
);

INSERT INTO dept_test VALUES (1,'ddit','daejeon');

desc emp;


CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10) ,
DEPTNO  NUMBER(2) REFERENCES dept_test(deptno)
);

dept_test 테이블에 존재하는 부서번호로 emp_test테이블에 입력하는 경우

INSERT INTO emp_test VALUES(9999, 'brown',1);
INSERT INTO emp_test VALUES(9999, 'brown',2);

DROP TABLE emp_test;

  FK_타겟테이블명_참조테이블명[인덱스] ;

CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10) ,
DEPTNO  NUMBER(2),
CONSTRAINT FK_emp_test_dept_test FOREIGN KEY (deptno) REFERENCES dept_test(deptno)
);

INSERT INTO emp_test VALUES(9999, 'brown',1);
INSERT INTO emp_test VALUES(9999, 'brown',2);

DELETE dept_test
WHERE deptno=1;

SELECT *
FROM emp_test;


CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10) ,
DEPTNO  NUMBER(2),
CONSTRAINT FK_emp_test_dept_test FOREIGN KEY (deptno) REFERENCES dept_test(deptno) ON DELETE SET NULL
);

INSERT INTO emp_test VALUES(9999, 'brown',1);

DELETE dept_test
WHERE deptno=1;

SELECT * 
FROM emp_test;



CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10) ,
--sal  NUMBER(7,2) CHECK ( sal > 0 )
sal  NUMBER(7,2) CONSTRAINT sal_no_zero CHECK ( sal > 0 ) 
);

INSERT INTO emp_test VALUES (9999,'sally' , -100);

DROP TABLE emp_test;

CREATE TABLE emp_test AS
SELECT * FROM emp;

SELECT * FROM emp_test;+


DROP TABLE emp_test;

CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10),
deptno  NUMBER(2));

ALTER TABLE emp_test ADD (hp VARCHAR2(11));

desc emp_test;

ALTER TABLE emp_test MODIFY (hp VARCHAR2(5));
ALTER TABLE emp_test MODIFY (hp NUMBER(5));

ALTER TABLE emp_test MODIFY (hp DEFAULT 123);
INSERT INTO emp_test (empno, ename, deptno) 
        VALUES (9999, 'brown', NULL);

SELECT *
FROM emp_test;

ALTER TABLE emp_test RENAME COLUMN hp TO cell;

SELECT *
FROM emp_test;

ALTER TABLE emp_test DROP COLUMN cell;

DROP TABLE emp_test;

DROP TABLE emp_test;

CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10) ,
DEPTNO  NUMBER(2)
);

ALTER TABLE emp_test ADD CONSTRAINT 
    pk_emp_test PRIMARY KEY (empno);
    
    
ALTER TABLE emp_test DROP CONSTRAINT  pk_emp_test;

ALTER TABLE emp_test ADD CONSTRAINT 
    pk_emp_test PRIMARY KEY (empno);
    

CREATE TABLE emp_test(
EMPNO    NUMBER(4),
ENAME VARCHAR2(10),
DEPTNO  NUMBER(2));

ALTER TABLE emp_test ADD CONSTRAINT pk_emp_test PRIMARY KEY (empno);


SELECT *
FROM user_tables;

SELECT *
FROM user_constraints;

SELECT *
FROM user_col_comments
WHERE table_name = 'emp_test';

SELECT *
FROM emp_test;

COMMENT ON TABLE emp_test IS '사원복제';
COMMENT ON COLUMN emp_test.empno IS '사번';
COMMENT ON COLUMN emp_test.ename IS '사원이름';
COMMENT ON COLUMN emp_test.deptno IS '부서번호';

SELECT *
FROM user_col_comments
WHERE table_name = 'EMP_TEST';

SELECT *
FROM user_col_comments;

SELECT *
FROM user_tab_comments;

SELECT a.table_name, a.table_type, a.COMMENTS , b.COLUMN_NAME, b.COMMENTS
FROM user_tab_comments a, user_col_comments b
WHERE a.TABLE_NAME = b.TABLE_NAME
AND a.TABLE_NAME IN ('PRODUCT','CUSTOMER','DAILY','CYCLE');


ALTER TABLE emp ADD CONSTRAINT PK_emp PRIMARY KEY (empno);

ALTER TABLE dept ADD CONSTRAINT PK_dept PRIMARY KEY (deptno);

ALTER TABLE emp ADD CONSTRAINT FK_emp_dept FOREIGN KEY (deptno) REFERENCES dept (deptno);


