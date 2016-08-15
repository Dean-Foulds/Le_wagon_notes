require_relative "recipe"
require_relative "view"
require_relative "jamie_oliver"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def import
    # 1. Ask the user for a keyword
    keyword = @view.ask_for_keyword

    # 2. Scrape JamieOliver for that keyword
    scraper = JamieOliver.new
    results = scraper.search(keyword)

    # 3. Present results to the user
    @view.print_recipes(results)

    # 4. Ask the user for a recipe to import
    index = @view.ask_user_for_recipe_index
    recipe = results[index]

    # 5. Fetch description from Jamie Oliver's recipe page
    scraper.enrich(recipe)

    # 6. Give the recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def mark_as_tested
    # 1. List the recipes
    list

    # 2. Ask the user for a specific recipe
    index = @view.ask_user_for_recipe_index

    # 3. Find the recipe from cookbook
    recipe = @cookbook.find(index)

    # 4. Mark as tested
    recipe.mark_as_tested
    @cookbook.save
  end

  def list
    # 1. Get the recipes from the cookbook
    recipes = @cookbook.all
    # 2. Give recipes to the view
    @view.print_recipes(recipes)
  end

  def create
    # 1. Ask the user for name
    name = @view.ask_user_for_recipe_name
    # 2. Ask the user for description
    description = @view.ask_user_for_recipe_description
    # 3. Create a new Recipe instance
    recipe = Recipe.new(name, description)
    # 4. Give this recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. List the recipes
    list
    # 2. Ask the user for recipe index
    index = @view.ask_user_for_recipe_index
    # 3. Ask cookbook to remove recipe at specified index
    @cookbook.remove_recipe(index)
  end
end


