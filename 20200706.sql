SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno);


SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e , emp m
WHERE e.mgr = m.empno(+);

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno AND m.deptno = 10);

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)
WHERE  m.deptno = 10;


SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e , emp m 
WHERE e.mgr = m.empno(+) AND m.deptno(+) = 10;

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno);

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e RIGHT OUTER JOIN emp m ON (e.mgr = m.empno);

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e FULL OUTER JOIN emp m ON (e.mgr = m.empno);


SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)

UNION

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e RIGHT OUTER JOIN emp m ON (e.mgr = m.empno)

MINUS

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e FULL OUTER JOIN emp m ON (e.mgr = m.empno);


SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno)

UNION

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e RIGHT OUTER JOIN emp m ON (e.mgr = m.empno)

INTERSECT

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e FULL OUTER JOIN emp m ON (e.mgr = m.empno);



--------------------도시발전지수

순위, 시도, 시군구, 버거 도시발전 지수(맥도날드, kfc, 버거킹)/ 롯데리아
정렬 - 순위 가 높은 행 가장 먼저 나오도록

fasfood, tax


SELECT * 
FROM fastfood;

SELECT *
FROM tax;

SELECT GB, COUNT(GB)
FROM fastfood
GROUP BY GB;

SELECT *
FROM fastfood, tax
WHERE fastfood.SIDO = tax.sido AND fastfood.sigungu = tax.sigungu;



SELECT fastfood.sido, fastfood.sigungu, count(gb) kfc
FROM fastfood, tax
WHERE fastfood.SIDO = tax.sido AND fastfood.sigungu = tax.sigungu AND gb= 'KFC'
GROUP BY fastfood.sido, fastfood.sigungu, gb;

SELECT fastfood.sido, fastfood.sigungu, count(gb) mac
FROM fastfood, tax
WHERE fastfood.SIDO = tax.sido AND fastfood.sigungu = tax.sigungu AND gb= '맥도날드'
GROUP BY fastfood.sido, fastfood.sigungu, gb;

SELECT fastfood.sido, fastfood.sigungu, count(gb) lot
FROM fastfood, tax
WHERE fastfood.SIDO = tax.sido AND fastfood.sigungu = tax.sigungu AND gb= '롯데리아'
GROUP BY fastfood.sido, fastfood.sigungu, gb;

SELECT fastfood.sido, fastfood.sigungu, count(gb) bgk
FROM fastfood, tax
WHERE fastfood.SIDO = tax.sido AND fastfood.sigungu = tax.sigungu AND gb= '버거킹'
GROUP BY fastfood.sido, fastfood.sigungu, gb;



------------------------------------------------


SELECT kfc.sido, kfc.sigungu, sum(bgk + kfc + mac) , count(lot)
FROM
(SELECT sido, sigungu, count(*) bgk
FROM fastfood
WHERE gb='버거킹'
GROUP BY sido, sigungu) bgk
,(SELECT sido, sigungu, count(*) kfc
FROM fastfood
WHERE gb='KFC'
GROUP BY sido, sigungu) kfc
,(SELECT sido, sigungu, count(*) lot
FROM fastfood
WHERE gb='롯데리아'
GROUP BY sido, sigungu) lot
,(SELECT sido, sigungu, count(*) mac
FROM fastfood
WHERE gb='맥도날드'
GROUP BY sido, sigungu) mac
WHERE mac.sido = kfc.sido
AND mac.sigungu = kfc.sigungu
AND mac.sido = lot.sido
AND mac.sigungu = lot.sigungu
AND mac.sido = bgk.sido
AND mac.sigungu = bgk.sigungu
GROUP BY kfc.sido, kfc.sigungu;

SELECT sido, sigungu, 
ROUND((NVL(SUM(DECODE(gb,'KFC',1)),0) + 
NVL(SUM(DECODE(gb,'맥도날드',1)),0)  + 
NVL(SUM(DECODE(gb,'버거킹',1)),0)) / 
NVL(SUM(DECODE(gb,'롯데리아',1)),1),2) score
FROM fastfood
WHERE gb IN('KFC','맥도날드','버거킹','롯데리아')
GROUP BY sido, sigungu
ORDER BY score DESC;

SELECT * 
FROM burgerstore;

SELECT sido, sigungu, 
ROUND((NVL(SUM(DECODE(STORECATEGORY,'KFC',1)),0) + 
NVL(SUM(DECODE(STORECATEGORY,'MACDONALD',1)),0)  + 
NVL(SUM(DECODE(STORECATEGORY,'BURGER KING',1)),0)) / 
NVL(SUM(DECODE(STORECATEGORY,'LOTTERIA',1)),1),2) score
FROM burgerstore
WHERE STORECATEGORY IN('KFC','MACDONALD','BURGER KING','LOTTERIA')
GROUP BY sido, sigungu
ORDER BY score DESC;
