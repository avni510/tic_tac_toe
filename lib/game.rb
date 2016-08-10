module TicTacToe

  class Game 
    
    def initialize(game_loop, symbol_loop)
      @game_loop = game_loop
      @symbol_loop = symbol_loop
      @tied_or_player_won = nil
    end

    def run 
      symbol1, symbol2 =  @symbol_loop.symbol_selection
      until @tied_or_player_won
        @tied_or_player_won = @game_loop.instructions(1, symbol1)
        break if @tied_or_player_won
        @tied_or_player_won = @game_loop.instructions(2, symbol2)
      end
    end
  end
end
