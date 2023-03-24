-- 1.Obtener todas las ordenes hechas por el empleado Robert King
SELECT * FROM orders AS ord JOIN employees AS emp ON (ord.EmployeeID = emp.EmployeeID) WHERE emp.FirstName = "Robert" AND emp.LastName = "King";

-- 2.Obtener todas las ordenes hechas por el empleado Robert King, Nancy Davolio y Andrew Fuller
SELECT * FROM orders AS ord JOIN employees AS emp ON (ord.EmployeeID = emp.EmployeeID) WHERE (emp.FirstName = "Robert" AND emp.LastName = "King") OR (emp.FirstName = "Nancy" AND emp.LastName = "Davolio") OR (emp.FirstName = "Andrew" AND emp.LastName = "Fuller");

-- 3.Obtener todas las ordenes por el cliente cuya compania es "Que del?cia"
SELECT * FROM orders AS ord JOIN customers AS cus ON (ord.CustomerID = cus.CustomerID) WHERE cus.CompanyName = "Que del?cia";

-- 4.Obtener todos los productos(codigo, nombre, precio, stock) de la orden 10257
SELECT orddet.OrderID, prod.ProductID, prod.ProductName, prod.UnitPrice, prod.UnitsInStock FROM products AS prod JOIN orderdetails AS orddet ON (prod.ProductID = orddet.ProductID) WHERE OrderID = 10257;

-- 5.Obtener todos los productos(codigo, nombre, precio, stock) de las ordenes hechas desde 1997 hasta la fecha de hoy
SELECT distinct(prod.ProductID), prod.ProductName, prod.UnitPrice, prod.UnitsInStock, YEAR(ord.OrderDate) AS "Año pedido" FROM products AS prod JOIN orderdetails AS orddet ON (prod.ProductID = orddet.ProductID) JOIN orders AS ord ON (ord.OrderID = orddet.OrderID) WHERE YEAR(OrderDate)>=1997;

-- 6.Mostar el ID del pedido, fecha del pedido y el total de productos de cada pedido
SELECT ord.OrderID, ord.OrderDate, sum(orddet.Quantity) FROM orders AS ord JOIN orderdetails AS orddet ON (ord.OrderID = orddet.OrderID) GROUP BY OrderID;

-- 7.Obtener el nombre de todas las categorias y los nombres de sus productos, precio y stock
SELECT cat.CategoryName, prod.ProductName, prod.UnitPrice, prod.UnitsInStock FROM categories AS cat JOIN products AS prod ON (cat.CategoryID=prod.CategoryID);

-- 8.Obtener el número de productos, por cada categoría. Mostrando el nombre de la categoría, el nombre del producto, y el total de productos por categoría,
-- solamente de las categorías 3, 5 y 8. Ordenar por el nombre de la categoría
SELECT cat.CategoryName, prod.ProductName, count(prod.ProductName) AS "Número de productos" from categories AS cat JOIN products AS prod ON (cat.CategoryID = prod.CategoryID) WHERE cat.CategoryID IN (3, 5, 8) GROUP BY cat.CategoryName ORDER BY cat.CategoryName;

-- 9.Visualizar el nombre de la categoria y el numero de productos que hay por cada categoria
SELECT CategoryName, count(ProductID) FROM categories AS cat JOIN products AS prod ON (cat.CategoryID = prod.CategoryID) GROUP BY CategoryName;

-- 10. Por cada pedido, obtener el ID de pedido, ID de proveedor y el nombre de la compañía.
SELECT orddet.OrderID, prod.ProductID, sup.SupplierID, sup.CompanyName FROM orderdetails AS orddet JOIN products AS prod ON (orddet.ProductID = prod.ProductID) JOIN suppliers AS sup ON (sup.SupplierID = prod.SupplierID) order by OrderID;

-- 11. Por cada pedido, obtener el ID de pedido, ID de empleado y el nombre de empleado.
SELECT ord.OrderID, emp.EmployeeID, emp.FirstName, emp.LastName FROM employees AS emp JOIN orders as ord ON (ord.EmployeeID=emp.EmployeeID);

-- 12. Por cada producto, obtener el ID de producto, ID de categoría y el nombre de categoría.
SELECT prod.ProductID, cat.CategoryID, cat.CategoryName FROM products AS prod JOIN categories AS cat ON (prod.CategoryID = cat.CategoryID) order by ProductID;

-- 13. Por cada empleado, imprimir el ID de empleado, nombre, apellido e ID de territorio.
SELECT emp.EmployeeID, emp.FirstName, emp.LastName, empter.TerritoryID FROM employees AS emp JOIN employeeterritories AS empter ON (emp.EmployeeID = empter.EmployeeID) GROUP BY emp.FirstName;

-- 14. Por cada cliente, mostrar el ID de cliente, nombre de contacto y pedidos.
SELECT cus.CustomerID, cus.ContactName, ord.OrderID FROM customers AS cus JOIN orders AS ord ON (ord.CustomerID = cus.CustomerID);

-- 15. Por cada cliente, mostrar el ID de cliente, nombre de contacto y numero total pedidos.
SELECT cus.CustomerID, cus.ContactName, count(ord.OrderID) FROM customers AS cus JOIN orders AS ord ON (ord.CustomerID = cus.CustomerID) GROUP BY CustomerID;

-- 16. Por cada pedido presente en orderdetails, imprimir toda su información y además, el nombre de la categoría a la que pertenece.
SELECT orddet.*, cat.CategoryName FROM orderdetails AS orddet JOIN products AS prod ON (prod.ProductID = orddet.ProductID) JOIN categories AS cat ON (prod.CategoryID = cat.CategoryID);

-- 17. Por cada pedido, mostrar el ID de pedido, dirección del cliente y dirección del empleado.
SELECT ord.OrderID, cus.Address, emp.Address FROM orders AS ord JOIN customers AS cus ON (cus.CustomerID = ord.CustomerID) JOIN employees AS emp ON (emp.EmployeeID = ord.EmployeeID) ORDER BY OrderID;

-- 18. Por cada producto, mostrar el ID de producto, nombre de producto y dirección del proveedor.
SELECT prod.ProductID, prod.ProductName, sup.Address FROM products AS prod JOIN suppliers AS sup ON (sup.SupplierID = prod.SupplierID);

-- 19.Visualizar el nombre de la compañía y el id del cliente, fecha, precio unitario y producto de la orden.
SELECT cus.CompanyName, cus.CustomerID, ord.OrderDate, prod.UnitPrice, prod.ProductName FROM customers AS cus JOIN orders AS ord ON (cus.CustomerID = ord.CustomerID) JOIN orderdetails AS orddet ON (ord.OrderID = orddet.OrderID) JOIN products AS prod ON (prod.ProductID = orddet.ProductID);

-- 20.Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece
SELECT prod.ProductName, prod.UnitPrice, prod.UnitsInStock, cat.CategoryName FROM products AS prod JOIN categories AS cat ON (prod.CategoryID = cat.CategoryID);

-- 21.Mostrar el nombre del producto, el precio producto, el código del proveedor y el nombre de la compañía proveedora
SELECT prod.ProductName, prod.UnitPrice, sup.SupplierID, sup.CompanyName FROM products AS prod JOIN suppliers AS sup ON (sup.SupplierID = prod.SupplierID);

-- 22.Mostrar el id de la orden, fecha, código del producto, precio, código del empleado y su nombre completo
SELECT ord.OrderID, ord.OrderDate, orddet.ProductID, prod.UnitPrice, emp.EmployeeID, emp.FirstName, emp.LastName FROM orderdetails AS orddet JOIN products AS prod ON (orddet.ProductID = prod.ProductID) JOIN orders AS ord ON (orddet.OrderID = ord.OrderID) JOIN employees AS emp ON (ord.EmployeeID = emp.EmployeeID);

-- 23.Calcular el stock de productos por cada categoria. Mostrar el nombre de la categoria y el stock por categoria
SELECT cat.CategoryName, SUM(prod.UnitsInStock) FROM products AS prod JOIN categories AS cat ON (cat.CategoryID = prod.CategoryID) GROUP BY cat.CategoryName;

-- 24.Obtener el nombre del cliente, nombre del proveedor, nombre del empleado y el nombre de los productos que estan en la orden 10794
SELECT cus.ContactName, sup.CompanyName, emp.FirstName, emp.LastName, prod.ProductName FROM products AS prod JOIN suppliers AS sup ON (sup.SupplierID = prod.SupplierID) JOIN orderdetails AS orddet ON (prod.ProductID = orddet.ProductID) JOIN orders AS ord ON (ord.OrderID = orddet.OrderID) JOIN employees AS emp ON (emp.EmployeeID = ord.EmployeeID) JOIN customers AS cus ON (cus.CustomerID = ord.CustomerID) WHERE ord.OrderID = 10794;

-- 25.Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra, código del producto, cantidad pedida
-- del producto, nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor, usar Join
SELECT cus.CompanyName, ord.OrderID, ord.OrderDate, prod.ProductID, orddet.Quantity, prod.ProductName, sup.CompanyName FROM orders AS ord JOIN orderdetails AS orddet
ON (ord.OrderID = orddet.OrderID) JOIN products AS prod ON (prod.ProductID = orddet.ProductID) JOIN customers AS cus ON (cus.CustomerID = ord.CustomerID) JOIN suppliers AS sup
ON (sup.SupplierID = prod.SupplierID) ORDER BY OrderID;

-- 26.Seleccionar cuantos proveedores tengo en cada país, considerando solo a los nombres de los proveedores que comienzan con la letra E hasta la letra P,
-- además de mostrar solo los países donde tenga más de 2 proveedores
SELECT supplierID, CompanyName, Country, count(*) FROM suppliers GROUP BY Country HAVING (count(*)>2) AND (CompanyName BETWEEN "D%" AND "Q%");
SELECT supplierID, ContactName, Country, count(*) FROM suppliers GROUP BY Country HAVING (count(*)>2) AND (ContactName BETWEEN "D%" AND "Q%"); 

-- 27.Crear una consulta que muestre el nombre de empleado y el número de empleados que cada uno de los empleados tiene a su cargo
SELECT emp1.EmployeeID, CONCAT(emp1.FirstName, " ", emp1.LastName) AS "Jefe", count(emp2.ReportsTo) AS "Empleados a su cargo" FROM employees AS emp1 JOIN employees AS emp2 ON (emp1.EmployeeID = emp2.ReportsTo) GROUP BY emp1.FirstName;

-- 28.Crear una consulta que muestre el nombre de empleado, el número de pedidos tramitado por cada empleado, de aquellos empleados que han tramitado mas de 15 pedidos
SELECT emp.FirstName, count(ord.EmployeeID) AS "Numero de pedidos tramitados" FROM employees AS emp JOIN orders AS ord ON (emp.EmployeeID = ord.EmployeeID) GROUP BY FirstName HAVING count(OrderID)>15;

-- 29.Crear una consulta que muestre el nombre del cliente, el número de pedidos que nos ha realizado el cliente, el dinero que nos ha dejado en la empresa, de
-- todos los clientes que sean de USA y que nos han realizado mas de 5 pedidos
SELECT cus.ContactName, count(ord.CustomerID) AS "Nº de pedidos realizados", sum(orddet.UnitPrice*orddet.Quantity) AS "Dinero Generado", cus.Country FROM orders AS ord JOIN orderdetails AS orddet ON (ord.OrderID = orddet.OrderID) JOIN customers AS cus ON (ord.CustomerID = cus.CustomerID) GROUP BY cus.ContactName HAVING cus.Country = "USA" AND count(ord.CustomerID)>5 ;

-- 30.Crear una consulta que muestre el nombre del jefe y el número de empleados a su cargo de aquel jefe que mas empleados tenga a su cargo
SELECT emp1.FirstName, emp1.LastName, count(emp2.ReportsTo) AS "Empleados a su cargo" FROM employees AS emp1 JOIN employees AS emp2 ON (emp1.EmployeeID = emp2.ReportsTo) GROUP BY emp1.FirstName ORDER BY count(emp2.ReportsTo) DESC LIMIT 1;

-- 31.Obtener el nombre del cliente y el número de pedidos del cliente que mas pedidos ha realizado en la empresa
SELECT cus.ContactName AS "Nombre del Jefe", count(ord.OrderID) AS "Numero de pedidos realizados" from Orders AS ord JOIN customers AS cus ON (ord.CustomerID = cus.CustomerID) GROUP BY cus.CustomerID order by count(ord.OrderID) DESC LIMIT 1;

-- 32.Obtener el nombre del cliente y el volumen de negocio del cliente que mas volumen de negocio nos ha dejado en la empresa.
SELECT cus.ContactName, (orddet.UnitPrice*orddet.Quantity) AS "Volumen de Negocio" FROM customers AS cus JOIN orders AS ord ON (cus.CustomerID = ord.CustomerID) JOIN orderdetails AS orddet ON (ord.OrderID = orddet.OrderID) GROUP BY cus.ContactName ORDER BY (orddet.UnitPrice*orddet.Quantity) DESC LIMIT 1;

-- MUY LARGOS, NO HACER
-- 33.Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, la fecha de la orden decompra, el código del producto,
-- cantidad pedida del producto, nombredel producto y el nombre de la compañía proveedora, usar JOIN. Solamente las compañías proveedoras que comienzan con laletra de la A
-- hasta la letra G,además la cantidad pedida del productodebe estar entre 23 y 187
-- 34.Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra, código del producto, cantidad pedida del producto,
-- nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor
-- 35.Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, la fecha de la orden de compra, código del producto,
-- cantidad pedida del producto, nombre del producto y el nombre de la compañía proveedora, usar Join. Solamente las compañías proveedoras que comienzan con la letra de la A
-- hasta la letra G, además la cantidad pedida del producto debe estar entre 18 y 190