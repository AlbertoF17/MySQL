-- 0. Ciudades que tienen menos clientes (customers) que la ciudad de Buenos Aires.
SELECT City, count(*) AS "Cantidad de Clientes"
FROM customers GROUP BY city
HAVING count(*)<
	(SELECT count(*)
	FROM customers
	WHERE City="Buenos Aires")
ORDER BY count(*) DESC;

-- 1. Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades en stock de los productos de la categoría 4.
SELECT *
FROM products
WHERE UnitsInStock >
	(SELECT MAX(UnitsInStock)
	FROM products
	WHERE CategoryID=4)
ORDER BY UnitsInStock ASC;

-- 2. Nombre de los empleados que son jefes.
SELECT FirstName
FROM employees
WHERE ReportsTo IS NULL; -- (WTF se supone q necesita subselect)

-- 3. Productos cuya categoría empiezan por la letra C.
SELECT prod.ProductName, cat.CategoryName
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID = cat.CategoryID)
WHERE cat.CategoryID IN
	(SELECT CategoryID FROM categories
	WHERE CategoryName LIKE "C%");

-- 4. Pedidos cuyo valor de carga (Freight) está por encima de la media.
SELECT *
FROM orders
WHERE Freight >
	(SELECT AVG(Freight)
	FROM orders)
ORDER BY Freight ASC;

-- 5. Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades en stock de los productos de la categoría 4.
SELECT ProductID, ProductName, UnitsInStock
FROM products
WHERE UnitsInStock >
	(SELECT MAX(UnitsInStock)
	FROM products
	WHERE CategoryID = 4)
ORDER BY UnitsInStock ASC;

-- 6. Escribir una consulta para recuperar el nombre de la compañía e ID de proveedor de aquellos proveedores que viven en un país que
-- tiene mas proveedores que Alemania. 
 SELECT CompanyName, SupplierID, count(*)
 FROM Suppliers
 WHERE Country IN 
	(SELECT Country
	FROM Suppliers
	GROUP BY Country
	HAVING Count(*) >
	(SELECT Count(*)
	FROM Suppliers
	WHERE Country='Germany'))
GROUP BY CompanyName;

-- 7. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados que tienen una edad superior a la edad media.
SELECT FirstName, LastName, year(curdate())- year(BirthDate) AS "Edad" , BirthDate
FROM employees
HAVING year(curdate())- year(BirthDate) >
	(SELECT AVG(year(curdate())- year(BirthDate))
	FROM employees);

-- 8. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados que tienen una edad superior a la edad media
-- de aquellos empleados con el título de 'Sales Representative'.
SELECT FirstName, LastName, year(curdate())- year(BirthDate) AS "Edad" , BirthDate
FROM employees
HAVING year(curdate())- year(BirthDate) >
	(SELECT AVG(year(curdate())- year(BirthDate))
	FROM employees
	WHERE Title = "Sales Representative");

-- 9. Escribir una consulta para recuperar todos los datos de los empleados que tienen una edad superior a la edad de Margaret Peacock.
SELECT *
FROM employees
WHERE year(curdate())- year(BirthDate) >
	(SELECT year(curdate())- year(BirthDate)
	FROM employees
	WHERE FirstName="Margaret"
	AND LastName="Peacock");

-- 10. Escribir una consulta para recuperar el ID de pedido, ID de cliente y nombre de compañía. Trabaje sin hacer joins entre orders y customers.
SELECT OrderID, CustomerID,
	(SELECT cus.CompanyName
	FROM customers AS cus
	WHERE cus.CustomerID = ord.CustomerID) AS "CompanyName"
FROM orders AS ord;

-- 11. Nombre de compañías de clientes que no han hecho pedidos en el 1996. No usar JOIN.
SELECT CompanyName
FROM customers
WHERE CustomerID IN
	(SELECT CustomerID
	FROM orders
	WHERE YEAR(OrderDate)!=1996)
GROUP BY CompanyName;

-- 12. Nombre de productos suministrados por proveedores de Japón. No usar JOIN.
SELECT ProductName
FROM products
WHERE SupplierID IN
	(SELECT SupplierID
	FROM suppliers
	WHERE Country="Japan");

-- 13. Hacer una subconsulta para obtener los empleados que tienen como jefe a Andrew Fuller.
SELECT FirstName
FROM employees
WHERE ReportsTo =
	(SELECT EmployeeID
	FROM employees
	WHERE FirstName = "Andrew"
	AND LastName="Fuller");

-- 14. Repetir para mostrar los que no tienen como jefe a Andrew.
SELECT FirstName
FROM employees
WHERE ReportsTo !=
	(SELECT EmployeeID
	FROM employees
	WHERE FirstName = "Andrew"
	AND LastName="Fuller");

-- 15. Recuperar los ID de productos con un precio unitario superior al precio unitario medio.
SELECT ProductID, UnitPrice
FROM products
WHERE UnitPrice>
	(SELECT AVG(UnitPrice)
	FROM products)
ORDER BY UnitPrice ASC;

-- 16. Subconsulta para obtener los nombres de categorias con un número de productos superior al número de  productos que pertenecen a la categoría 'condiments'.
SELECT CategoryName, (
	SELECT count(*) 
    FROM products AS pro 
    WHERE pro.CategoryID = cat.CategoryID 
    GROUP BY CategoryID) AS "Productos de cada categoria"
FROM categories AS cat
WHERE (SELECT count(*) FROM products AS pro WHERE pro.CategoryID = cat.CategoryID GROUP BY CategoryID) > 
	(SELECT count(*) 
    FROM products 
    WHERE CategoryID IN 
		(SELECT CategoryID 
        FROM categories 
        WHERE CategoryName ="condiments"));

-- 17. Subconsulta para obtener los ID de aquellos empleados que tienen un número de pedidos superior a la media de pedidos por empleado.
SELECT EmployeeID
FROM orders
GROUP BY EmployeeID
HAVING count(*)>
	(SELECT AVG(Pedidos)
	FROM
	(SELECT count(*) AS Pedidos
	FROM employees
	JOIN orders
	ON employees.EmployeeID=orders.EmployeeID
	GROUP BY orders.EmployeeID) TablaConteo);

-- 18. Productos cuyo valor de unidades en stock sea superior al valor máximo de unidades en stock de los productos de la categoría 1 y 3.
SELECT ProductName
FROM products
WHERE UnitsInStock >
	(SELECT MAX(UnitsInStock)
	FROM products
	WHERE CategoryID IN (1,3));

-- 19. Escribir una consulta para recuperar todos los datos de los empleados que tienen una edad inferior a la edad de Anne Dodsworth o Janet Leverling.
SELECT *
FROM employees
WHERE (year(curdate())-year(BirthDate)) <
	(SELECT (year(curdate())-year(BirthDate))
	FROM employees
	WHERE ((FirstName = "Anne" AND LastName = "Dodosworth")
	OR (FirstName = "Janet" AND LastName = "Leverling")));
-- WHERE FirstName IN ("Anne", "Janet") AND LastName IN ("Dodosworth", "Leverling")); -- CON OR DA ERROR AL DAR 2 VALORES

-- 20. Escribir una consulta para recuperar los paises que tienen mas proveedores que la suma de proveedores que tienen Brasil y España.
SELECT Country
FROM suppliers
HAVING count(*)>
	(SELECT sum(count(*))
	FROM suppliers
	WHERE Country
	IN ("Brazil","Spain"));

-- 21. Escribir una consulta para recuperar el nombre de la compañía e ID de proveedor de aquellos proveedores que viven en un país que tiene mas
-- proveedores que la suma de proveedores que tienen Brasil y España.
SELECT CompanyName, SupplierID, Country
FROM suppliers
GROUP BY SupplierID
HAVING Country =
	(SELECT Country
	FROM suppliers
	HAVING count(*)>
	(SELECT sum(count(*))
	FROM suppliers
	WHERE Country
	IN ("Brazil","Spain")));

-- 22. Ciudades que tienen más clientes que Madrid.
SELECT City, count(*) "Nº Clientes"
FROM customers
GROUP BY City
HAVING count(*) >
	(SELECT count(*)
	FROM customers
	WHERE City="Madrid");

-- 23. Ciudades que tienen más clientes que Madrid y Sevilla o Seville.
SELECT City, count(*) "Nº Clientes"
FROM customers
GROUP BY City
HAVING count(*) >
(SELECT count(*)
FROM customers
WHERE City="Madrid")
AND count(*) >
	(SELECT count(*)
	FROM customers
	WHERE City="Sevilla")
OR count(*) >
	(SELECT count(*)
	FROM customers
	WHERE City="Seville");

-- 24. Ciudades que tienen más clientes que Madrid o Sevilla o Seville.
SELECT City, count(*) "Nº Clientes"
FROM customers
GROUP BY City
HAVING count(*) >
(SELECT count(*)
FROM customers
WHERE City="Madrid")
OR count(*) >
(SELECT count(*)
FROM customers
WHERE City="Sevilla")
OR count(*) >
(SELECT count(*)
FROM customers
WHERE City="Seville");

-- 25. Ciudades que tienen más clientes que la suma de clientes de Madrid, Sevilla o Seville y Lisboa.
SELECT City, count(*) "Nº Clientes"
FROM customers
GROUP BY City
HAVING count(*) >
	(SELECT count(*)
	FROM customers
	WHERE City="Madrid" OR City = "Sevilla" OR City = "Seville");

-- 26. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados que tienen una edad igual o superior a la edad media.
SELECT FirstName, LastName, (year(now())-year(BirthDate)) AS "Edad"
FROM employees
WHERE (year(now())-year(BirthDate)) >=
	(SELECT AVG((year(now())-year(BirthDate)))
	FROM employees);

-- 27. Escribir una consulta para imprimir el nombre, apellidos y edad de aquellos empleados que tienen una edad igual o superior a la edad media de los
-- empleados con el cargo Sales Representative.
SELECT FirstName, LastName, (year(now())-year(BirthDate)) AS "Edad"
FROM employees
WHERE (year(now())-year(BirthDate)) >=
	(SELECT AVG((year(now())-year(BirthDate)))
	FROM employees
    WHERE Title="Sales Representative");

-- 28. Productos cuyo valor de unidades en stock sea superior al valor mínimo de unidades en stock de los productos de la categoría 4 o superior al valor
-- mínimo de unidades en stock de los productos de la categoría 6.
SELECT ProductName, UnitsInStock
FROM products
WHERE UnitsInStock >
	(SELECT min(UnitsInStock)
    FROM products
    WHERE CategoryID = 4)
OR UnitsInStock > 
	(SELECT min(UnitsInStock)
    FROM products
    WHERE CategoryID = 6);

-- 29. Productos cuya categoría empieza por la letra C o D.
SELECT ProductName,
	(SELECT CategoryName
    FROM categories AS cat
    WHERE cat.CategoryID = prod.CategoryID) AS "Nombre de las categorías"
FROM products AS prod
WHERE CategoryID IN
	(SELECT CategoryID
    FROM categories
    WHERE CategoryName LIKE "C%"
    OR CategoryName LIKE "D%");

-- 30. Ciudades que tienen menos clientes (customers) que la ciudad de Buenos Aires y Munich.
SELECT City, count(*) AS "Nº Clientes"
FROM customers
GROUP BY City
HAVING count(*) <
	(SELECT count(*)
    FROM customers
    WHERE City = "Buenos Aires"
    OR City = "M?nchen");

-- 31. Empleados que son más jóvenes que Margaret, Laura y Michael.
SELECT FirstName, LastName, (year(now())-year(BirthDate)) AS "Edad"
FROM employees
WHERE (year(now())-year(BirthDate)) <
	(SELECT min((year(now())-year(BirthDate)))
    FROM employees
    WHERE FirstName = "Margaret"
    OR FirstName = "Laura"
    OR FirstName = "Michael");