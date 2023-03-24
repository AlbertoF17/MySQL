-- 1. Contar la cantidad de pedidos que han sido realizados por un cliente de Mexico.
SELECT cus.CustomerID, count(ord.OrderID), cus.Country FROM orders AS ord JOIN customers AS cus ON (ord.CustomerID = cus.CustomerID) WHERE cus.Country = "Mexico" GROUP BY cus.CustomerID;

-- 2. Por cada pedido adjuntar, además de su información, el nombre de la  compañía que lo ha enviado (ShipVia).
SELECT ord.*, ship.CompanyName FROM orders AS ord JOIN shippers AS ship ON (ship.ShipperID = ord.ShipVia) ORDER BY OrderID;

-- 3. Imprimir toda la información de los clientes, con los nombres de las columnas traducidos al castellano y 
-- separando con espacios aquellos nombres compuestos de varias palabras.
SELECT CustomerID AS "ID del Cliente", CompanyName AS "Nombre de la compañía", ContactName AS "Nombre de Contacto", ContactTitle AS "Título del Contacto", Address AS "Dirección", City AS "Ciudad",
Region AS "Región", PostalCode AS "Código Postal", Country AS "País", Phone AS "Teléfono", Fax AS "Fax" FROM customers;

-- 4. Por cada producto, mostrar su nombre y la descripción de la categoría a la que pertenece.
SELECT prod.ProductName, cat.Description FROM products AS prod JOIN categories AS cat ON (cat.CategoryID = prod.CategoryID);

-- 5. Mostrar los paises y cantidad de empleados que tiene cada país.
SELECT Country AS "País", count(*) AS "Nº de Empleados" FROM employees GROUP BY Country;

-- 6. Contar los pedidos que han sido realizados por clientes de España.
SELECT * FROM orders WHERE ShipCountry = "Spain";

-- 7. Mostrar los pedidos realizados por clientes de Suecia y Argentina.
SELECT ord.* FROM orders AS ord JOIN customers AS cus ON (ord.CustomerID = cus.CustomerID) WHERE cus.Country IN ("Sweden", "Argentina");

-- 8. Por cada pedido, mostrar el descuento medio.
SELECT OrderID, AVG(Discount) FROM orderdetails GROUP BY OrderID;

-- 9. Por cada pedido, contar los productos que incluye, solo para aquellos  pedidos que cuentan con más de
-- tres productos y han sido atendidos por un empleado estadounidense.
SELECT orddet.OrderID, count(orddet.OrderID) FROM orderdetails AS orddet JOIN orders AS ord ON (orddet.OrderID = ord.OrderID) JOIN employees AS emp ON (emp.EmployeeID = ord.EmployeeID) WHERE emp.Country = "USA" GROUP BY OrderID;

-- 10. Mostrar los nombres y apellidos de todos los empleados utilizando una única columna, ordenándolos por edad, de mayor a menor.
SELECT concat(FirstName, " ", LastName) AS "Nombre Completo", BirthDate, round(datediff(curdate(), BirthDate)/365) AS "Edad" FROM employees ORDER BY BirthDate ASC;