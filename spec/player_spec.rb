module TicTacToe
  require 'spec_helper'

  describe Player do 
    it "returns the ordinal number and marker of a player" do
      player = Player.new('X')
      expect(player.marker).to eq('X')
    end
  end
end
