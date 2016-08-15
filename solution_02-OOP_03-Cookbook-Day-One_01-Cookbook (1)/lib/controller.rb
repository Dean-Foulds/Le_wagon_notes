require_relative 'recipe'
require_relative 'cookbook'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.recipes
    @view.display_recipes(recipes)
  end

  def create
    attributes = @view.ask_for_name_and_description
    recipe = Recipe.new(attributes)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    id = @view.ask_for_id_to_destroy
    @cookbook.remove_recipe(id)
  end
end
