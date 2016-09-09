module TicTacToe
  class Computer < Player
    attr_reader :marker

    def make_move(board)
      @console_ui.move_messages(board.nine_space_array, @marker)
      begin 
        move = random_move
        move = move.to_s
      end until @validation.move_valid?(board.nine_space_array, move)  
      board = board.fill(move, @marker)
      @console_ui.computer_move_message(move)
      board
    end

    def random_move
      Kernel.rand(8)
    end
  end
end
