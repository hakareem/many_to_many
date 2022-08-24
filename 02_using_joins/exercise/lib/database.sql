CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date timestamp
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  id int4,
  constraint fk_cohort foreign key(id) references cohorts(id) on delete cascade 
);
