module TicTacToe
  class ConsoleRunner
    TTT_MARKER1, TTT_MARKER2 = 'X', 'O'

    def initialize(marker_loop, game_completion, console_ui, game_type)
      @marker_loop = marker_loop
      @game_completion = game_completion
      @game_type = game_type
      @params = {
        :console_ui => console_ui,
        :validation => Validation.new
      }
      @player_setup = PlayerSetup.new
      @game_eval = GameEval.new
    end

    def run 
      @game_type.game_menu

      marker1, marker2 = @marker_loop.marker_selection(TTT_MARKER1, TTT_MARKER2)

      @player_setup.player_assignment(marker1, marker2, @params)

      player1 = @player_setup.p1
      player2 = @player_setup.p2

      game = Game.new(@game_eval,@game_type, player1, player2)

      completed_game_board = game.players_turns

      @game_completion.game_over_messages(completed_game_board, player1.marker, player2.marker)
    end
  end
end
