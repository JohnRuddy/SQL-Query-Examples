/****** Script for SelectTopNRows command from SSMS  ******/
use [AdventureWorks2008R2]
SELECT *
  FROM [Person].[Person]
  where FirstName = 'Jesus'  collate SQL_Latin1_General_CP1_CI_AI
  --with the collate (AI) names like Jésus can be found

  SELECT *
  FROM [Person].[Person]
  where FirstName LIKE 'J_sus'