module TicTacToe

  class Game 
    attr_reader :player1
    attr_reader :player2

    def initialize(game_turn, game_eval, game_type)
      @game_turn = game_turn
      @game_eval = game_eval
      @game_type = game_type
    end

    def players_turns(marker1, marker2)

      @player1 = Player.new(marker1)
      @player2 = Player.new(marker2) 

      current_player = @player1
      begin 
        board_array = @game_turn.execute(current_player.marker)
        current_player = toggle_player(current_player)
      end until @game_eval.game_over?(board_array, player1.marker, player2.marker)
      board_array
    end

    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
