module TicTacToe
  class GameCompletion 

    def initialize(console_ui, game_eval) 
      @console_ui = console_ui
      @game_eval = game_eval
    end

    def game_over_messages(board_array, player1, player2)
      @console_ui.display_board(board_array)
      @console_ui.puts_space
      winning_player = @game_eval.player_won(board_array, player1, player2)
      if winning_player
        @console_ui.won_message("Player #{winning_player.ord_num}")
      else
        @console_ui.tied_message
      end
      @console_ui.puts_space
    end
  end
end
