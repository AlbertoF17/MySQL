-- 1. Añade un nuevo departamento llamado "Quality Assurance", con un presupuesto de $40,000 y código de departamento de 11. Añade un
-- empleado llamado "Mary Moore" en ese departamento, con SSN 847-21-9811.
INSERT INTO departments (Code, Name, Budget) VALUES (11, "Quality Assurance", 40000);
INSERT INTO employees (SSN, Name, LastName, Department) VALUES (847-21-9811, "Mary", "Moore", 11);

-- 2. Reduce el presupuesto de todos los departamentos un 10%.
UPDATE departments SET Budget = Budget * (Budget*0.1);

-- 3. Reasigna todos los empleados del departamento Research (code 77) al departamento IT (code 14).
UPDATE employees SET Department = 14 WHERE Department = 77;

-- 4. Borra todos los empleados del departamento de IT (code 14).
DELETE FROM employees WHERE Department = 77;

-- 5. Borra todos los empleados que trabajan en departamentos con un presupuesto superior o igual a $60,000.
DELETE FROM employees WHERE Department IN (SELECT Code FROM departments WHERE Budget >= 60000);

-- 6. Borra todos los empleados.
DELETE FROM employees;