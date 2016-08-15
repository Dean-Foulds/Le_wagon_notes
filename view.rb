class View
  #  List all recipes

  def list(recipes)
    p recipes
    puts "====================="

    recipes.each_with_index do |recipe, index|
      if recipe.completed == "true"
        puts "**Recipe #{index + 1} - #{recipe.name} - Completed**"
      else
        puts "**Recipe #{index + 1} - #{recipe.name}**"
      end
      puts "Cooking time: #{recipe.time}"
      puts "Difficulty: #{recipe.difficulty}"
      puts "Description: #{recipe.description}"
      puts ""
    end
  end

  #  Create new recipe
  def create
    puts "Please enter the recipe title:"
    print "> "
    name = gets.chomp
    puts "Please enter a description of the recipe:"
    print "> "
    description = gets.chomp
    puts "How long does this recipe take to cook?"
    print "> "
    time = gets.chomp
    puts "How difficult is this recipe?"
    print "> "
    difficulty = gets.chomp
    return [name, description, time, difficulty]
  end


  #  Remove (destroy) recipe
  def destroy
    puts "Which recipe would you like to remove?"
    puts "Please enter the recipe number below."
    print "> "
    (gets.chomp.to_i - 1)
  end

  def request_search_term
    #  This will request a keyword to search for on BBC GoodFood
    puts "What would you like to search for?"
    print "> "
    search_term = gets.chomp
  end

  def import(imported_recipes)
    #  This will list all the recipes retrieved from BBC GoodFood
    puts "We searched BBC GoodFood and found #{imported_recipes.length} results"
    imported_recipes.each_with_index do |recipe, index|
      puts "#{index + 1} -> #{recipe[0]} - #{recipe[2]} - #{recipe[3]}"
    end
    puts "\n Which recipe would you like to import?"
    print "> "
    recipe_index = (gets.chomp.to_i - 1)
  end

  def request_completed_recipe
    #  This will request the user to enter which recipe they have completed
    puts "Which recipe would you like to mark as completed?"
    print "> "
    completed_recipe = (gets.chomp.to_i - 1)
  end
end
