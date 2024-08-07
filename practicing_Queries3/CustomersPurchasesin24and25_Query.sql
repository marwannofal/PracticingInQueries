create procedure CustomersPurchasesin24and25
as 
begin
	select 
		c.FirstName, 
		c.LastName,
		max(i.InvoiceDate) AS LastPurchaseDate
	from Chinook.dbo.Customer c
	left join Chinook.dbo.Invoice i 
		on c.CustomerId = i.CustomerId
	group by c.FirstName, c.LastName
	having max(i.InvoiceDate) 
			< dateadd(year, 1, getdate())
		or max(i.InvoiceDate) is null
	order by LastPurchaseDate;
end;