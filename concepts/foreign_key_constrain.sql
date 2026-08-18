create table Customers(
ID int identity(1,1),
Name nvarchar(100),
Age int,
primary key(id)
);

create table Orders(
order_id int identity(1, 1),
Name nvarchar(100),
Amount int,
price int,
-- customerId int references customers (id)
primary key (order_id)
);

--alter table orders
--add primary key (order_id);

drop table Customers;


select * from Orders;


-- if you created the tables and then you want to add the constraints, you do this
alter table orders
add foreign key (customerId) references customers (id);
