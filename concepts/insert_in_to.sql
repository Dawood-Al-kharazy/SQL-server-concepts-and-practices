CREATE DATABASE MainDB;

use MainDB;

CREATE TABLE EMP(
ID INT NOT NULL,
Name nvarchar(100) not null,
Phone nvarchar(10) null,
Salary smallmoney null
);


select * from EMP;



-- this is how to insert data into a table:
insert into EMP
values
(1, 'dawood', '77777777', 10000); -- or you can but in the nullable columns the word 'null', like the phone and the salary.

-- or

insert into EMP
values
(3, 'mosab', '77777777', 10000),
(4, 'mosab', '77777777', 10000);

-- or

insert into EMP (ID, Name)
values
(2, 'mohammed');

