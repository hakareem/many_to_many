require "post_repository"

RSpec.describe PostRepository do

def reset_post_table
seed_sql = File.read('spec/blog_seed.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
connection.exec(seed_sql)
end

before(:each) do
reset_post_table
end

 it "returns list of posts" do
  repo = PostRepository.new
  posts = repo.all
  expect(posts.length).to eq 2 
  expect(posts.first.title).to eq "Sky Garden" 
 end

 it "returns a single post" do
  repo = PostRepository.new
  post = repo.find(1)
  expect(post.title).to eq "Sky Garden" 
  expect(post.content).to eq "what is even that?" 
 end

 it "creates a new post record" do
  repo = PostRepository.new
  post = Post.new
  post.title = "Lixies"
  post.content = 'weekend is within a week'

  repo.create(post)
  posts = repo.all

  added_post = posts.last
  expect(added_post.title).to eq("Lixies")  
  expect(added_post.content).to eq('weekend is within a week') 
 end


 it "deletes an post from the list" do
   repo = PostRepository.new
   the_post = repo.find(1)

   repo.delete(the_post.post_id)

   all_posts = repo.all
   expect(all_posts.length).to eq(2) 
 end

 it "updates a post information" do
   repo = PostRepository.new

   post = repo.find(1)

   post.title = "May"
   post.content = 'who walked through the snow'

   repo.update(post)
   new_post = repo.find(1)

   expect(new_post.title).to eq("Sky Garden")  
   expect(new_post.content).to eq("what is even that?") 
 end

 it "retrievs all comments for a given post" do
    repository = PostRepository.new
    post = repository.find_with_comments(1)

    expect(post.comments.length).to eq(1)
    expect(post.title).to eq('Sky Garden')
 end
end