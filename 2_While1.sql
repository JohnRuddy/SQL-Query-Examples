-- 1 18
-- 9 97


select * from production.Products  --list all products
where productid in (1,2,3,9)

select avg(unitPrice) from production.Products  -- show the avg price of products

While (select avg(unitPrice) from production.Products) >29
Begin
	Select 'Downing the price here!'
	Update production.Products
	set unitprice = unitprice / 1.1
End      

select * from production.Products  --list all products
where productid in (1,2,3,9)

select avg(unitPrice) from production.Products

--Do something 10 times:
declare @counter int = 0

while (@counter <10)
Begin
	print 'Hello ' + convert(varchar, @counter)
	Set @counter = @counter+1
End

GO
-- Create a table of 10000 rows of random data:
create table #People
(
id int identity,
fullname varchar(99),
age int,
salary int
)
Go
Declare @counter int = 0
Declare  @nameAndNum varchar(99), @age int, @sal int

while(@counter<100000)
Begin
	Set @age = RAND() * 50 + 20 
	Set @sal = RAND() * 50000 + 20000 
	Set @nameAndNum = 'Freddy The ' +  Format(RAND() * 10000, '#')  
	insert into #People(fullname,age,salary)
	values ( @nameAndNum, @age, @sal)
	Set @counter = @counter+1
End

select * from #People
drop table #People






