module TicTacToe
  class GameTurn

    def initialize(args)
      @board = args[:board]
      @console_ui = args[:console_ui]
      @validation = args[:validation]
    end

    def execute(player, marker)
      move = @console_ui.move_messages(@board.nine_space_array, player, marker)
      move = valid_move_loop(move)
      @board.fill(move, marker)
      @board.nine_space_array
    end
    
    private

    def valid_move_loop(move)
      until @validation.move_valid?(@board.nine_space_array, move)
        @console_ui.valid_move_message
        move = @console_ui.user_input
      end
      move
    end
  end
end
