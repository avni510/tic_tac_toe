module TicTacToe
  class EndGame 

    def initialize(console_ui) 
      @console_ui = console_ui
    end

    def finished_game(player_won_or_tied)
      @console_ui.puts_space
      if player_won_or_tied == 1 || player_won_or_tied == 2
        @console_ui.won_message(player_won_or_tied)
      elsif player_won_or_tied == 0
        @console_ui.tied_message
      end
      @console_ui.puts_space
    end
  end
end
