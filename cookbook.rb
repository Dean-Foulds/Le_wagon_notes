require 'csv'
require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file)
    @filepath = csv_file

    @recipes = [] # Array of Recipe instances
    @html_doc = nil
    load_csv
  end

  def all
    #  This will call the load_csv method, which will import the csv file's
    #  data into the @recipes array. Then it will return the @recipes array.
    @recipes
  end

  def add_recipe(recipe)
    #  This will add the new recipe to the @recipes array
    @recipes << recipe

    write_csv
  end

  def remove_recipe(index)
    #  This will delete the recipe at a given index
    @recipes.delete_at(index)
    write_csv
  end

  def import(search_term)
    #  This will search the HTML markup and format the information into an array
    #  of arrays, with each sub-array containing strings of information about
    #  a particular recipe.
    open_url(search_term)

    unformatted_recipes = []
    recipes = []
    formatted_recipes = []


    @html_doc.search('.node.node-recipe.node-teaser-item.clearfix').each do |element|
      unformatted_recipes << element.text.strip.gsub(/\s{2,}/, ", ")
    end

    unformatted_recipes.each do |recipe|
      recipes << recipe.split(", ")
    end

    #  This process will select the revelant information from each sub-array
    #  and format this into a new array.
    recipes.each do |recipe|
      title = recipe[0]
      description = recipe[4]
      time = recipe[5]
      difficulty = recipe[6]
      formatted_recipes << [title, description, time, difficulty]
    end

    return formatted_recipes
  end

  def mark_recipe_completed(recipe_index)
    completed_recipe = @recipes[recipe_index]
    completed_recipe.mark_as_completed
    write_csv
  end

  private

  def load_csv
    #  This method will load the csv file and import the data into the @recipes
    #  array
    CSV.foreach(@filepath) do |row|
      recipe = Recipe.new(row[0], row[1], row[2], row[3], row[4])
      @recipes << recipe
    end
  end

  def write_csv
    CSV.open(@filepath, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.difficulty, recipe.completed]
      end
    end
  end

  def open_url(search_term)

    url = "http://www.bbcgoodfood.com/search/recipes?query=#{search_term}"

    @html_doc = Nokogiri::HTML(open(url))
  end
end
