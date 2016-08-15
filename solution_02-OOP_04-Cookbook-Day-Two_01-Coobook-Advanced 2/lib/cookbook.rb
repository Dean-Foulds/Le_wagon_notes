require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)  # csv_file is a String (file path)
    @csv_file = csv_file

    @recipes = []  # IMPORTANT: Array of `Recipe` instances.

    load_csv
  end

  def all
    return @recipes
  end

  def find(index)
    return @recipes[index]
  end

  def add_recipe(recipe)  # recipe is a `Recipe` instance.
    @recipes << recipe
    write_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    write_csv
  end

  def save
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      if row[2] == "true"
        recipe.mark_as_tested
      end
      recipe.cooking_time = row[3]

      @recipes << recipe
    end
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        # recipe is a `Recipe` instance
        csv << [recipe.name, recipe.description, recipe.tested?, recipe.cooking_time]
      end
    end
  end
end
