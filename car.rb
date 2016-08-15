class Car

  def initialize(color) # constructor
    @color = color # need to pass argument
    @engine_started = false
  end

  def start # is an instance method
    @engine_started = true
  end

  def engine_started?
    return @engine_started
  end

  attr_reader :color, :engine_started # shortcut for code below and above
  # def color
  #   return @color
  # end
  #
  attr_writer :color
  #attr_writer + attr_reader = attr_accessor

end

# red_car = Car.new("red")
# puts "Is my car started?"
# puts red_car.engine_started? ? "Yes" : "No"

# initiate a red car
# red_car = Car.new("red")


# call the instance method 'start' on the instance method red_car
# red_car.start



# to load in irb "load car.rb"
# [5] pry(main)> my_car = Car.new
# => #<Car:0x007f91e3d12be0>
# [6] pry(main)> your_car =Car.new
# => #<Car:0x007f91e3d33b60>
# [7] pry(main)>exit
#
# [3] pry(main)> load "car.rb"
# => true
# [4] pry(main)> blue_car.new
# NameError: undefined local variable or method `blue_car' for main:Object
# from (pry):4:in `<main>'
# [5] pry(main)> blue_car = Car.new
# ArgumentError: wrong number of arguments (given 0, expected 1)
# from car.rb:2:in `initialize'
# [6] pry(main)> blue_car = Car.new("blue")
# => #<Car:0x007ffb02e84720 @color="", @engine_stated=false>
# [7] pry(main)> blue_car.start
# NoMethodError: undefined method `start' for #<Car:0x007ffb02e84720 @color="", @engine_stated=false>
# from (pry):7:in `<main>'
# [8] pry(main)> blue_car.start
# NoMethodError: undefined method `start' for #<Car:0x007ffb02e84720 @color="", @engine_stated=false>
# from (pry):8:in `<main>'
# [9] pry(main)>
#
#  Le_wagon_notes                                                                     [2.3.1]

