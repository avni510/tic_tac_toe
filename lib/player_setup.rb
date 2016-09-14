module TicTacToe
  class PlayerSetup 
    attr_reader :p1
    attr_reader :p2

    def player_assignment(marker1, marker2, console_ui, game_type)
      @console_ui = console_ui
      if game_type.human_v_human
        @p1 = human_player(marker1)
        @p2 = human_player(marker2)
      elsif game_type.human_v_simp_comp
        @p1 = human_player(marker1)
        @p2 = computer_player(marker2)
      end
    end

   private 

    def human_player(player_marker)
      human_params = generate_basic_params(player_marker)
      Human.new(human_params)
    end
    
    def computer_player(player_marker)
      computer_move_strategy = SimpleComputer.new({})
      computer_params = generate_basic_params(player_marker)
      computer_params = computer_params.merge(ai: computer_move_strategy)
      Computer.new(computer_params)
    end

    def generate_basic_params(player_marker)
      {
        console_ui: @console_ui, 
        player_marker: player_marker, 
      }
    end
  end
end
