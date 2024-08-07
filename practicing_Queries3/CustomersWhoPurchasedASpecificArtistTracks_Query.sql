create procedure CustomersWhoPurchasedASpecificArtistTracks
as
begin
	select distinct c.FirstName, c.LastName
	from Chinook.dbo.Customer c
	inner join Chinook.dbo.Invoice i 
		on c.CustomerId = i.CustomerId
	inner join Chinook.dbo.InvoiceLine il 
		on i.InvoiceId = il.InvoiceId
	inner join Chinook.dbo.Track t 
		on il.TrackId = t.TrackId
	inner join Chinook.dbo.Album al 
		on t.AlbumId = al.AlbumId
	inner join Chinook.dbo.Artist ar 
		on al.ArtistId = ar.ArtistId
	where ar.Name = 'Queen'
	order by c.LastName, c.FirstName;
end;