class DisplayDice
  def roll(number)
    fail(StandardError, 'Dice must roll between 1 and 6') unless valid_roll?(number)
    send("roll_#{number}")
  end

  private

  def valid_roll?(number)
    number <= 6 && number >= 1
  end

  def roll_1
    puts " -----\n|     |\n|  .  |\n|     |\n -----"
  end

  def roll_2
    puts " -----\n|.    |\n|     |\n|    .|\n -----"
  end

  def roll_3
    puts " -----\n|.    |\n|  .  |\n|    .|\n -----"
  end

  def roll_4
    puts " -----\n|.   .|\n|     |\n|.   .|\n -----"
  end

  def roll_5
    puts " -----\n|.   .|\n|  .  |\n|.   .|\n -----"
  end

  def roll_6
    puts " -----\n|.   .|\n|.   .|\n|.   .|\n -----"
  end
end
