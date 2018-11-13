require './lib/game.rb'

describe 'tic_tac_toe' do
  describe 'game' do
    it 'plays game and makes X win' do
      game = Game.new
      game.board.mark_space(1)
      expect(game.board.squares[0]).to eq 'X'
      game.board.mark_space(2)
      expect(game.board.squares[1]).to eq 'O'
      game.board.mark_space(5)
      expect(game.board.squares[4]).to eq 'X'
      game.board.mark_space(3)
      expect(game.board.squares[2]).to eq 'O'
      game.board.mark_space(9)
      expect(game.board.squares[8]).to eq 'X'
      game.send :calculate_winner
      expect(game.winner).to eq 'X'
    end

    it 'plays game till draw' do
      game = Game.new
      game.board.mark_space(1)
      game.board.mark_space(2)
      game.board.mark_space(3)
      game.board.mark_space(4)
      game.board.mark_space(6)
      game.board.mark_space(5)
      game.board.mark_space(7)
      game.board.mark_space(9)
      game.board.mark_space(8)

      game.send :display_draw_result
      expect(game.draw).to eq true
    end

    it 'places X on the correct square' do
      game = Game.new
      response = game.send :valid_position?, 1
      expect(response).to eq true
    end

    it 'places X not on the correct square' do
      game = Game.new
      response = game.send :valid_position?, 0
      expect(response).to eq false
    end

    it 'returns nil for play_again on initial' do
      game = Game.new
      expect(game.play_again).to eq nil
    end

    it 'returns nil for game_over on initial' do
      game = Game.new
      expect(game.send(:game_over?)).to eq nil
    end
  end

  describe 'board' do
    it 'counts squares on board' do
      board = Board.new
      expect(board.squares.size).to eq(9)
    end

    it 'returns correct initial squares' do
      board = Board.new
      expect(board.squares).to eq((1..9).to_a)
    end

    it 'returns changed squares' do
      board = Board.new
      board.squares[0] = 'X'
      expect(board.squares).to eq(['X'] + (2..9).to_a)
    end

    it 'prints out new board with squares' do
      board = Board.new
      expect(board.display)
    end

    it 'prints out marked board with squares' do
      board = Board.new
      (1..9).to_a.map { |i| board.mark_space(i) }
      expect(board.display)
    end

    it 'returns free squares on board' do
      board = Board.new
      expect(board.free_squares).to eq((1..9).to_a)
    end

    it 'returns updated free squares on board' do
      board = Board.new
      board.mark_space(5)
      expect(board.free_squares).to eq((1..4).to_a + (6..9).to_a)
    end
  end
end
