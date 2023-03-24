SELECT * FROM employees WHERE EmployeeID = 4 OR EmployeeID = 6;
SELECT * FROM employees WHERE EmployeeID IN (4,6);
SELECT * FROM employees WHERE EmployeeID IN ("USA","Spain");
SELECT * FROM employees WHERE Country = "USA" OR Country = "Spain";
SELECT * FROM employees WHERE Country = "UK" AND City = "London";
SELECT * FROM employees WHERE Country = "UK" AND City = "London" AND FirstName = "Michael";
SELECT * FROM employees WHERE (City = "London" AND Title = "Sales Representative") OR (FirstName LIKE "M%");
SELECT * FROM employees WHERE NOT (Country = "USA");
#------------------------
SELECT LastName, FirstName FROM employees;
SELECT concat_ws(" ", FirstName, LastName, ":", EmployeeID) AS "Personas" FROM employees;
SELECT ProductName AS "Producto", UnitPrice AS "Precio por unidad", UnitPrice*0.7 AS "Precio con Descuento" FROM products;
SELECT ASCII("A");
SELECT char_length("Hola Mundo");#Puede ser una cadena vacía 
SELECT lcase(concat(FirstName, " ", LastName)) AS "Nombre y Apellidos", char_length(FirstName) AS "Nº Letras del Nombre" FROM employees;#LOWER tambien funciona
SELECT LEFT("Hola Mundo", 4) FROM employees;#Right funciona igual
SELECT *, LEFT(BirthDate, 4) FROM employees;
SELECT position("mundo" IN "Hola Mundo");
SELECT REVERSE("odnuM aloH");
SELECT REVERSE(REVERSE(FirstName)) FROM employees;
SELECT now();#curdate o curtime // current_timestamp devuelve lo mismo
SELECT current_timestamp();
SELECT year(BirthDate) FROM employees;#tambien existe month, day, hour, minute, week etc
SELECT version();
#------------------------------------------------------------------------
SELECT CategoryID, AVG(UnitsInStock) FROM products GROUP BY CategoryID HAVING AVG(UnitsInStock)>30;
SELECT * FROM products;
#------------------------------------------------------------------------
SELECT * FROM employees WHERE LastName BETWEEN "E%" AND "P%" OR LastName LIKE "E%" OR LastName LIKE "P%";
SELECT * FROM employees WHERE lower(substring(LastName, 1, 1)) BETWEEN "E%" AND "P%";
SELECT Country, count(*) FROM suppliers WHERE lower(substring(ContactName, 1, 1)) BETWEEN "E" AND "P" GROUP BY Country HAVING count(*)>2; 
SELECT count(*) FROM suppliers;

SELECT Country, ContactName FROM suppliers WHERE Country="Germany";

#----------- CLASE REPASO -----------
SELECT prod.ProductID AS "ID de producto", prod.ProductName AS "Nombre de producto", prod.SupplierID AS "ID de proveedor"
FROM products AS prod;

SELECT EmployeeID, CategoryID
FROM employees, categories;

SELECT prod.*
FROM products AS prod
WHERE prod.CategoryID IN (1,3,5);

SELECT prod.ProductName
FROM products AS prod
WHERE prod.ProductName
LIKE "C%"
ORDER BY ProductName DESC;

SELECT emp.FirstName, emp.LastName, year(emp.BirthDate) 
FROM employees AS emp
WHERE year(emp.BirthDate) < 1955;

SELECT emp.EmployeeID, ord.OrderID
FROM employees AS emp
JOIN orders AS ord
ON (ord.EmployeeID = emp.EmployeeID);

-- Obtener todos los pedidos de Nancy Davolio realizados durante el 1997.
SELECT * 
FROM orders AS ord
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID)
WHERE emp.FirstName="Nancy"
AND emp.LastName="Davolio"
AND YEAR(ord.OrderDate) = 1997;

-- Obtener el numero de productos por cada categoria.
SELECT cat.CategoryName, count(*)
FROM products AS prod
JOIN categories AS cat
ON (cat.CategoryID = prod.CategoryID)
GROUP BY cat.CategoryID;

-- Por cada compañia de envios, contar los pedidos.
SELECT ship.CompanyName, count(*)
FROM orders AS ord
JOIN shippers AS ship
ON (ord.ShipVia = ship.ShipperID)
GROUP BY ship.CompanyID;

-- Por cada pedido, mostrar las categorias de los productos que incluye.
SELECT orddet.OrderID, cat.Categoryname
FROM orderdetails AS orddet
JOIN products AS prod
ON (prod.ProductID = orddet.ProductID)
JOIN categories AS cat
ON (cat.CategoryID = prod.CategoryID)
ORDER BY OrderID;

-- 5. Mostrar los nombres de empleados que tienen mas de tres pedidos atendidos en el 1996.
SELECT  CONCAT_WS(' ', emp.FirstName, emp.LastName) AS "Nombre del empleado", count(*) AS "Nº pedidos en 1996"
FROM employees AS emp
JOIN orders AS ord
ON (emp.EmployeeID = ord.EmployeeID)
WHERE YEAR(ord.OrderDate) = 1996
GROUP BY emp.EmployeeID
HAVING count(*)>3;

-- Mostrar el nombre de empleado que tiene mas pedidos atendidos.
SELECT emp.FirstName, count(*) AS "Nº pedidos"
FROM employees AS emp
JOIN orders AS ord
ON (emp.EmployeeID  = ord.EmployeeID)
GROUP BY emp.EmployeeID
ORDER BY count(*) DESC
LIMIT 1;

-- Halle el total de unidades en stock para aquellos productos cuya descripción de categoría es “Carnes preparadas”.
SELECT cat.CategoryName, sum(prod.UnitsInStock) AS "Unidades Totales"
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID)
WHERE cat.Description = "prepared meats";

SELECT emp.*
FROM employees AS emp
WHERE emp.Region = "";

SELECT emp.*
FROM employees AS emp
WHERE emp.Region NOT LIKE '_%';

-- 1. Escribir una consulta para imprimir el ID de empleado y edad de aquellos empleados que tienen una edad inferior a la edad media.
SELECT emp.EmployeeID, year(now())-year(emp.BirthDate)
FROM employees AS emp
WHERE year(now())-year(emp.BirthDate) <
(SELECT AVG(year(now())-year(BirthDate))
FROM employees);

-- 2. Escribir una consulta para recuperar todos los datos de los empleados que tienen una edad superior a la edad de Margaret Peacock.
SELECT emp.EmployeeID, year(now())-year(emp.BirthDate)
FROM employees AS emp
WHERE year(now())-year(emp.BirthDate) >
(SELECT year(now())-year(BirthDate)
FROM employees WHERE FirstName = "Margaret"
AND LastName = "Peacock");

-- 3. Hacer una subconsulta para obtener los empleados que tienen como jefe a Andrew Fuller.
SELECT emp2.EmployeeID
FROM employees emp1
JOIN employees emp
ON (emp1.EmployeeID = emp2.ReportsTo)
WHERE emp1.FirstName='Andrew'
AND emp1.LastName='Fuller';

-- 4. Repetir para los que no tienen como jefe a Andrew Fuller.
SELECT emp2.EmployeeID
FROM employees emp1
JOIN employees emp
ON (emp1.EmployeeID = emp2.ReportsTo)
WHERE emp1.FirstName!='Andrew'
AND emp1.LastName!='Fuller';

-- 5. Empleados que son más jóvenes que Margaret, Laura y Michael.
SELECT emp1.FirstName, emp1.LastName
FROM employees AS emp1
WHERE (emp1.BirthDate)>
(SELECT MAX(emp2.BirthDate)
FROM employees AS emp2
WHERE emp2.FirstName IN ("Margaret","Laura","Michael"));

-- 6. Productos cuya categoría empieza por C o D.
SELECT prod.ProductID, prod.ProductName
FROM products AS prod
WHERE prod.CategoryID IN (SELECT cat.CategoryID
FROM categories AS cat WHERE cat.CategoryName LIKE "C%" OR cat.CategoryName LIKE "D%");

-- 7. 