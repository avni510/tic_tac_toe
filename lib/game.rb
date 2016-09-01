module TicTacToe

  class Game 
    TTT_MARKER1 = "X"
    TTT_MARKER2 = "O"
    
    def initialize(game_turn, marker_loop, game_completion, game_eval)
      @game_turn = game_turn
      @marker_loop = marker_loop
      @game_completion = game_completion
      @game_eval = game_eval
    end

    def run 
      marker1, marker2 = @marker_loop.marker_selection(TTT_MARKER1, TTT_MARKER2)

      @player1, @player2 = Player.new(1, marker1), Player.new(2, marker2)

      current_player = @player1

      begin 
        board_array = @game_turn.execute(current_player.ord_num, current_player.marker)
        current_player = toggle_player(current_player)
      end until @game_eval.game_over?(board_array, TTT_MARKER1, TTT_MARKER2)
      
      @game_completion.game_over_messages(board_array, @player1, @player2)
    end

    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
