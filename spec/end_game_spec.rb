module TicTacToe
  require "end_game"

  describe EndGame do 
    
    let(:mock_interface) { double () }
    let(:end_game) {EndGame.new(mock_interface) }

    describe ".finished_game" do 
      context "player 1 won" do 
        it "can display game over message" do 
          expect(mock_interface).to receive(:puts_space).exactly(2).times
          expect(mock_interface).to receive(:won_message)
          end_game.finished_game("1")
        end
      end

      context "the game ended in a tie" do 
        it "can display a game over message" do 
          expect(mock_interface).to receive(:puts_space).exactly(2).times
          expect(mock_interface).to receive(:tied_message)
          end_game.finished_game("tied")
        end
      end
    end
  end
end
