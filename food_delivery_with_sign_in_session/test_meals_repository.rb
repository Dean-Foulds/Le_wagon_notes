require_relative "app/repositories/meals_repository"

csv_file = "data/meals.csv"
repo = MealsRepository.new(csv_file)

repo.add(Meal.new(name: "Regina", price: 10))
