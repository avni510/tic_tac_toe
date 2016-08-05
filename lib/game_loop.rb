module TicTacToe
  class GameLoop

    def initialize(board, interface, eval_game, validation)
      @board = board 
      @interface = interface 
      @eval_game = eval_game
      @validation = validation
    end

    def instructions(tied_or_player_won, p1_symbol, p2_symbol)
      tied_or_player_won = player_instructions(1, p1_symbol)
      if tied_or_player_won
        @interface.display_board(@board.nine_space_array)
        return tied_or_player_won 
      end
      tied_or_player_won = player_instructions(2, p2_symbol)
      if tied_or_player_won
        @interface.display_board(@board.nine_space_array)
        return tied_or_player_won 
      end
    end

    private 

    def player_instructions(player, symbol)
      move = @interface.move_messages(@board.nine_space_array)
      move = valid_move_loop(move)
      board = @board.fill(move, symbol)
      return tied_or_player_won = player.to_s if @eval_game.won?(@board.nine_space_array)
      return tied_or_player_won = "tied" if @eval_game.tied?(@board.nine_space_array) 
      player_won = nil
    end

    def valid_move_loop(move)
      until @validation.board_conditions?(@board.nine_space_array, move) do 
        @interface.valid_move_message
        move = @interface.player_move
      end
      move
    end
  end
end
