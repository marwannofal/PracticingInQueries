create procedure LongestTracksByGenre
as 
begin
	with GenreMaxDuration as (
		select g.Name as Genre,
			   t.Name as TrackName,
			   t.Milliseconds / 1000 as DurationSeconds,
			   row_number() over (partition by g.GenreId 
			   order by t.Milliseconds desc) as RowNum
		from Chinook.dbo.Track t
		inner join Chinook.dbo.Genre g
			on t.GenreId = g.GenreId
	)
	select Genre, TrackName, DurationSeconds
	from GenreMaxDuration
	where RowNum = 1
	order by Genre;
end;