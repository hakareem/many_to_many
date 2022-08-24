require "cohort_repository"

RSpec.describe CohortRepository do

def reset_cohorts_table
seed_sql = File.read('spec/seeds_cohort.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'cohort_test' })
connection.exec(seed_sql)
end

before(:each) do
reset_cohorts_table
end

 it "returns list of cohorts" do
  repo = CohortRepository.new
  cohorts = repo.all
  expect(cohorts.length).to eq 2 
  expect(cohorts.first.name).to eq "March" 
 end

 it "returns a single cohort" do
   repo = CohortRepository.new
  cohort = repo.find(1)
  expect(cohort.name).to eq "March" 
  expect(cohort.starting_date).to eq "2021-03-03" 
 end

 it "creates a new cohort record" do
  repo = CohortRepository.new
  cohort = Cohort.new
  cohort.name = "Lixies"
  cohort.starting_date = '2021-01-01'

  repo.create(cohort)
  cohorts = repo.all

  added_cohort = cohorts.last
  expect(added_cohort.name).to eq("Lixies")  
  expect(added_cohort.starting_date).to eq('2021-01-01') 
 end


 it "deletes an cohort from the list" do
   repo = CohortRepository.new
   the_cohort = repo.find(1)

   repo.delete(the_cohort.cohort_id)

   all_cohorts = repo.all
   expect(all_cohorts.length).to eq(2) 
 end

 it "updates a cohort information" do
   repo = CohortRepository.new

   cohort = repo.find(1)

   cohort.name = "May"
   cohort.starting_date = '2021-01-01'

   repo.update(cohort)
   new_cohort = repo.find(1)

   expect(new_cohort.name).to eq("March")  
   expect(new_cohort.starting_date).to eq("2021-03-03") 
 end

 it "retrievs all students for a given cohort" do
    repository = CohortRepository.new
    cohort = repository.find_with_students(1)

    expect(cohort.students.length).to eq(1)
    expect(cohort.name).to eq('Fly')
 end
end