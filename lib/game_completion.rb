module TicTacToe
  class GameCompletion 

    def initialize(console_ui) 
      @console_ui = console_ui
    end

    def game_over_messages(game_result, board_array)
      @console_ui.display_board(board_array)
      @console_ui.puts_space
      if game_result == "player_one" || game_result == "player_two"
        @console_ui.won_message(game_result)
      elsif game_result == "tied"
        @console_ui.tied_message
      end
      @console_ui.puts_space
    end
  end
end
