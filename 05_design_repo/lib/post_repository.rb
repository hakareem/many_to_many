require_relative "./tag.rb"
require_relative "./post.rb"

class PostRepository

 def all
  sql = 'SELECT title FROM posts;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_posts = []
  result_set.each do |record|
   post = Post.new
   post.title = record["title"]

   all_posts << post
   end
   return all_posts
 end


 def find(id)
  sql = 'SELECT id, title FROM posts WHERE id = $1;'
  result_set = DatabaseConnection.exec_params(sql, [id])

  result = result_set[0]

  post = Post.new
  post.title = result["title"]
  post.id = result["id"]

  return post
 end


 # adds a new post record using sql query
  def create(post)
    sql = 'INSERT INTO posts (title) VALUES($1);'
    DatabaseConnection.exec_params(sql, [post.title])
    return nil
  end

 # deletes an post record using sql query
def delete(id)
  sql = 'DELETE FROM posts WHERE id = $1'
  DatabaseConnection.exec_params(sql, [id])

  sql_2 = 'DELETE FROM posts_tags WHERE id = $1'
  DatabaseConnection.exec_params(sql_2, [id])
 return 
end

 # updates a record using query with updated info
 def update(post)
  sql = 'UPDATE posts SET title = $1 WHERE id = $2;'
  DatabaseConnection.exec_params(sql, [post.title, post.id])
  return nil
 end

 def find_by_tag(tag)
  sql = 'SELECT posts.id, posts.title
    FROM posts 
    JOIN posts_tags ON posts_tags.post_id = posts.id
    JOIN tags ON posts_tags.tag_id = tags.id
    WHERE tags.id = $1;'

  result = DatabaseConnection.exec_params(sql, [tag])
  p result.first
   post = Post.new
   post.title = result.first['title']
    
    post.tags = []
    result.each do |record|
    tag = Tag.new
    tag.name = record['name']
    
    post.tags << tag
    end
   return post
  end
end