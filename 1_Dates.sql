SELECT     E.firstname, E.lastname, E.city
FROM         HR.Employees AS E 
Where city IN ( Select city from Sales.customers) 

--Dates ====================
select getDate(), SYSDATETIME() , @@version , user, user_name()

select year(getDate()), month(getDate()), day(getDate())

select getdate(), 
datepart(year, getDate()),
 datepart(month, getDate()),
  datepart(day, getDate()),
   datepart(weekday, getDate()),
    datepart(hour, getDate()) *
	 datepart(minute, getDate()) *
	  datepart(SECOND, getDate())  --can do maths with these NUMBERS

select getdate(), 
datename(year, getDate()),
 datename(month, getDate()),
  datename(day, getDate()),
   datename(weekday, getDate()),
    datename(hour, getDate()) +
	 datename(minute, getDate()) +
	  datename(SECOND, getDate()) --no maths allowed here!  Concatenate.

select getdate(), 
convert(varchar, getDate() , 100),
convert(varchar, getDate() , 102),
convert(varchar, getDate() , 103),
convert(varchar, getDate() , 106),
convert(varchar, getDate() , 107),
convert(varchar, getDate() , 113),
convert(varchar, getDate() , 131)


select 
datediff(day, getdate(), '05 dec 2013'),

datediff(day, getdate(), '20131205'),

datediff(day, '20050311',getdate())/365.25, 
datediff(day, '31 dec 2013','01 jan 2014')/365.25


select 
	orderid,
	'25 Dec 2013 (fix pls)' as 'requireddate'  ,
	'25 Dec 2013 (fix pls)' as 'shippeddate'  ,
	'4 (fix please)'		AS 'HowManyDaysLate',
	'Sunday (fix please)'   AS 'ShippedDayOfWeek'
from  sales.orders
where requireddate < shippeddate
--==============================================
select 
	orderid
	,datePart(year,requireddate) , datePart(year,shippeddate)
	,convert(varchar,requireddate, 106)		 AS 'requireddate'
	,convert(varchar,shippeddate, 106)		 AS 'shippeddate'
	,datediff(day,requireddate, shippeddate) AS 'HowManyDaysLate'
	,dateName(weekday, shippeddate)		     AS 'ShippedDayOfWeek'

from 	sales.orders
--Shipped the year after it was ordered
where 	datePart(year,requireddate) > datePart(year,shippeddate)
 







