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

    def size
      self.cells.count
    end

    def refill(position)
      cells[position.to_i] = position
      self
    end
  end
end
