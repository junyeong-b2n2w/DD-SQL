SELECT LPAD(' ', (LEVEL-1)*4) || s_id s_id, value
FROM h_sum
START WITH ps_id IS NULL
CONNECT BY PRIOR s_id = ps_id;


SELECT *
FROM h_sum;

SELECT *
FROM no_emp;

SELECT LPAD(' ', (LEVEL-1) *4) || org_cd, no_emp
FROM no_emp
START WITH parent_org_cd IS NULL
CONNECT BY PRIOR org_cd = parent_org_cd;

SELECT LPAD(' ', (LEVEL-1) *4) ||deptnm
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd AND deptnm != '정보기획부';


SELECT LPAD(' ', (LEVEL-1) *4) ||deptnm , SYS_CONNECT_BY_PATH(deptnm, '-')
FROM dept_h
WHERE deptnm != '정보기획부'
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd ;


SELECT LPAD(' ', (LEVEL-1) *4) ||deptnm ,CONNECT_BY_ISLEAF
FROM dept_h
WHERE deptnm != '정보기획부'
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd ;

SELECT *
FROM board_test;

SELECT seq, LPAD(' ', (LEVEL-1)*4 ) || title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq;

SELECT *
FROM board_test;

SELECT seq, LPAD(' ', (LEVEL-1)*4 ) || title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq
ORDER SIBLINGS BY seq DESC;

SELECT *
FROM
(SELECT seq ,CONNECT_BY_ROOT(seq) gn,  LPAD(' ', (LEVEL-1)*4 ) || title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq)
ORDER BY gn desc, seq;


SELECT dept_10.*, ROWNUM
FROM(SELECT ename,sal,deptno
        FROM emp
        WHERE DEPTNO = 10
        ORDER BY sal desc) dept_10;


SELECT dept_10.*, ROWNUM
FROM(SELECT ename,sal,deptno
        FROM emp
        WHERE DEPTNO = 10
        ORDER BY sal desc) dept_10
UNION ALL
SELECT dept_20.*, ROWNUM
FROM(SELECT ename,sal,deptno
        FROM emp
        WHERE DEPTNO = 20
        ORDER BY sal desc) dept_20
UNION ALL
SELECT dept_30.*, ROWNUM
FROM(SELECT ename,sal,deptno
        FROM emp
        WHERE DEPTNO = 30
        ORDER BY sal desc) dept_30;

SELECT ename,sal,deptno,
FROM emp
ORDER BY deptno, sal desc;

SELECT ename, sal, deptno,
RANK() OVER (PARTITION BY deptno ORDER BY sal) sal_rank,
DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal) sal_danse_rank,
ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY sal) sal_row_number
FROM emp;



SELECT a.ename, a.sal, a.deptno, b.lv
FROM 
(SELECT ROWNUM rn, a.*
 FROM 
    (SELECT ename, sal, deptno
     FROM emp
     ORDER BY deptno, sal DESC) a ) a,
 
(SELECT ROWNUM rn, a.lv
FROM 
(SELECT b.deptno, a.lv
    FROM 
    (SELECT LEVEL lv
     FROM dual
     CONNECT BY LEVEL <= 14 ) a,
    (SELECT deptno, COUNT(*) cnt
     FROM emp
     GROUP BY deptno) b
    WHERE a.lv <= b.cnt
    ORDER BY b.deptno, a.lv ) a )b
WHERE a.rn = b.rn;

(SELECT deptno, COUNT(*) cnt
     FROM emp
     GROUP BY deptno);

SELECT empno,ename, emp.deptno , cnt
     FROM emp ,
     (SELECT deptno, COUNT(*) cnt
     FROM emp
     GROUP BY deptno) v_cnt
     WHERE v_cnt.deptno = emp.deptno
     ORDER BY deptno;

SELECT empno,ename,deptno,count(*) OVER (PARTITION BY deptno) cnt
FROM emp;


SELECT empno,ename,sal, ROUND(AVG(sal) OVER (PARTITION BY deptno),2) avg
FROM emp;

SELECT empno,ename,sal,MAX(sal) OVER (PARTITION BY deptno) avg
FROM emp;

SELECT empno,ename,sal, MIN(sal) OVER (PARTITION BY deptno) avg
FROM emp;