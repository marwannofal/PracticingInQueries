create procedure GenrePopularityOverTime
as
begin
	select g.Name,
		   year(i.InvoiceDate) AS Year,
		   count(il.InvoiceLineId) as TracksSold
	from Chinook.dbo.InvoiceLine il
	inner join Chinook.dbo.Track t
		on il.TrackId = t.TrackId
	inner join Chinook.dbo.Invoice i
		on il.InvoiceId = i.InvoiceId
	inner join Chinook.dbo.Genre g
		on t.GenreId = g.GenreId
	group by g.Name, year(i.InvoiceDate)
	order by Year desc, TracksSold desc;
end;