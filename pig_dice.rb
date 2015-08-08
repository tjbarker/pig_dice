require_relative 'dice'
require_relative 'player'
require_relative 'game'
require_relative 'default_rule_set'
require_relative 'rigged_dice'
require_relative 'rock'
require 'byebug'

player_1 = Player.new(1)
player_2 = Player.new(2)

game = Game.new(players: [player_1, player_2], dice: dice, rule_set: DefaultRuleSet.new)

while true
  game.next_turn
end
