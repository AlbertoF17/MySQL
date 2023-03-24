DELIMITER $$;
DROP PROCEDURE IF EXISTS hola_mundo$$;
CREATE PROCEDURE Northwind.hola_mundo()
BEGIN
	SELECT 'hola mundo';
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS saludar$$;
CREATE PROCEDURE Northwind.saludar()
BEGIN
	SELECT 'Buenas noches';
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS mostrar_version$$;
CREATE PROCEDURE Northwind.mostrar_version()
BEGIN
	SELECT version();
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS mostrar_fecha$$;
CREATE PROCEDURE Northwind.mostrar_fecha()
BEGIN
	SELECT curdate();
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS crear_aleatorio$$;
CREATE PROCEDURE Northwind.crear_aleatorio()
BEGIN
	SELECT floor(rand()*10);
END$$;
DELIMITER ;

DELIMITER $$;
DROP FUNCTION IF EXISTS sumar$$;
CREATE FUNCTION Northwind.sumar(n1 int, n2 int)
	RETURNS int
DETERMINISTIC
BEGIN
	RETURN (n1+n2);
END$$;
DELIMITER ;

DELIMITER $$;
DROP FUNCTION IF EXISTS mayusculas$$;
CREATE FUNCTION Northwind.mayusculas(nombre varchar(100))
	RETURNS varchar(100)
DETERMINISTIC
BEGIN
	RETURN(UPPER(nombre));
END$$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_entrada$$;
CREATE PROCEDURE proc_entrada (IN p INT)
BEGIN
	SELECT p;
	SET p = 5;
END$$;
DELIMITER ;

SET @y=0;
SELECT @y;
CALL proc_entrada(@y);
SELECT @y;

DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_salida$$;
CREATE PROCEDURE proc_salida (OUT p INT)
BEGIN
	SELECT p;
	SET p = 5;
END$$;
DELIMITER ;

SET @y=0;
SELECT @y;
CALL proc_salida(@y);
SELECT @y;

DELIMITER $$; 
DROP PROCEDURE IF EXISTS proc_entrada_salida $$; 
CREATE PROCEDURE proc_entrada_salida (INOUT p INT) 
BEGIN 
	SELECT p;
	SET p = 5; 
END $$; 
DELIMITER ;

SET @y=0;
SELECT @y;
CALL proc_entrada_salida(@y);
SELECT @y;