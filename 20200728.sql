SELECT *
FROM TB_JDBC_USER;


desc board;


INSERT INTO board VALUES (1,'123',sysdate,'123','123');
INSERT INTO board VALUES (2,'123',sysdate,'jun2','123');
commit;


SELECT A.board_num, A.board_title , A.board_text, b.user_name, A.board_date
FROM board A LEFT OUTER JOIN TB_JDBC_USER B
ON A.board_author = B.user_id
ORDER BY A.board_num DESC;

SELECT NVL(MAX(board_num),0) +1  max_num FROM board;

desc board;



-- 화면 출력을 활성화 하는 설정 ( 접속후 1회만 실행하면 유지)
SET SERVEROUTPUT ON;
-- 간단한 PL/SQL익명 블럭

DECLARE
    deptno NUMBER(2);
    dname VARCHAR2(20);
BEGIN
    SELECT deptno, dname  INTO deptno, dname
    FROM dept
    WHERE deptno =10;
    
    DBMS_OUTPUT.PUT_LINE(deptno || '    ' || dname);
END;
/



DECLARE
    deptno dept.deptno%TYPE;
    dname dept.dname%TYPE;
BEGIN
    SELECT deptno, dname  INTO deptno, dname
    FROM dept
    WHERE deptno =10;
    
    DBMS_OUTPUT.PUT_LINE(deptno || '    ' || dname);
END;
/




-- print dept라는 프로시져 생성
-- 인자 " 없음
-- 로직 dept 테이블에서 10번부서의 부서이름과 부서위치를 로그로 출력

--view와 비교
--1. 뷰생성
--2. select * from 뷰
--
--프로시저 절차
--1. 프로시저 생성 CREATE OR REPLACE ....
--2. 프로지셔 실행





-- 선언부
CREATE OR REPLACE PROCEDURE print_dept IS

    dname dept.dname%TYPE;
    loc dept.loc%TYPE;
BEGIN
    SELECT dname, loc  INTO  dname ,loc
    FROM dept
    WHERE deptno =10;
    
    DBMS_OUTPUT.PUT_LINE(dname || '    ' || loc);
END;
/
--준영쓰~ 오늘도 힘내세여~!!!!!>_<
EXEC print_dept;


CREATE OR REPLACE PROCEDURE print_dept(p_deptno IN dept.deptno%TYPE) IS

    v_dname dept.dname%TYPE;
    v_loc dept.loc%TYPE;
BEGIN
    SELECT dname, loc  INTO  v_dname ,v_loc
    FROM dept
    WHERE deptno = p_deptno;
    
    DBMS_OUTPUT.PUT_LINE(v_dname || '    ' || v_loc);
END;
/

EXEC print_dept(20);



-- 프로시저 생성 실습

CREATE OR REPLACE PROCEDURE printemp(p_empno IN emp.empno%TYPE) IS

    v_ename emp.ename%TYPE;
    v_dname dept.dname%TYPE;
BEGIN
    SELECT ename, dname  INTO  v_ename ,v_dname
    FROM emp, dept
    WHERE emp.deptno = dept.deptno AND empno = p_empno;
    
    DBMS_OUTPUT.PUT_LINE(v_ename || '    ' || v_dname);
END;
/



EXEC printemp(7782);

SELECT * FROM dept_test;

DROP TABLE dept_test;
CREATE TABLE dept_test AS
SELECT *
FROM dept;

SELECT * FROM dept_test;


CREATE OR REPLACE PROCEDURE registdept_test(p_deptno IN dept_test.deptno%TYPE,
p_dname IN dept_test.dname%TYPE , p_loc IN dept_test.loc%TYPE) IS
BEGIN
    INSERT INTO dept_test (deptno, dname, loc) VALUES (p_deptno , p_dname, p_loc);
    commit;
END;
/


SELECT * from dept_test;

exec REGISTDEPT_TEST(98, 'ddit' , 'daejoen');

CREATE OR REPLACE PROCEDURE UPDATEdept_test(p_deptno IN dept_test.deptno%TYPE,
p_dname IN dept_test.dname%TYPE , p_loc IN dept_test.loc%TYPE) IS
BEGIN
    UPDATE dept_test SET dname=p_dname, loc=p_loc WHERE deptno = p_deptno;
    commit;
END;
/


exec UPDATEDEPT_TEST(98, 'ddit_m' , 'daejoen');

SELECT * from dept_test;




DECLARE 
    v_dept_row dept%ROWTYPE;
BEGIN
    SELECT * INTO v_dept_row
    FROM dept
    WHERE deptno=10;
    DBMS_OUTPUT.PUT_LINE('dname : ' || v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('deptno : ' || v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('loc : ' || v_dept_row.loc);
END;
/
