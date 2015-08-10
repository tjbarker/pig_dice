class Dice
  attr_accessor :decorator

  def initialize(**opts)
    self.decorator = opts.fetch(:decorator)
  end

  def roll
    response = nil
    until response == 'r' do
      puts 'Type "r" to roll'
      response = gets.chomp.downcase
    end
    roll = rand(6) + 1
    decorator.roll(roll)
    roll
  end
end
