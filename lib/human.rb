module TicTacToe
  class Human < Player

    def make_move(board)
      @board = board
      @console_ui.move_messages(@board.cells, @player_marker)
      @console_ui.move_selection_message
      move = @console_ui.user_input
      move = valid_move_loop(move)
      @board.fill(move, @player_marker)
    end
    
    private

    def valid_move_loop(move)
      until @validation.move_valid?(@board.cells, move)
        @console_ui.valid_move_message
        move = @console_ui.user_input
      end
      move
    end
  end
end
