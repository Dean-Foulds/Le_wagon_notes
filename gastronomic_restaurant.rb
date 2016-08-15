require_relative "restaurant"

class GastronimicRestaurant < Restaurant

   def initialize(name, city, capacity, category)
    @name = name
    @city = city
    @capacity = capacity
    @category = category
    @clients = []
  end
