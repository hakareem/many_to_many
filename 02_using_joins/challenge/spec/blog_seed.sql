TRUNCATE posts, comments RESTART IDENTITY;

INSERT INTO posts (title, content) VALUES ('Sky Garden', 'what is even that?');
INSERT INTO posts (title, content) VALUES ('April fool', 'very original and funny');

INSERT INTO comments (name, content, post_id) VALUES ('John','surely that is not safe',1);
INSERT INTO comments (name, content, post_id) VALUES ('Mark','doesnt makes sense', 2);