require_relative "./comment.rb"
require_relative "./post.rb"

class PostRepository

 def all
  sql = 'SELECT title, content FROM posts;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_posts = []
  result_set.each do |record|
   post = Post.new
   post.title = record["title"]
   post.content = record["content"]

   all_posts << post
   end
   return all_posts
 end


 def find(id)
  sql = 'SELECT title, content FROM posts WHERE id = $1;'
  result_set = DatabaseConnection.exec_params(sql, [id])

  result = result_set[0]

  post = Post.new
  post.title = result["title"]
  post.content = result["content"]

  return post
 end


 # adds a new post record using sql query
  def create(post)
    sql = 'INSERT INTO posts (title, content) VALUES($1,$2);'
    DatabaseConnection.exec_params(sql, [post.title, post.content])
    return nil
  end

 # deletes an post record using sql query
def delete(id)
  sql = 'DELETE FROM posts WHERE id = $1'
  DatabaseConnection.exec_params(sql, [id])
 return 
end

 # updates a record using query with updated info
 def update(post)
  sql = 'UPDATE posts SET title = $1, content = $2 WHERE id = $3;'
  DatabaseConnection.exec_params(sql, [post.title, post.content, post.post_id])
  return nil
 end

 def find_with_comments(id)
  sql = 'SELECT
	posts.title,
	posts.content,
	comments.name,
 comments.content,
	comments.post_id
FROM
	posts
	JOIN comments ON comments.post_id = posts.id
WHERE
	posts.id = $1;'

  result = DatabaseConnection.exec_params(sql, [id])


   post = Post.new
   post.title = result.first['title']
   post.content = result.first['content']
    
  post.comments = []
  result.each do |record|
    comment = Comment.new
    comment.name = record['name']
    comment.content = record['content']

    post.comments << comment
    end
   return post
  end
end