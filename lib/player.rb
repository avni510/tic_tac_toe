module TicTacToe
  class Player
    attr_reader :current_player
    attr_reader :marker 

    def initialize
      @current_player = nil
      @marker = nil
    end

    def toggle_player(marker1, marker2)
      if @current_player == 2 || @current_player == nil
        @current_player, @marker = 1, marker1
      else
        @current_player, @marker = 2, marker2
      end
    end
  end
end
