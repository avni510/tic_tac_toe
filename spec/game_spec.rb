module TicTacToe
  require 'spec_helper'

  describe Game do 
    
    params = {
    :console_ui => ConsoleUI.new(WrapperIO.new), 
    :board => Board.new,
    :validation => Validation.new
    }
    
    let(:game_turn) { GameTurn.new(params) }

    let(:marker_loop) {
      MarkerLoop.new(Validation.new, ConsoleUI.new(WrapperIO.new))
    }

    let(:game_eval) { GameEval.new }

    let(:game_completion) { 
      GameCompletion.new(ConsoleUI.new(WrapperIO), game_eval)
    }

    describe ".run" do 
      context "player 2 wins the game" do 
        it "runs through a game of tic tac toe" do 
          game = Game.new(game_turn, marker_loop, game_completion, game_eval)
          
          expect(marker_loop).to receive(:marker_selection).and_return(["X", "O"])
          
          player1, player2 = Player.new(1, 'X'), Player.new(2, 'O')

          expect(game_turn).to receive(:execute).with(player1.ord_num, player1.marker).and_return(

            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "7", "8",
          ])

          winning_board = 
            [ 
              "X", "O", "X",
              "3", "O", "X", 
              "6", "O", "8"
          ]

          expect(game_turn).to receive(:execute).with(player2.ord_num, player2.marker).and_return(winning_board)

          expect(game_completion).to receive(:game_over_messages)

          game.run
        end
      end
    end
  end
end
