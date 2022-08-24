require_relative 'lib/database_connection'
require_relative "lib/cohort_repository.rb"

class Application

  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @cohort_repository = cohort_repository
  end

  def run
    @io.puts "Welcome to the cohort manager!"
    @io.puts "Enter 1 to see list of cohorts"
    @io.puts "Enter 2 to see list of students for a single cohort"
    selection = @io.gets.chomp

    if selection.to_i == 1
       @io.puts "Here is the list of cohorts:"
        @cohort_repository.all.each do |cohort|
        p "Cohort Name: #{cohort.name} - Starting Date: #{cohort.starting_date}"
        end
        elsif selection.to_i == 2
       @io.puts "Here is the list of students:"
        cohort = @cohort_repository.find_with_students(1)
        p " All students for cohort #{cohort.name}: #{cohort.students}"
    end
  end
end

  if __FILE__ == $0
  app = Application.new(
    'cohort_test',
    Kernel,
    CohortRepository.new
  )
  app.run
  end


