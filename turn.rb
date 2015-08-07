class Turn
  def throw
    throw_1 = Dice.new.roll
    throw_2 = Dice.new.roll
    total_throw = throw_1 + throw_2
    (throw_1, throw_2, total_throw)
  end

  def option(throw_1, throw_2, total_throw)
    if ((throw_1 == 1) && (throw_2 == 1))
      puts 'That was a terminal role, your total score is now 0.'

      end_turn
    elsif ((throw_1 == 1) || (throw_2 == 1))
      'bust throw'
    else
      total_throw
    end
  end

  def response(option)
    if option == 0
      true
    end
  end
end
