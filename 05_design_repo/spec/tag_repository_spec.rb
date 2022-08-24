require "tag_repository"

RSpec.describe TagRepository do

def reset_tags_table
seed_sql = File.read('spec/seeds.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'tester_db' })
connection.exec(seed_sql)
end

before(:each) do
reset_tags_table
end

  it "retrievs all tags for a given post" do
    repository = TagRepository.new
    tag = repository.find_by_post(1)

    expect(tag.posts.length).to eq(1)
    expect(tag.name).to eq('First Tag')
  end
end