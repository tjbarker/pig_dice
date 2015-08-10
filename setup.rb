class Setup
  def number_of_players
    puts "How many players are playing?"
    gets.chomp.to_i.tap do |number|
      fail(StandardError, 'Invalid required score') unless (number > 0)
    end
  end

  def total_score_required
    puts "What score would you like to play to?"
    gets.chomp.to_i.tap do |score|
      fail(StandardError, 'Invalid required score') unless (score > 0)
    end
  end
end
