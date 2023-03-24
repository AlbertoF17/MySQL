-- 1. Seleccionar las órdenes de compra (Orders) realizadas por el empleado con código entre el 2 y 5 con fecha de pedido del 31 de julio
-- de cualquier año. Buscar información sobre la función EXTRACT.
SELECT * FROM orders WHERE (EmployeeID BETWEEN 2 AND 5) AND EXTRACT(DAY FROM OrderDate)=31 AND EXTRACT(MONTH FROM OrderDate)=7;

-- 2. Seleccionar las órdenes de compra realizadas por el empleado con código 3, de cualquier año, pero solo de los últimos 5 meses
-- (agosto-diciembre). Buscar información sobre la función MONTH.
SELECT * FROM orders WHERE (EmployeeID=3) AND (MONTH(OrderDate) BETWEEN 8 AND 12);

-- 3. Seleccionar los detalles de las órdenes de compras (tabla OrderDetails) que tengan cantidades entre 10 y 250.
SELECT * FROM orderdetails WHERE Quantity BETWEEN 10 AND 250;

-- 4. Seleccionar los detalles de las órdenes de compras cuyo coste (precio unitario x unidades) se encuentre entre 10 y 330. Mostrar el coste como TOTAL.
SELECT *, UnitPrice*Quantity AS "TOTAL" FROM orderdetails WHERE UnitPrice*Quantity BETWEEN 10 AND 330;

-- 5. Hacer un listado de todos los países a los que pertenecen los distintos clientes (buscar información sobre el operador DISCTINCT).
SELECT DISTINCT(Country) FROM customers;

-- 6. Mostrar los 15 productos más vendidos.
SELECT * FROM products ORDER BY UnitsOnOrder DESC LIMIT 15;

-- 7. Imprimir el nombre de todos los empleados, así como la longitud en caracteres del mismo (en dos columnas).
SELECT FirstName, char_length(FirstName) AS "Length" FROM employees;

-- 8. Imprimir en una única columna el nombre y apellidos de todos los empleados, concatenados.
SELECT CONCAT(FirstName, " ", LastName) FROM employees;

-- 9. Imprimir el nombre de los empleados en minúsculas y el apellido en mayúsculas.
SELECT CONCAT(lcase(FirstName), " ", ucase(LastName)) FROM employees;

-- 10. Imprimir el nombre de los empleados, excluyendo la primera y última letra.
SELECT SUBSTRING(FirstName,2,length(FirstName)-2) FROM employees;

-- 11. Imprimir el nombre, apellidos y fecha de nacimiento de todos los empleados. La fecha de nacimiento debe estar en el formato europeo (DD—MM--AAAA).
SELECT FirstName, LastName, date_format(BirthDate, "%d-%m-%Y") AS "BirthDate" FROM employees;

-- 12. Por cada empleado, imprimir junto a su nombre y apellidos, el número de años que han transcurrido desde su nacimiento hasta su contratación.
SELECT  FirstName, LastName, extract(YEAR FROM HireDate)-extract(YEAR FROM BirthDate) AS "Edad en fecha de contratacion" FROM employees;
SELECT Firstname, Lastname, timestampdiff(YEAR, BirthDate, Hiredate) FROM Employees;
SELECT FirstName, LastName, DATEDIFF(HireDate,BirthDate)/365 AS DATEDIFF FROM Employees;

-- 13. Por cada empleado, imprimir el número de años que han transcurrido desde su contratación hasta la fecha actual.
SELECT  FirstName, LastName, extract(YEAR FROM Now())-extract(YEAR FROM HireDate) AS "Años en la empresa" FROM employees;
SELECT Firstname, Lastname, timestampdiff(YEAR, Hiredate, Now()) AS "Años en la empresa" FROM Employees;

-- 14. Repetir el ejercicio anterior expresando el resultado en meses.
SELECT  FirstName, LastName, 12*(extract(YEAR FROM Now())-extract(YEAR FROM HireDate)) AS "Meses en la empresa" FROM employees;
SELECT Firstname, Lastname, 12*(timestampdiff(YEAR, Hiredate, Now())) AS "Años en la empresa" FROM Employees;
SELECT timestampdiff(MONTH, HireDate, Now()) FROM Employees;

-- 15. Repetir el ejercicio anterior expresando el resultado en días.
SELECT  FirstName, LastName, 365*(extract(YEAR FROM Now())-extract(YEAR FROM HireDate)) AS "Días en la empresa" FROM employees;
SELECT Firstname, Lastname, 365*(timestampdiff(YEAR, Hiredate, Now())) AS "Días en la empresa" FROM Employees;
SELECT timestampdiff(DAY, HireDate, Now()) FROM Employees;

-- 16. Imprimir el nombre del día de la semana en el que nació cada empleado, junto con su nombre y apellidos.
SELECT FirstName, LastName, dayname(BirthDate) AS "Día de nacimiento" FROM employees;

-- 17. Imprimir el nombre del mes en el que fue contratado cada empleado, junto con su nombre y apellidos.
SELECT FirstName, LastName, monthname(HireDate) AS "Mes de contratación" FROM employees;

-- 18. Por cada pedido, imprimir el id de pedido, nombre del producto y beneficio (precio unitario x unidades del pedido).
SELECT Orderdetails.OrderID, Products.ProductName, orderdetails.UnitPrice*Orderdetails.Quantity AS "Beneficio" from Orderdetails JOIN Products ON Products.ProductID; -- SELECT OrderID, ProductID, UnitPrice*Quantity AS "Beneficio" from orderdetails;

-- 19. Repetir el ejercicio anterior añadiendo una nueva columna con el nuevo beneficio resultante de incrementar un 20% el precio unitario del producto.
-- Imprimir esa nueva columna como ‘NUEVO BENEFICIO’.
SELECT Orderdetails.OrderID, Products.ProductName, orderdetails.UnitPrice*Orderdetails.Quantity AS "Beneficio" FROM Orderdetails JOIN Products ON Products.ProductID;

-- 20. Por cada empleado, imprimir nombre, apellidos, fecha de contratación y antigüedad en días (días que lleva contratado).
SELECT FirstName, LastName, HireDate, 365*(extract(YEAR FROM Now())-extract(YEAR FROM HireDate)) AS "Antigüedad en días" FROM employees;
SELECT Firstname, Lastname, HireDate, timestampdiff(DAY, HireDate, curdate()) FROM Employees;

-- 21. Repetir el ejercicio anterior añadiendo una nueva columna con la edad a la que fue contratado.
SELECT FirstName, LastName, HireDate, 365*(extract(YEAR FROM Now())-extract(YEAR FROM HireDate)) AS "Antigüedad en días", extract(YEAR FROM HireDate)-extract(YEAR FROM BirthDate) AS "Edad a la que fue contratado" FROM employees;
SELECT Firstname, Lastname, HireDate, timestampdiff(DAY, HireDate, curdate()) AS "Antigüedad en días", timestampdiff(YEAR, Birthdate, HireDate) AS "Edad a la que fue contratado" FROM Employees;

-- 22. Seleccionar los 7 productos con precio más caro, que cuenten con stock en almacén. Buscar información sobre la función LIMIT.
SELECT * FROM products WHERE UnitsInStock>0 ORDER BY UnitPrice DESC LIMIT 7;

-- 23. Seleccionar los 9 productos con menos stock en almacén, que pertenezcan a la categoría 3, 5 u 8.
SELECT * FROM products WHERE CategoryID IN (3, 5, 8) ORDER BY UnitsInStock ASC LIMIT 9;