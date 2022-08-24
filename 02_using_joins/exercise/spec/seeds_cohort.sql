-- TRUNCATE TABLE cohorts RESTART IDENTITY; 
-- TRUNCATE TABLE students RESTART IDENTITY;


TRUNCATE cohorts, students RESTART IDENTITY;

INSERT INTO cohorts (name, starting_date) VALUES ('March', '2021-03-03');
INSERT INTO cohorts (name, starting_date) VALUES ('Jan', '2021-01-01');

INSERT INTO students (name, cohort_id) VALUES ('Fly',1);
INSERT INTO students (name, cohort_id) VALUES ('Slo',2);



