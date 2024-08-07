create procedure TopALLCustomersByPurchaseAmount
as
begin
	select c.FirstName, c.LastName, 
		sum(i.Total) as TotalSpent
	from Chinook.dbo.Customer c
	inner join Chinook.dbo.Invoice i
	on c.CustomerId = i.CustomerId
	group by c.FirstName, c.LastName
	order by TotalSpent desc
end;

