Select MIN(master.dbo.Products.UnitsInStock)	
	AS 'Minimum Quatity in stock',
		Max(master.dbo.Products.UnitsInStock)
			As 'Maximum Quatity in stock' 
				From master.dbo.Products ;