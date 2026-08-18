---      default constraint ---
create database DB11;

-- default constraint when creating a table
create table table1(
ID int not null,
Name nvarchar(100) not null,
Age smallint,
City nvarchar(50) default 'sanaa'
);


create table table2(
ID int not null,
Name nvarchar(100) not null,
Age smallint,
RegsisterDate datetime
);


-- default when altering the table
alter table table2
add constraint defaultDate
default getdate() for RegsisterDate;

-- drop default constraint

alter table table2
drop constraint defaultdate
