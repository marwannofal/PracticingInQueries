create procedure CustomersWithInvoicesGreaterThanTheAverage
as
begin
	select c.FirstName, c.LastName,
		   i.InvoiceId, i.Total
	from Chinook.dbo.Customer c
	inner join Chinook.dbo.Invoice i
		on c.CustomerId = i.CustomerId
	where i.total > (select avg(Total) 
					from Chinook.dbo.Invoice )
	order by i.Total desc;
end;