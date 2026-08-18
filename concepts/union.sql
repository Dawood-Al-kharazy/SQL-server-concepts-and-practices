--- union

-- delete dublicate data
select * from Employees
where id = 300
union
select * from Employees
where id = 301

-- doesn't delete dublicate data
select * from Departments
union all
select * from Departments