module TicTacToe

  class Game 
    
    def initialize(game_turn, marker_loop, end_game, game_eval)
      @game_turn = game_turn
      @marker_loop = marker_loop
      @end_game = end_game
      @game_eval = game_eval
    end

    def run 
      marker1, marker2 =  @marker_loop.marker_selection
      while true
        break if game_over_after_player_turn?(1, marker1)
        break if game_over_after_player_turn?(2, marker2)
      end
      game_result = @game_eval.player_won_or_tied(@board_array, marker1, marker2)
      @end_game.game_over_messages(game_result, @board_array)
    end

    def game_over_after_player_turn?(num, marker)
      @board_array = @game_turn.execute(num, marker)
      @game_eval.game_over?(@board_array)
    end
  end
end
