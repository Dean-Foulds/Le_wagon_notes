class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for_name_and_description
    attributes = {}
    puts "What's the recipe name?"
    print "> "
    attributes[:name] = gets.chomp
    puts "Please describe your recipe"
    print "> "
    attributes[:description] = gets.chomp
    return attributes
  end

  def ask_for_id_to_destroy
    puts "What's the recipe index you want to remove?"
    index = gets.chomp.to_i
    return index
  end
end