module TicTacToe

  class Game 
    
    def initialize(game_turn, marker_loop, game_completion, game_eval)
      @game_turn = game_turn
      @marker_loop = marker_loop
      @game_completion = game_completion
      @game_eval = game_eval
    end

    def run 
      marker1, marker2 = @marker_loop.marker_selection

      @player1, @player2 = Player.new(1, marker1), Player.new(2, marker2)

      current_player = @player1

      begin 
        board_array = @game_turn.execute(current_player.ord_num, current_player.marker)
        current_player = toggle_player(current_player)
      end until @game_eval.game_over?(board_array)
      
      @game_completion.game_over_messages(board_array, marker1, marker2)
    end

    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
