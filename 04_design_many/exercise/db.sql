DROP TABLE IF EXISTS "public"."students";

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

CREATE TABLE "public"."students" (
    "id" SERIAL,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."students_tags";

-- Table Definition
CREATE TABLE "public"."students_tags" (
    "student_id" int4,
    "tag_id" int4
);

DROP TABLE IF EXISTS "public"."tags";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS tags_id_seq;

-- Table Definition
CREATE TABLE "public"."tags" (
    "id" SERIAL,
    "name" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."students" ("id", "name") VALUES
(1, 'Penzema'),
(2, 'Modric'),
(3, 'Mark'),
(4, 'Messi'),
(5, 'Penaldo'),
(6, 'Mpaypal'),
(7, 'Lakaka');

INSERT INTO "public"."students_tags" ("student_id", "tag_id") VALUES
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

INSERT INTO "public"."tags" ("id", "name") VALUES
(1, 'happy'),
(2, 'excited'),
(3, 'champion'),
(4, 'legend');

ALTER TABLE "public"."students_tags" ADD FOREIGN KEY ("tag_id") REFERENCES "public"."tags"("id");
ALTER TABLE "public"."students_tags" ADD FOREIGN KEY ("student_id") REFERENCES "public"."students"("id");