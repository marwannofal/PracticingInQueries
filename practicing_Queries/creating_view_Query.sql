create view employee as 
	select master.dbo.Employees.FirstName, 
		master.dbo.Employees.EmployeeEmailAdrress
			from master.dbo.Employees
				