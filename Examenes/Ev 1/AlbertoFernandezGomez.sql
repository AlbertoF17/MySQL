-- 1. Muestre el ID de categoría, nombre de categoría y descripción (en este mismo orden) para todas las categorías existentes.
-- La cabecera de las columnas del grid de resultado deben mostrarse exactamente como ID de categoría, Nombre de categoría y Descripcion,
-- respetando los espacios. Los nombres de las distintas categorías deben aparecer completamente en mayúsculas.
SELECT CategoryID AS "ID de categoría", upper(CategoryName) AS "Nombre de categoría", Description AS "Descripcion" FROM categories;

#COMENTARIO EJERCICIO 1
#Sobre el ejercicio, lo único que puedo añadir es que los alias son copia-pega del enunciado para que no haya margen de error y que la función upper convierte la cadena a mayúsculas,
#tal y como se observa en la query correspondiente al ejercicio.


-- 2. Por cada producto muestre el nombre de producto, longitud en caracteres del nombre de producto, precio unitario redondeado
-- al entero inferior más cercano, número de unidades en stock y ganancia. La ganancia de cada producto se calcula utilizando el número de
-- unidades del producto y el precio unitario redondeado de dicho producto.
SELECT ProductName, length(ProductName) AS "Longitud de caracteres", floor(UnitPrice) AS "Precio Unitario redondeado" , UnitsInStock, UnitsInStock*floor(UnitPrice) AS "Ganancia" FROM products;

#COMENTARIO EJERCICIO 2
#En este ejercicio se utiliza length para averiguar la longitud de la cadena (la del nombre del producto en este caso) y floor para redondear al entero inferior más cercano, luego la ganancia
#se halla a partir de la función floor también, por lo que usa los redondeos tal y como el enunciado indica, los alias son meramente decorativos, sólo son usados cuando el nombre de una columna
#posee una función o una operación. Los alias son meramente decorativos, sólo son usados cuando el nombre de una columna posee una función o una operación.


-- 3. Cuente la cantidad de productos que pertenecen a la categoría “Bebidas”.
SELECT cat.CategoryName, count(*) AS "Nº de Productos" FROM products AS prod JOIN categories AS cat ON (prod.CategoryID=cat.CategoryID) WHERE CategoryName = "Beverages";

#COMENTARIO EJERCICIO 3
#En este ejercicio es necesario realizar un join debido a que el dato del nombre de la categoría viene dado por su nombre, no por su ID. Además está agregada la columna del propio nombre
#de la categoría para que el grid de resultado sea más visual y se interprete mejor el resultao de la query.
#Los alias son meramente decorativos, sólo son usados cuando el nombre de una columna posee una función o una operación.


-- 4. Por cada producto muestre el nombre de producto, nombre de la compañía proveedora y ciudad de la compañía proveedora, para aquellos
-- productos sin stock.
SELECT prod.ProductName, sup.CompanyName, sup.Country FROM products AS prod JOIN suppliers AS sup ON (prod.SupplierID=sup.SupplierID) WHERE prod.UnitsInStock=0;

#COMENTARIO EJERCICIO 4
#Para este ejercicio sólo se necesita comentar que el join es necesario debido a que nos piden datos que se encuentran en 2 tablas diferentes.


-- 5. Muestre los proveedores con algún valor visible en el campo Homepage.
SELECT * FROM suppliers WHERE Homepage!="";

#COMENTARIO EJERCICIO 5
#Para este ejercicio "IS NOT NULL" no serviría ya que un dato puede estar vacío sin ser nulo (es decir, al contrario que lo que pide en el enunciado,
#sería un valor no nulo pero invisible), por eso se utiliza la igualdad que se puede observar en la propia query.

-- 6. Halle el total de unidades en stock para aquellos productos cuya descripción de categoría es “Carnes preparadas”.
SELECT sum(UnitsInStock) AS "Unidades Totales" FROM products AS prod JOIN categories AS cat ON (prod.CategoryID=cat.CategoryID) WHERE cat.Description = "prepared meats";

#COMENTARIO EJERCICIO 6
#Para este ejercicio, al igual que en el ejercicio 3, es necesario realizar un join debido a que el dato de la categoría viene dado por su descripción, no por su ID.
#Los alias son meramente decorativos, sólo son usados cuando el nombre de una columna posee una función o una operación.

-- 7. Por cada cliente halle la cantidad total de pedidos, sólo para aquellos clientes de Alemania, Canada o Venezuela que tienen algún valor visible en el campo Region
SELECT CustomerID, count(*) AS "Nº Pedidos" FROM customers WHERE Country IN ("Germany", "Canada", "Venezuela") AND Region!="" GROUP BY CustomerID;

#COMENTARIO EJERCICIO 7
#En este ejercicio he decidido usar un IN en vez de 3 OR con una comparación de igualdad cada una, aunque lo podría haber hecho y el grid de resultado no cambiaría.
#Al igual que en el ejercicio 5, para el dato Region, "IS NOT NULL" no serviría ya que un dato puede estar vacío sin ser nulo, por eso uso la igualdad que se puede observar en la propia query.
#Los alias son meramente decorativos, sólo son usados cuando el nombre de una columna posee una función o una operación.

-- 8. Por cada cliente, pedido realizado y empleado asociado, muestre los distintos productos (id de producto).
SELECT ord.CustomerID, ord.OrderID, ord.EmployeeID, orddet.ProductID FROM orders AS ord JOIN orderdetails AS orddet ON (ord.OrderID=orddet.OrderID) ORDER BY OrderID ASC;

#COMENTARIO EJERCICIO 8
#En este ejercicio veo un poco ambiguo el enunciado ya que si agrupamos por OrderID (es decir, agrupamos por "pedido realizado" según la nomenclatura del enunciado) sólo va a aparecer uno de
#los productos del pedido (en caso de que el pedido contenga más de un producto), por lo que he decidido ponerlos como columnas simplemente en vez de hacer un GROUP BY (por tanto, he interpretado
#que aunque en el enunciado ponga "por cada X", realmente este no es indicativo de un GROUP BY). Ha sido ordenado ascendentemente por el OrderID de forma voluntaria, interpreto que así el grid
#de resultado tiene más sentido.

-- 9. Halle la edad media de los representantes de ventas de Londres y Redmond que sean mujeres.
SELECT AVG(timestampdiff(YEAR, BirthDate, now())) AS "Media aritmética de la Edad" FROM employees WHERE Title="Sales Representative" AND City IN ("London","Redmond") AND TitleOfCourtesy IN ("Ms.", "Mrs.");

#COMENTARIO EJERCICIO 9
#El lapso de tiempo en años entre la fecha de nacimiento y la fecha actual (que se consigue usando timestampdiff como está escrito en la propia query) nos daría como resultado los años de edad
#del empleado estudiado, si aplicamos la media aritmética (función AVG) de dicho dato a todas las filas que cumplan las condiciones dadas por el enunciado (que están en la sentencia WHERE de la query correspondiente al
#ejercicio), el resultado nos da la media que nos preguntan. También he decidido usar un IN en vez de 3 OR con una comparación de igualdad cada una, aunque lo podría haber hecho y el grid de resultado no cambiaría.
#Los alias son meramente decorativos, sólo son usados cuando el nombre de una columna posee una función o una operación.

-- 10. Por cada ciudad muestre el número de empleados con edad superior a 66 años.
SELECT City, count(*) AS "Nº de Personas de +66 años" FROM employees WHERE (timestampdiff(YEAR, BirthDate, now()))>66 GROUP BY City;

#COMENTARIO EJERCICIO 10
#En este ejercicio sólo tenemos que contar las personas que superan los 66 años, es decir, el mismo timestampdiff que se usó en el ejercicio anterior como columna, ahora se utiliza como condición
#(sin la función de la media aritmética) para filtrar por la condición mencionada en el enunciado (edad>66).
#Los alias son meramente decorativos, sólo son usados cuando el nombre de una columna posee una función o una operación.