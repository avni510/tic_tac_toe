module TicTacToe
  class PlayerSetup 
    attr_reader :p1
    attr_reader :p2

    def player_assignment(marker1, marker2, console_ui, game_type)
      if game_type.human_v_human
        @p1 = human_player(marker1, console_ui) 
        @p2 = human_player(marker2, console_ui)
      elsif game_type.human_v_simp_comp
        @p1 = human_player(marker1, console_ui)
        @p2 = Computer.new(marker2, console_ui)
      end
    end

    private 

    def human_player(marker, console_ui)
      Human.new(marker, console_ui)
    end
  end
end
