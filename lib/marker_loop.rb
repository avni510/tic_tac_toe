module TicTacToe

  class MarkerLoop

    def initialize(validation, console_ui)
      @validation = validation
      @console_ui = console_ui 
    end

    def marker_selection
      @console_ui.select_marker_message
      p1_marker = marker_selection_loop
      p1_marker.upcase!
      p2_marker = marker_assignment(p1_marker, "X", "O")
      @console_ui.puts_markers(p1_marker, p2_marker)
      @console_ui.puts_space
      return p1_marker, p2_marker 
    end

    def marker_selection_loop
      marker = @console_ui.user_input
      until @validation.marker_conditions?(marker)
        @console_ui.valid_marker_message
        marker = @console_ui.user_input
      end
      marker
    end

    def marker_assignment(p1_marker, game_marker1, game_marker2)
      if p1_marker == game_marker1
        game_marker2
      elsif p1_marker == game_marker2
        game_marker1
      end
    end
  end
end
