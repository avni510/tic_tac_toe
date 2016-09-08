module TicTacToe
  require 'spec_helper'
  describe PlayerSetup do

    let(:mock_console_ui) { double }
    let(:player_setup) { double }

    context "human v. human" do 
      it "returns the corresponding Player objects for each player" do
        args = 
          {
            :board => Board.new, 
            :console_ui => mock_console_ui,
            :validation => Validation.new
          }
        marker1, marker2 = "X", "O"   

        player_setup = PlayerSetup.new

        player_setup.player_assignment(marker1, marker2, args)
        expect(player_setup.p1).to be_a_kind_of(Human)
        expect(player_setup.p2).to be_a_kind_of(Human)
      end
    end
  end
end
