create procedure CustomersWithNoCompany
as
begin
	select c.FirstName, c.LastName, 
		   c.Country ,c.Company
	from Chinook.dbo.Customer c
	where c.Company is null
	order by c.LastName, c.Country;
end;