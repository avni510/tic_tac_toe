module TicTacToe
  require 'spec_helper'
  describe PlayerSetup do

    let(:mock_console_ui) { double }
    let(:game_type) { double }
    let(:player_setup) { PlayerSetup.new }

    before (:each) do 
      @args = 
        {
          :console_ui => mock_console_ui,
          :validation => Validation.new
        }
    end

    context "human v. human" do 
      it "returns the corresponding Player objects for each player" do
        marker1, marker2 = "X", "O"   

        allow(game_type).to receive(:human_v_human).and_return(true)

        player_setup.player_assignment(marker1, marker2, @args, game_type)
        expect(player_setup.p1).to be_a_kind_of(Human)
        expect(player_setup.p2).to be_a_kind_of(Human)
      end
    end
    
    context "human v. simple computer" do 
      it "returns the corresponding Player objects for each player" do
        marker1, marker2 = "X", "O"   

        allow(game_type).to receive(:human_v_human).and_return(false)

        allow(game_type).to receive(:human_v_simp_comp).and_return(true)

        player_setup.player_assignment(marker1, marker2, @args, game_type)
        expect(player_setup.p1).to be_a_kind_of(Human)
        expect(player_setup.p2).to be_a_kind_of(Computer)
      end
    end
  end
end
