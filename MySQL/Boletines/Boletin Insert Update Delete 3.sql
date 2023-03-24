-- 1. Crea un nuevo almacén en New York con capacidad para 3 cajas.
INSERT INTO warehouses (Code, Location, Capacity) VALUES (0, "New York", 3);

-- 2. Crea una nueva caja con código "H5RT", que contenga "Papers" con un valor de
-- $200, y situada en el almacén 2.
INSERT INTO boxes (Code, Contents, Value, Warehouse) VALUES ("H5RT", "Papers", 200, 2);

-- 3. Reduce el valor de todas las cajas un 15%.
UPDATE boxes SET Value = Value - (Value*0.15);

-- 4. Aplica un 20% de reducción a las cajas con un valor superior que el valor medio de todas las cajas.
UPDATE boxes SET Value = Value - (Value*0.2) WHERE Value > (SELECT * FROM (SELECT AVG(Value) FROM boxes)AS x);

-- 5. Elimina todas las cajas con un valor inferior a $100.
DELETE FROM boxes WHERE Value < 100;

-- 6. Elimina todas las cajas de los almacenes saturados.
DELETE FROM boxes WHERE Warehouse IN (SELECT * FROM (SELECT Code FROM warehouses AS wh WHERE wh.Capacity <= (SELECT COUNT(*) FROM boxes AS bx WHERE bx.Warehouse = wh.Code)) AS X);
