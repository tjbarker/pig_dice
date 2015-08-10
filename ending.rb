class Ending
  attr_accessor :name, :score

  def initialize
    self.name = name
    self.score = score
  end

  def declaration(name, score)
    puts "congratulations #{name} you scored #{score} and won the game!"
  end
end
