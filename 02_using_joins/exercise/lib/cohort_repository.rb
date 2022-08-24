require_relative "./cohort.rb"
require_relative "./student.rb"

class CohortRepository

 def all
  sql = 'SELECT name, starting_date FROM cohorts;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_cohorts = []
  result_set.each do |record|
   cohort = Cohort.new
   cohort.name = record["name"]
   cohort.starting_date = record["starting_date"]

   all_cohorts << cohort
   end
   return all_cohorts
 end


 def find(id)
  sql = 'SELECT name, starting_date FROM cohorts WHERE id = $1;'
  result_set = DatabaseConnection.exec_params(sql, [id])

  result = result_set[0]

  cohort = Cohort.new
  cohort.name = result["name"]
  cohort.starting_date = result["starting_date"]

  return cohort
 end


 # adds a new cohort record using sql query
  def create(cohort)
    sql = 'INSERT INTO cohorts (name, starting_date) VALUES($1,$2);'
    DatabaseConnection.exec_params(sql, [cohort.name, cohort.starting_date])
    return nil
  end

 # deletes an cohort record using sql query
def delete(id)
  sql = 'DELETE FROM cohorts WHERE id = $1'
  DatabaseConnection.exec_params(sql, [id])
 return 
end

 # updates a record using query with updated info
 def update(cohort)
  sql = 'UPDATE cohorts SET name = $1, starting_date = $2 WHERE id = $3;'
  DatabaseConnection.exec_params(sql, [cohort.name, cohort.starting_date, cohort.cohort_id])
  return nil
 end

 def find_with_students(id)
  sql = 'SELECT
	cohorts.name,
	cohorts.starting_date,
	students.name,
	students.cohort_id
FROM
	cohorts
	JOIN students ON students.cohort_id = cohorts.id
WHERE
	cohorts.id = $1;'

  result = DatabaseConnection.exec_params(sql, [id])


   cohort = Cohort.new
   cohort.name = result.first['name']
   cohort.starting_date = result.first['starting_date']
    
  cohort.students = []
  result.each do |record|
    student = Student.new
    student.name = record['name']
    student.cohort_id = record['cohort_id']

    cohort.students << student
    end
   return cohort
  end
end