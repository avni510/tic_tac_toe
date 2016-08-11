module TicTacToe

require "game"
require "wrapper_io"
require "console_ui"
require "game_loop"
require "board"
require "eval_game"
require "validation"
require "marker_loop"
require "end_game"

  describe Game do 
    let(:game_loop) {
      GameLoop.new(
        Board.new, ConsoleUI.new(WrapperIO.new), EvalGame.new, Validation.new
    )}

    let(:marker_loop) {
      MarkerLoop.new(Validation.new, ConsoleUI.new(WrapperIO.new))
    }

    let(:end_game) { EndGame.new(ConsoleUI.new(WrapperIO))
    }

    describe ".run" do 
      context "player 1 wins the game" do 
        it "runs through a game of tic tac toe" do 
          game = Game.new(game_loop, marker_loop, end_game)
          
          expect(marker_loop).to receive(:marker_selection).and_return(["X", "O"])
          
          expect(game_loop).to receive(:instructions).with(1, "X").and_return(nil, 1)

          expect(game_loop).to receive(:instructions).with(2, "O").and_return(nil) 

          expect(end_game).to receive(:finished_game).with(1)


          game.run
        end
      end
    end
  end
end
