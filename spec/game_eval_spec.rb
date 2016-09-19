module TicTacToe
  require 'spec_helper'

  describe GameEval do 
    let(:game_eval){ GameEval.new }

    describe ".player_marker_won" do
      marker1, marker2 = 'X', 'O'

      context "player X won the game" do
        it "returns 'X'" do
          [
            [[ 
              "O", "X", "O", 
              "O", "O", "5",
              "X", "X", "X"
              ], marker1],
            [[
              "X", "X", "O", 
              "O", "O", "X", 
              "X", "O", "X"
            ], nil],
            [[
              "X", "O", "O", 
              "3", "X", "5", 
              "6", "7", "X"
            ], marker1],
            [[
              "O", "X", "2", 
              "O", "X", "5", 
              "O", "7", "8"
            ], marker2],
            [[
              "O", "O", "X", 
              "O", "4", "X", 
              "6", "7", "X"
            ], marker1],
            [[
              "X", "X", "2", 
              "O", "O", "O", 
              "X", "7", "8"
            ], marker2],
            [[
              "O", "1", "X", 
              "O", "X", "5", 
              "X", "O", "8"
            ], marker1],
            [[
              "X", "X", "O", 
              "O", "O", "X", 
              "X", "X", "O"
            ], nil]
          ].each do |board, winning_marker|
            expect(game_eval.winning_player_marker(board, marker1, marker2)).to eq(winning_marker)
          end
        end
      end
    end

    describe ".game_over" do
      context "the game is won" do 
        [  
          [[
            "X", "X", "X",
            "3", "4", "5", 
            "6", "7", "8"
        ], true],
          [[
            "O", "1", "2", 
            "O", "4", "5", 
            "O", "7", "8"
        ], true],
          [[
            "X", "1", "2", 
            "3", "X", "5", 
            "6", "7", "X"
        ], true] ].each do |board, bool|
          it "returns true if the game is over and false otherwise" do 
            expect(game_eval.game_over?(board, 'X', 'O')).to eq(bool)
          end
        end
      end

      context "the game is tied" do
       board_array =  
         [ 
          "X", "X", "O", 
          "O", "O", "X", 
          "X", "O", "X"
         ]

        it "returns true if the game is over and false otherwise" do 
          expect(game_eval.game_over?(board_array, 'X', 'O')).to eq(true)
        end
      end

      context "the game neither tied nor won" do
        [ 
          [[
            "0", "1", "2", 
            "O", "O", "X", 
            "6", "7", "8"
        ], false],
          [[
            "O", "1", "2", 
            "3", "4", "5", 
            "O", "X", "X"
        ], false], 
        ].each do |board, bool|
          it "returns true if the game is over and false otherwise" do 
            expect(game_eval.game_over?(board, 'X', 'O')).to eq(bool)
          end
        end
      end
    end
  end
end
