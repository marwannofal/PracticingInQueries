create procedure TracksNotSold
as
begin
	select t.Name as TrackName, 
			al.Title as ALbum,
			ar.Name as Artist
	from Track t 
	inner join Chinook.dbo.Album al
		on t.AlbumId = al.AlbumId
	inner join Chinook.dbo.Artist ar
		on al.ArtistId = ar.ArtistId
	where t.TrackId not in (select distinct TrackId
		  from Chinook.dbo.InvoiceLine);
end;

