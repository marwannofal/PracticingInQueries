create procedure EmployeesWhoManagedCustomers
as
begin
	select e.FirstName, e.LastName,
		   count(c.CustomerId) 
				as CustomersManaged
	from Chinook.dbo.Employee e
	inner join Chinook.dbo.Customer c
		on e.EmployeeId = c.SupportRepId
	group by e.FirstName, e.LastName
	order by CustomersManaged desc;
end;