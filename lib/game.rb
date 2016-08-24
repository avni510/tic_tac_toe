module TicTacToe

  class Game 
    
    def initialize(game_turn, marker_loop, game_completion, game_eval, player)
      @game_turn = game_turn
      @marker_loop = marker_loop
      @game_completion = game_completion
      @game_eval = game_eval
      @player = player
    end

    def run 
      marker1, marker2 = @marker_loop.marker_selection

      @player.toggle_player(marker1, marker2) 

      begin 
        board_array = @game_turn.execute(@player.current_player, @player.marker)
        @player.toggle_player(marker1, marker2)
      end until @game_eval.game_over?(board_array)
      
      game_result = @game_eval.player_won_or_tied(board_array, marker1, marker2)

      @game_completion.game_over_messages(game_result, board_array)
    end
  end
end
