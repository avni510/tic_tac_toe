module TicTacToe
  require 'spec_helper'

  describe Game do 
    
    params = {
    :console_ui => ConsoleUI.new(WrapperIO.new), 
    :board => Board.new,
    :validation => Validation.new}
    
    let(:game_turn) {
      GameTurn.new(params)}

    let(:marker_loop) {
      MarkerLoop.new(Validation.new, ConsoleUI.new(WrapperIO.new))
    }

    let(:game_completion) { GameCompletion.new(ConsoleUI.new(WrapperIO))
    }

    let(:game_eval) {GameEval.new}

    let(:player) {Player.new}
    describe ".run" do 
      context "player 1 wins the game and is symbol X" do 
        it "runs through a game of tic tac toe" do 
          game = Game.new(game_turn, marker_loop, game_completion, game_eval, player)
          
          expect(marker_loop).to receive(:marker_selection).and_return(["X", "O"])
          
          expect(game_turn).to receive(:execute).with(1, "X").and_return(
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

          expect(game_turn).to receive(:execute).with(2, "O").and_return(winning_board)

          game_result = game_eval.player_won_or_tied(winning_board, 'X', 'O')

          expect(game_completion).to receive(:game_over_messages).with(game_result, winning_board)

          game.run
        end
      end
    end
  end
end
