-- Recuperar los datos de los proveedores cuyo nombre de compañía termine en Ltd. y mostrar e ID de proveedor y nombre de compañía.
SELECT SupplierID AS "ID de Proveedor", CompanyName AS "Nombres de compañía"
FROM suppliers
WHERE CompanyName LIKE '%Ltd.';

-- Mostrar toda la información de los proveedores cuyo nombre de contacto comienza por la cadena chXr donde la X representa un único carácter cualquiera.
SELECT *
FROM suppliers
WHERE ContactName LIKE "ch_r%";

-- Mostrar los productos con descuento junto con el ID de pedido y el empleado que atendió el pedido.
SELECT orddet.ProductID, orddet.Discount, orddet.OrderID, ord.EmployeeID
FROM orderdetails AS orddet
JOIN orders AS ord
ON (ord.OrderID = orddet.OrderID)
WHERE orddet.Discount > 0;

-- Contar los clientes de cada país que disponen de FAX.
SELECT Country, count(*) AS "Nº clientes con FAX"
FROM customers
WHERE Fax IS NOT NULL AND FAX !=""
GROUP BY Country;

-- Contar los pedidos enviados por la compañía de envíos número 3.
SELECT count(*)
FROM orders
WHERE ShipVia = 3;

-- Calcula el nivel de reordenamiento medio de los productos que empiezan por C.
SELECT AVG(ReorderLevel) AS "Nivel de Reordenamiento Medio"
FROM products
WHERE ProductName LIKE "C%";

-- Contar el número de categorías que cuentan con imagen.
SELECT count(*)
FROM categories
WHERE Picture IS NOT NULL;

-- Mostrar los proveedores de Londres.
SELECT SupplierID
FROM suppliers
WHERE City = "London";

-- Obtener el total de unidades en stock de los productos con ID par.
SELECT sum(UnitsInStock)
FROM products
WHERE ProductID%2 = 0;

-- Por cada empleado mostrar la descripción de su territorio junto con el ID de territorio y empleado.
SELECT ter.TerritoryDescription, ter.TerritoryID, empter.EmployeeID
FROM territories AS ter
JOIN employeeterritories AS empter
ON (empter.TerritoryID = ter.TerritoryID)
ORDER BY EmployeeID;