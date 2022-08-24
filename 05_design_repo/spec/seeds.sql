TRUNCATE posts, tags, posts_tags RESTART IDENTITY CASCADE; 

INSERT INTO posts (title) VALUES ('First Post');

INSERT INTO tags (name) VALUES ('First Tag');

INSERT INTO posts_tags (post_id, tag_id) VALUES (1, 1);




INSERT INTO posts (title) VALUES ('Second Post');

INSERT INTO tags (name) VALUES ('Second Tag');

INSERT INTO posts_tags (post_id, tag_id) VALUES (2, 2);

-- INSERT INTO posts (title) VALUES ('Third Post');
-- INSERT INTO tags (name) VALUES ('Third Tag');