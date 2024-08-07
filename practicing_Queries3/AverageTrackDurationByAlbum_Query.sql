create procedure AverageTrackDurationByAlbum
as 
begin
	select a.Title as Album, 
		avg(t.Milliseconds) / 100 
			as AvgDurationSeconds
	from Chinook.dbo.Album a
	inner join Chinook.dbo.Track t
		on a.AlbumId = t.AlbumId
	group by a.Title
	order by AvgDurationSeconds desc;
end;