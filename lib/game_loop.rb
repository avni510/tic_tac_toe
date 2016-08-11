module TicTacToe
  class GameLoop

    def initialize(board, console_ui, eval_game, validation)
      @board = board 
      @console_ui = console_ui 
      @eval_game = eval_game
      @validation = validation
    end

    def instructions(player, symbol)
      move = @console_ui.move_messages(@board.nine_space_array)
      move = valid_move_loop(move)
      @board.fill(move, symbol)
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
        move = @console_ui.player_move
      end
      move
    end
  end
end
