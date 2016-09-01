module TicTacToe
  require 'spec_helper'

  describe ConsoleRunner do
    describe ".run" do
      it "runs through a game of tic tac toe" do

        console_ui = double 

        marker_loop = MarkerLoop.new(Validation.new, console_ui)
      
        game_eval = GameEval.new

        game_completion = GameCompletion.new(console_ui, game_eval)

        params = {
        :console_ui => console_ui,
        :board => Board.new,
        :validation => Validation.new
        }

        game_turn = GameTurn.new(params)

        marker1, marker2 = 'X', 'O'

        expect(marker_loop).to receive(:marker_selection).and_return([marker1, marker2])

        completed_game_board = 
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "6", "O", "8"
          ]

        allow_any_instance_of(Game).to receive(:players_turns).and_return(completed_game_board)

        expect(game_completion).to receive(:game_over_messages)

        console_runner = ConsoleRunner.new(marker_loop, game_completion, console_ui)

        console_runner.run
      end
    end
  end
end
