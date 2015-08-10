class Ending
  attr_accessor :name, :score

  def initialize(**opts)
    self.name = opts.fetch(:name) 
    self.score = opts.fetch(:score)
  end

  def declaration
    puts "congratulations #{name} you scored #{score} and won the game!"
  end
end
