require_relative "base_view"

class CustomersView < BaseView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}, #{customer.address}"
    end
  end
end
