SELECT *
FROM fastfood;

SELECT sido, sigungu, gb
FROM fastfood;

SELECT sido, sigungu, 
SUM( DECODE(gb, 'KFC', 1)), SUM(DECODE(gb, '맥도날드', 1)),
SUM( DECODE(gb, '버거킹', 1)) ,SUM(DECODE(gb, '롯데리아', 1))
FROM fastfood
WHERE gb IN ('KFC', '버거킹', '맥도날드','롯데리아')
GROUP BY sido,sigungu;

SELECT *
FROM burgerstore;

SELECT ROWNUM ham_rn, hamburger.*
FROM (SELECT sido, sigungu, 
ROUND((NVL(SUM( DECODE(storecategory, 'KFC', 1)),0) + NVL(SUM(DECODE(storecategory, 'MACDONALD', 1)),0) +
NVL(SUM( DECODE(storecategory, 'BURGER KING', 1)),0)) / NVL(SUM(DECODE(storecategory, 'LOTTERIA', 1)),1), 2) score
FROM burgerstore
WHERE storecategory IN ('KFC', 'BURGER KING', 'MACDONALD','LOTTERIA')
GROUP BY sido,sigungu
ORDER BY score desc) hamburger;

도시발전순위, 햄버거시도, 햄버거 시군그, 햄버거 발전지수, 근로소득 순위, 근로소득 순위, 근로소득 시도, 근로소득 시군구, 1인당 근로소득액

SELECT *
FROM tax;

SELECT ROWNUM tax_rn, per_tax.*
FROM 
(SELECT sido, sigungu, round((sal/people),2) per_sal
FROM tax
ORDER BY per_sal DESC) per_tax;


SELECT * FROM 
        (SELECT ROWNUM ham_rn, hamburger.*
            FROM (SELECT sido ham_sido, sigungu ham_sigungu, 
                    ROUND((NVL(SUM( DECODE(storecategory, 'KFC', 1)),0) + NVL(SUM(DECODE(storecategory, 'MACDONALD', 1)),0) +
                    NVL(SUM( DECODE(storecategory, 'BURGER KING', 1)),0)) / NVL(SUM(DECODE(storecategory, 'LOTTERIA', 1)),1), 2) score
                    FROM burgerstore
                    WHERE storecategory IN ('KFC', 'BURGER KING', 'MACDONALD','LOTTERIA')
                    GROUP BY sido,sigungu
                    ORDER BY score desc) hamburger),
        (SELECT ROWNUM tax_rn, per_tax.*
        FROM (SELECT sido tax_sido, sigungu tax_sigungu, round((sal/people),2) per_sal
                FROM tax
                ORDER BY per_sal DESC) per_tax)
WHERE tax_rn = ham_rn(+)
ORDER BY tax_rn;


SELECT e.empno, e.ename, e.deptno, d.dname, d.loc
FROM emp e, dept d;

SELECT cid, cnm, pid, pnm
FROM customer CROSS JOIN product;



SELECT *
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'SMITH');
                


;
SELECT * 

FROM ALL_TAB_COLUMNS

WHERE TABLE_NAME = 'emp';


SELECT empno, ename,deptno, (SELECT dname FROM dept WHERE deptno = emp.deptno) dname
FROM emp;

SELECT *
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename='SMITH');

SELECT count(*)
FROM emp
WHERE sal > (SELECT avg(sal)
FROM emp);

SELECT *
FROM emp
WHERE sal > (SELECT avg(sal)
FROM emp);

