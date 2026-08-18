-- this is about select statement




--- normal statements ---
select Employees.* 
from Employees;
-- is the same with:
select * 
from Employees;
------------
select * 
from Departments;
------------
select * 
from Countries;
------------
select FirstName, LastName, MonthlySalary 
from Employees;


--- select distinct ---
select distinct DepartmentID
from Employees;
-- distinct works on all columns
select distinct FirstName, DepartmentID
from Employees;


--- where statement with select    ----
select Employees.FirstName, Employees.LastName, Employees.MonthlySalary
from Employees
where MonthlySalary >= 500 and Gendor = 'f';
------------
select *
from Employees
where CountryID <> 1;
------------
select *
from Employees
where ExitDate is not null;


--- in operator ---
select * 
from Employees
where DepartmentID in(1, 2);
-- 'in' is the same with 'or'

select Name
from Departments
where ID in(
	select DepartmentID
	from Employees
	where MonthlySalary < 210
);

---   order by   ---
select Employees.FirstName, Employees.LastName, Employees.MonthlySalary
from Employees
where DepartmentID = 3
-- it will order the table based on the firstname value, then will sort the table based on the lastname value,
-- if there were two ail, it will put them at the begining of the table and then order them based on them lastname values,
-- it will put the highest value on the top
order by FirstName asc, LastName desc;


---    top     ---
select top 10 percent *
from Employees

select top 5 percent *
from Employees


--select FirstName, LastName, MonthlySalary
--from Employees
--where MonthlySalary in(
--select top 3 MonthlySalary
--from Employees

select FirstName, LastName, MonthlySalary
from Employees
where MonthlySalary in(
select distinct top 3 MonthlySalary
from Employees 
order by MonthlySalary desc);



---   as    ---
select A= 5+3, B= 8/2;

select A= 5+3, B= 8/2
from Employees;

-- 'as' and '=' is the same
select fr=firstname, monthlysalary/2 as salary
from employees;

select distinct FullName = FirstName + '  ' + LastName, MonthlySalary
from Employees
order by MonthlySalary asc;

-- dataiff calclate the difference between two dates and give you the result on years 
select ID, FullName= FirstName + ' ' + LastName, Age = DATEDIFF(Year , DateOfBirth ,getDate())
from Employees
order by age desc;


---      between      ---
select *
from Employees
where MonthlySalary >= 1000 and MonthlySalary <= 2000;
-- is the same with
select *
from Employees
where MonthlySalary between 1000 and 2000;


---       count, sum, avg, min, max      ----
select  Count=COUNT(monthlysalary), 
		Totoal=sum(monthlysalary), 
		avrage=avg(monthlysalary), 
		Min=min(monthlysalary), 
		Max=max(monthlysalary)
from Employees
where DepartmentID=1;
-- avrage and count, doesn't count the null values


---       group by     ---
select  Count=COUNT(monthlysalary), 
		Totoal=sum(monthlysalary), 
		avrage=avg(monthlysalary), 
		Min=min(monthlysalary), 
		Max=max(monthlysalary),
		dept = (select Name from Departments where ID = Employees.DepartmentID)
from Employees
group by DepartmentID
order by DepartmentID;



---      having    ---
select  department = (select Name from Departments where ID = Employees.DepartmentID),
		Number=COUNT(monthlysalary), 
		Totoal=sum(monthlysalary), 
		avrage=avg(monthlysalary), 
		Min=min(monthlysalary), 
		Max=max(monthlysalary)

from Employees
group by DepartmentID
having COUNT(monthlysalary) > 100
order by DepartmentID;


-- Same solution without having :-)
select * from 
(

   select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
	
       Group By DepartmentID
	  
) R1

where R1.TotalCount> 100;


---       like       ---
select * from Employees;

--Finds any values that start with "a"
select ID, FirstName from Employees
where FirstName like 'a%';

--Finds any values that end with "a"
select ID, FirstName from Employees
where FirstName like '%a';

--Finds any values that have "tell" in any position
select ID, FirstName from Employees
where FirstName like '%tell%';

--	Finds any values that start with "a" and ends with "a"
select ID, FirstName from Employees
where FirstName like 'a%a';

--Finds any values that have "a" in the second position
select ID, FirstName from Employees
where FirstName like '_a%';

--Finds any values that have "a" in the third position
select ID, FirstName from Employees
where FirstName like '__a%';

--Finds any values that start with "a" and are at least 3 characters in length
select ID, FirstName from Employees
where FirstName like 'a__%';

--Finds any values that start with "a" and are at least 4 characters in length
select ID, FirstName from Employees
where FirstName like 'a___%';

--Finds any values that start with "a"
select ID, FirstName from Employees
where FirstName like 'a%' or FirstName like 'b%' ;


---    wild card     ---
--Execute these satatements to update data
Update Employees 
set FirstName ='Dawood' , LastName='Al-kharazi'
where ID= 285;

Update Employees 
set FirstName ='Dawood' , LastName='Ahmed'
where ID= 286;
--------------------------------
select ID, FirstName, LastName from Employees
Where firstName = 'Mohammed' or FirstName ='Mohammad'; 

-- will search form Mohammed or Mohammad
select ID, FirstName, LastName from Employees
Where firstName like 'Mohamm[ae]d';
-------------------------------------
--You can use Not 
select ID, FirstName, LastName from Employees
Where firstName Not like 'Mohamm[ae]d';
--------------------
select ID, FirstName, LastName from Employees
Where firstName like 'a%' or firstName like 'b%' or firstName like 'c%';
-- search for all employees that their first name start with a or b or c
select ID, FirstName, LastName from Employees
Where firstName like '[abc]%';
---------------------------------
-- search for all employees that their first name start with any letter from a to l
select ID, FirstName, LastName from Employees
Where firstName like '[a-l]%';
---------------------------------

