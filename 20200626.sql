SELECT *
FROM emp
WHERE ename like 'S%';

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '신%';

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '%이%';

UPDATE member SET mem_name = '신이환'
WHERE mem_id = 'c001';

SELECT empno, ename, comm
FROM emp
WHERE comm = NULL;

SELECT empno, ename, comm
FROM emp
WHERE comm IS NOT NULL;

SELECT *
FROM emp
WHERE mgr = 7698 AND sal > 1000;

SELECT *
FROM emp
WHERE mgr = 7698 OR sal > 1000;

SELECT *
FROM emp
WHERE mgr NOT IN(7698, 7839);

SELECT *
FROM emp
WHERE job = 'SALESMAN' 
AND hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');

SELECT *
FROM emp
WHERE deptno NOT IN 10 OR deptno IS NULL 
AND hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');


SELECT *
FROM emp
WHERE deptno IN (20, 30) 
AND hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');

SELECT *
FROM emp
WHERE job = 'SALESMAN' 
OR hiredate >= TO_DATE('1981/06/01', 'YYYY/MM/DD');

SELECT *
FROM emp
WHERE job = 'SALESMAN' 
  OR empno LIKE '78%';

SELECT *
FROM emp
WHERE job = 'SALESMAN' 
    OR empno BETWEEN 7800 AND 7899 
    OR empno BETWEEN 780 AND 789
    OR empno = 78; 


--NOT IN (7698, 7839, null)
--!(mgr = 7698 OR mgr = 7839 OR mgr = NULL)
--(mgr != 7698 AND mgr != 7839 AND mgr != NULL);



SELECT *
FROM emp
WHERE job = 'SALESMAN' 
    OR empno LIKE '78%' AND hiredate >= TO_DATE('1981/06/01','YYYY/MM/DD');
    
SELECT *
FROM emp
ORDER BY ename;
    
SELECT *
FROM emp
ORDER BY ename desc, mgr;

SELECT empno, ename, sal, sal*12 salary
FROM emp
ORDER BY 4;

SELECT *
FROM dept
ORDER BY dname;

SELECT *
FROM dept
ORDER BY loc desc;

SELECT * 
FROM emp
WHERE comm > 0
ORDER BY comm desc, empno desc;
