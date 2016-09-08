module TicTacToe
  
  class Game 
    attr_reader :player1
    attr_reader :player2

    def initialize(game_eval, game_type, args)
      @game_eval = game_eval
      @game_type = game_type
      @args = args
    end

    def players_turns(marker1, marker2)
      player_assignment(marker1, marker2)

      current_player = @player1
      begin 
        board_array = current_player.make_move
        current_player = toggle_player(current_player)
      end until @game_eval.game_over?(board_array, player1.marker, player2.marker)
      board_array
    end
    
    def player_assignment(marker1, marker2)
      @player1 = Human.new(marker1, @args)
      @player2 = Human.new(marker2, @args) 
    end

    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
