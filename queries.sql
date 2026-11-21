-- =====================================================================
-- Consultas sobre el catálogo de Netflix (SQLite)
--
-- Requiere haber creado la base con schema.sql y cargado los datos.
-- Ejecutar todas con: sqlite3 netflix.db < queries.sql
-- =====================================================================


-- 1. Cantidad de títulos por tipo (películas y series)
SELECT tipo, COUNT(*) AS total
FROM titulos
GROUP BY tipo
ORDER BY total DESC;


-- 2. Los 10 países con más títulos
--    JOIN une la tabla intermedia con la de países.
SELECT p.nombre AS pais, COUNT(*) AS titulos
FROM titulo_pais tp
JOIN paises p ON p.id_pais = tp.id_pais
WHERE p.nombre <> 'Desconocido'
GROUP BY p.nombre
ORDER BY titulos DESC
LIMIT 10;


-- 3. Estrenos por año desde 2000
SELECT anio_estreno, COUNT(*) AS titulos
FROM titulos
WHERE anio_estreno >= 2000
GROUP BY anio_estreno
ORDER BY anio_estreno;


-- 4. Años con más de 500 estrenos
--    HAVING filtra grupos después de agruparlos; WHERE filtra filas antes.
SELECT anio_estreno, COUNT(*) AS titulos
FROM titulos
GROUP BY anio_estreno
HAVING COUNT(*) > 500
ORDER BY titulos DESC;


-- 5. Películas de Estados Unidos estrenadas desde 2015
SELECT t.titulo, t.anio_estreno
FROM titulos t
JOIN titulo_pais tp ON tp.show_id = t.show_id
JOIN paises p ON p.id_pais = tp.id_pais
WHERE p.nombre = 'United States'
  AND t.tipo = 'Movie'
  AND t.anio_estreno >= 2015
ORDER BY t.anio_estreno DESC, t.titulo
LIMIT 15;


-- 6. Clasificaciones más frecuentes
SELECT clasificacion, COUNT(*) AS titulos
FROM titulos
WHERE clasificacion IS NOT NULL
GROUP BY clasificacion
ORDER BY titulos DESC
LIMIT 5;


-- 7. Directores con más títulos
SELECT director, COUNT(*) AS titulos
FROM titulos
WHERE director <> 'Sin dato'
GROUP BY director
ORDER BY titulos DESC
LIMIT 10;


-- 8. Países con más de 100 títulos y porcentaje de series
--    CASE cuenta las series dentro de la misma consulta.
SELECT p.nombre AS pais,
       COUNT(*) AS total,
       SUM(CASE WHEN t.tipo = 'TV Show' THEN 1 ELSE 0 END) AS series,
       ROUND(100.0 * SUM(CASE WHEN t.tipo = 'TV Show' THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_series
FROM titulo_pais tp
JOIN titulos t ON t.show_id = tp.show_id
JOIN paises p ON p.id_pais = tp.id_pais
WHERE p.nombre <> 'Desconocido'
GROUP BY p.nombre
HAVING COUNT(*) > 100
ORDER BY total DESC;


-- 9. Títulos agregados al catálogo por mes (2019-2020)
--    strftime es una función de fecha de SQLite. En PostgreSQL se usaría TO_CHAR.
SELECT strftime('%Y-%m', fecha_agregado) AS mes, COUNT(*) AS titulos
FROM titulos
WHERE fecha_agregado BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY mes
ORDER BY mes;


-- 10. Títulos sin país registrado
SELECT COUNT(DISTINCT tp.show_id) AS titulos_sin_pais
FROM titulo_pais tp
JOIN paises p ON p.id_pais = tp.id_pais
WHERE p.nombre = 'Desconocido';
