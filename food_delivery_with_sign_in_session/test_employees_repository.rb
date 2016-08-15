require_relative "app/repositories/employees_repository"

csv_path = "data/employees.csv"

repository = EmployeesRepository.new(csv_path)

p repository
