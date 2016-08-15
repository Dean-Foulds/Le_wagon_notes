class Recipe
  attr_reader :name
  attr_accessor :url, :description, :cooking_time

  def initialize(name, description)
    @name = name
    @description = description
    @url = nil
    @cooking_time = nil
    @tested = false
  end

  def tested?
    return @tested
  end

  def mark_as_tested
    @tested = true
  end
end
