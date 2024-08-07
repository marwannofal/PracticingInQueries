create procedure AlbumsWithTracksCount
as
begin
	select a.Title as Album, 
		count(t.TrackId) as TrackCount
	from Chinook.dbo.Album a 
	inner join Chinook.dbo.Track t
		on a.AlbumId = t.AlbumId
	group by a.Title
	order by TrackCount desc
end;
