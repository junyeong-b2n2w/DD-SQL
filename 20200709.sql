SELECT *
FROM cycle
WHERE cid=1
 AND pid IN (SELECT pid
            FROM cycle 
            WHERE cid=2);

select * 
from customer;


SELECT c.cid, cu.cnm, c.pid, p.pnm, c.day, c.cnt
FROM cycle c, product p , customer cu
WHERE c.cid=1
 AND c.pid IN (SELECT pid
            FROM cycle 
            WHERE cid=2)
AND c.pid=p.pid
AND cu.cid = c.cid;

SELECT *
FROM emp
WHERE EXISTS(SELECT 'x'
            FROM emp);
            
SELECT * 
FROM emp e
WHERE EXISTS (SELECT 'x'
            FROM emp m
            WHERE m.empno=e.mgr);
            
SELECT e.*
FROM emp e, emp m
WHERE e.mgr = m.empno;

SELECT *
FROM emp
WHERE mgr IS NOT NULL;

SELECT *
FROM emp
WHERE mgr > 0;


SELECT * 
FROM product p
WHERE EXISTS (SELECT *
            FROM Cycle
            WHERE pid =p.pid
            AND cid =1);

SELECT * 
FROM product p
WHERE pid IN (SELECT pid
            FROM Cycle
            WHERE cid =1);
            
SELECT * 
FROM product p
WHERE NOT EXISTS (SELECT *
            FROM Cycle
            WHERE pid =p.pid
            AND cid =1);


SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

UNION

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698);



SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

UNION ALL

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698);


SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566, 7499)

INTERSECT

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698);


SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566, 7499)

MINUS

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698);


SELECT empno, ename
FROM emp
WHERE empno IN (7369, 7566, 7499)

MINUS

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)
ORDER BY ename ;


INSERT INTO dept (deptno, dname,loc)
VALUES (99, 'DDIT','daejeon');

SELECT *
FROM dept;

desc dept;

INSERT INTO dept 
VALUES (98, 'DDIT2','대전');

SELECT *
FROM dept;

INSERT INTO emp (empno,ename,job,hiredate)
VALUES (9998,'sally','RANGER',SYSDATE);

INSERT INTO emp (empno,ename,job,hiredate)
VALUES (9997,'moon','RANGER',TO_DATE('2020/07/01','YYYY/MM/DD'));


SELECT *
FROM dept;


INSERT INTO emp(empno, ename,job, hiredate)
SELECT 9998,NULL,'RANGER',SYSDATE
FROM dual
UNION ALL
SELECT 9997,'moon','RANGER',TO_DATE('2020/07/01','YYYY/MM/DD')
FROM dual;


SELECT *
FROM dept;

INSERT INTO dept 
VALUES (90, 'ddit', '대전');

UPDATE dept SET dname = '대덕it', 
                loc = 'daejeon'
WHERE deptno = 90;
