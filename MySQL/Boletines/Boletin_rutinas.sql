-- FUNCIONES
-- 1. Escribe una función que reciba un número entero de entrada y devuelva TRUE si
-- el número es par o FALSE en caso contrario
DELIMITER $$;
DROP FUNCTION IF EXISTS func_es_par$$;
CREATE FUNCTION  func_es_par(a INT)
	RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	IF a%2 = 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END$$;
DELIMITER ;

SET @x = 4;
SELECT func_es_par(@x);

-- 2. Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir
-- de los valores de sus lados.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_hipotenusa$$;
CREATE FUNCTION  func_hipotenusa(a FLOAT, b FLOAT)
	RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN SQRT((a*a)+(b*b));
END$$;
DELIMITER ;

SET @x = 4;
SET @y = 5;
SELECT func_hipotenusa(@x, @y);

-- 3. Escribe una función que reciba como parámetro de entrada un valor numérico
-- que represente un día de la semana y que devuelva un cadena de caracteres con
-- el nombre del día de la semana correspondiente, Por ejemplo, poo el valor de
-- entrada 1 debería devolverla cadena lunes.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_dia$$;
CREATE FUNCTION  func_dia(a INT)
	RETURNS varchar(20)
DETERMINISTIC
BEGIN
CASE a
	WHEN 1 THEN
		RETURN "Lunes";
	WHEN 2 THEN
		RETURN "Martes";
	WHEN 3 THEN
		RETURN "Miércoles";
	WHEN 4 THEN
		RETURN "Jueves";
	WHEN 5 THEN
		RETURN "Viernes";
	WHEN 6 THEN
		RETURN "Sábado";
	WHEN 7 THEN
		RETURN "Domingo";
	ELSE
		RETURN "Eres un poco despistado, introduce un número del 1 al 7";
END CASE;
END$$;
DELIMITER ;

SET @x = 4;
SELECT func_dia(@x);

-- 4. Escribe una función que reciba 3 números reales como parámetros de entrada y
-- devuelva el mayor de los tres.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_num_mayor$$;
CREATE FUNCTION  func_num_mayor(a INT, b INT, c INT)
	RETURNS INT
DETERMINISTIC
BEGIN
	IF a > b AND a > c THEN
		RETURN a;
	ELSEIF b > a AND b > c THEN
		RETURN b;
	ELSEIF c > a AND c > b THEN
		RETURN c;
	END IF;
END$$;
DELIMITER ;

SET @x = 14;
SET @y = 8;
SET @z = 6;
SELECT func_num_mayor(@x, @y, @z);

-- 5. Escribe una función que devuelva el valor del área de un circulo a partir del valor
-- del raido que se recibirá como parámetro de entrada.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_circulo$$;
CREATE FUNCTION  func_circulo(a FLOAT)
	RETURNS FLOAT
DETERMINISTIC
BEGIN
	RETURN (PI()*a*a);
END$$;
DELIMITER ;

SET @x = 4;
SELECT func_circulo(@x);

-- 6. Escribe una función que devuelva como salida el número de años que han transcurrido
-- ente dos fechas que se reciben como parámetros de entada. Por ejemplo, si pasamos como
-- parámetros de entrada las fechas 2014-01-41 y 2008-01-61 la función tiene que devolver
-- que han pasado 10 años. Para realzar esta función puede hacer uso de las siguientes funciones
-- que nos proporciona MySQL: DATEDIFF, TRUNCATE.
DELIMITER $$;
DROP FUNCTION IF EXISTS func_anyos_transcurridos$$;
CREATE FUNCTION  func_anyos_transcurridos(a DATE, b DATE)
	RETURNS INT
DETERMINISTIC
BEGIN
	RETURN DATEDIFF(a, b)/365;
END$$;
DELIMITER ;

SET @x = "1999-01-01";
SET @y = "1988-01-01";
SELECT func_anyos_transcurridos(@x, @y);

-- 7. Escribe una función que reciba una cadena de entrada y devuelva la misma cadena pero
-- sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la
-- misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la
-- cadena "María" la función debe devolver la cadena "Maria".
DELIMITER $$;
DROP FUNCTION IF EXISTS func_quitar_acentos$$;
CREATE FUNCTION  func_quitar_acentos(a VARCHAR(255))
	RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	SET a = REPLACE(a, "Á", "A");
    SET a = REPLACE(a, "É", "E");
    SET a = REPLACE(a, "Í", "I");
    SET a = REPLACE(a, "Ó", "O");
    SET a = REPLACE(a, "Ú", "U");
    SET a = REPLACE(a, "á", "a");
    SET a = REPLACE(a, "é", "e");
    SET a = REPLACE(a, "í", "i");
    SET a = REPLACE(a, "ó", "o");
    SET a = REPLACE(a, "ú", "u");
	RETURN a;
END$$;
DELIMITER ;

SET @x = "María";
SELECT func_quitar_acentos(@x);

-- PROCEDIMIENTOS
-- 1. Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hala mundo!
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_saludar$$;
CREATE PROCEDURE  proc_saludar()
BEGIN
	SELECT "¡Hola mundo!";
END$$;
DELIMITER ;

CALL proc_saludar();

-- 2. Escribe un procedimiento que reciba un número real de entrada y mueete un mensaje indicando ele número es positivo, negativo o cero.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_pos_neg_0$$;
CREATE PROCEDURE  proc_pos_neg_0(IN a INT)
BEGIN
	IF a < 0 THEN
		SELECT "Número negativo";
	ELSEIF a > 0 THEN
		SELECT "Número positivo";
	ELSE
		SELECT "Número 0";
    END IF;
END$$;
DELIMITER ;

SET @x = 3;
CALL proc_pos_neg_0(@x);

-- 3. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de enrada, con el valor un
-- número real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_pos_neg_0$$;
CREATE PROCEDURE  proc_pos_neg_0(IN a INT, INOUT b VARCHAR(20))
BEGIN
	IF a < 0 THEN
		SET b = "Número negativo";
	ELSEIF a > 0 THEN
		SET b = "Número positivo";
	ELSE
		SET b = "Número 0";
    END IF;
    SELECT b;
END$$;
DELIMITER ;

SET @x = 3;
SET @y = "Hola";
CALL proc_pos_neg_0(@x, @y);
-- SELECT @y;

-- 4. Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, y
-- muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta a siguientes condiciones:
-- [0,5) = Insuficiente
-- [5,6) = Aprobado
-- [6,7) = Bien
-- [7,9) = Notable
-- [9,10) = Sobresaliente
-- En cualquier otr caso la nota no será válida
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_nota$$;
CREATE PROCEDURE  proc_nota(IN a INT)
BEGIN
	IF a >= 0 AND a < 5 THEN
		SELECT "Insuficiente";
	ELSEIF a >= 5 AND a < 6 THEN
		SELECT "Aprobado";
	ELSEIF a >= 6 AND a < 7 THEN
		SELECT "Bien";
	ELSEIF a >= 7 AND a < 9 THEN
		SELECT "Notable";
	ELSEIF a >= 9 AND a < 10 THEN
		SELECT "Sobresaliente";
	ELSE
		SELECT "Nota no válida";
    END IF;
END$$;
DELIMITER ;

SET @x = 9;
CALL proc_nota(@x);

-- 5. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor de la
-- nota en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota conrspondiente,
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_nota$$;
CREATE PROCEDURE  proc_nota(IN a INT, OUT b VARCHAR(20))
BEGIN
	IF a >= 0 AND a < 5 THEN
		SET b = "Insuficiente";
	ELSEIF a >= 5 AND a < 6 THEN
		SET b = "Aprobado";
	ELSEIF a >= 6 AND a < 7 THEN
		SET b = "Bien";
	ELSEIF a >= 7 AND a < 9 THEN
		SET b = "Notable";
	ELSEIF a >= 9 AND a < 10 THEN
		SET b = "Sobresaliente";
	ELSE
		SET b = "Nota no válida";
    END IF;
    SELECT b;
END$$;
DELIMITER ;

SET @x = 9;
SET @y = "Hola";
CALL proc_nota(@x, @y);
-- SELECT @y;

-- 6. Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_nota$$;
CREATE PROCEDURE  proc_nota(IN a INT, OUT b VARCHAR(20))
BEGIN
	CASE a 
	WHEN 0 THEN
		SET b = "Insuficiente";
	WHEN 1 THEN
		SET b = "Insuficiente";
    WHEN 2 THEN
		SET b = "Insuficiente";
	WHEN 3 THEN
		SET b = "Insuficiente";
	WHEN 4 THEN
		SET b = "Insuficiente";
	WHEN 5 THEN
		SET b = "Aprobado";
	WHEN 6 THEN
		SET b = "Bien";
	WHEN 7 THEN
		SET b = "Notable";
	WHEN 8 THEN
		SET b = "Notable";
	WHEN 9 THEN
		SET b = "Sobresaliente";
	WHEN 10 THEN
		SET b = "Sobresaliente";
	ELSE
		SET b = "Nota no válida";
    END CASE;
    SELECT b;
END$$;
DELIMITER ;

SET @x = 8;
SET @y = "Hola";
CALL proc_nota(@x, @y);
-- SELECT @y;

-- 7. Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana
-- y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente, Por ejemplo, para el valor
-- de entrada 1 debería devoher la cadena unes
DELIMITER $$;
DROP PROCEDURE IF EXISTS proc_dia$$;
CREATE PROCEDURE  proc_dia(IN a INT, OUT b VARCHAR(20))
BEGIN
CASE a
	WHEN 1 THEN
		SET b = "Lunes";
	WHEN 2 THEN
		SET b = "Martes";
	WHEN 3 THEN
		SET b = "Miércoles";
	WHEN 4 THEN
		SET b = "Jueves";
	WHEN 5 THEN
		SET b = "Viernes";
	WHEN 6 THEN
		SET b = "Sábado";
	WHEN 7 THEN
		SET b = "Domingo";
	ELSE
		SET b = "Eres un poco despistado, introduce un número del 1 al 7";
END CASE;
	SELECT b;
END$$;
DELIMITER ;

SET @x = 4;
SET @y = "Hola";
CALL proc_dia(@x, @y);
-- SELECT @y;