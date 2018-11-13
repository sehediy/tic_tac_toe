require './lib/game'

def start_game
  game = Game.new
  start_game if game.play_again
end

start_game
