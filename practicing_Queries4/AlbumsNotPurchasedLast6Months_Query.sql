create procedure AlbumsNotPurchasedLast6Months
as 
begin
	select al.Title as Album,
		   ar.Name as Artist
	from Chinook.dbo.Album al
	inner join Chinook.dbo.Artist ar
		on al.ArtistId = ar.ArtistId
	where not exists(
		select 1
		from Chinook.dbo.InvoiceLine il
		inner join Chinook.dbo.Track t
			on il.TrackId = t.TrackId
		inner join Chinook.dbo.Invoice i
			on il.InvoiceId = i.InvoiceId
		where t.AlbumId = al.AlbumId
		and i.InvoiceDate >= DATEADD(month , -6,getdate())
	)
	order by ar.Name, al.Title;
end;