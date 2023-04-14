-- 1.	Por cada proveedor contar sus productos, mostrando sólo aquellos proveedores con un número de productos
-- superior a la cantidad de proveedores cuyo nombre de compañía empieza por la letra G.
SELECT SupplierID, count(*) AS "Nº Productos" 
FROM products 
GROUP BY SupplierID 
HAVING count(*)>(SELECT count(*) FROM suppliers WHERE CompanyName LIKE "G%");

-- 2. Nombres de categorías cuyo precio unitario medio sea inferior al precio unitario medio general (el de toda la tabla).
SELECT prod.CategoryName
FROM products AS prod
JOIN categories AS cat
ON prod.CategoryID = cat.CategoryID
GROUP BY CategoryName
HAVING AVG(UnitPrice) < (
	SELECT AVG(UnitPrice)
    	FROM products);

-- 3. Países de envío con menos pedidos que Argentina.
SELECT ShipCountry
FROM orders
GROUP BY ShipCountry
HAVING count(*) < (
	SELECT count(*)
	FROM orders
	WHERE ShipCountry="Argentina")