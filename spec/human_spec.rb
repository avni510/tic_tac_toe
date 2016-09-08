module TicTacToe
  require "spec_helper"

  describe Human do 
    it "returns the player's marker" do
      human = Human.new('O')
      expect(human.marker).to eq('O')
    end
  end
end
