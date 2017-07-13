select top 20 SalesPersonID, SalesOrderID, TotalDue, TerritoryID 

from Sales.SalesOrderHeader
-- TerritoryID 


select	SalesPersonID, TerritoryID ,
		Count(SalesOrderID) AS 'NumSales', 
		Round(Sum(TotalDue),-3)	AS 'TotalIncome', 
		Round(Avg(TotalDue),-3) AS 'AvgPerSale', 
		Convert(int,  Sum(TotalDue) )	AS 'TotalIncome', 
		Convert(int,  Avg(TotalDue)  ) AS 'AvgPerSale',
		Format(Avg(TotalDue) , '€ #,#') 

from Sales.SalesOrderHeader
where SalesPersonID IS NOT NULL
group by SalesPersonID , TerritoryID HAVING Count(SalesOrderID)>=10
 
order by SalesPersonID , TerritoryID