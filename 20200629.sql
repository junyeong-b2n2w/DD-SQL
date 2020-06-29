SELECT ROWNUM, empno, ename
FROM emp;

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM <= 10;

SELECT  ROWNUM, empno, ename
FROM (SELECT empno, ename
			FROM emp
			ORDER BY ename);
            
            
SELECT ROWNUM, v_emp.*
FROM (SELECT empno, ename
			FROM emp
			ORDER BY ename) v_emp ;
            
            
SELECT ROWNUM, v_emp.*
FROM (SELECT empno, ename
			FROM emp
			ORDER BY ename) v_emp 
WHERE ROWNUM BETWEEN 1 AND 10;
            
SELECT *
FROM(SELECT ROWNUM rn, v_emp.*
		FROM (SELECT empno, ename
					FROM emp
					ORDER BY ename) v_emp)
WHERE rn BETWEEN 11 AND 20;

SELECT *
FROM(SELECT ROWNUM rn, v_emp.*
		FROM (SELECT empno, ename
					FROM emp
					ORDER BY ename) v_emp)
WHERE rn BETWEEN (:page -1) * :pageSize + 1 AND :page * :pageSize;
            
SELECT  *
FROM dual;

SELECT LENGTH('TEST')
FROM emp;

SELECT LENGTH('TEST'), emp.*
FROM emp;

SELECT CONCAT('Hello', CONCAT(',', 'WORLD')) "CONCAT"
       , SUBSTR('Hello, World', 1, 5) "SUBSTR"
       , LENGTH('Hello, World') "LENGTH"
       , INSTR('Hello, World', 'o') "INSTR"
       , INSTR('Hello, World', 'o', INSTR('Hello, World', 'o') + 1) "INSTR2"  -- 첫번째 o 등장위치 이후에 등장하는 o의 위치
       , LPAD('Hello, World', 15, ' ') "LPAD"
       , RPAD('Hello, World', 15, ' ') "RPAD"
       , REPLACE('Hello, World', 'o', 'p') "REPLACE"
       , TRIM(' Hello, World ') "TRIM"
       , TRIM('d' FROM 'Hello, World') "TRIM2" 
       , LOWER('Hello, World') "LOWER"
       , UPPER('Hello, World') "UPPER"
       , INITCAP('hello, World') "INITCAP"
FROM dual;
            
SELECT *
FROM emp
WHERE ename = UPPER('smith');

SELECT ROUND(105.54 , 1) round
      ,ROUND(105.55 , 1) round2
      ,ROUND(105.55 , 0) round3
      ,ROUND(105.55 , -1) round4
FROM dual;


SELECT TRUNC(105.54 , 1) TRUNC             
      ,TRUNC(105.55 , 1) TRUNC2            
      ,TRUNC(105.55 , 0) TRUNC3            
      ,TRUNC(105.55 , -1) TRUNC4           
FROM dual;

SELECT ename, sal,TRUNC(sal/1000), MOD(sal, 1000) reminder
FROM emp;

SELECT SYSDATE + 3/24
FROM dual;

SELECT SYSDATE + (1/24/60)*3
FROM dual;


SELECT TO_DATE('20191231' , 'YYYYMMDD') -5
FROM dual;

SELECT TO_DATE('20191231' , 'YYYYMMDD') last_Day,
       TO_DATE('20191231' , 'YYYYMMDD') -5 last_day_before5,
       SYSDATE now,
       SYSDATE -3 now_before3
       FROM dual;


SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD D IW HH24:MI:SS')
FROM dual;

SELECT ename
    ,TO_CHAR(hiredate, 'yyyy/mm/dd HH24:MI:SS') hiredate
    ,TO_CHAR(hiredate +1 , 'yyyy/mm/dd HH24:MI:SS') hiredate_addD
    ,TO_CHAR(hiredate +1/24 , 'yyyy/mm/dd HH24:MI:SS') hiredate_addH
    
FROM emp;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') dt_dash
    ,TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24-MI-SS') dt_dash_with_time
    ,TO_CHAR(SYSDATE, 'DD-MM-YYYY') dt_dd_mm_yyyy
FROM dual;