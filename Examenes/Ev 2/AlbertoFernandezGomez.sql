USE northwind;
-- 1. Cree una tabla de nombre CATEGORIES2 que tenga exactamente la misma estructura y tipos de datos que la tabla CATEGORIES.
CREATE TABLE categories2 (
    CategoryID BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(255) NOT NULL,
    Description LONGTEXT NOT NULL,
    Picture LONGBLOB
)  ENGINE=INNODB;

-- 2. Rellene la nueva tabla con todos los datos que existan en la tabla original, utilizando para ello una única sentencia SQL (no puede utilizar la palabra reservada VALUES).
INSERT INTO categories2 SELECT * FROM CATEGORIES;

-- 3. Imprima sin repetir los nombres de aquellas ciudades que tengan MENOS clientes que la cantidad de clientes de Buenos Aires menos los de Barcelona.
SELECT *
FROM customers
GROUP BY City
HAVING COUNT(*) < SUM((
SELECT COUNT(*)
FROM customers
WHERE City = 'Buenos Aires') - (
SELECT COUNT(*)
FROM customers
WHERE City = 'Barcelona'));

-- 4. Imprima los productos cuyo precio unitario y unidades en stock sean inferiores al precio unitario medio y unidades en stock medio.
SELECT *
FROM products
WHERE UnitPrice < (
SELECT AVG(UnitPrice)
FROM products)
AND UnitsInStock < (
SELECT AVG(UnitsInStock)
FROM products);

-- 5. Imprima el nombre y apellidos de aquellos empleados que tienen un número de pedidos inferior a la suma de pedidos del empleado número 1 y el empleado número 4.
SELECT FirstName, LastName
FROM employees
WHERE EmployeeID IN (
SELECT employeeID
FROM orders
GROUP BY EmployeeID
HAVING count(*)<
SUM((
SELECT count(EmployeeID)
FROM orders
WHERE EmployeeID = 1) + (
SELECT count(EmployeeID)
FROM orders
WHERE EmployeeID = 4)));

-- 6. Elimine de la tabla CATEGORIES2 aquellas categorías cuya descripción contenga las palabras ‘meats’, ‘candies’ o ‘fish’.
DELETE FROM categories2 
WHERE Description LIKE '%meats%'
OR Description LIKE '%candies%'
OR Description LIKE '%fish%';