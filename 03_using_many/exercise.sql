-- Use a SELECT query with a JOIN to retrieve all the posts associated with the tag 'travel'.

SELECT posts.id, posts.title
  FROM posts 
    JOIN posts_tags ON posts_tags.post_id = posts.id
    JOIN tags ON posts_tags.tag_id = tags.id
    WHERE tags.id = 2;


-- Output
 id |          title          
----+-------------------------
  4 | My weekend in Edinburgh
  6 | A foodie week in Spain
