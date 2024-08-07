create procedure MonthlySalesReport
as
begin
	select 
		format(i.InvoiceDate, 'yyyy-MM') 
			AS YearMonth,
		sum(i.Total) as TotalSales
	from Chinook.dbo.Invoice i
	group by format(i.InvoiceDate, 'yyyy-MM') 
	order by YearMonth desc;
end;