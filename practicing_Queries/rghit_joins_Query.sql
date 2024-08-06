select 
	master.dbo.Customers.ContactName,
	master.dbo.Orders.OrderDate
from master.dbo.Customers
right join master.dbo.Orders
on master.dbo.Customers.CustomerID = master.dbo.Orders.CustomerID;