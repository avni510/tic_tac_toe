module TicTacToe
  require 'spec_helper'

  describe ConsoleRunner do
    describe ".run" do

      def create_board(spaces)
        board = Board.new
        spaces.each_with_index do |marker, index|
          board.fill(index, marker)
        end
        board
      end

      it "runs through a game of tic tac toe" do

        mock_console_ui = double 

        marker_loop = MarkerLoop.new(Validation.new, mock_console_ui)
      
        game_eval = GameEval.new

        game_completion = GameCompletion.new(mock_console_ui, game_eval)

        game_type = double

        marker1, marker2 = 'X', 'O'

        board = create_board(
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "6", "7", "8"
          ])

        allow(game_type).to receive(:game_menu)

        allow(game_type).to receive(:human_v_human).and_return(true)

        expect(marker_loop).to receive(:marker_selection).and_return([marker1, marker2])


        args = 
          {
            :board => board, 
            :console_ui => mock_console_ui,
            :validation => Validation.new
          }
        
        player_setup = PlayerSetup.new

        allow(game_type).to receive(:human_v_human).and_return(true)
        player_setup.player_assignment(marker1, marker2, args, game_type)

        player1 = player_setup.p1
        player2 = player_setup.p2

        completed_game_board = 
          [ 
            "X", "O", "X",
            "3", "O", "X", 
            "6", "O", "8"
          ]

        allow_any_instance_of(Game).to receive(:players_turns).and_return(completed_game_board)

        expect(game_completion).to receive(:game_over_messages).with(completed_game_board, player1.marker, player2.marker)

        console_runner = ConsoleRunner.new(marker_loop, game_completion, mock_console_ui, game_type)

        console_runner.run
      end
    end
  end
end
