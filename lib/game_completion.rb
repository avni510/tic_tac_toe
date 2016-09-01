module TicTacToe
  class GameCompletion 

    def initialize(console_ui, game_eval) 
      @console_ui = console_ui
      @game_eval = game_eval
    end

    def game_over_messages(board_array, marker1, marker2)
      @console_ui.display_board(board_array)
      @console_ui.puts_space
      game_result = @game_eval.player_won_or_tied(board_array, marker1, marker2)
      if game_result ==  marker1 
        @console_ui.won_message("Player 1")
      elsif game_result == marker2
        @console_ui.won_message("Player 2")
      else
        @console_ui.tied_message
      end
      @console_ui.puts_space
    end
  end
end
