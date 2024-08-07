# frozen_string_literal: false

# Class used to display game board
class Board
  attr_accessor :states

  def initialize
    @states = Array.new(3) { Array.new(3, 0) } # Create a 2-D Array where 0 is a space with no sign in place
  end

  def generate_row(last_row: false)
    # Creates game board row and then prints the row to the console
    # Use with a method to generate the entire board
    # '\e[' escape code in use
    if last_row == true
      puts Array.new(5) { |i| i.even? ? ' ' : '|' }.join('')
    else
      arr = Array.new(5) { |i| i.even? ? "\e[4m \e[0m" : "\e[4m|\e[0m" } # when i is even '_' will be added | when i is not even '|' is added
      puts arr.join('')
    end
  end

  def generate_board
    puts "\n"
    puts "\e[4;1mGame Board:\e[0m"
    puts "\n"
    3.times { |i| i == 2 ? generate_row(last_row: true) : generate_row }
    puts "\n"
  end
end
