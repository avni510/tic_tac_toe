module TicTacToe
  class Player
    attr_reader :marker
    attr_reader :board

    def initialize(marker, args)
      @marker = marker
      @console_ui = args[:console_ui]
      @validation = args[:validation]
    end
  end
end
