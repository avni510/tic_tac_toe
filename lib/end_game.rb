module TicTacToe
  class EndGame 

    def initialize(console_ui) 
      @console_ui = console_ui
    end

    def finished_game(game_result, board_array)
      @console_ui.display_board(board_array)
      @console_ui.puts_space
      if game_result == 1 || game_result == 2
        @console_ui.won_message(game_result)
      elsif game_result == 0
        @console_ui.tied_message
      end
      @console_ui.puts_space
    end
  end
end
