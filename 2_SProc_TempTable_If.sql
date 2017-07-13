exec AllAboutCountry 'fghdh'

--All about a country - customers, employees suppliers in a given county
--demo logic, temp tables, variable, if?, while?
create Procedure AllAboutCountry 
@whatCountry varchar(99)
AS
BEGIN
	--declare @whatCountry varchar(99) = 'UK'
	Create Table #People
	(
	pID int identity,
	pName varchar(99),
	pType varchar(99)
	)

	insert into #People(pName, pType)
	select contactname, 'Cust'  from sales.Customers where country = @whatCountry

	insert into #People(pName, pType)
	select firstName + ' ' + lastName , 'Emp' from hr.Employees where country = @whatCountry

	insert into #People(pName, pType)
	select contactName, 'Supplier' from production.Suppliers where country = @whatCountry

	--Fix names, only who have a comma
	update #People set pName = SUBSTRING(pName, CHARINDEX(',', pName)+2, 99 ) 
							+ ' ' 
							+ SUBSTRING(pName, 1 , CHARINDEX(',', pName)-1)
	--where pName like '%, %'
	where CHARINDEX(',', pName) > 0

	-- Feed back either the table or an 'error' message
	if (select count(*) from #People)=0
		Begin
			Select 'Opps no-one found!'
		End
	Else
		Begin
			select * from #People
		End
	drop table #People
END



