-- Crear una función que devuelva 1 o 0 si un número a es divisible por un numero b (siendo estos
-- enteros). (Busca información en google sobre cómo hacer el módulo)
DELIMITER $$;
DROP FUNCTION IF EXISTS es_divisible$$;
CREATE FUNCTION  es_divisible(a INT,b INT)
	RETURNS INT
DETERMINISTIC
BEGIN
	IF a%b = 0 THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END$$;
DELIMITER ;

SET @x = 4;
SET @y = 3;
SELECT es_divisible(@x, @y);

-- Crear un procedimiento que reciba un entero entre 1 y 12, y muestre por pantalla el mes del año. En
-- caso de no ser el número de un mes, mostrar ‘Eres un poco despistado, introduce un mes’.
DELIMITER $$;
DROP PROCEDURE IF EXISTS es_divisible$$;
CREATE PROCEDURE  mes(IN a INT, OUT mes varchar(20))
BEGIN
CASE a
	WHEN 1 THEN
		SET mes = "Enero";
	WHEN 2 THEN
		SET mes = "Febrero";
	WHEN 3 THEN
		SET mes = "Marzo";
	WHEN 4 THEN
		SET mes = "Abril";
	WHEN 5 THEN
		SET mes = "Mayo";
	WHEN 6 THEN
		SET mes = "Junio";
	WHEN 7 THEN
		SET mes = "Julio";
	WHEN 8 THEN
		SET mes = "Agosto";
	WHEN 9 THEN
		SET mes = "Septiembre";
	WHEN 10 THEN
		SET mes = "Octubre";
	WHEN 11 THEN
		SET mes = "Noviembre";
	WHEN 12 THEN
		SET mes = "Diciembre";
	ELSE
		SET mes = "Eres un poco despistado, introduce un mes";
END CASE;
END$$;
DELIMITER ;

SET @x = 4;
CALL mes(@x, @y);
SELECT @y;

-- Crear un procedimiento que reciba una cadena de tamaño 50 (puede usar una inferior si quiere) e
-- imprima por pantalla si es un palíndromo (no elimine espacios ni nada, solo compruebe que se lee
-- igual al derecho que al revés). (Busca información sobre cómo invertir una cadena).
DELIMITER $$;
DROP PROCEDURE IF EXISTS es_palindromo$$;
CREATE PROCEDURE  es_palindromo(IN a varchar(50), OUT resultado varchar(20))
BEGIN
	IF a = REVERSE(a) THEN
		SET resultado = "Es palindromo";
	ELSE
		SET resultado = "NO es palindromo";
	END IF;
END$$;
DELIMITER ;

SET @x = "Alberto";
CALL es_palindromo(@x, @y);
SELECT @y;