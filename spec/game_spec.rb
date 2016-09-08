module TicTacToe
  require 'spec_helper'

  describe Game do 

    let(:game_eval) { GameEval.new }

    let(:game_type) {GameType.new(mock_console_ui) }

    let(:mock_console_ui) { double }

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

          board = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "7", "8",
            ])

          args = 
            {
              :board => board, 
              :console_ui => mock_console_ui,
              :validation => Validation.new
            }
          
          player_setup = PlayerSetup.new
          player_setup.player_assignment(p1_marker, p2_marker, args)

          player1 = player_setup.p1
          player2 = player_setup.p2

          game = Game.new(game_eval, game_type, player1, player2)

          board_after_player1_move = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "X", "7", "8"
            ])

          expect(player1).to receive(:make_move).and_return(board_after_player1_move)

          board_after_player2_move = create_board(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "X", "O", "8"
            ])

          expect(player2).to receive(:make_move).and_return(board_after_player2_move)

          result = game.players_turns
          expect(result).to eq(board_after_player2_move.nine_space_array)

      end
    end
  end
end
