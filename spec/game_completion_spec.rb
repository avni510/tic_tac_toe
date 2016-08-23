module TicTacToe
  require 'spec_helper'

  describe GameCompletion do 
    
    let(:mock_console_ui) { double () }
    let(:game_completion) { GameCompletion.new(mock_console_ui) }

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
          expect(mock_console_ui).to receive(:won_message)

          game_completion.game_over_messages(1, board_array)
        end
      end

      context "the game ended in a tie" do 
        it "displays a tied message" do 
          board_array = [
            "X", "O", "X",
            "X", "O", "O",
            "O", "X", "X"
          ]
          expect(mock_console_ui).to receive(:tied_message)

          game_completion.game_over_messages(0, board_array)
        end
      end
    end
  end
end
