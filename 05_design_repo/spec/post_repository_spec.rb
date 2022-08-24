require "post_repository"

RSpec.describe PostRepository do

def reset_post_table
seed_sql = File.read('spec/seeds.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'tag' })
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
 end

 it "creates a new post record" do
  repo = PostRepository.new
  post = Post.new
  post.title = "Lixies"

  repo.create(post)
  posts = repo.all

  added_post = posts.last
  expect(added_post.title).to eq("Lixies")  
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

   repo.update(post)
   new_post = repo.find(1)

   expect(new_post.title).to eq("Sky Garden")  
 end

 it "retrievs all tags for a given post" do
    repository = PostRepository.new
    post = repository.find_by_tag(2)

    expect(post.tags.length).to eq(1)
    expect(post.title).to eq('Sky Garden')
 end
end