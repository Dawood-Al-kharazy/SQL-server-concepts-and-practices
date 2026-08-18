-- inner join
select Customers.Name, Customers.CustomerID, Orders.Amount
from Customers join Orders
on Customers.CustomerID = Orders.CustomerID;

-- left outter join
SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM Customers 
Left Outer JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- right outter join
SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM     Customers RIGHT OUTER JOIN
                  Orders ON Customers.CustomerID = Orders.CustomerID

/* full join*/
SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM     Customers FULL OUTER JOIN
                  Orders ON Customers.CustomerID = Orders.CustomerID