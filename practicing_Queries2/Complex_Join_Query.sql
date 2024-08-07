select master.dbo.Products.ProductName,
	   master.dbo.Suppliers.CompanyName,
	   master.dbo.Categories.CategoryName
from master.dbo.Products
inner join master.dbo.Suppliers
on master.dbo.Suppliers.SupplierID = master.dbo.Products.SupplierID
inner join master.dbo.Categories
on master.dbo.Categories.CategoryID = master.dbo.Products.CategoryID
		