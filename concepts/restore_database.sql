select * from departments


-- how to drop a column
alter table departments
drop  column name;


-- how to restore a database
use HR_Database;

EXEC sp_changedbowner 'sa';
Restore Database HR_Database from disk ='c:\HR_Database.bak';