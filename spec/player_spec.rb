module TicTacToe
  require 'spec_helper'

  describe Player do 
    it "returns the ordinal number and marker of a player" do
      player = Player.new(1, 'X')
      expect(player.ord_num).to eq(1)
      expect(player.marker).to eq('X')
    end
  end
end
