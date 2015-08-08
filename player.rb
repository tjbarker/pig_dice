class Player
  attr_accessor :name, :total_score

  def initialize(number)
    puts "Player #{number}, what is your name?"
    self.name = gets.chomp.capitolize
    self.total_score = 0
    puts "Ok, #{name}'s account is set up.'"
  end

  def score(turn_score)
    self.total_score += turn_score
  end

  def have_turn(dice)
    first_roll = dice.roll
    second_roll = dice.roll
    [first_roll, second_roll]
  end
end
