module TicTacToe
  require 'spec_helper'

  describe GameEval do 
    let(:game_eval){ GameEval.new }

    describe ".player_won" do
      marker1, marker2 = 'X', 'O'

      context "player 1 won the game" do
        it "returns player1" do
          board = [ 
            "X", "O", "2", 
            "3", "X", "O",
            "6", "7", "X"
          ]

          expect(game_eval.player_won(board, marker1, marker2)).to eq(marker1)
        end
      end

      context "player 2 won the game" do
        it "returns player2" do
          board = [
            "X", "O", "2", 
            "3", "O", "X", 
            "6", "O", "X"
          ]
          expect(game_eval.player_won(board, marker1, marker2)).to eq(marker2)
        end
      end

      context "the game is tied" do
        it "returns nil" do
          board = [
            "X", "X", "O", 
            "O", "O", "X", 
            "X", "O", "X"
          ]
          expect(game_eval.player_won(board, marker1, marker2)).to eq(nil)
        end
      end
    end

    describe ".game_over" do
      [
        [[ "X", "X", "O", 
          "O", "O", "X", 
          "X", "O", "X"
      ], true], 
        [[
          "X", "X", "X",
          "3", "4", "5", 
          "6", "7", "8"
      ], true],
        [[
          "0", "1", "2", 
          "O", "O", "X", 
          "6", "7", "8"
      ], false],
        [[
          "O", "1", "2", 
          "O", "4", "5", 
          "O", "7", "8"
      ], true],
        [[
          "O", "1", "2", 
          "3", "4", "5", 
          "O", "X", "X"
      ], false], 
        [[
          "X", "1", "2", 
          "3", "X", "5", 
          "6", "7", "X"
      ], true]
      ].each do |board, bool|
        it "returns true if the game is over and false otherwise" do 
          expect(game_eval.game_over?(board, 'X', 'O')).to eq(bool)
        end
      end
    end
  end
end
