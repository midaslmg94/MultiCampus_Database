select custid, 
	(select name 
	 from customer c
     where c.custid = o.custid)
     ,sum(saleprice)
     
from orders o
group by custid;

-- 위의 쿼리와 아래의 쿼리는 같은 결과 
-- join 쿼리 사용

select c.custid, c.name, sum(o.saleprice)
from customer c join orders o 
	on c.custid= o.custid
group by c.custid;

