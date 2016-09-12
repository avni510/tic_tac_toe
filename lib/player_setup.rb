module TicTacToe
  class PlayerSetup 
    attr_reader :p1
    attr_reader :p2

    def player_assignment(marker1, marker2, console_ui, game_type)
      if game_type.human_v_human
        @p1 = Human.new(marker1, console_ui)
        @p2 = Human.new(marker2, console_ui)
      elsif game_type.human_v_simp_comp
        @p1 = Human.new(marker1, console_ui)
        @p2 = Computer.new(marker2, console_ui)
      end
    end
  end
end
