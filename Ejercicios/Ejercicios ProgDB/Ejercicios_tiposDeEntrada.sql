-- 1. Crear una rutina que reciba un número y lo eleve al cuadrado.
DELIMITER $$;
DROP PROCEDURE IF EXISTS cuadrado_de_un_numero$$;
CREATE PROCEDURE  cuadrado_de_un_numero
(IN a INT, OUT b INT)
BEGIN
	SET b = a*a;
END$$;
DELIMITER ;

SET @x = 3;
SET @y = 0;
CALL cuadrado_de_un_numero(@x, @y);
SELECT @y;

-- 2. Crear una rutina que reciba dos números, y eleve el primero al segundo (potencia).
DELIMITER $$;
DROP PROCEDURE IF EXISTS cuadrado_de_un_numero$$;
CREATE PROCEDURE  cuadrado_de_un_numero
(IN a INT, IN b INT, OUT c INT)
BEGIN
	SET c = POWER(a,b);
END$$;
DELIMITER ;

SET @x = 3;
SET @y = 3;
SET @z = 0;
CALL cuadrado_de_un_numero(@x, @y, @z);
SELECT @z;

-- 3. Crear una rutina que reciba dos cadenas y las concatene con un guion bajo.
DELIMITER $$;
DROP PROCEDURE IF EXISTS concatenar$$;
CREATE PROCEDURE  concatenar
(IN a varchar(10), IN b varchar(10), OUT c varchar(20))
BEGIN
	SET c = CONCAT(a, "_", b);
END$$;
DELIMITER ;

SET @x = "Hola";
SET @y = "Mundo";
CALL concatenar(@x, @y, @z);
SELECT @z;

-- 4. Crear una rutina que reciba una cadena y le quite los espacios del principio y el final.
DELIMITER $$;
DROP PROCEDURE IF EXISTS quitar_espacios$$;
CREATE PROCEDURE  quitar_espacios
(IN a varchar(10), OUT b varchar(10))
BEGIN
	SET b = TRIM(a);
END$$;
DELIMITER ;

SET @x = "      Hola     ";
CALL quitar_espacios(@x, @y);
SELECT @y;

-- 5. Crear una rutina que reciba una cadena y genere una segunda con el mismo contenido pero en mayúsculas.
DELIMITER $$;
DROP PROCEDURE IF EXISTS mayus$$;
CREATE PROCEDURE  mayus
(IN a varchar(10), OUT b varchar(10))
BEGIN
	SET b = UPPER(a);
END$$;
DELIMITER ;

SET @x = "Hola Mundo";
CALL mayus(@x, @y);
SELECT @y;