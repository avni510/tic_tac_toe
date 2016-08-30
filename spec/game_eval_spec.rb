module TicTacToe
  require 'spec_helper'

  describe GameEval do 
    let(:game_eval){ GameEval.new }

    describe ".player_won_or_tied" do
      context "player 1 is 'X' and player 1 won the game" do
        it "returns 'player_one'" do
          board = [ 
            "X", "O", "2", 
            "3", "X", "O",
            "6", "7", "X"
          ]
          expect(game_eval.player_won_or_tied(board, 'X', 'O')).to eq('X')
        end
      end

      context "player 2 is 'O' and player 2 won the game" do
        it "returns 'player_two'" do
          board = [
            "X", "O", "2", 
            "3", "O", "X", 
            "6", "O", "X"
          ]
          expect(game_eval.player_won_or_tied(board, 'X', 'O')).to eq('O')
        end
      end

      context "the game is tied" do
        it "returns 'tied'" do
          board = [
            "X", "X", "O", 
            "O", "O", "X", 
            "X", "O", "X"
          ]
          expect(game_eval.player_won_or_tied(board, 'X', 'O')).to eq(nil)
        end
      end
    end

    describe ".game_over" do
      it 'can evaluate if the game is over' do
        board = [
          "X", "O", "X", 
          "O", "X", "O", 
          "X", "O", "X"
        ]
        expect(game_eval.game_over?(board)).to eq(true)
      end

      it "can evaluate if a game is tied" do 
        board = [
          "X", "X", "O", 
          "O", "O", "X", 
          "X", "O", "X"
        ]
        expect(game_eval.game_over?(board)).to eq(true)
      end

      [
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
        it "can evaluate if a game is won" do 
          expect(game_eval.game_over?(board)).to eq(bool)
        end
      end
    end
  end
end
