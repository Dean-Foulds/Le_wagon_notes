class View
  def ask_for_keyword
    puts "Type an ingredient"
    print "> "
    gets.chomp
  end

  def print_recipes(recipes)
    # recipes is a parameter. Array of `Recipe` instances.
    recipes.each_with_index do |recipe, index|
      # recipe is of class Recipe
      # index is a Fixnum (starting at 0)
      x = recipe.tested? ? "x" : " "
      puts "#{index + 1}. [#{x}] (#{recipe.cooking_time}) #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_recipe_name
    puts "Name of recipe?"
    return gets.chomp
  end

  def ask_user_for_recipe_description
    puts "Description?"
    return gets.chomp
  end

  def ask_user_for_recipe_index
    puts "Which recipe?"
    return gets.chomp.to_i - 1
  end
end
