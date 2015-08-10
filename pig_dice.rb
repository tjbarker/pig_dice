require_relative 'dice'
require_relative 'player'
require_relative 'game'
require_relative 'default_rule_set'
require_relative 'setup'
require_relative 'ending'
require_relative 'display_dice'
require 'byebug'

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

dice = Dice.new(decorator: DisplayDice.new)

game = Game.new(players: players, dice: dice, rule_set: DefaultRuleSet.new)

while (game.current_player.nil? ? 0 : game.current_player.total_score) < total_score_required do
  game.next_turn
end
byebug
ending = Ending.new.declaration(name: game.previous_player.name, score: game.previous_player.total_score)
ending
