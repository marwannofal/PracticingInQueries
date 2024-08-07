create procedure MostPopularArtists
as 
begin
	select ar.Name as Artist,
		   count(il.InvoiceLineId) 
				as TrackSold
	from Chinook.dbo.Artist ar
	inner join Chinook.dbo.Album al
		on ar.ArtistId = al.ArtistId
	inner join Chinook.dbo.Track t 
		on al.AlbumId = t.AlbumId
	inner join Chinook.dbo.InvoiceLine il
		on t.TrackId = il.TrackId
	group by ar.Name
	order by TrackSold desc;
end;