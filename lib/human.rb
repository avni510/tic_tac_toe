module TicTacToe
  require_relative 'player'

  class Human < Player
    attr_reader :marker

    def make_move(board)
      @console_ui.move_messages(board.cells, @marker)
      @console_ui.move_selection_message
      move = @console_ui.user_input
      move = valid_move_loop(move, board)
      board.fill(move, @marker)
    end
    
    private

    def valid_move_loop(move, board)
      until @validation.move_valid?(board.cells, move)
        @console_ui.valid_move_message
        move = @console_ui.user_input
      end
      move
    end
  end
end
