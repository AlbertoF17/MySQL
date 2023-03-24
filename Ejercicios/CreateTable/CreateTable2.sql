-- Crear una base de datos llamada MOVIES, destinada a almacenar películas que se proyectan en varios
-- cines. La base de datos debe tener dos tablas:
-- Movies:
	-- con un campo Code de tipo entero, clave primaria.
	-- con un campo Title de tipo cadena variable de tamaño maximo 255, no nulo.
	-- con un campo Rating de tipo cadena variable de tamaño maximo 255.
-- MovieTheaters:
	-- con un campo Code de tipo entero, clave primaria.
	-- con un campo Name de tipo cadena variable de tamaño maximo 255, no nulo.
	-- con un campo Movie de tipo entero, como clave ajena hacia la tabla Movies.
    
CREATE DATABASE MOVIES;
USE MOVIES;

CREATE TABLE Movies(
    Code INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Rating VARCHAR(255)
) ENGINE=INNODB;

CREATE TABLE MovieTheaters(
    Code INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Movie INT,
    FOREIGN KEY (Movie)
		REFERENCES Movies(Code)
) ENGINE=INNODB;