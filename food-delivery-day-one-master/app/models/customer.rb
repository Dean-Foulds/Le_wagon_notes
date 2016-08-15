class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    # id, name, address
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_csv_row
    [@id, @name, @address]
  end

  def self.headers
    %w(id name price)
  end
end
