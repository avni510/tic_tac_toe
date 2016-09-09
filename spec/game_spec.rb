require 'pry'
module TicTacToe
  require 'spec_helper'

  describe Game do 

    let(:game_eval) { GameEval.new }

    let(:mock_console_ui) { double }

    let(:game_type) { double }

    let(:player_setup) { PlayerSetup.new }

      context "player 2 wins the game" do
        def create_board(spaces)
          board = Board.new
          spaces.each_with_index do |marker, index|
            board.fill(index, marker)
          end
          board
        end

        it "executes each player's turn until the game is over" do
          p1_marker, p2_marker = 'X', 'O'

          initial_board = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "7", "8",
            ])

          args = 
            {
              :board => initial_board, 
              :console_ui => mock_console_ui,
              :validation => Validation.new
            }

          game = Game.new(game_eval, player_setup, args, game_type)
          
          allow(game_type).to receive(:human_v_human).and_return(false)

          allow(game_type).to receive(:human_v_simp_comp).and_return(true)

          player1 = double
          player2 = double

          board_after_player1_move = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "X", "7", "8"
            ])

          allow(player1).to receive(:make_move).with(initial_board).and_return(board_after_player1_move)

          board_after_player2_move = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "X", "O", "8"
            ])

          allow(player2).to receive(:make_move).with(board_after_player1_move).and_return(board_after_player2_move)


          game.instance_variable_set(:@player1, player1)

          game.instance_variable_set(:@player2, player2)

          result = game.players_turns(p1_marker, p2_marker)

          expect(result).to eq(board_after_player2_move.nine_space_array)
      end
    end
  end
end
