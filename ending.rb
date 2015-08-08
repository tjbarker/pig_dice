class Ending
  attr_accessor :name, :score, :required_score

  def declaration
    puts "congratulations #{name} you scored #{score} and won the game!"
  end
end
