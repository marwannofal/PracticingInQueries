create procedure AveragePurchaseAmountPerCountry
as
begin
	select c.Country, avg(i.Total) 
					as AvgPurchaseAmount
	from Chinook.dbo.Customer c
	inner join Chinook.dbo.Invoice i
		on c.CustomerId = i.CustomerId
	group by c.Country
	order by AvgPurchaseAmount;
end;