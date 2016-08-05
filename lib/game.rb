module TicTacToe

  class Game 
    
    def initialize(game_loop, symbol_loop, end_game, interface)
      @game_loop = game_loop
      @symbol_loop = symbol_loop
      @end_game = end_game
    end

    def run 
      @symbol_loop.symbol_selection
    end
  end
end
