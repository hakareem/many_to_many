-- Use SQL to insert a new tag 'sql' and associate the post titled 'SQL basics' with this tag.

-- Then use a SELECT query with a JOIN to retrieve all posts associated with the tag 'sql' and verify the above worked.


INSERT INTO tags (name) VALUES ('sql');
-- New tag inserted with id 5

INSERT INTO posts_tags (post_id, tag_id) VALUES (7,5);

-- 

SELECT posts.id, posts.title
  FROM posts 
    JOIN posts_tags ON posts_tags.post_id = posts.id
    JOIN tags ON posts_tags.tag_id = tags.id
    WHERE tags.id = 5;
    
    -- OUTPUT
    --      id |      title          
    -- ----+-------------------------
    --   7 | SQL basics
