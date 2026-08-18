-- this is about deleting data from a table, in DML

select * from EMP;

-- if you used this command with out where statment you will delete the whole data in the table
delete from EMP
where phone is null and ID = 5;


--update EMP
--set Phone = 770394839
--where Phone is null;