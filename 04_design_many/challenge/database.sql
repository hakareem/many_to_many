DROP TABLE IF EXISTS "public"."movies";

CREATE SEQUENCE IF NOT EXISTS movies_id_seq;

CREATE TABLE "public"."movies" (
    "id" SERIAL,
    "title" text,
    "release_date" date,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."movies_cinemas";

-- Table Definition
CREATE TABLE "public"."movies_cinemas" (
    "movie_id" int4,
    "cinema_id" int4
);

DROP TABLE IF EXISTS "public"."cinemas";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS cinemas_id_seq;

-- Table Definition
CREATE TABLE "public"."cinemas" (
    "id" SERIAL,
    "city_name" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."movies" ("id", "title", "release_date") VALUES
(1, 'The Hunt', '1999-11-13'),
(2, 'The Wizard','2012-11-13'),
(3, 'The Witch','2050-11-13'), 
(4, 'The Rain', '2022-11-13'),
(5, 'Football', '2000-05-10'), 
(6, 'Vik', '1808-08-08'),
(7, 'Hourglass', '1959-10-12');

INSERT INTO "public"."movies_cinemas" ("movie_id", "cinema_id") VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 2),
(7, 1),
(6, 3),
(2, 4),
(3, 4);

INSERT INTO "public"."cinemas" ("id", "city_name") VALUES
(1, 'London'),
(2, 'Manchester'),
(3, 'Liverpool'),
(4, 'Watford');

ALTER TABLE "public"."movies_cinemas" ADD FOREIGN KEY ("cinema_id") REFERENCES "public"."cinemas"("id");
ALTER TABLE "public"."movies_cinemas" ADD FOREIGN KEY ("movie_id") REFERENCES "public"."movies"("id");