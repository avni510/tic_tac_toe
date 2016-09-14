module TicTacToe
  class SimpleComputer < Computer

    def generate_move(board)
      upper_limit = board.size
      Random.rand(upper_limit)
    end
  end
end
