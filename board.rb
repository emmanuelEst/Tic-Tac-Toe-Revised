# frozen_string_literal
 
# Class used to display game board
class Board
  attr_accessor :states

  def initialize
    @states = Array.new(3) {Array.new(3,0)} # Create a 2-D Array where 0 is a space with no sign in place
  end
end