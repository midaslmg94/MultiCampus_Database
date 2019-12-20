select *
from customer
where address like '%대한민국%';

-- 위의 쿼리문을 뷰로 만듦
create view vCustomer
as(
select *
from customer
where address like '%대한민국%'
);

-- 생성된 뷰 출력 : select보다 속도가 더 빠름
select *
from vCustomer;


-- 복잡한 join 구문
select o.orderid
	, o.custid
	, c.name
	, o.bookid
	, b.bookname
	, o.saleprice
	, o.orderdate
from orders o join customer c
	on o.custid=c.custid
    join book b on o.bookid = b.bookid;
    
-- 뷰 생성
create view vOrder(orderid, 
	custid
    ,name
    , bookid
    , bookname
    , saleprice
    , orderdate)
as(select o.orderid
	, o.custid
	, c.name
	, o.bookid
	, b.bookname
	, o.saleprice
	, o.orderdate
from orders o join customer c
	on o.custid=c.custid
    join book b on o.bookid = b.bookid);
    
-- 뷰 실행
select *
from vOrder
where name = '김연아';