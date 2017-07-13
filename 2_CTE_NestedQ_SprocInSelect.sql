select * from sales.customers
where city IN (select city from hr.employees) 

select * 
from sales.customers C
join (select city from hr.employees) E
on C.city = E.city


with MyCTE AS (select city from hr.employees)
select distinct * 
from sales.customers C
Join MyCTE E
on C.city = E.city
order by 1

with MyCTE AS (select city from hr.employees),
DO_CTE AS (select * from sales.orders where freight>100)
select distinct * 
from sales.customers C
Join MyCTE E	on C.city = E.city
Join DO_CTE O	on C.custid = O.custid
order by 1

--hack to get SProc to be usable in a select:
select top 1 *  from SELF.tsql2012.sales.orders
OpenQuery(self, 'exec CustsInCity ''Paris'' ') T
