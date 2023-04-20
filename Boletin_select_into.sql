-- 1. Crear una función que reciba un ID de empleado y devuelva su nombre y apellidos concatenados y
-- separados por un espacio en blanco. Darle el nombre getNombreCompleto.
el nombre getNombreCompleto.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_getNombreCompleto$$;
CREATE FUNCTION Northwind.func_getNombreCompleto(idEmpleado int)
RETURNS VARCHAR(61)
DETERMINISTIC
BEGIN
DECLARE nombre, apellido VARCHAR(30) DEFAULT "";
SELECT FirstName,LastName INTO nombre,apellido FROM employees WHERE EmployeeID=idEmpleado; 
	RETURN(concat(nombre," ",apellido));
END$$;
DELIMITER ;

SELECT func_getNombreCompleto(4);

-- 2. Repetir el ejercicio anterior concatenando la edad, que deberá ser calculada
-- en base a la fecha de nacimiento. Darle el nombre getNombreCompletoEdad.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_getNombreCompletoEdad $$;
CREATE FUNCTION func_getNombreCompletoEdad (id_empleado INT)
RETURNS VARCHAR(61)
DETERMINISTIC
BEGIN
	DECLARE nombre, apellido VARCHAR(30) DEFAULT '';
    DECLARE edad INT DEFAULT 0;
	SELECT FirstName, LastName, FLOOR((DATEDIFF(curdate(), BirthDate))/365) INTO nombre, apellido, edad FROM Employees WHERE EmployeeID=id_empleado;
    RETURN(concat_ws(' ',nombre, apellido, edad));
END $$;
DELIMITER ;

SELECT func_getNombreCompletoEdad(6)

-- 3A. Modificar los ejercicios anteriores para que sea un método que devuelva en variables de salida los datos requeridos.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_getNombreCompleto$$;
CREATE PROCEDURE Northwind.proc_getNombreCompleto(IN id_empleado INT, OUT nombre VARCHAR(30), OUT apellido VARCHAR(30))
BEGIN
SELECT FirstName,LastName INTO nombre,apellido FROM employees WHERE EmployeeID=idEmpleado; 
END$$;
DELIMITER ;

SET @id = 3;
SET @nombre = "";
SET @apellido = "";

CALL proc_getNombreCompleto(@id, @nombre, @apellido);
SELECT @nombre, @apellido;

-- 3B
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_getNombreCompletoEdad $$;
CREATE PROCEDURE proc_getNombreCompletoEdad (IN id_empleado INT, OUT nombre VARCHAR(30), OUT apellido VARCHAR(30), OUT edad INT)
BEGIN
	SELECT FirstName, LastName, FLOOR((DATEDIFF(curdate(), BirthDate))/365) INTO nombre, apellido, edad FROM Employees WHERE EmployeeID=id_empleado;
END $$;
DELIMITER ;

SET @id = 3;
SET @nombre = "";
SET @apellido = "";
SET @edad = 0;

CALL proc_getNombreCompletoEdad(@id, @nombre, @apellido, @edad);
SELECT @nombre, @apellido, @edad;

-- 4. Crear una rutina que reciba un ID de pedido, y devuelva en una variable de salida el empleado que lo atendió
DELIMITER $$; 
DROP PROCEDURE IF EXISTS proc_getempleado $$; 
CREATE PROCEDURE proc_getempleado (IN id_pedido INT, OUT empleado VARCHAR(50), OUT id_empleado INT) 
BEGIN 
  SELECT emp.EmployeeID, emp.FirstName INTO id_empleado, empleado FROM orders ord JOIN employees emp ON (ord.EmployeeID=emp.EmployeeID) WHERE OrderID=id_pedido;
END $$; 
DELIMITER ;
SET @id_pedido = 10258;
SET @nombre_empleado = "";
SET @id_empleado = 0;

CALL proc_getempleado(@id_pedido, @nombre_empleado, @id_empleado);
SELECT @id_pedido, @nombre_empleado, @id_empleado;

-- 5 Repetir el anterior, pero devolviendo el cliente.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_pedidoXcliente$$;
CREATE PROCEDURE proc_pedidoXcliente(IN id_pedido INT, OUT id_cliente VARCHAR(20), OUT nombre VARCHAR(61))
BEGIN
	SELECT ord.CustomerID, cust.CompanyName INTO id_cliente, nombre FROM orders AS ord JOIN customers AS cust ON ord.CustomerID = cust.CustomerID WHERE ord.OrderID = id_pedido;
END $$;
DELIMITER ;
SET @a = '';
SET @b = '';
CALL proc_pedidoXcliente(10248,@a,@b);

SELECT CONCAT(@a,' ',@b)'proc_pedidoXcliente';

-- 6. Crear una rutina que devuelva en una variable de salida la cantidad de pedidos del empleado número 3.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_pedidosXempleado$$;
CREATE PROCEDURE proc_pedidosXempleado(IN id_empleado INT, OUT nombre VARCHAR(61), OUT num_pedidos INT)
BEGIN
	SELECT ord.EmployeeID, emp.FirstName, ord.count(EmployeeID) INTO id_empleado, nombre, num_pedidos FROM orders AS ord JOIN employees AS emp ON ord.EmployeeID = emp.EmployeeID WHERE emp.EmployeeID = id_empleado;
END $$;
DELIMITER ;
SET @a = '';
SET @b = 0;
CALL proc_pedidoXcliente(3,@a,@b);

SELECT CONCAT(@a,' ',@b)'proc_pedidosXempleado';

-- 7. Crear una rutina que reciba dos nombres de empleados y devuelva el nombre del que ha atendido mayor cantidad de pedidos.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_empleadoConMasPedidos$$;
CREATE FUNCTION func_empleadoConMasPedidos (nombre1 VARCHAR(30), nombre2 VARCHAR(30))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	IF (SELECT * FROM Orders AS ord JOIN employees AS emp ON (ord.EmployeeID = emp.EmployeeID) WHERE emp.FirstName = nombre1) > 
	(SELECT * FROM Orders AS ord JOIN employees AS emp ON (ord.EmployeeID = emp.EmployeeID) WHERE emp.FirstName = nombre2) THEN
		SET solucion = nombre1;
	ELSE
		SET solucion = nombre2;
	END IF;
    RETURN (solucion);
END $$;
DELIMITER ;

SELECT func_empleadoConMasPedidos("Nancy","Margaret");

-- 8. ¿Se puede modificar el ejercicio anterior para que el ID de empleado se reciba como un argumento de entrada?
DELIMITER $$;
DROP FUNCTION IF EXISTS func_empleadoConMasPedidosConID$$;
CREATE FUNCTION func_empleadoConMasPedidosConID (id1 INT, id2 INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	IF (SELECT * FROM Orders WHERE EmployeeID = id1) > (SELECT * FROM Orders WHERE EmployeeID = id2) THEN
		SET solucion = (SELECT FirstName FROM employees WHERE EmployeeID = id1);
	ELSE
		SET solucion = (SELECT FirstName FROM employees WHERE EmployeeID = id2);
	END IF;
    RETURN (solucion);
END $$;
DELIMITER ;

SELECT func_empleadoConMasPedidosConID(1,4);

-- 9. Crear una rutina que devuelva en una variable el valor máximo de precio de producto.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_maxPrecioProducto$$;
CREATE FUNCTION func_maxPrecioProducto (id_prod INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE maxPrecio INT DEFAULT 0;
	SET maxPrecio = (SELECT UnitPrice FROM orderdetails WHERE ProductID = id_prod ORDER BY UnitPrice LIMIT 1);
END $$;
DELIMITER ;

SELECT func_maxPrecioProducto(1);

-- 10. Crear una rutina que devuelva la cantidad de pedidos en una variable.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_numPedidos$$;
CREATE FUNCTION func_numPedidos()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE numPedidos INT DEFAULT 0;
	SET numPedidos = (SELECT count(*) FROM orders);
END $$;
DELIMITER ;

SELECT func_numPedidos();

-- 11. Repetir el anterior pero solo teniendo en cuenta aquellos pedidos que tienen descuento.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_numPedidosConDescuento$$;
CREATE FUNCTION func_numPedidosConDescuento()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE numPedidos INT DEFAULT 0;
	SET numPedidos = (SELECT count(*) FROM orders AS ord JOIN products AS prod ON (ord.ProductID = prod.ProductID) WHERE prod.Discount > 0);
END $$;
DELIMITER ;

SELECT func_numPedidosConDescuento();

-- 12. Crear una rutina que devuelva el id de empleado que tiene más pedidos.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_empleadoConMasPedidos$$;
CREATE FUNCTION func_empleadoConMasPedidos()
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE idEmp INT DEFAULT 0;
	-- SET idEmp = ();
END $$;
DELIMITER ;

SELECT func_empleadoConMasPedidos();

-- 13. Crear una rutina que reciba un nombre de contacto y devuelva el ID de cliente.

-- 14. Crear una rutina que reciba un ID de envío (ShipperID) y devuelva la cantidad de pedidos enviados con ese transportista.

-- 15. Crear una rutina que reciba dos ID de categoría, y devuelva la suma de la cantidad de productos que tienen ambas.

-- 16. Crear una rutina que reciba tres ID de categorías y devuelva sus descripciones concatenadas y separadas por punto y coma.