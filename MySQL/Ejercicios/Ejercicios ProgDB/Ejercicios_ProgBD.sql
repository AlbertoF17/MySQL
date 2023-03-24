CALL hola_mundo();
CALL saludar();
SHOW CREATE PROCEDURE hola_mundo;
CALL mostrar_version();
CALL mostrar_fecha();
CALL crear_aleatorio();
SELECT sumar(2.7,7);
SELECT mayusculas("Alberto");

-- Mostrar el ID de empleado, nombre en mayúsculas y apellido en mayúsculas de todos los empleados,
-- empleando la función mayusculas creada en la transparencia anterior. ¿Es mejor una función o un procedimiento?
DELIMITER $$;
DROP PROCEDURE IF EXISTS mostrar_empleados_mayus$$;
CREATE PROCEDURE Northwind.mostrar_empleados_mayus()
BEGIN
	SELECT employeeID, mayusculas(FirstName), mayusculas(LastName) FROM employees;
END$$;
DELIMITER ;

-- Crear una función multiplicar que reciba un float y un entero, y los devuelva multiplicados.
-- Usar la función para mostrar el ID de producto, el nombre de producto y los beneficios de venderlo (UnitPrice*UnitsInStock), usando la función creada, sobre la tabla Products.
DELIMITER $$;
DROP FUNCTION IF EXISTS multiplicar$$;
CREATE FUNCTION Northwind.multiplicar(n1 float, n2 int)
	RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN(n1*n2);
END$$;
DELIMITER ;

SELECT ProductID, ProductName, (UnitPrice*UnitsInStock) AS "beneficios" FROM products;

-- Crear una función medir_longitud que reciba una cadena de caracteres y devuela su longitud.
-- Usarla para imprimir el nombre de todos los empleados junto con la longitud de sus nombres.
DELIMITER $$;
DROP FUNCTION IF EXISTS medir_longitud$$;
CREATE FUNCTION Northwind.medir_longitud(cadena varchar(255))
	RETURNS INT
DETERMINISTIC
BEGIN
	RETURN(length(cadena));
END$$;
DELIMITER ;

SELECT medir_longitud("Alberto");

-- Crear una función concatenar que reciba dos cadenas y las devuelva concatenadas separadas por un guión bajo.
-- Por ejemplo, si se reciben ‘Juan’ y ‘Palomo’, devolvería ‘Juan_Palomo’. Usarla para imprimir el ID de empleado, y concatenar el nombre y apellidos usando esta función.
DELIMITER $$;
DROP FUNCTION IF EXISTS concatenar$$;
CREATE FUNCTION Northwind.concatenar(cadena1 varchar(100), cadena2 varchar(100))
	RETURNS varchar(201)
DETERMINISTIC
BEGIN
	RETURN(concat_ws("_", cadena1, cadena2));
END$$;
DELIMITER ;

SELECT concatenar("Alberto","Fernández");

DELIMITER $$;
DROP PROCEDURE IF EXISTS suma_numeros$$;
CREATE PROCEDURE  suma_numeros
(IN a INT, IN b INT, OUT c INT)
BEGIN
	SET c = a+b;
END$$;
DELIMITER ;

SET @x = 3;
SET @y = 7;
SET @z = 0;
CALL suma_numeros(@x, @y, @z);
SELECT @z;

DELIMITER $$;
DROP PROCEDURE IF EXISTS intercambiar_numeros$$;
CREATE PROCEDURE  intercambiar_numeros
(INOUT a INT, INOUT b INT)
BEGIN
	DECLARE tmp INT;
	SET tmp = a;
    SET a = b;
    SET b = tmp;
END$$;
DELIMITER ;

SET @x = 3;
SET @y = 7;
SELECT CONCAT(@x, ", ", @y);
CALL intercambiar_numeros(@x, @y);
SELECT CONCAT(@x, ', ', @y);

DELIMITER $$;
DROP PROCEDURE IF EXISTS es_mayor $$;
CREATE PROCEDURE es_mayor
(IN a INT, IN b INT, OUT mensaje VARCHAR(30))
BEGIN
	IF a>b THEN
		SET mensaje="El primero es mayor";
	ELSEIF a<b THEN
		SET mensaje="El segundo es mayor";
	ELSE
		SET mensaje="Son iguales";
	END IF;
END $$;
DELIMITER ;

SET @x=3;
SET @y=13;
SET @res="";
CALL es_mayor(@x, @y, @res);
SELECT @res;