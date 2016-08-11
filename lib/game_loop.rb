module TicTacToe
  class GameLoop

    def initialize(board, console_ui, eval_game, validation)
      @board = board 
      @console_ui = console_ui 
      @eval_game = eval_game
      @validation = validation
    end

    def instructions(player, marker)
      move = @console_ui.move_messages(@board.nine_space_array, player, marker)
      move = valid_move_loop(move)
      @board.fill(move, marker)
      if @eval_game.won?(@board.nine_space_array)
        return player
      elsif @eval_game.tied?(@board.nine_space_array)
        return "tied"
      end
    end
    
    private

    def valid_move_loop(move)
      until @validation.board_conditions?(@board.nine_space_array, move)
        @console_ui.valid_move_message
        move = @console_ui.user_input
      end
      move
    end
  end
end
