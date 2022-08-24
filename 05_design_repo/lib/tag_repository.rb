require_relative "./tag.rb"
require_relative "./post.rb"

class TagRepository
def find_by_post(id)
    sql = 'SELECT tags.name
      FROM tags 
      JOIN posts_tags ON posts_tags.tag_id = tags.id
      JOIN posts ON posts_tags.post_id = posts.id
      WHERE posts.id = $1;'

    result = DatabaseConnection.exec_params(sql, [id])

      tag = Tag.new
      tag.name = result.first['name']
      
      tag.posts = []
      result.each do |record|
      post = Post.new
      post.title = record['title']
      
      tag.posts << post
      end
    return tag
    end
   end