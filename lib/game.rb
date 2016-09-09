module TicTacToe
  
  class Game 

    def initialize(game_eval, player1, player2)
      @game_eval = game_eval
      @player1 = player1
      @player2 = player2
    end

    def players_turns
      current_player = @player1

      board = current_player.make_move(current_player.board)
      
      until @game_eval.game_over?(board.nine_space_array, @player1.marker, @player2.marker)
        current_player = toggle_player(current_player)
        board = current_player.make_move(board)
      end

      board.nine_space_array
    end
    
    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
