-- 1. Por cada pedido, mostrar el número de líneas (tabla OrderDetails).
SELECT OrderID, count(*) AS "Número de líneas" FROM orderdetails GROUP BY OrderID;

-- 2. Por cada producto, mostrar el número de líneas (tabla OrderDetails).
SELECT ProductID, count(*) AS "Número de líneas" FROM orderdetails GROUP BY ProductID;

-- 3. Por cada cliente, mostrar el número de pedidos.
SELECT CustomerID, count(*) AS "Número de pedidos" FROM orders GROUP BY CustomerID;

-- 4. Repetir el anterior sólo con los clientes de Londres.
SELECT CustomerID, ShipCity, count(*) AS "Número de pedidos" FROM orders GROUP BY CustomerID HAVING ShipCity="London";

-- 5. Repetir el ejercicio 1 mostrando sólo aquellos que tienen más de 4 líneas.
SELECT OrderID, count(*) AS "Número de líneas" FROM orderdetails GROUP BY OrderID HAVING count(*)>4;

-- 6. Por cada cliente, mostrar el número de pedidos sólo para los clientes con más de 10 pedidos.
SELECT CustomerID, ShipCity, count(*) AS "Número de pedidos" FROM orders GROUP BY CustomerID HAVING count(*)>10;

-- 7. Mostrar el número de empleados en cada ciudad.
SELECT City, count(*) AS "Número de empleados" FROM employees GROUP BY City;

-- 8. Mostrar el número de empleados en cada ciudad que tenga al menos dos empleados.
SELECT City, count(*) AS "Número de empleados" FROM employees GROUP BY City HAVING count(*)>=2;

-- 9. Mostrar el número de empleados en cada ciudad que tengan el cargo de ‘Sales representative’, para aquellas ciudades con al menos dos empleados de este cargo. Ordenar por el número de empleados.
SELECT City, Title, count(*) AS "Número de empleados" FROM employees GROUP BY City, Title HAVING (Title="Sales representative" AND count(*)>=2);

-- 10. Muestra las distintas ciudades en las que hay empleados.
SELECT DISTINCT(City) FROM employees;
SELECT City FROM employees GROUP BY City;

-- 11. Cuenta las ciudades en las que hay empleados.
SELECT count(DISTINCT(City)) FROM employees;

-- 12. Por cada país y ciudad de envío, mostrar el total de pedidos.
SELECT ShipCountry, ShipCity, count(*) AS "Nº Pedidos" FROM orders GROUP BY ShipCountry, ShipCity;

-- 13. Por cada país y ciudad, contar los empleados que tienen el cargo de ‘Sales representative’.
SELECT Country, City, Title, count(*) AS "Número de empleados" FROM employees GROUP BY Country, City, Title HAVING Title="Sales representative";

-- 14. Por cada país y ciudad, contar el número de clientes.
SELECT Country, City, count(*) AS "Número de clientes" FROM customers GROUP BY City, Country;

-- 15. Repetir el anterior mostrando sólo aquellos que tienen más de un cliente.
SELECT Country, City, count(*) AS "Número de clientes" FROM customers GROUP BY City, Country HAVING count(*)>1;

-- 16. Por cada producto, hallar la cantidad de unidades vendidas y la media por pedido.
SELECT ProductID, count(ProductID) AS "Cantidad de unidades vendidas", AVG(Quantity*UnitPrice) "Media por pedido" FROM orderdetails GROUP BY ProductID;

-- 17. Por cada pedido, contar los distintos productos vendidos (no la cantidad).
SELECT OrderID, count(*) FROM orderdetails GROUP BY OrderID;

-- 18. Repetir el anterior mostrando solo los pedidos con un único producto.
SELECT OrderID, count(ProductID) FROM orderdetails GROUP BY OrderID HAVING count(ProductID)=1;

-- 19. En la tabla de proveedores (suppliers), contar el número de proveedores por cada título de contacto (ContactTitle).
SELECT ContactTitle, count(*) AS "Número de proveedores" FROM suppliers GROUP BY ContactTitle;

-- 20. Contar el número de productos que empiezan por la letra C.
SELECT count(*) AS "Nº productos" FROM products WHERE ProductName LIKE "C%";

-- 21. Contar el número de pedidos que fueron realizados en un mes de Julio (OrderDate).
SELECT count(*) AS "Nº pedidos en Julio" FROM orders WHERE OrderDate LIKE "%-07-%";
SELECT count(*) AS "Nº pedidos en Julio" FROM orders WHERE MONTH(OrderDate)=7;

-- 22. Contar el número de pedidos realizados por el cliente DUMON en el año 1997.
SELECT CustomerID, count(OrderDate) AS "Nº pedidos" FROM orders WHERE YEAR(OrderDate) = 1997 AND CustomerID="DUMON";

-- 23. Contar el número de pedidos (Orders) en los que los años de sus campos de tipo fecha no son exactamente iguales.
SELECT count(*) AS "Número de pedidos con años de los campos tipo fecha diferentes" FROM orders WHERE YEAR(OrderDate)!=YEAR(RequiredDate) AND YEAR(OrderDate)!=YEAR(ShippedDate) AND YEAR(RequiredDate)!=YEAR(ShippedDate);