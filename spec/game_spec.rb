module TicTacToe

require "game"
require "wrapperio"

  describe Game do 
    let(:game_loop) {
      GameLoop.new(
        Board.new, ConsoleInterface.new(WrapperIO.new), EvalGame.new, Validation.new
    )}

    let(:symbol_loop) {
      SymbolLoop.new(Validation.new, ConsoleInterface.new(WrapperIO.new))
    }

    let(:end_game) { EndGame.new(ConsoleInterface.new(WrapperIO))
    }

    context "player 1 wins the game" do 
      it "runs through a game of tic tac toe" do 
        game = Game.new(game_loop, symbol_loop, end_game)
        
        expect(symbol_loop).to receive(:symbol_selection).and_return(["X", "O"])
        
        expect(game_loop).to receive(:instructions).with(1, "X").and_return(nil, 1)

        expect(game_loop).to receive(:instructions).with(2, "O").and_return(nil) 

        expect(end_game).to receive(:finished_game).with(1)


        game.run
      end
    end
  end
end
