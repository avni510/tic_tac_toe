module TicTacToe

  class Board 
    attr_reader :nine_space_array

    def initialize 
      @nine_space_array = [*'0'..'8']
    end

    def fill(position, symbol)
      @nine_space_array[position.to_i] = symbol      
      @nine_space_array
    end
  end
end
