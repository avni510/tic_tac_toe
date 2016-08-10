module TicTacToe

require "game"
require "wrapperio"

  describe Game do 
    let(:game_loop) {
      GameLoop.new(
        Board.new, ConsoleInterface.new(WrapperIO.new), EvalGame.new, Validation.new
    )}

    context "player 1 wins the game" do 
      it "runs through a game of tic tac toe" do 
        game = Game.new(game_loop)

        expect(game_loop).to receive(:instructions).with(1, "X").and_return(nil, 1)

        expect(game_loop).to receive(:instructions).with(2, "O").and_return(nil) 

        game.run
      end
    end
  end
end
