module TicTacToe
  class GameCompletion 

    def initialize(console_ui, game_eval) 
      @console_ui = console_ui
      @game_eval = game_eval
    end

    def game_over_messages(board_array, marker1, marker2)
      @console_ui.display_board(board_array)
      @console_ui.puts_space
      winning_marker = @game_eval.winning_player_marker(board_array, marker1, marker2)
      end_game_message(winning_marker)
    end

    def end_game_message(winning_marker)
      if winning_marker
        @console_ui.won_message("#{winning_marker}")
      else
        @console_ui.tied_message
      end
      @console_ui.puts_space
    end
  end
end
