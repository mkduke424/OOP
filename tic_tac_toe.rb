require 'pry'

# player class to hold players and pices
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end
end

class Board
  attr_accessor :arr_board_spaces

  def initialize
    @arr_board_spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = "|_1_|_2_|_3_| \n |_4_|_5_|_6_| \n |_7_|_8_|_9_|"
  end

  def board
    @board = " |_#{arr_board_spaces[0]}_|_#{arr_board_spaces[1]}_|"\
    "_#{arr_board_spaces[2]}_| \n |_#{arr_board_spaces[3]}_|_#{arr_board_spaces[4]}_|_"\
    "#{arr_board_spaces[5]}_| \n |_#{arr_board_spaces[6]}_|_#{arr_board_spaces[7]}_|_#{arr_board_spaces[8]}_|"
  end

  def take_turn(name, piece)
    print "Make your move #{name}: "
    space = gets.chomp.to_i
    arr_board_spaces[arr_board_spaces.index(space)] = piece


    if !check_for_winner?(piece)
      puts board + "\n"
      puts name + " won!!!!"
      "exit"
    elsif arr_board_spaces.all? {|a| a.class == String}
    puts board + "\n"
    puts" Looks like it's a Tie!!!"
    "exit"
    else
      puts board + "\n"
    end
  end

  def check_for_winner?(piece)
    if (arr_board_spaces[0] == piece && arr_board_spaces[1] == piece && arr_board_spaces[2] == piece) \
    || (arr_board_spaces[3] == piece && arr_board_spaces[4] == piece && arr_board_spaces[5] == piece) \
    || (arr_board_spaces[6] == piece && arr_board_spaces[7] == piece && arr_board_spaces[8] == piece) \
    || (arr_board_spaces[0] == piece && arr_board_spaces[3] == piece && arr_board_spaces[6] == piece) \
    || (arr_board_spaces[1] == piece && arr_board_spaces[4] == piece && arr_board_spaces[7] == piece) \
    || (arr_board_spaces[2] == piece && arr_board_spaces[5] == piece && arr_board_spaces[8] == piece) \
    || (arr_board_spaces[2] == piece && arr_board_spaces[4] == piece && arr_board_spaces[6] == piece) \
    || (arr_board_spaces[0] == piece && arr_board_spaces[4] == piece && arr_board_spaces[8] == piece)
      false
    else
      true
    end
  end
end

print 'Player 1:X Whats your name: '
player1 = Player.new(gets.chomp, 'X')
print "Player 2:O What's your name: "
player2 = Player.new(gets.chomp, 'O')

board1 = Board.new
puts board1.board

loop do
  begin
  break if board1.take_turn(player1.name, player1.piece) == 'exit'
  break if board1.take_turn(player2.name, player2.piece) == 'exit'
  rescue
    puts "Wrong input bud :( try again"
  end
end
