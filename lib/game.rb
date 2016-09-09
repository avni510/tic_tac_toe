module TicTacToe
  class Game 
    attr_reader :player1
    attr_reader :player2

    def initialize(game_eval, player_setup, params, game_type)
      @game_eval = game_eval
      @player_setup = player_setup
      @params = params
      @game_type = game_type
    end

    def players_turns(marker1, marker2)
      @player_setup.player_assignment(marker1, marker2, @params, @game_type)

      @player1 = @player_setup.p1
      @player2 = @player_setup.p2

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
