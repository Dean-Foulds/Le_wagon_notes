class Recipe
  attr_reader :name, :description, :time, :difficulty, :completed

  def initialize(name, description, time, difficulty, completed = "false")
    @name = name
    @description = description
    @time = time
    @difficulty = difficulty
    @completed = completed
  end

  def mark_as_completed
    @completed = "true"
  end
end


