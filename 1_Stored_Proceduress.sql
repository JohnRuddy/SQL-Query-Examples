--Stored procedures
use TSQL2012;
GO

create proc  CustsInCity
@whatTown varchar(200)
as
begin
	select * from sales.customers
	where city = @whatTown
end

exec CustsInCity 'zzz'


-- prevent web-site hacking (sql-injection)
	select companyName from sales.customers
	where city = 'zzz' union all select firstname + lastname+city from hr.Employees --'
-- fast - best 'routes' are pre-calculated and stored as part of the proc.
	select * from AdventureWorks2008R2.Person.Person
	where LastName='Bright'
-- fast n/w used invoking them

-- can update, insert, delete data as well as select.
-- can return a number, a single text val, a table (aka cursor, dataset, resultset)




zzz' or 1=1 --

zzz' union all select name from sys.tables --





