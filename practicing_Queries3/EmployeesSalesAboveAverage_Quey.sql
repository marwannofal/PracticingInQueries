create procedure EmployeesSalesAboveAverage
as
begin
	with EmployeeSales as (
		select e.EmployeeId, e.FirstName, e.LastName,
			sum(i.Total) as TotalSales
		from Chinook.dbo.Employee e
		inner join Chinook.dbo.Customer c 
			on e.EmployeeId = c.SupportRepId
		inner join Chinook.dbo.Invoice i 
			on c.CustomerId = i.CustomerId
		group by e.EmployeeId, e.FirstName, e.LastName
	)
	select 
		es.FirstName, es.LastName, es.TotalSales
	from EmployeeSales es
	where es.TotalSales > 
		(select avg(TotalSales) 
			from EmployeeSales)
	order by es.TotalSales desc;
end;