require_relative "../models/meal"
require_relative "../views/meals_view"

class MealsController
  # User actions?

  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsView.new
  end

  def add
    # 1. Ask the user about the meal name
    name = @view.ask_for(:name)
    # 2. Ask the user about the price
    price = @view.ask_for_price
    # 3. Build a meal instance
    new_meal = Meal.new(name: name, price: price)
    # 4. Give the meal to the MealsRepository
    @meals_repository.add(new_meal)
  end

  def list
    # 1. Ask the repo for meals list
    meals = @meals_repository.all
    # 2. Ask the view to print meals
    @view.display(meals)
  end
end



