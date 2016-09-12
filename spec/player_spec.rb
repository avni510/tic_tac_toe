module TicTacToe
  require 'spec_helper'

  describe Player do 
    
    let(:mock_console_ui) { double }

    it "returns the ordinal number and marker of a player" do
      player = Player.new('X', mock_console_ui)
      expect(player.marker).to eq('X')
    end
  end
end
