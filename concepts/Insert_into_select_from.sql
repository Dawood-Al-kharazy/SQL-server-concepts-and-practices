-- this query is about how to insert the result of select statment into an exising table

select * from oldPersons;
delete from oldpersons;


create table persons(
ID int not null,
Name nvarchar(100) not null,
Phone nvarchar(10) null
);


-- this for copying the columns' names, just the names
select *
into oldPersons
from persons
where 1 = 2;


-- adding new data
insert into persons
values
(1, 'dawood', 12342),
(2, 'mohammed', 12342),
(3, 'yahya', 12342),
(1, 'ali', 12342)
;


-- copying the whole data
insert into oldPersons
select * from persons


-- copying part of the data
insert into oldPersons (id, name)
select id, name
from persons;


-- copying wiht conditions
insert into oldPersons
select *
from persons
where name = 'dawood';