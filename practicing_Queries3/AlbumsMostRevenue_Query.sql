create procedure AlbumsMostRevenue
as 
begin
	select al.Title as Album,
		   ar.Name as Artist,
		   sum(il.UnitPrice * il.Quantity)
			as TotalRevenue
	from Chinook.dbo.InvoiceLine il 
	inner join Chinook.dbo.Track t 
		on il.TrackId = t.TrackId
	inner join Chinook.dbo.Album al 
		on t.AlbumId = al.AlbumId
	inner join Chinook.dbo.Artist ar 
		on al.ArtistId = ar.ArtistId
	group by al.Title ,ar.Name
	order by TotalRevenue desc;
end;