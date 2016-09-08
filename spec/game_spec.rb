module TicTacToe
  require 'spec_helper'

  describe Game do 

    let(:game_eval) { GameEval.new }
    let(:mock_console_ui) { double }

    let(:game_type) {GameType.new(mock_console_ui) }
    
    describe ".player_turns" do
      def create_board(spaces)
        board = Board.new
        spaces.each_with_index do |marker, index|
          board.fill(index, marker)
        end
        board
      end

      context "player 2 wins the game" do
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

          game = Game.new(game_eval, game_type, args)

          p1 = double
          p2 = double 

          allow(game).to receive(:player_assignment).and_return(nil)

          game.instance_variable_set(:@player1, p1)

          game.instance_variable_set(:@player2, p2)

          expect(p1).to receive(:make_move).and_return(
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "O", "7", "X"
            ])

          winning_board = 
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "7", "X"
            ]

          expect(p2).to receive(:make_move).and_return(winning_board)

          allow(p1).to receive(:marker).and_return(p1_marker)

          allow(p2).to receive(:marker).and_return(p2_marker)

          result = game.players_turns(p1_marker, p2_marker) 
          expect(result).to eq(winning_board)

        end
      end
    end
  end
end
