SELECT empno, ename,sal, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND emp.sal > 2500 AND emp.empno > 7600 AND dname ='RESEARCH';

SELECT Lprod.LPROD_gu, Lprod.LPROD_NM, prod_id , prod.prod_name
FROM prod, Lprod
WHERE prod.prod_lgu = lprod.lprod_gu;

SELECT Lprod.LPROD_gu, Lprod.LPROD_NM, prod_id , prod.prod_name
FROM prod JOIN Lprod ON (prod.prod_lgu = lprod.lprod_gu);

-- JOIN 2
-- ORACLE
SELECT buyer.buyer_id, buyer.buyer_name, prod.prod_id, prod.prod_name
FROM buyer, prod
WHERE prod.prod_buyer = buyer.buyer_id;
-- ANSI
SELECT buyer.buyer_id, buyer.buyer_name, prod.prod_id, prod.prod_name
FROM buyer JOIN prod ON (prod.prod_buyer = buyer.buyer_id);

-- JOIN 3
-- ORACLE
SELECT mem_id, mem_name,prod_id, prod_name, cart_qty
FROM member, cart, prod
WHERE member.mem_id = cart.cart_member AND cart.cart_prod = prod.prod_id;
-- ANSI
SELECT mem_id, mem_name,prod_id, prod_name, cart_qty
FROM member JOIN cart ON ( member.mem_id = cart.cart_member) JOIN prod ON(cart.cart_prod = prod.prod_id);

CUSTOMER : 고객정보
PRODUCT : 제품정보
CYCLE : 고객애음주기
DAILY : 

--JOIN 4
SELECT customer.cid, cnm, pid, day, cnt
FROM customer, cycle
WHERE customer.cid = cycle.cid 
  AND cnm IN('brown','sally');
  
-- JOIN 5

SELECT customer.cid, cnm, product.pid,pnm, day, cnt
FROM customer, cycle,product
WHERE customer.cid = cycle.cid AND cycle.pid = product.pid 
  AND cnm IN('brown','sally');


-- JOIN 6
SELECT customer.cid, cnm, cycle.pid, pnm , sum(cnt)
      FROM customer, cycle, product
      WHERE customer.cid = cycle.cid AND cycle.pid = product.pid
GROUP BY customer.cid, cnm, cycle.pid, pnm;

-- JOIN7
SELECT product.pid ,product.pnm, sum( cycle.cnt)
FROM cycle, product
WHERE cycle.pid = product.pid
GROUP BY product.pid, product.pnm;


--동일한 테이블 끼리 조인되었기 때문에 SELF-JOIN
--조인 조건을 만족하는 데이텀나 조회되었기 때문에 INNER-JOIN
SELECT e.empno, e.ename, e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;
--
--KING 의 경우 mgr컬럼이 없어서 NULL => 조인실패
--14건의 데이터 중 13건의 데이터만 조인성공
--
--OUTER 조인을 이용하면 조인 실패하더라도 기준테이블을 기준으로 출력이 가능
--
--ANSI - SQL 

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m ON (e.mgr = m.empno);