module TicTacToe
  class Computer < Player

    def make_move(board)
      @board = board
      @console_ui.move_messages(@board.cells, @marker)
      move = valid_move_loop
      @console_ui.computer_move_message(move)
      @board.fill(move, @marker)
    end

    private

    def valid_move_loop
      begin 
        move = random_move
        move = move.to_s
      end until @validation.move_valid?(@board.cells, move)  
      move
    end

    def random_move
      upper_limit = @board.board_size
      Random.rand(upper_limit)
    end
  end
end
