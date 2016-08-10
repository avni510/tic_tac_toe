module TicTacToe

  class Game 
    
    def initialize(game_loop, marker_loop, end_game)
      @game_loop = game_loop
      @marker_loop = marker_loop
      @end_game = end_game
      @tied_or_player_won = nil
    end

    def run 
      marker1, marker2 =  @marker_loop.marker_selection
      until @tied_or_player_won
        @tied_or_player_won = @game_loop.instructions(1, marker1)
        break if @tied_or_player_won
        @tied_or_player_won = @game_loop.instructions(2, marker2)
      end
      @end_game.finished_game(@tied_or_player_won)
    end
  end
end
