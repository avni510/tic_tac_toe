module TicTacToe

  class Game 
    
    def initialize(game_loop, symbol_loop, end_game)
      @game_loop = game_loop
      @symbol_loop = symbol_loop
      @end_game = end_game
      @tied_or_player_won = nil
    end

    def run 
      @symbol_loop.symbol_selection
      until @tied_or_player_won 
        @tied_or_player_won = @game_loop.instructions(@tied_or_player_won, @symbol_loop.player1_symbol, @symbol_loop.player2_symbol)
      end
      @end_game.finished_game(@tied_or_player_won)
    end
  end
end
