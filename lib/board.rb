require './lib/square'

class Board
  attr_reader :squares

  def initialize
    val = 0
    @squares = Array.new(9) { Square.new val += 1 }.map(&:value)
  end

  def display
    puts '-------------'
    @squares.each_slice(3) do |square|
      puts "| #{square[0]} | #{square[1]} | #{square[2]} |"
      puts '-------------'
    end
  end

  def mark_space(position)
    @squares[position - 1] = next_value(@current)
  end

  def free_squares
    @squares.reject { |s| s == 'X' || s == 'O' }
  end

  private

  def next_value(previous = 'O')
    @current = previous == 'X' ? 'O' : 'X'
  end
end
