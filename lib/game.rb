require './lib/board'

class Game
  attr_reader :play_again

  def initialize
    @board = Board.new
    start_game
  end

  private

  def start_game
    loop do
      take_turn
      calculate_winner
      break if game_over?
    end
    suggest_to_play_again
  end

  def take_turn
    @board.display
    puts 'Enter position from free spots: '
    position = gets
    take_turn unless @board.free_squares.include? position.to_i
    @board.mark_space(position.to_i)
  end

  def calculate_winner
    winning_combinations.map do |combination|
      next unless winning_combination? combination
      return show_winner
    end
  end

  def display_draw_result
    @draw = true
    @board.display
    puts "It's a draw"
  end

  def show_winner
    @board.display
    puts "#{@winner} WINS!!!"
  end

  def suggest_to_play_again
    puts 'Play another game(y/n):'
    answer = gets
    @play_again = answer.chomp == 'y'
  end

  def game_over?
    display_draw_result unless @board.free_squares.size.positive?
    @winner || @draw
  end

  def winning_combination?(combination)
    a = combination[0]
    b = combination[1]
    c = combination[2]
    squares = @board.squares
    return unless squares[a] && squares[a] == squares[b] && squares[a] == squares[c]
    @winner = squares[a]
  end

  def winning_combinations
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end
end
