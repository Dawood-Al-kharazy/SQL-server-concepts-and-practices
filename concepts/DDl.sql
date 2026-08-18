create table Employees(
Id int not null,
Name nvarchar(50) not null,
Salary smallmoney null
);

drop table emp;

alter table Employees
add age int null


-- this when use any database MS
--alter table Employees
--rename column gender to gendor;


-- this when use, SQLServer
exec sp_rename 'Employees.Id', 'ID', 'COLUMN';

-- this when use any database, when rename a table
--alter table Employees
--rename to new_name


-- this when use SQLServer, when rename a table
exec sp_rename 'Employees', 'Emp';


-- this when modyfing a column, in SQLServer
alter table Emp
alter column ID int null;

-- this is the same, but when use any other database MS
alter table Emp
modify column ID int null;


-- this when to drop a column
alter table Emp
drop column Name;

-- this when backup
BACKUP DATABASE DB4
TO DISK = 'C:\MyDatabase1_backup.bak';
-- WITH DIFFERENTIAL;
-- when want to backup defferential data just.

-- this when restoring a backup
RESTORE DATABASE DB4
FROM DISK = 'C:\MyDatabase1.bak';


