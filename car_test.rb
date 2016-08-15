require_relative "car"

my_car = Car.new("red")
puts "Is my car started?"
puts my_car.engine_started? ? "Yes" : "No"
my_car.color = "black"
puts my_car.color
