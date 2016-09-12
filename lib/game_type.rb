module TicTacToe
  class GameType
    attr_reader :human_v_human
    attr_reader :human_v_simp_comp

    def initialize(console_ui)
      @console_ui = console_ui
    end

    def game_menu
      @console_ui.game_menu_messages
      menu_choices = {
        '1' => '1. Human v. Human', 
        '2' => '2. Human v. Simple Computer'
      }
      @console_ui.display_game_menu(menu_choices)
      user_game_choice = valid_game_menu_choice(menu_choices)
      game_type_assignment(user_game_choice, menu_choices)
    end

    private

    def valid_game_menu_choice(menu_choices)
      user_game_choice = @console_ui.user_input
      until menu_choices.has_key?(user_game_choice)
        @console_ui.valid_menu_choice
        user_game_choice = @console_ui.user_input
      end
      user_game_choice
    end

    def game_type_assignment(user_game_choice, menu_choices)
      if user_game_choice == menu_choices.key('1. Human v. Human')
        @human_v_human = true
      elsif user_game_choice == menu_choices.key('2. Human v. Simple Computer')
        @human_v_simp_comp = true
      end
    end
  end
end
