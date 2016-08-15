require "csv"
require_relative "base_repository"
require_relative "../models/customer"

class CustomersRepository < BaseRepository

  private

  def build_element(row)
    row[:id]       = row[:id].to_i      # Convert column to Fixnum
    Customer.new(row)
  end

end
