module TicTacToe
  require 'spec_helper'

  describe Game do 
    let(:game_turn) {
      GameTurn.new(
        Board.new, ConsoleUI.new(WrapperIO.new), EvalGame.new, Validation.new
    )}

    let(:marker_loop) {
      MarkerLoop.new(Validation.new, ConsoleUI.new(WrapperIO.new))
    }

    let(:end_game) { EndGame.new(ConsoleUI.new(WrapperIO))
    }

    describe ".run" do 
      context "player 1 wins the game and is symbol X" do 
        it "runs through a game of tic tac toe" do 
          game = Game.new(game_turn, marker_loop, end_game)
          
          expect(marker_loop).to receive(:marker_selection).and_return(["X", "O"])
          
          expect(game_turn).to receive(:execute).with(1, "X").and_return(nil, 1)

          expect(game_turn).to receive(:execute).with(2, "O").and_return(nil) 

          expect(end_game).to receive(:finished_game).with(1)

          game.run
        end
      end
    end
  end
end
