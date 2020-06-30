SELECT ename, TO_CHAR(hiredate, 'YYYY-MM-DD')
        ,MONTHS_BETWEEN(SYSDATE, hiredate)
FROM emp;

SELECT ADD_MONTHS(SYSDATE , 5) aft5,
       ADD_MONTHS(SYSDATE , -5) bef5
FROM dual;

SELECT NEXT_DAY(SYSDATE, 7)
FROM dual;


SELECT LAST_DAY(TO_DATE('20/06/05', 'YY/MM/DD'))
FROM dual;

SELECT TO_DATE((TO_CHAR(SYSDATE,'YYYYMM') || '01') , 'YYYYMMDD')
FROM dual;

SELECT :param param 
      , TO_CHAR((LAST_DAY(TO_DATE(:param , 'YYYYMM'))), 'DD') DT
FROM dual;


EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno='7369';



SELECT *
FROM TABLE(dbms_xplan.display);


EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE TO_CHAR(empno)='7369';

SELECT *
FROM TABLE(dbms_xplan.display);

SELECT TO_DATE('20001212', 'YYYYMMDD')
FROM dual;

SELECT TO_CHAR(TO_DATE('20001212', 'YYYYMMDD'))
FROM dual;

SELECT ename, sal, TO_CHAR(sal, 'L9,999.00') fm_sal
FROM emp;

SELECT ename, sal, TO_NUMBER(TO_CHAR(sal, 'L9,999.00'),'L9,999.00') fm_sal
FROM emp;

SELECT empno, sal, comm, NVL2(comm, comm, 0)
FROM emp;

SELECT ename, sal, comm, NULLIF(sal,3000)
FROM emp;

SELECT COALESCE(NULL, NULL, 30, NULL)
FROM dual;

INSERT INTO emp (empno, ename, hiredate) VALUES(9999, 'brown', null);

SELECT * 
FROM emp;

SELECT  ename, mgr, NVL(mgr,111), hiredate, NVL(hiredate, SYSDATE)
FROM emp;


SELECT empno, ename, mgr, NVL(mgr,9999) mgr_n, NVL2(mgr,mgr,9999) mgr_n_1, COALESCE(mgr,9999) mgr_n_2
FROM emp;

SELECT userid, usernm, reg_dt, NVL(reg_dt, SYSDATE)
FROM users
WHERE userid != 'brown';

SELECT ename, job, sal
    ,CASE
        WHEN job = 'SALESMAN' THEN sal * 1.05
        WHEN job = 'MANAGER' THEN sal * 1.10
        WHEN job = 'PRESIDENT' THEN sal * 1.20
        ELSE sal * 1
    END bonus
FROM emp;

SELECT ename, job, sal
    ,CASE
        WHEN job = 'SALESMAN' THEN sal * 1.05     -- 세일즈맨 5%
        WHEN job = 'MANAGER' THEN sal * 1.10      -- 매니저 10%
        WHEN job = 'PRESIDENT' THEN sal * 1.20    -- 사장   20%
        ELSE sal * 1
    END bonus
FROM emp;


SELECT empno, ename, 
    CASE
        WHEN deptno = 10 THEN 'ACCOUNTING'
        WHEN deptno = 20 THEN 'RESEARCH'
        WHEN deptno = 30 THEN 'SALES'
        WHEN deptno = 40 THEN 'OPERATIONS'
        ELSE 'DDIT'
    END DNAME
FROM emp;