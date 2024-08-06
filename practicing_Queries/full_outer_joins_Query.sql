select 
	master.dbo.Orders.ShipAddress,
	master.dbo.Orders.OrderDate,
	master.dbo.[Order Details].Quantity
from master.dbo.Orders
full outer join master.dbo.[Order Details]
on master.dbo.Orders.OrderID = master.dbo.[Order Details].OrderID