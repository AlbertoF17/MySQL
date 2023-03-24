-- Crear una base de datos llamada WAREHOUSES, destinada a almacenar información sobre unos almacenes.
-- La base de datos debe tener dos tablas:
-- Warehouses:
	-- con un campo Code de tipo entero no nulo, clave primaria.
	-- con un campo Location de tipo cadena variable de tamaño maximo 255, no nulo.
	-- con un campo Capacity de tipo entero no nulo.
-- Boxes:
	-- con un campo Code de tipo cadena variable de tamaño maximo 255, no nulo, clave primaria.
	-- con un campo Contents de tipo cadena variable de tamaño maximo 255, no nulo.
	-- con un campo Value de tipo real no nulo.
	-- con un campo Warehouse de tipo entero no nulo, clave ajena hacia la tabla Warehouses.
    
CREATE DATABASE WAREHOUSES;
USE WAREHOUSES;

CREATE TABLE Warehouses(
    Code INT PRIMARY KEY NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Capacity TEXT NOT NULL
) ENGINE=INNODB;

CREATE TABLE Boxes(
    Code VARCHAR(255) PRIMARY KEY NOT NULL,
    Contents VARCHAR(255) NOT NULL,
    Value REAL NOT NULL,
    Warehouse INT NOT NULL,
    FOREIGN KEY (Warehouse)
		REFERENCES Warehouses(Code)
) ENGINE=INNODB;