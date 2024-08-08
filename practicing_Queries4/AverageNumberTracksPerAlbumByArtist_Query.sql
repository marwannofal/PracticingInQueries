create procedure AverageNumberTracksPerAlbumByArtist
as 
begin
	select ar.Name as Artist,
		   avg(TrackCount) as AvgTracksPerAlbum
	from (
		select al.ArtistId, count(t.TrackId) 
						as TrackCount
		from Chinook.dbo.Album al
		inner join Chinook.dbo.Track t
			on al.AlbumId = t.AlbumId
		group by al.ArtistId, al.AlbumId
	) AlbumTracks
	inner join Chinook.dbo.Artist ar 
		on AlbumTracks.ArtistId = ar.ArtistId
	group by ar.Name 
	order by AvgTracksPerAlbum desc;
end;