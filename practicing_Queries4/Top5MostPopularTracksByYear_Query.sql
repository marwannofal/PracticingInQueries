create procedure Top5MostPopularTracksByYear
as
begin
	with TrackSales as(
		select t.TrackId, t.Name as TrackName,
			   year(i.InvoiceDate) as Year,
			   count(il.InvoiceLineId) as SalesCount
		from Chinook.dbo.InvoiceLine il
		inner join Chinook.dbo.Track t
			on il.TrackId = t.TrackId
		inner join Chinook.dbo.Invoice i
			on il.InvoiceId = i.InvoiceId
		group by t.TrackId, t.Name ,year(i.InvoiceDate)
	)
	select TrackName, Year, SalesCount
	from(
		select TrackName, Year, SalesCount,
		row_number() over (
			partition by Year order by 
						SalesCount desc
		) as RowNum
		from TrackSales
	) RankedTracks
	where RowNum <= 5
	Order by Year Desc, SalesCount desc;
end;