module TicTacToe
  class EndGame 

    def initialize(interface) 
      @interface = interface
    end

    def finished_game(player_won_or_tied)
      @interface.puts_space
      if player_won_or_tied == "1" || player_won_or_tied == "2"
        @interface.won_message(player_won_or_tied)
      elsif player_won_or_tied == "tied"
        @interface.tied_message
      end
      @interface.puts_space
    end
  end
end
