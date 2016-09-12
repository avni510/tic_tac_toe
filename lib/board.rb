module TicTacToe
  class Board 
    attr_reader :cells

    def initialize(cells = [*'0'..'8'])
      @cells = cells
    end

    def fill(position, marker)
      cells[position.to_i] = marker
      self
    end
  end
end
