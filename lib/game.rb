module TicTacToe

  class Game 
    
    def initialize(game_loop)
      @game_loop = game_loop
      @tied_or_player_won = nil
    end

    def run 
      until @tied_or_player_won
        @tied_or_player_won = @game_loop.instructions(1, "X")
        break if @tied_or_player_won
        @tied_or_player_won = @game_loop.instructions(2, "O")
      end
    end
  end
end
