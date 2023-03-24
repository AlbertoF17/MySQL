-- Crear una base de datos llamada PIECES, destinada a almacenar productos de varios
-- proveedores. La base de datos debe tener tres tablas:
-- Pieces: 
	-- con un campo CodeID de tipo entero como clave primaria no nula.
	-- con un campo Name de tipo texto no nulo.
-- Providers:
	-- con un campo CodeID de tipo cadena variable de tamaño maximo 40, como clave primaria no nula.
	-- con un campo Name de tipo texto no nulo.
-- Provides:
	-- con un campo Piece de tipo entero, clave ajena hacia la tabla Pieces.
	-- con un campo Provider de tipo cadena variable de tamaño maximo 40, como clave ajena hacia la tabla Providers.
	-- con un campo Price de tipo entero no nulo.
	-- la clave primaria la conforman los campos Piece y Provider.
CREATE DATABASE PIECES;
USE PIECES;

CREATE TABLE Pieces(
    CodeID INT PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL
) ENGINE=INNODB;

CREATE TABLE Providers(
    CodeID VARCHAR(40) PRIMARY KEY NOT NULL,
    Name TEXT NOT NULL
) ENGINE=INNODB;

CREATE TABLE Provides(
    Piece INT,
    Provider VARCHAR(40),
    Price INT NOT NULL,
    PRIMARY KEY(Piece, Provider),
    FOREIGN KEY (Piece)
		REFERENCES Pieces(CodeID),
	FOREIGN KEY (Provider)
		REFERENCES Providers(CodeID)
) ENGINE=INNODB;