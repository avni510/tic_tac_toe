module TicTacToe
  class MarkerLoop

    def initialize(validation, console_ui)
      @validation = validation
      @console_ui = console_ui 
    end

    def marker_selection(ttt_marker1, ttt_marker2)
      @console_ui.select_marker_message
      p1_marker = marker_selection_loop
      p2_marker = marker_assignment(p1_marker, ttt_marker1, ttt_marker2)
      @console_ui.puts_markers(p1_marker, p2_marker)
      @console_ui.puts_space
      return p1_marker, p2_marker 
    end

    private

    def marker_selection_loop
      marker = @console_ui.user_input
      until @validation.marker_valid?(marker)
        @console_ui.valid_marker_message
        marker = @console_ui.user_input
      end
      marker.upcase
    end

    def marker_assignment(p1_marker, ttt_marker1, ttt_marker2)
      p1_marker == ttt_marker1 ? ttt_marker2 : ttt_marker1 
    end
  end
end
