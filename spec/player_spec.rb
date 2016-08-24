module TicTacToe
  require 'spec_helper'

  describe Player do 
    let(:player) { Player.new }

    it "returns the current player as nil when first initialized" do 
      expect(player.current_player).to eq(nil)
    end

    it "returns the player's marker to be nil when first initialized" do
      expect(player.marker).to eq(nil)
    end

    context "Player 1 is 'X' and Player 2 is 'O' " do
      it "returns player 1 as the current player and player 1's marker" do
        player.toggle_player('X', 'O')
        expect(player.current_player).to eq(1)
        expect(player.marker).to eq('X')
      end

      context "player one is the current player" do
        it "returns player 2 as the current player and player 2's marker" do
          
         2.times { player.toggle_player('X', 'O') }

         expect(player.current_player).to eq(2)
         expect(player.marker).to eq('O')
        end
      end
    end
  end
end
