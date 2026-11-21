-- =====================================================================
-- Esquema de la base de datos del catálogo de Netflix (SQLite)
--
-- Tablas:
--   titulos       : una fila por película o serie (clave primaria: show_id)
--   paises        : una fila por país, sin repetir nombres
--   titulo_pais   : relación de muchos a muchos entre títulos y países
--
-- Ejecutar con: sqlite3 netflix.db < schema.sql
-- Los datos se cargan desde el CSV con el notebook base-datos-netflix.ipynb
-- =====================================================================

PRAGMA foreign_keys = ON;

CREATE TABLE titulos (
    show_id        TEXT PRIMARY KEY,
    tipo           TEXT NOT NULL CHECK (tipo IN ('Movie', 'TV Show')),
    titulo         TEXT NOT NULL,
    director       TEXT,
    anio_estreno   INTEGER,
    clasificacion  TEXT,
    duracion       TEXT,
    fecha_agregado TEXT,              -- formato AAAA-MM-DD
    descripcion    TEXT
);

CREATE TABLE paises (
    id_pais  INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre   TEXT NOT NULL UNIQUE
);

CREATE TABLE titulo_pais (
    show_id  TEXT    NOT NULL,
    id_pais  INTEGER NOT NULL,
    PRIMARY KEY (show_id, id_pais),
    FOREIGN KEY (show_id) REFERENCES titulos(show_id),
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);
