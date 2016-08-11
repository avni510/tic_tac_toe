module TicTacToe
  require "end_game"

  describe EndGame do 
    
    let(:mock_console_ui) { double () }
    let(:end_game) {EndGame.new(mock_console_ui) }

    before (:each) do 
      expect(mock_console_ui).to receive(:puts_space).exactly(2).times
    end 

    describe ".finished_game" do 
      context "player 1 won" do 
        it "displays a won message" do 
          expect(mock_console_ui).to receive(:won_message)
          end_game.finished_game(1)
        end
      end

      context "the game ended in a tie" do 
        it "displays a tied message" do 
          expect(mock_console_ui).to receive(:tied_message)
          end_game.finished_game("tied")
        end
      end
    end
  end
end
