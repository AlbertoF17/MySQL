-- Contar el número de productos para los que no hay stock.
SELECT Count(UnitsInStock) FROM products WHERE UnitsInStock=0;

-- Sumar el total de unidades en stock de todos los productos cuyo campo UnitsInOrder no sea cero.
SELECT SUM(UnitsInStock) FROM products WHERE UnitsOnOrder!=0;

-- Contar el número de empleados cuyo nombre empieza por la letra A.
SELECT COUNT(*) FROM employees WHERE FirstName Like "A%";