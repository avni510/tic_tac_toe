module TicTacToe
  class GameLoop

    def initialize(board, interface, eval_game, validation)
      @board = board 
      @interface = interface 
      @eval_game = eval_game
      @validation = validation
    end

    def instructions(player, symbol)
      move = @interface.move_messages(@board.nine_space_array)
      move = valid_move_loop(move)
      @board.fill(move, symbol)
      if @eval_game.won?(@board.nine_space_array)
        player
      elsif @eval_game.tied?(@board.nine_space_array)
        "tied"
      end
    end
    
    private

    def valid_move_loop(move)
      until @validation.board_conditions?(@board.nine_space_array, move)
        @interface.valid_move_message
        move = @interface.player_move
      end
      move
    end
  end
end
