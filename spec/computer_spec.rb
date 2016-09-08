module TicTacToe
  require "spec_helper"
  
  describe Computer do
    let(:validation) { Validation.new }
    let(:mock_console_ui) { double }
    let(:board) {Board.new}

    it "returns the player's marker" do
      args = 
        {
          :board => board, 
          :console_ui => mock_console_ui, 
          :validation => validation
        }
      computer = Computer.new('X', args)
      expect(computer.marker).to eq('X')
    end
  end
end
