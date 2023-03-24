-- 1. Añade la película "One, Two, Three" sin calificación.
INSERT INTO movies (Code, Title, Rating) VALUES (0, "One, Two, Three", NULL);

-- 2. Configura la calificación de todas las películas sin calificar a "G".
UPDATE movies SET Rating = "G" WHERE Rating IS NULL;

-- 3. Elimina cines que proyecten películas calificadas con "NC-17".
DELETE FROM movietheaters WHERE movietheaters.Movie IN (SELECT Code FROM movies AS mov WHERE mov.Rating = "NC-17");