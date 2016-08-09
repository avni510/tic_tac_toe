module TicTacToe
  require "eval_game"

  describe EvalGame do 
    let(:game){ EvalGame.new }

    describe ".tied" do 
      it "can evaluate if a game is tied" do 
        board = [
          "X", "O", "X", 
          "O", "X", "O", 
          "X", "O", "X"
        ]
        expect(game.tied?(board)).to eq(true)
      end
    end

    describe ".won" do 
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
          expect(game.won?(board)).to eq(bool)
        end
      end
    end
  end
end
