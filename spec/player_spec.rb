module TicTacToe
  require 'spec_helper'

  describe Player do 
    
    let(:mock_console_ui) { double }
    let(:validation) {Validation.new}

    it "returns the ordinal number and marker of a player" do
      args = 
        {
          :console_ui => mock_console_ui,
          :validation => validation
        }
      player = Player.new('X', args)
      expect(player.marker).to eq('X')
    end
  end
end
