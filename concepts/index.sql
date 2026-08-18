create table t6(
ID int primary key,
Name varchar(100),
Age smallint);

create index idx_Name
on t6 (name);

drop index t6.idx_Name;