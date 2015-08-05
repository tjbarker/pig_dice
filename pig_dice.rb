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

  def add_players
#    number_of players = 0
#    while add_another_player == yes do
#      puts 'what is the players name?'
#      player_name = gets.to_s.chomp
#      player_name = Player(player_name).new
#      number_of_players += 1
#      puts 'Would you like to add another player?'
#      add_another_player = gets.to_s.chomp
#    end
    puts 'add player'
  end
end

----------------------------------------------------------------------------
class Dice
  def roll
    rand(6) + 1
  end
end

class Player1
  attr_reader :name
  attr_accessor :score

  def initialize(name)
    self.score = {}
    create_score(total_score, 0)
    create_score(roll_score, 0)
    create_score(turn_counter, 0)
  end

  def create_score(title, value)
    self.score.push((title: title, value: value))
  end

  def change_score(title, value)
    self.score["#{title}"] = value
  end
end
class SetUp
class Game
  attr_accessor :number_of_players, :number_of_rounds

  def initialize
    self.number_of_players = 0
    self.number_of_players = number("players are there")
    self.number_of_rounds = 0
    self.number_of_rounds = number("rounds will be played")
    create_players 
  end

  def number(statement)
    puts "how many #{statement}?"
    gets.to_i.chomp
  end

  def create_players
    i = 0
    until i == number_of_players do
      create_player(i + 1)
      i += 1
    end
  end

  def create_player(number)
    puts "What is new players name?"
    new_player = gets.to_s.chomp
    player(number) = Player1.new(new_player)
    puts "Ok, #{new_player} is set up!"
  end

end


player1 = Player1.new(tom)
player1.to_s
