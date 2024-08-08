create procedure TracksPurchasedCustomersCountry
as
begin
	select distinct t.Name as TrackName, 
					ar.Name as Artist,
					al.Title as Album
	from Chinook.dbo.Invoice i
	inner join Chinook.dbo.InvoiceLine il
		on i.InvoiceId = il.InvoiceId
	inner join Chinook.dbo.Track t
		on il.TrackId = t.TrackId
	inner join Chinook.dbo.Album al 
		on t.AlbumId = al.AlbumId
	inner join Chinook.dbo.Artist ar 
		on al.ArtistId = ar.ArtistId
	inner join Chinook.dbo.Customer c
		on i.CustomerId = c.CustomerId
	where c.Country = 'USA'
	order by TrackName, Artist;
end;