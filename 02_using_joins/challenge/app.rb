require_relative 'lib/database_connection'
require_relative "lib/post_repository.rb"

class Application

  def initialize(database_name, io, post_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @post_repository = post_repository
  end

  def run
    @io.puts "Welcome to the posty post!"
    @io.puts "What would you like to see today?"
    @io.puts "Enter 1 for all posts"
    @io.puts "Enter 2 for all comments for a post"
    selection = @io.gets.chomp

    if selection.to_i == 1
       @io.puts "Here is the list of all posts:"
        @post_repository.all.each do |post|
        p "Title: #{post.title} - Content: #{post.content}"
        end
        elsif selection.to_i == 2
       @io.puts "Here is the list of comments:"
       post = @post_repository.find_with_comments(1)
        p "All comments for #{post.title} post: #{post.comments}"
        end
  end
end

  if __FILE__ == $0
  app = Application.new(
    'blog',
    Kernel,
    PostRepository.new
  )
  app.run
  end


