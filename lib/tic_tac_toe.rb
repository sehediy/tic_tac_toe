require './lib/game'

def start_new_game
  game = Game.new
  game.start
  start_new_game if game.play_again
end

start_new_game
