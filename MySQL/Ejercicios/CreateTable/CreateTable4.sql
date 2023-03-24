-- Crear una base de datos llamada Manufacturers. La base de datos debe tener dos tablas:
-- Manufacturers:
	-- con un campo Code de tipo entero, clave primaria.
	-- con un campo Name de tipo cadena variable de tamaño maximo 255, no nulo.
-- Products:
	-- con un campo Code de tipo entero, clave primaria.
	-- con un campo Name de tipo cadena variable de tamaño maximo 255, no nulo.
	-- con un campo Price de tipo decimal, no nulo.
	-- con un campo Manufacturer de tipo entero no nulo, clave ajena hacia la tabla Manufacturers.
CREATE DATABASE Manufacturers;
USE Manufacturers;

CREATE TABLE Manufacturers(
    Code INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
) ENGINE=INNODB;

CREATE TABLE Providers(
    Code INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL NOT NULL,
    Manufacturer INT NOT NULL,
    FOREIGN KEY (Manufacturer)
		REFERENCES Manufacturers(Code)
) ENGINE=INNODB;
    