--While (and some Cursor code)
Declare @dbName varchar(99)
declare @fullSQL nvarchar(999);

DECLARE CurDataBaseList CURSOR FOR  --No @,  cursor ... tempTable?
  SELECT name from sys.databases where name not in ('tempDB','model')

  OPEN CurDataBaseList;
  FETCH NEXT FROM CurDataBaseList into @dbName ;
  WHILE @@FETCH_STATUS = 0 -- if the fetch was successful
     BEGIN
		set @fullSQL = 'Backup Database ' + @dbName + ' TO disk=''C:\data\' + @dbName + '.back'' with init'
        exec sp_executesql  @fullSQL
		FETCH NEXT FROM CurDataBaseList into @dbName;
     END;
  CLOSE CurDataBaseList;
  DEALLOCATE CurDataBaseList;
  GO
GO

