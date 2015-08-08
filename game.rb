class Game
  attr_accessor :players, :dice, :current_turn, :rule_set, :current_turn_score, :current_player

  def initialize(**opts)
    self.players = opts[:players]
    self.dice = opts[:dice]
    self.current_turn = 1
    self.rule_set = opts[:rule_set]
    self.current_turn_score = 0

  end

  def score_declaration
    puts "Your roll was #{rule_set.success_roll}"
    puts "Your turn score is #{current_turn_score}"
    puts "Your total score is #{current_player.total_score}"
  end

  def next_turn
    current_player = players[(players.size + current_turn) % players.size]
    turn_is_active = true
    current_turn_score = 0
    while turn_is_active
      results = current_player.have_turn(dice)
      rule_set.test_roll(results)
      if rule_set.terminal_roll?
        puts 'Terminal Roll'
        score_declaration
        current_player.score = 0
        turn_is_active = false
      elsif rule_set.busted_roll?
        puts 'Busted Roll'
        score_declaration
        turn_is_active = false
      else
        current_turn_score += rule_set.success_roll
        byebug
        score_declaration
        puts 'Do you wish to roll again? (Y or N)'
        if gets.chomp == 'N'
          current_player.score += current_turn_score
          turn_is_active = false
        end
      end
    end
    self.current_turn += 1
  end
end
