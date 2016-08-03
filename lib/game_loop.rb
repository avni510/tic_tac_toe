
module TicTacToe
  class GameLoop

    def initialize(board, interface, eval_game, validation)
      @board = board 
      @interface = interface 
      @eval_game = eval_game
      @validation = validation
    end

    def instructions(player_won)
      player_won = player_instructions(2)
      return player_won if player_won
      player_won = player_instructions(1)
      return player_won if player_won
    end

  private

    def player_instructions(player)
      return player_won = player if @eval_game.game_over?(@board.nine_space_array)
      move = @interface.move_messages(@board.nine_space_array)
      until @validation.board_conditions?(@board.nine_space_array, move) do
        @interface.valid_move_message
        move = @interface.move_messages(@board.nine_space_array)
      end
      board = @board.fill(move, @interface.player1_symbol)
      player_won = nil
    end
  end
end
