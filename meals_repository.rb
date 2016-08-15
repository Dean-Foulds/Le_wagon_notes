require 'csv'
require_relative '../models/meal'

class MealsRepository

  def initialize(filepath)
    @filepath = filepath

    @meals = []
    load_csv
  end

  def all
    #  This will return an array of every meal stored
    @meals
  end

  def add(meal)
    #  This will add a new meal to the @meals array
    @meals << meal
    write_csv
  end

  private

  def load_csv
    #  This will import the information from the csv file into new Meal
    #  instances, which are stored in the @meal array. This will only happen if
    #  the filepath exists.
    if File.exists?(@filepath)
      csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }


      CSV.foreach(@filepath, csv_options) do |row|
        meal = Meal.new(id: row["id"].to_i, name: row["name"], price: row["price"].to_i)
        @meals << meal
      end
      @meals
    else
      puts "File does not exist"
    end
  end

  def write_csv
    #  This will write the information in the @meals array to the meals.csv file
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"', headers: :first_row }

    CSV.open(@filepath, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'price']
      i = 1
      @meals.each do |meal|
        meal.id = i
        csv << [meal.id, meal.name, meal.price]
        i += 1
      end
    end
  end
end
