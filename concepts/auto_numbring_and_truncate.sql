select * from Departments;

insert into Departments
values
('CS');

-- this will delete the records and will not reset the id to 1
-- also here you can set a condation
delete from Departments;
-- this will delete the records and will reset the id to 1
-- here you can't set a condation
truncate table departments;


drop table Departments;


-- create table with auto numbring ID
create table departments(
ID int identity(1,1) not null, 
Name nvarchar(10) not null
);