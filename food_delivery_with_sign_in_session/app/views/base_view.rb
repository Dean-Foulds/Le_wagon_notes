class BaseView
  def ask_for(label)
    puts "#{label}?"
    print "> "
    gets.chomp
  end
end
