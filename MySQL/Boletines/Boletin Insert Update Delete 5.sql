-- 1. Añade un nuevo producto: Loudspeakers, $70, manufacturer 2.
INSERT INTO products (Code, Name, Price, Manufacturer) VALUES (0, Loudspeakers, 70, 2);

-- 2. Actualiza el nombre del producto 8 a "Laser Printer".
UPDATE products SET Name = "Laser Printer" WHERE Code = 8;

-- 3. Aplica un 10% de descuento a todos los productos.
UPDATE products SET Price = Price - (Price*0.1);

-- 4. Aplica un 10% de descuento a todos los productos con un precio superior o igual a $120.
UPDATE products SET Price = Price - (Price*0.1) WHERE Price IN (SELECT * FROM (SELECT Price FROM products WHERE Price >= 120)AS X);