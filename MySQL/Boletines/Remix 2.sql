-- 1. Por cada compañía de envíos, mostrar su nombre y contar el número de pedidos que ha enviado.
SELECT ship.CompanyName, count(ord.OrderID) FROM shippers AS ship JOIN Orders AS ord ON (ord.ShipVia = ship.ShipperID) GROUP BY CompanyName;

-- 2. Mostrar el nombre de los países a los que pertenecen los distintos clientes y empleados, de forma que no se repitan.
SELECT distinct(cus.Country) FROM employees AS emp JOIN customers AS cus;

-- 3. Contar los distintos ID de territorios.
SELECT count(distinct(TerritoryID)) FROM territories;

-- 4. Contar el número de categorías cuyo nombre empieza por C y termina por S, dando un alias a la columna.
SELECT count(CategoryName) AS "Nº de Categorías que empiezan por 'C' y terminan por 'S'" FROM categories WHERE CategoryName LIKE "C%S";

-- 5. Mostrar los distintos territorios, adjuntando también la descripción de región (RegionDescription).
SELECT terr.*, reg.RegionDescription FROM territories AS terr JOIN region AS reg ON (reg.RegionID = terr.RegionID);

-- 6. Contar el número de filas de la tabla customerdemographics.
SELECT count(*) FROM customerdemographics;

-- 7. Mostrar los nombres de ciudades de los proveedores en orden alfabetico inverso, pero solo para aquellas cuyo nombre
-- de ciudad comienza de la A a la C incluidas ambas letras.
SELECT City FROM suppliers WHERE substring(City,1,1) BETWEEN "A" AND "C" ORDER BY City DESC;

-- 8. Por cada nombre de compañía de envíos contar el número de distintos productos enviados. Es decir, que si una compañía
-- de envíos envía una bata, tres bicis y siete jerseys de cuello de pico estampados a un cliente zamorano y luego la misma compañía
-- de envíos envía una bata a un cliente jienense, esa  compañía de envíos (que Dios la guarde en su alma) habría enviado tres productos distintos.
SELECT ship.CompanyName, count(orddet.productID) FROM orderdetails AS orddet JOIN orders AS ord ON (orddet.OrderID = ord.OrderID) JOIN shippers AS ship ON (ord.ShipVia = ship.ShipperID) GROUP BY ship.CompanyName;
