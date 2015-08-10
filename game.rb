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
    self.current_turn_score = 0
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
    next_turn_declaration
    current_player.total_score
  end

  def previous_player
    players[(players.size + current_turn) % players.size]
  end

  private

  def turn_setup
    self.current_player = players[(players.size + current_turn + 1) % players.size]
    self.turn_is_active = true
    self.current_turn_score = 0
    puts "\n#{current_player.name}'s turn\n"
  end

  def terminal_roll
    puts 'Terminal Roll'
    score_declaration
    self.current_player.total_score = 0
    self.turn_is_active = false
  end

  def busted_roll
    puts 'Busted Roll'
    self.current_turn_score += rule_set.success_roll
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
    puts "Roll:        #{rule_set.success_roll}"
    puts "Turn score:  #{current_turn_score}"
    puts "Total score: #{current_player.total_score}\n"
  end

  def next_turn_declaration
    puts "\n" + '-' * 28 + "\nThat's the end of your turn.\n" + '-' * 28
  end

end
