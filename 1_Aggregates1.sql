-- How many orders to each country, and total freight charged?
select 
	Count(O.orderID) as 'CountOrders'
	,Sum(O.freight)  as 'SumFreight'
	,o.shipcountry --group by non-agg columns...
	,O.shipperid
	--,avg(freight)

from sales.orders O
--where...
group by o.shipcountry ,O.shipperid
with cube
order by 3, 1