class Player
  attr_reader :name
  attr_accessor :score

  def initialize(name)
    self.score = {}
    self.score[@name] = name
    create_score(total_score, 0)
    create_score(roll_score, 0)
    create_score(turn_counter, 0)
  end

  def hold(value)
    reset_roll_score
    total = score[:total_score]
    total += @value
    change_score(total_score, total)

  def reset_roll_score
    change_score(roll_score, 0)
  end

  def reset_total_score
    change_score(total_score, 0)
  end


  def change_score(title, value)
    self.score[@title] = value
  end

  def declaration(name, total_score, roll_score, turn_counter)
    puts "\n#{name}\nYour scores:"
    puts "Total Score: #{total_score}"
    puts "Roll Score:  #{roll_score}"
    puts "Turns Taken: #{turn_counter}"
  end
end
