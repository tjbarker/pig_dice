class Game
  attr_accessor :players, :dice, :current_turn, :rule_set, :current_turn_score, :current_player, :turn_is_active

  def initialize(**opts)
    self.players = opts[:players]
    self.dice = opts[:dice]
    self.current_turn = 1
    self.rule_set = opts[:rule_set]
    self.current_turn_score = 0
  end

  def next_turn
    turn_setup
    while turn_is_active
      results = current_player.have_turn(dice)
      rule_set.test_roll(results)
      puts "\n"
      if rule_set.terminal_roll?
        terminal_roll
      elsif rule_set.busted_roll?
        busted_roll
      else
        legit_roll
      end
    end
    self.current_turn += 1
    current_player.total_score
  end

  def previous_player
    players[(players.size + current_turn) % players.size]
  end
  
  private

  def turn_setup
    self.current_player = players[(players.size + current_turn + 1) % players.size]
    self.turn_is_active = true
    current_turn_score = 0
    puts "#{current_player.name}'s turn"
  end

  def terminal_roll
    puts 'Terminal Roll'
    score_declaration
    self.current_player.score = 0
    self.turn_is_active = false
  end

  def busted_roll
    puts 'Busted Roll'
    score_declaration
    self.turn_is_active = false
  end

  def legit_roll
    self.current_turn_score += rule_set.success_roll
    score_declaration
    puts 'Do you wish to roll again? (Y or N)'
    if gets.chomp.upcase == 'N'
      self.current_player.total_score += current_turn_score
      self.turn_is_active = false
    end
  end

  def score_declaration
    puts "\nYour roll was #{rule_set.success_roll}"
    puts "Your turn score is #{current_turn_score}"
    puts "Your total score is #{current_player.total_score}"
  end

end
