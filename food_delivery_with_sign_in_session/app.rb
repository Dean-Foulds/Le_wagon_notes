# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative "app/repositories/employees_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/customers_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/meals_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"

employee_csv = "data/employees.csv"
employee_repository = EmployeesRepository.new(employee_csv)
sessions_controller = SessionsController.new(employee_repository)

customers_csv = "data/customers.csv"
customer_repository = CustomersRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repository)

meals_csv = "data/meals.csv"
meals_repository = MealsRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)
router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
