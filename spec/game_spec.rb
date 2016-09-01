module TicTacToe
  require 'spec_helper'

  describe Game do 
    params = {
    :console_ui => ConsoleUI.new(WrapperIO.new),
    :board => Board.new,
    :validation => Validation.new
    }
    
    let(:game_turn) { GameTurn.new(params) }

    let(:game_eval) { GameEval.new }

    describe ".players_turns" do 
      context "player 2 wins the game" do 
        it "executes each player's turn until the game is over" do 
          p1_marker, p2_marker = 'X', 'O'

          game = Game.new(game_turn, game_eval, p1_marker, p2_marker)
          
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

          game.players_turns
        end
      end
    end
  end
end
