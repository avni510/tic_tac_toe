module TicTacToe
  require 'spec_helper'

  describe GameCompletion do 
    
    let(:mock_console_ui) { double }
    let(:game_eval) { GameEval.new } 
    let(:game_completion) { GameCompletion.new(mock_console_ui, game_eval) }

    before (:each) do 
      expect(mock_console_ui).to receive(:puts_space).exactly(2).times
      allow(mock_console_ui).to receive(:display_board)
    end 

    describe ".game_over_messages" do 
      context "player 1 won" do 
        it "displays a won message" do 

          board_array = [
            "X", "O", "2",
            "3", "X", "O",
            "6", "7", "X"
          ]

          marker1, marker2 = 'X', 'O'

          winning_player_marker = game_eval.player_marker_won(board_array, marker1, marker2)

          expect(mock_console_ui).to receive(:won_message).with("#{winning_player_marker}")

          game_completion.game_over_messages(board_array, marker1, marker2)
        end
      end

      context "the game ended in a tie" do 
        it "displays a tied message" do 

          board_array = [
            "X", "O", "X",
            "X", "O", "O",
            "O", "X", "X"
          ]
          
          marker1, marker2 = 'O', 'X'

          game_result = game_eval.player_marker_won(board_array, marker1, marker2)

          expect(mock_console_ui).to receive(:tied_message)

          game_completion.game_over_messages(board_array, marker1, marker2)
        end
      end
    end
  end
end
