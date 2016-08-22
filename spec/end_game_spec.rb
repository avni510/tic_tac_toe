module TicTacToe
  require 'spec_helper'

  describe EndGame do 
    
    let(:mock_console_ui) { double () }
    let(:end_game) { EndGame.new(mock_console_ui) }

    before (:each) do 
      expect(mock_console_ui).to receive(:puts_space).exactly(2).times
      allow(mock_console_ui).to receive(:display_board)
    end 

    describe ".finished_game" do 
      context "player 1 won" do 
        it "displays a won message" do 
          board_array = [
            "X", "O", "2",
            "3", "X", "O",
            "6", "7", "X"
          ]
          expect(mock_console_ui).to receive(:won_message)

          end_game.finished_game(1, board_array)
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

          end_game.finished_game(0, board_array)
        end
      end
    end
  end
end
