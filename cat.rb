class Cat

def initialize(name, color)
  @name = name
  @color = color
end

def dye(new_color)
  @color = new_color
end

def self.branch
  return "Mammals" # will return false
end
end


felix = Cat.new("felix", "black")
p felix
