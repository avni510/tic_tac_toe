module TicTacToe
  require 'spec_helper'

  describe Player do 
    
    let(:mock_console_ui) { double }

    it "returns the marker of a player" do
      params = 
        { 
          player_marker: 'X',
          console_ui: mock_console_ui,
          validation: Validation.new
        }

      player = Player.new(params)
      expect(player.player_marker).to eq('X')
    end
  end
end
