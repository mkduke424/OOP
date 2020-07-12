require 'pry'

# there are two objects a user and a mastermind 

# maser mind - creates a random code of 4 colors/ play round/ give clues/ reveal winner or loser 
class Mastermind

  attr_reader :master_code
  
  def initialize(color_array = %w[white orange blue black purple green])  
    @master_code = color_array.sample(4)
  end

  def play_round(guess)
    hint = ["O","O","O","O"]

    master_code.each_with_index do |item, index|
      if item == guess[index]
        hint[index] = item
      end
    end
    p hint
  end

  def cracked_code?(guess)
    if guess == master_code
      puts  "Congratulations you cracked the secret code => #{master_code}"
      true
    else
      false
    end
  end
end

# player guesses a code / if player is a computer they make better guesses depending on mastermind clues
class Guesser 
  attr_accessor :guess

  def initialize
    @guess = ""
  end

  def new_guess
    print " What would you like your guess to be: "
    @guess = gets.chomp.downcase.split(" ")
  end

end
# create  an option for the user to be a mastermind or a guesser 
computer = Mastermind.new
human = Guesser.new

# logic - play 12 rounds -> if code is guessed correctly then stop.
# If not then give the guesser a hint of how accurate they were
1.upto(12) do |i|
  print "Round #{i}- "
  computer.play_round(human.new_guess)
  break if computer.cracked_code?(human.guess)
  if i == 12
    puts "Sorry you couldn't crack the code => #{computer.master_code}"
  end
end

