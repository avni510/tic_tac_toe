module TicTacToe
  class Player
    attr_reader :current_player
    attr_reader :marker 

    def initialize(player, marker)
      @current_player = player
      @marker = marker
    end

    def toggle_player(marker1, marker2)
      if @current_player == 2
        @current_player, @marker = 1, marker1
      else
        @current_player, @marker = 2, marker2
      end
    end
  end
end
