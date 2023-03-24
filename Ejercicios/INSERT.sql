INSERT INTO employees (EmployeeID, LastName, FirstName)
VALUES (0, "Fernández", "Alberto"),
(0, "Pérez", "JoseMari"),
(0, "Márquez", "Jouse");

INSERT INTO categories (CategoryID, CategoryName, Description, Picture)
VALUES (0, "Hola", "Mundo", NULL),
(0, "Base de Datos", "MySQL", NULL),
(0, "Profesor", "Jorge Juan", NULL),
(0, "No sé", "qué más poner", NULL);

INSERT INTO categories
SET CategoryName = "Ejemplo1", Description = "Desc", Picture= NULL;
SELECT *
FROM categories;

INSERT INTO employees(LastName, FirstName)
SELECT LastName, FirstName
FROM employees
WHERE EmployeeID>= 5
AND EmployeeID<=9;

REPLACE INTO employees(EmployeeID, LastName, FirstName)
VALUES (59, "Fer","Alb");

DELETE FROM categories
WHERE CategoryID > 8;
DELETE FROM employees
WHERE EmployeeID > 9;

UPDATE categories
SET CategoryName = "Bebidas"
WHERE CategoryID = (SELECT MAX(CategoryID) FROM categories);

UPDATE categories SET CategoryName="Comida del mar" ORDER BY CategoryID DESC LIMIT 1;