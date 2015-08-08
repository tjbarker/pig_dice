require_relative 'dice'
require_relative 'player'
require_relative 'game'
require_relative 'default_rule_set'
require 'byebug'

player_1 = Player.new(1)
player_2 = Player.new(2)
dice = Dice.new

game = Game.new(players: [player_1, player_2], dice: dice, rule_set: DefaultRuleSet.new)
game.next_turn
