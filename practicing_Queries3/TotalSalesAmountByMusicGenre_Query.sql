create procedure TotalSalesAmountByMusicGenre
as 
begin
	select g.Name as genre, 
		Sum(il.UnitPrice * il.Quantity) as TotalSales
	from Chinook.dbo.InvoiceLine il 
	inner join Chinook.dbo.Track t on il.TrackId = t.TrackId
	inner join Chinook.dbo.Genre g on t.GenreId = g.GenreId
	group by g.Name
	order by TotalSales desc;
end;