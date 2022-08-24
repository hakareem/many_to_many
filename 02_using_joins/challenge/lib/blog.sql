DROP TABLE IF EXISTS "public"."posts";

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "title" text,
    "content" text,
    PRIMARY KEY ("id")
);


DROP TABLE IF EXISTS "public"."comments";

CREATE SEQUENCE IF NOT EXISTS comments_id_seq;

CREATE TABLE "public"."comments" (
    "id" SERIAL,
    "name" text,
    "content" text,
    "post_id" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."posts" ("title", "content") VALUES
('Doolittle', "Very hot outside"),
('Surfer Rosa', "Very cold outside"),
('Waterloo', "Drink is liquid")

INSERT INTO "public"."comments" ("name", "content", "post_id") VALUES
('Joe', 'What are you doing?', 1),
('Rox', 'Did you see that?', 2),
('Mark', 'He ran away', 3)
