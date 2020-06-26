- 1prod 테이블에서 모든 데이터를 조회하는 쿼리를 작성하세요


    SELECT *
    FROM lprod;


- buyer 테이블에서 buyer_id, buyer_name 컬럼만 조회하는 쿼리를 작성하세요


    SELECT buyer_id, buyer_name
    FROM buyer;


- cart 테이블에서 모든 데이터를 조회하는 쿼리를 작성하세요.


    SELECT *
    FROM cart;


- member 테이블에서 mem_id, mem_pass, mem_name 컬럼만 조회하는 쿼리를 작성하세요


    SELECT mem_id, mem_pass, mem_name
    FROM member;
    
    
SELECT sal, sal+500, sal-500, sal/5, 500
FROM emp;

DESC emp;

SELECT hiredate, hiredate+5, hiredate -5
FROM emp;
    
DESC users;


SELECT userid, reg_dt, reg_dt+5
FROM users;


emp 테이블에서 sal 컬럼과 comm 칼럼의 합을 새로운 칼럼으로 표현
SELECT userid, reg_dt, reg_dt+5
FROM users;


SELECT empno, ename, sal s, comm, sal+comm AS sal_plus_comm
FROM emp;

SELECT empno, ename, sal s, comm, sal+comm AS "sal plus comm"
FROM emp;

------------실습 SELECT 2------

SELECT prod_id id, prod_name name
FROM prod;

SELECT lprod_gu gu, lprod_nm nm
FROM lprod;

SELECT buyer_id "바이어아이디", buyer_name "이름"
FROM buyer;

SELECT userid || usernm AS id_name,
       CONCAT(userid, usernm) AS concat_id_name
FROM users;

SELECT '아이디 : ' || userid
FROM users;

SELECT 'SELECT * FROM ' || TABLE_NAME || ';' AS query
FROM user_tables;


----WHERE----


SELECT *
FROM users
WHERE userid = 'brown';

SELECT *
FROM emp
WHERE deptno >= 30;


SELECT *
FROM emp
WHERE 1=1;

SELECT *
FROM emp
WHERE hiredate >= '82/01/01'

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

SELECT *
FROM emp
WHERE sal >= 1000 AND sal <= 2000;


--BETWEEN AND 실습 WHERE1

SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE('1982/01/01' ,'YYYY/MM/DD') 
                   AND TO_DATE('1983/01/01' ,'YYYY/MM/DD');
  
SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('1982/01/01' ,'YYYY/MM/DD') 
  AND hiredate <= TO_DATE('1983/01/01' ,'YYYY/MM/DD');
  
  
--IN--

SELECT *
FROM emp
WHERE deptno = 10
or deptno = 20;

SELECT *
FROM emp
WHERE deptno IN (10,20);

SELECT *
FROM users
WHERE userid IN ('brown', 'cony', 'sally');
