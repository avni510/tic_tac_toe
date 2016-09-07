module TicTacToe

  class ConsoleRunner
    TTT_MARKER1, TTT_MARKER2 = 'X', 'O'

    def initialize(marker_loop, game_completion, console_ui)
      @marker_loop = marker_loop
      @game_completion = game_completion
      params = {
        :console_ui => console_ui,
        :validation => Validation.new
      }
      @game_turn = GameTurn.new(params)
      @game_eval = GameEval.new
    end

    def run 
      marker1, marker2 = @marker_loop.marker_selection(TTT_MARKER1, TTT_MARKER2)

      game = Game.new(@game_turn, @game_eval, marker1, marker2)

      completed_game_board = game.players_turns

      @game_completion.game_over_messages(completed_game_board, game.player1, game.player2)
    end
  end
end
