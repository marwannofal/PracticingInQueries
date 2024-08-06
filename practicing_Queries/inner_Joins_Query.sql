select 
	master.dbo.Categories.CategoryName,
	master.dbo.Products.ProductName
from master.dbo.Categories
inner join master.dbo.Products
on master.dbo.Categories.CategoryID = master.dbo.Products.CategoryID
