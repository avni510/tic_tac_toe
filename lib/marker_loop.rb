module TicTacToe

  class MarkerLoop
    TTT_MARKER1 = 'X'
    TTT_MARKER2 = 'O'

    def initialize(validation, console_ui)
      @validation = validation
      @console_ui = console_ui 
    end

    def marker_selection
      @console_ui.select_marker_message
      p1_marker = marker_selection_loop
      p1_marker.upcase!
      p2_marker = marker_assignment(p1_marker)
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
      marker
    end

    def marker_assignment(p1_marker)
      p1_marker == TTT_MARKER2 ? TTT_MARKER1 : TTT_MARKER2
    end
  end
end
