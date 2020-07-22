SELECT *
FROM dept_test;


ALTER TABLE dept_test DROP COLUMN empcnt;

INSERT INTO dept_test VALUES ( 99,'ddit1', 'daejeon');
INSERT INTO dept_test VALUES ( 98,'ddit1', 'daejeon');


DELETE FROM dept_test
WHERE deptno IN (40, 98, 99);

ROLLBACK;

DELETE FROM dept_test
WHERE deptno NOT IN(SELECT deptno
                FROM emp
                GROUP BY deptno);
                
DELETE FROM dept_test
WHERE deptno NOT IN(SELECT deptno
                FROM emp
                WHERE emp.deptno = dept_test.deptno);
                
                
DELETE FROM dept_test
WHERE NOT EXISTS (SELECT 'X'
                FROM emp
                WHERE emp.deptno = dept_test.deptno);
                
SELECT *
FROM dept_test;



SELECT * 
FROM emp_test;


SELECT *
FROM emp_test e
WHERE sal <=
            (SELECT avg(s.sal)
            FROM emp_test s
            GROUP BY s.deptno
            HAVING e.deptno = s.deptno );
            
UPDATE emp_test e 
SET e.SAL = e.sal+200
WHERE sal <=
            (SELECT avg(s.sal)
            FROM emp_test s
            GROUP BY s.deptno
            HAVING e.deptno = s.deptno );
            
            
UPDATE emp_test e 
SET e.SAL = e.sal+200
WHERE sal <=
            (SELECT avg(s.sal)
            FROM emp_test s
            WHERE e.deptno = s.deptno );            
            
ROLLBACK;



SELECT TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 dt, 
       TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd') d,
       TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'iw') iw, 
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),1,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) sun,
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),2,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) mon,
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),3,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) tue,
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),4,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) wed,
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),5,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) thu,
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),6,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) fri,
       DECODE(TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd'),7,TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1,null) sat
FROM dual
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'DD');



SELECT 
       MAX(DECODE(d , 1, dt)) sun ,MAX(DECODE(d , 2, dt)) mon ,MAX(DECODE(d , 3, dt)) tue ,
       MAX(DECODE(d , 4, dt)) wed,MAX(DECODE(d , 5, dt)) thu,MAX(DECODE(d , 6, dt)) fri ,MAX(DECODE(d , 7, dt)) sat
FROM
    (SELECT TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 dt, 
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd') d,
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'iw') iw
      FROM dual
      CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'DD'))
GROUP BY DECODE (d,1,iw+1,iw)
ORDER BY DECODE (d,1,iw+1,iw);

201912월 
앞뒤 월 connect를 1일자 일요일, 마지막 토요일+
;

desc sales;

SELECT dt, DECODE (TO_CHAR(dt,'MM'),01,sales) jan, DECODE (TO_CHAR(dt,'MM'),02,sales) feb ,DECODE (TO_CHAR(dt,'MM'),03,sales) mar,
            DECODE (TO_CHAR(dt,'MM'),04,sales) apr ,DECODE (TO_CHAR(dt,'MM'),05,sales) may ,DECODE (TO_CHAR(dt,'MM'),06,sales) jun
FROM sales
;


SELECT SUM(DECODE (TO_CHAR(dt,'MM'),01,sales)) jan, SUM(DECODE (TO_CHAR(dt,'MM'),02,sales)) feb ,NVL(SUM(DECODE (TO_CHAR(dt,'MM'),03,sales)),0) mar,
           SUM( DECODE (TO_CHAR(dt,'MM'),04,sales)) apr ,SUM(DECODE (TO_CHAR(dt,'MM'),05,sales)) may ,SUM(DECODE (TO_CHAR(dt,'MM'),06,sales)) jun
FROM sales
;




SELECT 
       MAX(DECODE(d , 1, dt)) sun ,MAX(DECODE(d , 2, dt)) mon ,MAX(DECODE(d , 3, dt)) tue ,
       MAX(DECODE(d , 4, dt)) wed,MAX(DECODE(d , 5, dt)) thu,MAX(DECODE(d , 6, dt)) fri ,MAX(DECODE(d , 7, dt)) sat
FROM
    (SELECT TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 dt, 
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd') d,
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'iw') iw
            
            
      FROM dual
      CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'DD'))
GROUP BY DECODE (d,1,iw+1,iw)
ORDER BY DECODE (d,1,iw+1,iw);




SELECT 
       MAX(DECODE(d , 1, dt)) sun ,MAX(DECODE(d , 2, dt)) mon ,MAX(DECODE(d , 3, dt)) tue ,
       MAX(DECODE(d , 4, dt)) wed,MAX(DECODE(d , 5, dt)) thu,MAX(DECODE(d , 6, dt)) fri ,MAX(DECODE(d , 7, dt)) sat
FROM
    (SELECT TO_date(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL - 1 -(TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D') -1) )  dt, 
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 -(TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D') -1) , 'd') d,
            TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'iw') iw,
            (TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1) - (TO_CHAR(TO_DATE(:YEARMONTH, 'YYYYMM') + LEVEL -1 , 'd')) + 1 -(TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D')) sun
            
      FROM dual
      CONNECT BY LEVEL <= (TO_CHAR(TO_DATE(:YEARMONTH , 'YYYYMM'),'D') -1) +
                        TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'DD') 
                   + (7 - TO_CHAR(LAST_DAY(TO_DATE(:YEARMONTH, 'YYYYMM')),'D')) )
      
      
GROUP BY sun
ORDER BY sun;


