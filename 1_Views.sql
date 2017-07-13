--Views.  Alias for a big select statement.  
-- No data is created. 
-- The internal select statement is executed each time the view is accessed
GO
create view vOrdersDates
AS
select 
	orderid
	,datePart(year,requireddate) AS 'YearRequired'
	,datePart(year,shippeddate)  AS 'YearShipped'
	,convert(varchar,requireddate, 106)		 AS 'requireddate'
	,convert(varchar,shippeddate, 106)		 AS 'shippeddate'
	,datediff(day,requireddate, shippeddate) AS 'HowManyDaysLate'
	,dateName(weekday, shippeddate)		     AS 'ShippedDayOfWeek'

from 	sales.orders
--Shipped the year after it was ordered
--where 	datePart(year,requireddate) > datePart(year,shippeddate)
 where requireddate< '01 jan 2010'
GO
 --This would be v slow:
 select v.orderid, v.ShippedDayOfWeek from vOrdersDates v
 --This also is v slow but it creates/fills a new Table with the results:
 select * INTO MyTable
 from vOrdersDates

 GO
 alter view vOrdersDates 
 AS
 select * from MyTable
 GO