select master.dbo.Orders.OrderID,
	(select COUNT(*) 
	from master.dbo.[Order Details]
	where master.dbo.[Order Details].OrderID 
	= master.dbo.Orders.OrderID) as 'itemCount'
from master.dbo.Orders