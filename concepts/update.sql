select * from EMP;

-- this when to update anything in the table:
update EMP
set Phone = '771904758', Salary = 900
where ID = 4;


-- this is another example:
update EMP
set Salary += 200
where Salary > = 500;



--update EMP
--set Salary = 400
--where id = 3;