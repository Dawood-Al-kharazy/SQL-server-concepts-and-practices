select x='yes'
where exists(
select * from orders
where OrderID = 3 and Amount < 600
);



select x=2