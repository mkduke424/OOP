# get input from a Player 1 and store it as x 
# get input from a player 2 and store it as y 

class Player 

  attr_reader :name, :piece

  def initialize(name,piece)
    @name = name
    @piece = piece
  end

end

# create a class named board 
# mthods - display_board, check_for_winner, winner
class Board 
  @arr_board_spaces = [1,2,3,4,5,6,7,8,9]
  @board = " |_#{arr_board_spaces[0]}_|_#{arr_board_spaces[0]}_|_#{arr_board_spaces[0]}_| \n |_#{arr_board_spaces[0]}_|_#{arr_board_spaces[0]}_|_#{arr_board_spaces[0]}_|\n |_7_|_8_|_9_|\n"
end

# print "Player 1 : x - What is your name: " 
# player1 = Player.new(gets.chomp, "x")

# print "Player 2 : y - What is your name: "
# player2 = Player.new(gets.chomp, "y")


# 
#player class 
#methods to get player piece, and player name



#logic 
# continuous loop to play until there is a winner 
# player 1 play -> display board -> check for winner -> player 2 play -> display board -> check for winner -> if winner display winner -> exit loop 