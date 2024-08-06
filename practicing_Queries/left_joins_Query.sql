select 
	master.dbo.Products.ProductName,
	master.dbo.Suppliers.CompanyName
From master.dbo.Products 
left join master.dbo.Suppliers
on master.dbo.Products.SupplierID = master.dbo.Suppliers.SupplierID;