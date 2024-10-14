# frozen_string_literal: false

# Class used to display game board
class Board
  attr_accessor :states

  BOARD_BUILDER = {
    0 => ' ',
    'X' => 'X',
    'O' => 'O'
  }.freeze

  def initialize
    @states = Array.new(3) { Array.new(3, 0) } # Create a 2-D Array where 0 is a space with no sign in place
  end

  def generate_row(states_array, row_number, last_row: false)
    # Creates game board row and then prints the row to the console
    # Use with a method to generate the entire board
    # '\e[' escape code in use
    arr = Array.new(5) do |index|
      if index.even?
        # Divide by 2 to get the right index in the states array
        BOARD_BUILDER[states_array[row_number][index / 2]] 
      else
        '|'
      end
    end.join('')
    # False will underline all the characters in the row | True will remove the underline
    last_row ? (puts arr.insert(0, "\e[0m")) : (puts arr.insert(0, "\e[4m"))
  end

  def generate_board
    puts "\n"
    puts "\e[4;1mGame Board:\e[0m"
    puts "\n"
    # One the last row underline formatting will be removed
    3.times do |i|
      if i == 2
        generate_row(@states, i, last_row: true) if i == 2
      else
        generate_row(@states, i)
      end
    end
  end

  def check_row_win?(sign)
    @states.each_with_index do |row, index|
      puts "#{sign} wins! On row #{index + 1}" if row.all?(sign)
    end
  end

  def check_column_win?(sign)
    # checks for a column win based on the given sign
    column_win = false
    3.times do |column|
      if [@states[0][column], @states[1][column], @states[2][column]].all?(sign)
        column_win = true
        break
      end
    end
    column_win
  end

  # Checks the left to right diagonal condition depending on the given sign
  def left_to_right_check?(sign)
    [@states[0][0], @states[1][1], @states[2][2]].all?(sign)
  end

  # Checks the Right to left diagonal condition depending on the given sign
  def right_to_left_check?(sign)
    [@states[0][2], @states[1][1], @states[2][0]].all?(sign)
  end

  # Checks both left to right and right to left diagonal conditions based on a given sign
  def diagonal_check?(sign)
    [left_to_right_check?(sign), right_to_left_check?(sign)].any? ? true : false
  end
end
