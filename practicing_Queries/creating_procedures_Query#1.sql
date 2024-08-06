create procedure productByCategory 
as 
begin
	select 
		master.dbo.Products.ProductName,
		master.dbo.Categories.CategoryName
	from master.dbo.Products
	full outer join master.dbo.Categories
	on master.dbo.Products.CategoryID = 
		master.dbo.Categories.CategoryID
end;
	