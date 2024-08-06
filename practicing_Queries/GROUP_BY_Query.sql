select master.dbo.Products.UnitsInStock,
	Count(*) as 'Product Count Per Stock Level' from master.dbo.Products 
		GROUP BY master.dbo.Products.UnitsInStock;