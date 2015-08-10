class Setup
  def number_of_players
    puts "How many players are playing?"
    gets.chomp.to_i
  end

  def total_score_required
    puts "What score would you like to play to?"
    score = gets.chomp.to_i
    fail(StandardError, 'Invalid required score') unless (score > 0)
    score
  end
end
