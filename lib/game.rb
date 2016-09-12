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
    
    def assign_players(marker1, marker2)
      @player_setup.player_assignment(marker1, marker2, @params, @game_type)

      @player1 = @player_setup.p1
      @player2 = @player_setup.p2
    end

    def players_turns(board)
      current_player = @player1

      begin 
        board = current_player.make_move(board)
        current_player = toggle_player(current_player)
      end until @game_eval.game_over?(board.nine_space_array, @player1.marker, @player2.marker)

      board.nine_space_array
    end
    
    private

    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
