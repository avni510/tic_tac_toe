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
      @board = Board.new
    end

    def run 
      @game_type.game_menu

      marker1, marker2 = @marker_loop.marker_selection(TTT_MARKER1, TTT_MARKER2)

      game = Game.new(@game_eval, @player_setup, @params, @game_type)

      game.assign_players(marker1, marker2)

      completed_game_board = game.players_turns(@board)

      @game_completion.game_over_messages(completed_game_board, marker1, marker2)
    end
  end
end
