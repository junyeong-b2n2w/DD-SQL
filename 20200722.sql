SELECT 
       MAX(DECODE(d , 1, dt)) sun ,MAX(DECODE(d , 2, dt)) mon ,MAX(DECODE(d , 3, dt)) tue ,
       MAX(DECODE(d , 4, dt)) wed,MAX(DECODE(d , 5, dt)) thu,MAX(DECODE(d , 6, dt)) fri ,MAX(DECODE(d , 7, dt)) sat
FROM
    (SELECT TO_date(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL - 1 -(TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D') -1) )  dt, 
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 -(TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D') -1) , 'd') d,
            trunc((ROWNUM +6) /7) test
            
      FROM dual
      CONNECT BY LEVEL <= (TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D') -1) +
                        TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'DD') 
                   + (7 - TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'D')) )
      
      
GROUP BY test
ORDER BY test;


SELECT MAX(DECODE(d, 1, dt)), MAX(DECODE(d, 2, dt)), MAX(DECODE(d, 3, dt)), 
       MAX(DECODE(d, 4, dt)), MAX(DECODE(d, 5, dt)), MAX(DECODE(d, 6, dt)), 
       MAX(DECODE(d, 7, dt))
FROM
(SELECT TO_DATE(:dtdt, 'yyyymm') + level - 
       TO_CHAR(TO_DATE(:dtdt, 'yyyymm'), 'd') dt,
       TO_CHAR(TO_DATE(:dtdt, 'yyyymm') + level - 
       TO_CHAR(TO_DATE(:dtdt, 'yyyymm'), 'd'), 'd') d,
       CASE WHEN ROWNUM <= 7 THEN 1 WHEN ROWNUM <= 14 THEN 2 WHEN ROWNUM <= 21 THEN 3
            WHEN ROWNUM <= 28 THEN 4 WHEN ROWNUM <= 35 THEN 5 WHEN ROWNUM <= 42 THEN 6
            END test
FROM dual
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:dtdt, 'yyyymm')), 'dd') + 
                    TO_CHAR(TO_DATE(:dtdt, 'yyyymm'), 'd') - 1 + 7 - 
                    TO_CHAR(LAST_DAY(TO_DATE(:dtdt, 'yyyymm')), 'd'))
GROUP BY test
ORDER BY test;


SELECT MAX(DECODE(d, 1, dt)), MAX(DECODE(d, 2, dt)), MAX(DECODE(d, 3, dt)), 
       MAX(DECODE(d, 4, dt)), MAX(DECODE(d, 5, dt)), MAX(DECODE(d, 6, dt)), 
       MAX(DECODE(d, 7, dt))
FROM
(
SELECT TO_DATE(:dtdt, 'yyyymm') + level - TO_CHAR(TO_DATE(:dtdt, 'yyyymm'), 'd') dt,
       TO_CHAR(TO_DATE(:dtdt, 'yyyymm') + level - TO_CHAR(TO_DATE(:dtdt, 'yyyymm'), 'd'), 'd') d,
       trunc((ROWNUM +6) /7) test
FROM dual
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:dtdt, 'yyyymm')), 'dd') + 
                    TO_CHAR(TO_DATE(:dtdt, 'yyyymm'), 'd') - 1 + 7 - 
                    TO_CHAR(LAST_DAY(TO_DATE(:dtdt, 'yyyymm')), 'd')
                    )
GROUP BY test
ORDER BY test;





SELECT LPAD(' ', (LEVEL-1)*4) ||ename , level
FROM emp
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;

SELECT LPAD(' ', (LEVEL-1)*4) ||ename , level
FROM emp
START WITH ename='SMITH'
CONNECT BY PRIOR mgr = empno AND PRIOR hiredate < hiredate;


SELECT *
FROM dept_h;

SELECT LPAD(' ', (LEVEL-1)*4) || deptnm ,dept_h.*, level
FROM dept_h
START WITH DEPTNM = 'XX회사'
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT LPAD(' ', (LEVEL-1)*4) || deptnm ,dept_h.*, level
FROM dept_h
START WITH DEPTNM = '정보시스템부'
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT LPAD(' ', (LEVEL-1)*4) || deptnm ,dept_h.*, level
FROM dept_h
START WITH DEPTNM = '디자인팀'
CONNECT BY PRIOR p_deptcd = deptcd;
