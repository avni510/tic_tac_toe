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
      params = generate_params_hash(player_marker)
      Human.new(params)
    end
    
    def computer_player(player_marker)
      params = generate_params_hash(player_marker)
      Computer.new(params)
    end

    def generate_params_hash(player_marker)
      {
        console_ui: @console_ui, 
        player_marker: player_marker, 
      }
    end
  end
end
