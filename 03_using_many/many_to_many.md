```
-- Select all the tags associated with a given post.
-- Note how we're using two different joins to "link"
-- all the three tables together:
--    * first, by matching only records in the join table for the given post
--    * second, by matching only tags for these records in the join table
```
```sql

SELECT tags.id, tags.name
  FROM tags 
    JOIN posts_tags ON posts_tags.tag_id = tags.id
    JOIN posts ON posts_tags.post_id = posts.id
    WHERE posts.id = 2;
 ```


 ```sql

INSERT INTO posts (title) VALUES ('My amazing post');
-- New post inserted with id 3

INSERT INTO tags (name) VALUES ('poetry');
-- New tag inserted with id 5

INSERT INTO posts_tags (post_id, tag_id) VALUES (3, 5);
```


