use TSQL2012

declare @amount int =6

SELECT TOP (@amount) 
	   Cat.categoryid   AS 'TheID'
      ,Cat.categoryname AS 'TheCatName'
      ,Cat.description  AS 'TheDescription'
FROM Production.Categories Cat








