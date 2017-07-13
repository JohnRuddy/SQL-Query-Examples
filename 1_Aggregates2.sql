--Aggregates:  count(), count(distinct city), sum(), avg(), min(), max(), stdev(), stdevp()

SELECT      country as 'LandName', 
			city,
			COUNT(custid) AS Expr1


FROM        Sales.Customers
--you must 'group by' all non-aggregated columns
GROUP BY country, city
-- often we 'order' by the same columns as we have 'group'ed
ORDER BY  city, country