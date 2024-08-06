select master.dbo.Products.UnitsInStock,
	count(*) as 'Product Count Per Stock Level' from master.dbo.Products 
		group by master.dbo.Products.UnitsInStock 
			having master.dbo.Products.UnitsInStock > 5;