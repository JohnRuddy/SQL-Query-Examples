--Cursor in a Cursor using the most efficient fast_forward
Declare @CName varchar(99), @CID int
declare @fullSQL nvarchar(999);
declare @OID int, @freight decimal

DECLARE CurCust  CURSOR fast_forward FOR  --No @,  cursor ... tempTable?
  SELECT CustID, CompanyName from Sales.Customers

  OPEN CurCust;
  FETCH NEXT FROM CurCust into @CID, @CName ;
  WHILE @@FETCH_STATUS = 0 -- if the fetch was successful
     BEGIN
		Print 'Details for the customer:  ' + @CName
		Print'======================================================'
		
		  DECLARE CurOrd CURSOR fast_forward FOR  --No @,  cursor ... tempTable?
		  SELECT  orderId, freight from Sales.Orders
		  where custID = @CID
		  OPEN CurOrd;
		  FETCH NEXT FROM CurOrd into @OID, @freight ;
		  WHILE @@FETCH_STATUS = 0 -- if the fetch was successful
			 BEGIN
			 pRINT 'Order details: : '+format(@OID,'#') + '  ' + Format(@freight, '€ #')
			 FETCH NEXT FROM CurOrd into @OID, @freight ;
			 END
		 CLOSE CurOrd;
		 DEALLOCATE CurOrd;



		Print''
		Print''
		FETCH NEXT FROM CurCust into @CID, @CName ;
     END;
  CLOSE CurCust;
  DEALLOCATE CurCust;
  GO