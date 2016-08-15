require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all

    @view.list(recipes)
  end

  def create
    recipe_data = @view.create

    new_recipe = Recipe.new(recipe_data[0], recipe_data[1], recipe_data[2], recipe_data[3])

    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    recipe_index = @view.destroy

    @cookbook.remove_recipe(recipe_index)
  end

  def import
    search_term = @view.request_search_term

    imported_recipes = @cookbook.import(search_term)

    recipe_index = @view.import(imported_recipes)

    new_recipe = Recipe.new(imported_recipes[recipe_index][0], #  Recipe title
                            imported_recipes[recipe_index][1], #  Recipe description
                            imported_recipes[recipe_index][2], #  Recipe time
                            imported_recipes[recipe_index][3]) #  Recipe difficulty

    @cookbook.add_recipe(new_recipe)
  end

  def completed
    list

    recipe_index = @view.request_completed_recipe

    @cookbook.mark_recipe_completed(recipe_index)


  end
end

# Ask a user for a keyword to search
# Make a HTTP request to the recipe website with this keyword
# Parse the HTML document to extract useful recipe info
# Display to the user a list of recipes found
# Ask the user which recipe he/she wants to import
# (Optional) Make a new HTTP request to fetch more info (description, ...) from the recipe page
# Add the recipe to the Cookbook

