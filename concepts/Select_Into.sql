-- this is when you want to copy a table to another table

select * from EMPCopy3;


-- if you want to copy everything, it will not modify an existing table, i will creat it
select *
into EMPCopy1
from EMP;


-- if you want just copy some columns
select id, phone, salary
into EMPCopy2
from EMP;


-- if you just want to copy the names of the columns with out the data
select *
into EMPCopy3
from EMP
where 1 = 2;


-- this when renaming a table
--alter table maincopy1
--rename to EMPCopy1;
--exec sp_rename 'MainCopy2', 'EMPCopy2';