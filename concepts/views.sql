-- creating a view
create view activeEmployees as
select *
from Employees
where ExitDate is not null;
