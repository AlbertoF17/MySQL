-- 1. Realizar una consulta donde obtengamos el ID de los pedidos asociados a la empleada Nancy Davolio.
SELECT ord.OrderID, emp.LastName, emp.FirstName FROM orders AS ord JOIN employees AS emp ON ord.EmployeeID = emp.EmployeeID WHERE emp.FirstName="Nancy" and emp.LastName="Davolio";
SELECT ord.OrderID, emp.LastName, emp.FirstName FROM orders AS ord JOIN employees AS emp ON (ord.EmployeeID = emp.EmployeeID) WHERE ord.EmployeeID = 1;

-- 2. Recuperar todos los campos de la tabla Orders, imprimiendo además la compañía de cliente.
SELECT ord.*, cus.CompanyName FROM orders AS ord JOIN customers AS cus ON (ord.CustomerID = cus.CustomerID);

-- 2. Por cada producto, mostrar el nombre de producto y el nombre de la compañia que lo provee.
SELECT prod.ProductName, sup.CompanyName FROM products AS prod JOIN suppliers AS sup ON (prod.SupplierID = sup.SupplierID);
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT OrderID, LastName, FirstName FROM orders, employees WHERE orders.EmployeeID = employees.EmployeeID; -- JOIN escrito de otra forma