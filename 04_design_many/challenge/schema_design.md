# Two Tables (Many-to-Many) Design Recipe Template

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORIES:

As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of movies with their title and release date.

As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of my cinemas with their city name (e.g 'London' or 'Manchester').

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which cinemas are showing a specific movie.

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which movies are being shown a specific cinema.

```

```
Nouns:

movies => id, title, release_date
student_cinemas => movies_id, cinemas_id
cinemas => id, city_name
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| movies                | id, title, release_date
| student_cinemas          | movies_id, cinemas_id
| cinemas               | id , city_name

1. Name of the first table (always plural): `movies` 

    Column names: `id`, `title`, `release_date`

2. Name of the second table (always plural): `cinemas` 

    Column names: `id`, `city_name`

## 3. Decide the column types.

```
# EXAMPLE:

Table: movies
id: SERIAL
title: text
release_date: date


Table: cinemas
id: SERIAL
city_name: text

```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one movie have many cinemas? (YES)
2. Can one cinema have many movies? (YES)


## 5. Design the Join Table

The join table usually contains two columns, which are two foreign keys, each one linking to a record in the two other tables.

The naming convention is `movies_cinemas`.

```
# EXAMPLE

Join table for tables: movies and cinemas
Join table name: movies_cinemas
Columns: movie_id, cinema_id
```

## 4. Write the SQL.

```sql
-- EXAMPLE


-- Create the first table.
CREATE TABLE mvoies (
  id SERIAL PRIMARY KEY,
  title text,
  release_date date
);

-- Create the second table.
CREATE TABLE cinemas (
  id SERIAL PRIMARY KEY,
  city_name text
);

-- Create the join table.
CREATE TABLE movies_cinemas (
  student_id int,
  tag_id int,
  constraint fk_post foreign key(student_id) references movies(id) on delete cascade,
  constraint fk_tag foreign key(tag_id) references cinemas(id) on delete cascade,
  PRIMARY KEY (student_id, tag_id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < movies_cinemas.sql
```

## QUERY TO TEST DB
```sql

-- ALL cinemas ASSOICATED WITH movie ID = 2
SELECT cinemas.id, cinemas.city_name
  FROM cinemas 
    JOIN movies_cinemas ON movies_cinemas.cinema_id = cinemas.id
    JOIN movies ON movies_cinemas.movie_id = movies.id
    WHERE movies.id = 2;

-- OUTPUT 
--    id |          name          
-- ----+-------------------------
--   1 | London
--   4 | Watford
```