module TicTacToe
  require 'spec_helper'

  describe Player do 

    context "Player 1 is 'X' and Player 2 is 'O' " do
      it "returns player 1 as the current player and player 1's marker" do
        player = Player.new(1, 'X')
        expect(player.current_player).to eq(1)
        expect(player.marker).to eq('X')
      end

      context "player one just had their turn" do
        it "returns player 2 as the current player and player 2's marker" do
          
          player = Player.new(1, 'X')
          player.toggle_player('X', 'O')

          expect(player.current_player).to eq(2)
          expect(player.marker).to eq('O')
        end
      end
    end
  end
end
