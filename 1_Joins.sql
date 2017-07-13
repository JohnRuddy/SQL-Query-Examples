select C.custid, C.companyname, C.country,c.phone
from sales.customers C

select O.orderid, O.orderdate, O.freight, O.custid
from sales.Orders O

select C.custid, C.companyname, C.country,c.phone,
 O.orderid, O.orderdate, O.freight, O.custid
from --The terms Inner and Outer can always be removed - they add nothing
	sales.customers C FULL  JOIN sales.Orders O      
	--FULL shows all unmatched records from Both sides of the join
ON 
	C.custid = O.custid

--where freight >=0
order by 5


--Full Left Right
--List all customers and employees, aligning the matched ones by city
select 
	E.empid,
	C.companyname, 
	C.city 
from sales.customers C FULL join  hr.Employees E  on E.city = C.city
