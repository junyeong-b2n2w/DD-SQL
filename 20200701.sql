SELECT ename, job, sal,
					DECODE(job, 'SALESMAN', sal * 1.05,
                      'MANAGER', sal * 1.10,
                      'PRESIDENT', sal * 1.20
                     ) bonus
FROM emp;

SELECT empno, ename, DECODE(deptno
                        ,10, 'ACCOUNTING'
                        ,20, 'RESEARCH'
                        ,30, 'SALES'
                        ,40, 'OPERATIONS'
                        ,'DDIT') dname
  FROM emp;
  
  SELECT ename, job, sal, DECODE(job, 'SALESMAN', sal *1.05,
                                     'MANAGER' , sal * 1.10,
                                     'PRESIDENT', sal*1.20,
                                     sal *1) bonus
    FROM emp;
                        
SELECT ename, job, sal,deptno
    ,CASE
        WHEN job = 'SALESMAN' THEN sal * 1.05     -- 세일즈맨 5%
        WHEN job = 'MANAGER' THEN 
                                    CASE WHEN deptno = 30 THEN sal * 1.5 ELSE sal * 1.10 END     -- 매니저 10%
        WHEN job = 'PRESIDENT' THEN sal * 1.20    -- 사장   20%
        ELSE sal * 1
    END bonus
FROM emp;



SELECT ename, job, sal, DECODE(job, 'SALESMAN', sal *1.05,
                                     'MANAGER' , DECODE(deptno, 30 , sal * 1.5 , sal * 1.1 ),
                                     'PRESIDENT', sal*1.20,
                                     sal *1) bonus
  FROM emp;
  
SELECT empno, ename, hiredate, DECODE( MOD(TO_CHAR(SYSDATE, 'YYYY'),2) , 0,
                                CASE
                                    WHEN MOD(TO_CHAR(hiredate, 'YYYY'),2) = 0 THEN '건강검진 대상자'
                                    ELSE '건강검진 비대상자'
                                END
                                ,
                                CASE
                                    WHEN MOD(TO_CHAR(hiredate, 'YYYY'),2) = 1 THEN '건강검진 대상자'
                                    ELSE '건강검진 비대상자'
                                END
                                ) contact
FROM emp;



  
SELECT empno, ename, hiredate, DECODE( MOD(TO_CHAR(SYSDATE, 'YYYY'),2) ,MOD(TO_CHAR(hiredate, 'YYYY'),2),
                                '건강검진 대상자',
                                '건강검진 비대상자') contact
FROM emp;

SELECT userid, usernm, ' '  alias , reg_dt, DECODE( MOD(TO_CHAR(SYSDATE, 'YYYY'),2) ,MOD(TO_CHAR(reg_dt, 'YYYY'),2),
                                           '건강검진 대상자',
                                           '건강검진 비대상자') contact_to_doctor
FROM users;

SELECT * FROM emp;



SELECT deptno, SUM(sal), MAX(sal), MIN(sal), ROUND(AVG(sal),2),COUNT(sal) ,COUNT(*),COUNT(comm)
FROM emp
GROUP BY deptno;

SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno;

-- 컬럼 쓰는경우 (컬럼이 NULL이 아닌 행의 수)
-- * 쓰는경우 (그 그룹의 행수)

SELECT deptno ,COUNT(sal) ,COUNT(*)
FROM emp
GROUP BY deptno;

SELECT deptno, ROUND(AVG(sal),2)
FROM emp
GROUP BY deptno;

SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;

SELECT deptno, SUM(comm)
FROM emp
GROUP BY deptno;

SELECT deptno, MIN(sal)
FROM emp
GROUP BY deptno;

SELECT deptno, 10, SYSDATE ,SUM(sal)
FROM emp
GROUP BY deptno;

SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) > 9000;

SELECT sum_dept.*
FROM (SELECT deptno, SUM(sal) sum_sal
        FROM emp
        GROUP BY deptno) sum_dept
WHERE sum_sal > 9000;


SELECT COUNT(comm)
FROM emp
GROUP BY deptno;

SELECT deptno,MAX(sal)
FROM emp
GROUP BY deptno;