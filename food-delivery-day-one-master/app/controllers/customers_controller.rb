require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # 1. ask for the name
    name = @view.ask_for(:name)
    # 2. ask for the address
    address = @view.ask_for(:address)
    # 3. Create the customer
    new_customer = Customer.new(name: name, address: address)
    # 4. store in the repo
    @customer_repository.add(new_customer)
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end
end
