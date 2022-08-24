# Two Tables (Many-to-Many) Design Recipe Template

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORIES:

As a coach
So I can get to know all students
I want to keep a list of students' names.

As a coach
So I can get to know all students
I want to assign tags to students (for example, "happy", "excited", etc).

As a coach
So I can get to know all students
I want to be able to assign the same tag to many different students.

As a coach
So I can get to know all students
I want to be able to assign many different tags to a student.

```

```
Nouns:

students => id, name
student_tags => student_id, tag_id
tags => id, name
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| students              | id, name
| student_tags          | student_id, student_id
| tags                  | id , name

1. Name of the first table (always plural): `students` 

    Column names: `id`, `names`

2. Name of the second table (always plural): `tags` 

    Column names: `id`, `name`

## 3. Decide the column types.

```
# EXAMPLE:

Table: students
id: SERIAL
name: text

Table: tags
id: SERIAL
name: text
```

## 4. Design the Many-to-Many relationship

Make sure you can answer YES to these two questions:

1. Can one student have many tags? (YES)
2. Can one tag have many students? (YES)


## 5. Design the Join Table

The join table usually contains two columns, which are two foreign keys, each one linking to a record in the two other tables.

The naming convention is `students_tags`.

```
# EXAMPLE

Join table for tables: student and tags
Join table name: students_tags
Columns: student_id, tag_id
```

## 4. Write the SQL.

```sql
-- EXAMPLE


-- Create the first table.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text
);

-- Create the second table.
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name text
);

-- Create the join table.
CREATE TABLE students_tags (
  student_id int,
  tag_id int,
  constraint fk_post foreign key(student_id) references students(id) on delete cascade,
  constraint fk_tag foreign key(tag_id) references tags(id) on delete cascade,
  PRIMARY KEY (student_id, tag_id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < students_tags.sql
```

## QUERY TO TEST DB
```sql
-- ALL TAGS ASSOICATED WITH STUDENT ID = 2
SELECT tags.id, tags.name
  FROM tags 
    JOIN students_tags ON students_tags.tag_id = tags.id
    JOIN students ON students_tags.student_id = students.id
    WHERE students.id = 2;

-- OUTPUT 
--    id |          name          
-- ----+-------------------------
--   1 | happy
--   4 | legend
```