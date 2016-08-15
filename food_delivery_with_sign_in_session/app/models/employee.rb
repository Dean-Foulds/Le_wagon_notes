class Employee
  attr_reader :username, :password

  def initialize(attributes = {})
    # id,username,password,role
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]  # manager / delivery_guy
  end

  def manager?
    @role == "manager"
  end

  def to_csv_row
    [@id, @username, @password, @role]
  end

  def self.headers
    %w(id username password role)
  end
end
