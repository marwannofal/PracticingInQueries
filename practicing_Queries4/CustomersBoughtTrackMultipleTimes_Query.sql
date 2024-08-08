create procedure CustomersBoughtTrackMultipleTimes
as 
begin 
	select c.FirstName, c.LastName,
		   t.Name as Track, 
		   count(il.InvoiceLineId) 
				as PurchaseCount
	from Chinook.dbo.Customer c
	inner join Chinook.dbo.Invoice i
		on c.CustomerId = i.CustomerId
	inner join Chinook.dbo.InvoiceLine il
		on i.InvoiceId = il.InvoiceId
	inner join Chinook.dbo.Track t
		on il.TrackId = t.TrackId
	group by c.FirstName, c.LastName, t.Name 
	having count(il.InvoiceLineId)  > 1
	order by PurchaseCount desc, 
			c.FirstName, c.LastName;
end;