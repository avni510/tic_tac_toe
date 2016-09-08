module TicTacToe
  class Player
    attr_reader :marker

    def initialize(marker, args)
      @marker = marker
      @board = args.fetch(:board, Board.new)
      @console_ui = args[:console_ui]
      @validation = args[:validation]
    end
  end
end
