module TicTacToe
  class Player
    attr_reader :marker
    attr_reader :board

    def initialize(marker, args)
      @marker = marker
      @board = args.fetch(:board, Board.new)
      @console_ui = args[:console_ui]
      @validation = args[:validation]
    end
  end
end
