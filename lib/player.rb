module TicTacToe
  class Player
    attr_reader :marker
    attr_reader :board

    def initialize(marker, console_ui)
      @marker = marker
      @console_ui = console_ui
      @validation = Validation.new
    end
  end
end
