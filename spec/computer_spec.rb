module TicTacToe
  require "spec_helper"
  
  describe Computer do
    it "returns the player's marker" do
      computer = Computer.new('X')
      expect(computer.marker).to eq('X')
    end
  end
end
