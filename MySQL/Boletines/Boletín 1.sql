-- 1. Selecciona todas las filas de la tabla de empleados.
SELECT * FROM employees;

-- 2. Repite lo anterior, pero mostrando sólo el nombre y primer apellido de cada empleado.
SELECT FirstName, LastName FROM employees;

-- 3. Repite lo anterior, pero mostrando la cabecera de las columnas en español.
SELECT FirstName "Nombre", LastName "Apellido" FROM employees;

-- 4. Selecciona todas las filas de la tabla de pedidos y anota cuantas hay en total. A continuación, selecciona de nuevo todas las filas pero mostrando únicamente el ID de pedido,
-- contando de nuevo cuantas hay. ¿Coincide con la anotación anterior? ¿Por qué?
SELECT * FROM orders; -- Hay 830 filas
SELECT OrderID FROM orders; -- Hay 830 filas, coincide porque cada pedido recibe una ID para ser identificado

-- 5. Muestra el nombre de las distintas compañías proveedoras, renombrando la cabecera de la columna como Nombre de compañía (respeta los espacios).
SELECT CompanyName "Nombre de compañía" FROM suppliers;

-- 6. Muestra el ID de producto y nombre de producto de todos los productos.
SELECT ProductID, ProductName FROM products;

-- 7. Visualiza todo el contenido de la tabla de productos. A continuación haz lo mismo con la tabla de pedidos, y de nuevo, haz lo mismo con la tabla de detalle de pedidos.
-- ¿El contenido de las tres tablas guarda alguna similitud o relación? ¿Crees que tienen algo que ver?
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;
-- Las tablas están relacionadas entre si 