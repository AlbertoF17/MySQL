CREATE DATABASE fkdemo;
USE fkdemo;
CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
) ENGINE=INNODB;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
        
) ENGINE=INNODB;

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
    
SELECT * FROM categories;

INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

INSERT INTO products(productName, categoryId)
VALUES('iPad',3);
-- Da error ya que el categoryID tiene un valor no válido

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;
-- Da error ya que no se puede modificar una categoria cuyo ID es usado en la tabla products

DROP TABLE products;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;

INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);

SELECT * FROM products;

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM categories;

SELECT * FROM products;

DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM categories;
SELECT * FROM products;

DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;

CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)ENGINE=INNODB;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
        ON UPDATE SET NULL
        ON DELETE SET NULL 
)ENGINE=INNODB;

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
    
INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
    
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM categories;
SELECT * FROM products;

DELETE FROM categories 
WHERE categoryId = 2;

SELECT * FROM products;

ALTER TABLE products
DROP FOREIGN KEY fk_category;

SET foreign_key_checks = 0;
SET foreign_key_checks = 1;