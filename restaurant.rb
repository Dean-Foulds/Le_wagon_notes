require_relative "restaurant"

class Restaurant
  def initialize(name, city, capacity, category)
    @name = name
    @city = city
    @capacity = capacity
    @category = category
    @clients = []
  end

  def book(client_name)
    @clients << client_name
  end
  # def open?
  #   if Time.now.hour >= 18 && Time.now.hour <= 22
  #     return true
  #   else
  #     return false
  # end
  # Below refactored
  def open?
    return Time.now.hour >= 18 && Time.now.hour <= 22
  end



end
