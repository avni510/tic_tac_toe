module TicTacToe
  class Computer < Player
    attr_reader :marker

    def make_move(board)
      begin 
        move = random_move
        move = move.to_s
      end until @validation.move_valid?(board.nine_space_array, move)  
      board.fill(move, @marker)
    end

    def random_move
      Kernel.rand(8)
    end
  end
end
