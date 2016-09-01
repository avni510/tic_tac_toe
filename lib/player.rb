module TicTacToe
  class Player
    attr_reader :ord_num
    attr_reader :marker

    def initialize(ord_num, marker)
      @ord_num = ord_num
      @marker = marker
    end
  end
end
