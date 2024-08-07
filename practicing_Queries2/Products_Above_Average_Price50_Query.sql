SELECT p.ProductID,
       p.UnitPrice
FROM master.dbo.Products p
INNER JOIN (
    SELECT ProductID,
           AVG(UnitPrice) AS AvgUnitPrice
    FROM master.dbo.Products
    GROUP BY ProductID
) avgProducts ON p.ProductID = avgProducts.ProductID
WHERE avgProducts.AvgUnitPrice > 50;
