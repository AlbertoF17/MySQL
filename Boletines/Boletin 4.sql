-- De la tabla pedidos (Orders), imprimir por cada empleado el número de pedidos. Debe mostrarse el ID de empleado como ID DEL EMPLEADO y el número de pedidos como NUM_PEDIDOS.
SELECT EmployeeID AS "ID DEL EMPLEADO", count(OrderID) AS "NUM_PEDIDOS" FROM orders GROUP BY EmployeeID;

-- De la tabla OrderDetails, por cada pedido, imprimir el ID de pedido y el total de unidades.
SELECT OrderID, SUM(Quantity) FROM orderdetails GROUP BY OrderID;

-- Repetir el ejercicio anterior imprimiendo solo aquellos pedidos con un numero total de unidades inferior a 50.
SELECT OrderID, SUM(Quantity) FROM orderdetails GROUP BY OrderID HAVING SUM(Quantity)<50;

-- En la tabla empleados, por cada país imprimir el número de empleados que ostentan el cargo de “Sales Representative”. Imprimir el nombre del país y el número.
SELECT Country, count(Title) FROM employees GROUP BY Country, Title HAVING (Title LIKE "Sales Representative");
SELECT Country, count(Title) FROM employees WHERE (Title="Sales Representative") GROUP BY Country;

-- En la tabla empleados, por cada país imprimir el número de empleados que NO ostentan el cargo de “Sales Representative”. Imprimir el nombre del país y el número.
SELECT Country, count(Title) FROM employees GROUP BY Country, Title HAVING (Title NOT LIKE "Sales Representative");
SELECT Country, count(Title) FROM employees WHERE (Title!="Sales Representative") GROUP BY Country;
