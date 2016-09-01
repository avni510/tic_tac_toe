module TicTacToe

  class Game 
    attr_reader :player1
    attr_reader :player2

    def initialize(game_turn, game_eval, p1_marker, p2_marker)
      @game_turn = game_turn
      @game_eval = game_eval
      @player1 = Player.new(1, p1_marker)
      @player2 = Player.new(2, p2_marker)
    end

    def players_turns
      current_player = @player1
      begin 
        board_array = @game_turn.execute(current_player.ord_num, current_player.marker)
        current_player = toggle_player(current_player)
      end until @game_eval.game_over?(board_array, @player1, @player2)
      board_array
    end

    def toggle_player(current_player)
      current_player == @player1 ? @player2 : @player1
    end
  end
end
