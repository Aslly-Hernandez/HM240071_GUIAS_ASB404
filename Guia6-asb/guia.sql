SELECT * FROM Categories;

SELECT CategoryName, CategoryID FROM Categories;

SELECT orders,products, unitprice
FROM order_details
WHERE orders=10251;

SELECT company FROM customers
WHERE company='Alfreds Futteriste';

SELECT orders,products, unitprice
FROM order_details
WHERE orders=10251 AND products=57;

SELECT orders,products, unitprice
FROM order_details
WHERE orders=10251 OR products=57;

SELECT orders,products, unitprice
FROM order_details
WHERE orders>=11000 AND orders<=11003;

SELECT orders, products, unitprice
FROM order_details
WHERE orders BETWEEN 11000 AND 11003;

SELECT company FROM customers
WHERE company LIKE 'A%';

SELECT company FROM customers
WHERE company LIKE 'MA%';

SELECT RegionDescription FROM Region
WHERE RegionDescription LIKE '%TERN%';

SELECT orders FROM order_details
WHERE orders LIKE '_0285';

SELECT company FROM customers
WHERE company LIKE '[a-c]%';

SELECT * FROM Territories
WHERE TerritoryDescription LIKE 'Santa_C%';

SELECT * FROM Territories
WHERE TerritoryDescription LIKE 'Santa!_C%' ESCAPE '!';

SELECT * FROM order_details
WHERE orders IN (10248, 10255, 10270);

SELECT * FROM order_details
WHERE orders IN (10248 OR orders=10255 OR orders=10270;

SELECT CategoryName, CategoryID FROM Categories
ORDER BY CategoryName ASC;
                 
SELECT CategoryName, CategoryID FROM Categories
ORDER BY CategoryName;
                 
SELECT CategoryName, CategoryID FROM Categories
ORDER BY CategoryName DESC;                 
                 
SELECT suppliers, categoryID FROM products;
                 
SELECT CategoryID AS [Codigo de la Categoria],
categoryName AS [Nombre de la Categoria]
FROM Categories;
                 
SELECT products productsName, Unitprice, unitprice*1.10 AS Aumento
FROM products;
                 
SELECT TOP 3 orders, (Unitprice*quantity) AS [venta total]
FROM order_details
ORDER BY [Venta Total] DESC;
                 
     


