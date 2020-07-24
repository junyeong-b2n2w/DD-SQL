select *
from imsi
connect by level <= 3;

-- 전체 사원의 급여순위가 자신보다 한단계낮은 사람의 급여값을 5번째로 컬럼으로 생성
--(급여가 같을경우 입사일자가 빠른사람이 우선순위가 높다)

SELECT empno, ename, hiredate, sal
FROM emp
ORDER BY sal DESC, hiredate;

SELECT empno, ename, hiredate, sal,
LEAD(sal) OVER (ORDER BY sal DESC, hiredate) lead_Sal,
 LAG(sal) OVER (ORDER BY sal DESC, hiredate) lag_Sal
FROM emp;


SELECT empno, ename, hiredate, job, sal, LAG(sal) OVER (PARTITION BY job ORDER BY sal DESC, hiredate) lag_sal
FROM emp;

SELECT emp_sal_rn.empno, emp_sal_rn.ename, emp_sal_rn.hiredate, emp_sal_rn.job, emp_sal_rn.sal, sal_rn.sal
FROM (SELECT emp_sal.*, ROWNUM rn
            FROM  (SELECT empno, ename, hiredate, job, sal
                    FROM emp
                    ORDER BY sal DESC) emp_sal) emp_sal_rn,
        (SELECT ROWNUM+1 rn, sal
         FROM (SELECT sal
                FROM emp
                ORDER BY sal desc) ) sal_rn
WHERE emp_sal_rn.rn= sal_rn.rn(+)
ORDER BY emp_sal_rn.sal DESC;


SELECT empno, ename, sal
FROM emp
ORDER BY sal;



SELECT empno, ename, sal , 
            SUM(sal) OVER (ORDER BY sal ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) c_sum,
            SUM(sal) OVER (ORDER BY sal ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) c_sum2
FROM emp
ORDER BY sal;




SELECT empno, ename, sal , 
            
            SUM(sal) OVER (ORDER BY sal ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) c_sum2
FROM emp
ORDER BY sal;


SELECT empno, ename, deptno,sal , 
            SUM(sal) OVER (PARTITION BY deptno ORDER BY deptno, sal RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) c_sum2
FROM emp;

SELECT empno, ename, deptno,sal,
  SUM(sal) OVER (PARTITION BY deptno ORDER BY sal ROWS BETWEEN  UNBOUNDED PRECEDING AND CURRENT ROW ) c_row,
  SUM(sal) OVER (PARTITION BY deptno ORDER BY sal RANGE BETWEEN  UNBOUNDED PRECEDING AND CURRENT ROW ) c_range,
  SUM(sal) OVER (PARTITION BY deptno ORDER BY sal) c_default
FROM emp;


