class Game
  attr_accessor :number_of_players, :number_of_rounds

  def initialize
    self.number_of_players = 0
    self.number_of_players = number("players are there")
    self.number_of_rounds = 0
    self.number_of_rounds = number("rounds will be played")
    puts "#{number_of_players}"
    puts "#{number_of_rounds}"
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
    puts "What is player #{number}'s name?"
    new_player = gets.to_s.chomp
    player(number) = Player1.new(new_player)
    puts "Ok, #{new_player} is set up!"
  end

end
