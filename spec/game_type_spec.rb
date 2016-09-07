module TicTacToe
  require "spec_helper"
  describe GameType do
    let(:mock_console_ui) { double }
    let(:game_type) { GameType.new(mock_console_ui) }

    before (:each) do
      allow(mock_console_ui).to receive(:game_menu_messages)
      allow(mock_console_ui).to receive(:display_game_menu)
      allow(mock_console_ui).to receive(:user_input).and_return('2')
    end

    it "sets @human_v_human to true if 1 is entered" do
      allow(mock_console_ui).to receive(:user_input).and_return('1')
      game_type.game_menu
      expect(game_type.human_v_human).to eq(true)
    end

    it "sets @human_v_simp_comp to true if 2 is entered" do
      game_type.game_menu
      expect(game_type.human_v_simp_comp).to eq(true)
    end

    it "displays instructions to the user of how to select a game" do
      expect(mock_console_ui).to receive(:game_menu_messages)
      game_type.game_menu
    end

    it "prints the game menu choices" do
      menu_choices = {
        "1" => "1. Human v. Human", 
        "2" => "2. Human v. Simple Computer"
      }
      expect(mock_console_ui).to receive(:display_game_menu).with(menu_choices)
      game_type.game_menu
    end

    it "prompts the user for their game choice" do
      expect(mock_console_ui).to receive(:user_input).and_return('1')
      game_type.game_menu
    end

    context "the user enters an invalid menu option" do
      it "prompts the user enter a menu option again" do
        expect(mock_console_ui).to receive(:valid_menu_choice).exactly(4).times
        expect(mock_console_ui).to receive(:user_input).and_return('!', "t", "I", "one", '1')
        game_type.game_menu
      end
    end
  end
end
