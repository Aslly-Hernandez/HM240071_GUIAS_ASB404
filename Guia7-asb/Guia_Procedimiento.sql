#Ejemplo clasee
SELECT st.username, c.city, co.country
FROM staff ST
INNER JOIN STORE S ON ST.staff_id = S.manager_staff_id
INNER JOIN ADDRESS A ON S.address_id = A.address_id
INNER JOIN city C ON A.city_id = C.city_id
INNER JOIN country CO ON C.country_id = CO.country_id;

#USO DEL INNER JOIN
SELECT
f.film_id,
f.title,
c.category_id,
c.name AS category_name
FROM sakila.film f
INNER JOIN sakila.film_category fc ON f.film_id = fc.film_id
INNER JOIN sakila.category c ON fc.category_id = c.category_id
ORDER BY f.film_id;

#USO DEL RIGHT JOIN
SELECT 
f.film_id,
f.title,
c.category_id,
c.name AS category_name
FROM sakila.film f
RIGHT JOIN sakila.film_category fc ON f.film_id = fc.film_id
RIGHT JOIN sakila.category c ON fc.category_id = c.category_id
ORDER BY c.category_id;

#USO DEL LEFT JOIN
SELECT 
f.film_id,
f.title,
c.category_id,
c.name AS category_name
FROM sakila.film f
LEFT JOIN sakila.film_category fc ON f.film_id = fc.film_id
LEFT JOIN sakila.category c ON fc.category_id = c.category_id;


#USO DE SUBCONSULTAS
SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers
WHERE CustomerID IN (SELECT CustumerID FROM Orders
                     WHERE OrderDate>='1998-01-01');


SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers
WHERE CustomerID NOT IN (SELECT CustumerID FROM Orders
                     WHERE OrderDate>='1998-01-01');


SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers
WHERE CustomerID = (SELECT CustumerID FROM Orders
                     WHERE OrderID>='10248');


SELECT CustomerID, CompanyName, ContactName, Country
FROM Customers C
WHERE EXISTS (SELECT * FROM Orders O
                     WHERE C.CustomerID=O.CustomerID
                     AND OrderDate>='1998-01-01');

SELECT O.OrderID, OrderDate, (SELECT MAX(UnitPrice)
FROM [Order Details] OD
WHERE OD.OrderID=O.OrderID) AS MaxPrecioUnitario
FROM Orders AS O











