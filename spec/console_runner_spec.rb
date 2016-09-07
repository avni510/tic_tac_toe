module TicTacToe
  require 'spec_helper'

  describe ConsoleRunner do
    describe ".run" do
      it "runs through a game of tic tac toe" do

        mock_console_ui = double 

        marker_loop = MarkerLoop.new(Validation.new, mock_console_ui)
      
        game_eval = GameEval.new

        game_completion = GameCompletion.new(mock_console_ui, game_eval)

        game_type = GameType.new(mock_console_ui)

        marker1, marker2 = 'X', 'O'

        expect(game_type).to receive(:game_menu)

        allow(game_type).to receive(:human_v_human).and_return(true)

        expect(marker_loop).to receive(:marker_selection).and_return([marker1, marker2])

        completed_game_board = 
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "6", "O", "8"
          ]

        allow_any_instance_of(Game).to receive(:players_turns).and_return(completed_game_board)

        expect(game_completion).to receive(:game_over_messages)

        console_runner = ConsoleRunner.new(marker_loop, game_completion, mock_console_ui, game_type)

        console_runner.run
      end
    end
  end
end
