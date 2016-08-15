class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    # id, name, price
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_csv_row
    [@id, @name, @price]
  end

  def self.headers
    %w(id name price)
  end
end
