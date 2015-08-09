require_relative 'dice'
require_relative 'player'
require_relative 'game'
require_relative 'default_rule_set'
require_relative 'setup'
require_relative 'ending'


setup = Setup.new

number_of_players = setup.number_of_players
total_score_required = setup.total_score_required

i = 0
players = []
until i == number_of_players do
  i += 1
  player = Player.new(i)
  players << player
end

dice = Dice.new

game = Game.new(players: players, dice: dice, rule_set: DefaultRuleSet.new)

while game.next_turn < total_score_required do
  game.next_turn
end
