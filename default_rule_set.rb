class DefaultRuleSet
  attr_accessor :value1, :value2

  def test_roll(role_values)
    self.value1 = role_values.first
    self.value2 = role_values.last
  end

  def terminal_roll?
    value1 == 1 && value2 == 1
  end

  def busted_roll?
    value1 == 1 || value2 == 1
  end

  def success_roll
    value1 + value2
  end
end
