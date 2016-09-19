module TicTacToe
  class Computer < Player

    def make_move(board)
      @board = board
      @console_ui.move_messages(@board.cells, @player_marker)
      move = valid_move_loop
      @console_ui.computer_move_message(move)
      @board.fill(move, @player_marker)
    end

    private

    def valid_move_loop
      begin 
        move = @ai.generate_move(@board)
        move = move.to_s
      end until @validation.move_valid?(@board.cells, move)  
      move
    end
  end
end
