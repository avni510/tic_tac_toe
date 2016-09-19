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
        @p2 = computer_player(marker2, simple_computer)
      elsif game_type.human_v_hard_comp
        @p1 = human_player(marker1)
        @p2 = computer_player(marker2, hard_computer(marker2, marker1))
      end
    end

   private 

    def human_player(player_marker)
      human_params = generate_basic_params(player_marker)
      Human.new(human_params)
    end

    def computer_player(player_marker, computer_move_strategy)
      computer_params = generate_basic_params(player_marker)
      computer_params = computer_params.merge(ai: computer_move_strategy)
      Computer.new(computer_params)
    end

    def hard_computer(player_marker,opponent_marker)
      params = hard_computer_params(player_marker, opponent_marker)
      computer_move_strategy = HardComputer.new(params)
    end
    
    def simple_computer
      computer_move_strategy = SimpleComputer.new({})
    end

    def generate_basic_params(player_marker)
      {
        console_ui: @console_ui, 
        player_marker: player_marker,
      }
    end

    def hard_computer_params(player_marker, opponent_marker)
      { 
        opponent_marker: opponent_marker, 
        game_eval: GameEval.new,
        player_marker: player_marker,
        validation: Validation.new
      }
    end
  end
end
