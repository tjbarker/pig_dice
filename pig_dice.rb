class Player
  attr_accessor :name, :dice_roll1, :dice_roll2, :total_dice, :turn_score, :roll_score, :total_score, :turn_counter, :total_rounds, :player_name

  def initialize(player_name)
    self.player_name = player_name
    self.score = []
    self.turn_counter = 0
    self.turn_score = 0
    self.roll_score = 0
    self.total_score = 0
    self.total_rounds = 1
  end

  def change_score

  end
  def greeting
    puts 'What is your player name? '
    self.player_name = gets.chomp
    puts 'How many rounds would you like to play? '
    self.total_rounds = gets.chomp.to_i
    puts "Ok #{player_name}, let's play #{total_rounds} rounds!"
  end

  def play
    while total_rounds > turn_counter do
      roll
    end
  end

  def end_turn
    self.roll_score = 0
    self.turn_counter += 1
  end

  def roll
    puts "\nYour current roll score is #{roll_score}, \nyour total score is #{total_score}, \nand you've got #{total_rounds - turn_counter} moves left. \nWould you like to Roll or Hold?"
    player_move = gets.chomp
    if player_move.downcase == 'roll'
      puts "\nok, lets roll"
      self.dice_roll1 = 1 + rand(6)
      self.dice_roll2 = 1 + rand(6)
      self.total_dice = dice_roll1 + dice_roll2
      puts "you rolled a #{dice_roll1} and a #{dice_roll2}"
      if (total_dice == 2)
        puts 'That was a terminal role, your total score is now 0.'
        self.total_score = 0
        end_turn
      elsif ((dice_roll1 == 1) || (dice_roll2 == 1))
        puts 'That\'s the end of your turn!'
        end_turn
      else
        puts "your roll added #{total_dice} to your roll score"
        self.roll_score += total_dice
      end
    elsif player_move.downcase == 'hold'
      puts 'fine, we can hold that score'
      self.total_score += roll_score
      end_turn
    else
      puts 'error incorrect command'
      self.turn_counter += 1
    end
  end

  def ending
    self.total_score += roll_score
    puts "Great Game #{player_name}, after #{total_rounds} rounds you scored #{total_score}!"
  end

end

class Game

  def initailize

  end

  def create_players

  end

  def add_player
    puts 'What would you like to be called?'
    player_name = gets.chomp

  end
end


player1 = Player.new

player1.greeting
player1.play
player1.ending
