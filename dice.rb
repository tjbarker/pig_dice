class Dice
  def roll
    response = nil
    until response == 'r' do
      puts 'Type "r" to roll'
      response = gets.chomp.downcase
    end
    roll = rand(6) + 1
    puts "you rolled: #{roll}"
    roll
  end
end
