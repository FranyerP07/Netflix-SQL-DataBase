# Netflix Catalog Database with SQL

**English** | [Español](#base-de-datos-del-catálogo-de-netflix-con-sql)

Relational database built with SQLite and Python, loaded with the Netflix catalog (8,807 titles), and ten SQL queries that answer questions about the catalog.

## What it demonstrates
- Table design with primary keys, foreign keys and `CHECK` constraints.
- Normalization of a column with several values (countries) into a many-to-many relation.
- Data loading from CSV with pandas and `executemany`.
- Queries with `JOIN`, `GROUP BY`, `HAVING`, `CASE`, `BETWEEN` and date functions.

## Database schema
```
titulos (show_id PK, tipo, titulo, director, anio_estreno, clasificacion, duracion, fecha_agregado, descripcion)
paises (id_pais PK, nombre UNIQUE)
titulo_pais (show_id FK -> titulos, id_pais FK -> paises)   -- PK compuesta
```

## Queries included
1. Titles by type (movies and TV shows).
2. Top 10 countries by number of titles.
3. Releases per year since 2000.
4. Years with more than 500 releases.
5. Movies from the United States released since 2015.
6. Most common ratings.
7. Directors with the most titles.
8. Countries with more than 100 titles and their percentage of TV shows.
9. Titles added to the catalog per month (2019–2020).
10. Titles without a registered country.

## How to run it
1. Download `netflix_titles.csv` from Kaggle: https://www.kaggle.com/datasets/shivamb/netflix-shows
2. Open `base-datos-netflix.ipynb` in Google Colab.
3. Upload the CSV to `/content`.
4. Run the cells from top to bottom. The database `netflix.db` is created in the same folder.

No installation is needed: SQLite comes with Python.

## Author
Franyer Pérez · [LinkedIn](https://www.linkedin.com/in/franyer-perez-1b569b450)

---

# Base de datos del catálogo de Netflix con SQL

[English](#netflix-catalog-database-with-sql) | **Español**

Base de datos relacional creada con SQLite y Python, con el catálogo de Netflix (8,807 títulos), y diez consultas SQL que responden preguntas sobre el catálogo.

## Qué demuestra
- Diseño de tablas con claves primarias, claves foráneas y restricciones `CHECK`.
- Normalización de una columna con varios valores (países) en una relación de muchos a muchos.
- Carga de datos desde CSV con pandas y `executemany`.
- Consultas con `JOIN`, `GROUP BY`, `HAVING`, `CASE`, `BETWEEN` y funciones de fecha.

## Esquema de la base de datos
```
titulos (show_id PK, tipo, titulo, director, anio_estreno, clasificacion, duracion, fecha_agregado, descripcion)
paises (id_pais PK, nombre UNIQUE)
titulo_pais (show_id FK -> titulos, id_pais FK -> paises)   -- PK compuesta
```

## Consultas incluidas
1. Títulos por tipo (películas y series).
2. Los 10 países con más títulos.
3. Estrenos por año desde 2000.
4. Años con más de 500 estrenos.
5. Películas de Estados Unidos estrenadas desde 2015.
6. Clasificaciones más frecuentes.
7. Directores con más títulos.
8. Países con más de 100 títulos y porcentaje de series.
9. Títulos agregados al catálogo por mes (2019–2020).
10. Títulos sin país registrado.

## Cómo ejecutarlo
1. Descarga `netflix_titles.csv` de Kaggle: https://www.kaggle.com/datasets/shivamb/netflix-shows
2. Abre `base-datos-netflix.ipynb` en Google Colab.
3. Sube el CSV a `/content`.
4. Ejecuta las celdas de arriba hacia abajo. La base `netflix.db` se crea en la misma carpeta.

No hace falta instalar nada: SQLite viene incluido con Python.

## Autor
Franyer Pérez · [LinkedIn](https://www.linkedin.com/in/franyer-perez-1b569b450)
