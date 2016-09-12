module TicTacToe
  class Computer < Player
    attr_reader :marker

    def make_move(board)
      @console_ui.move_messages(board.nine_space_array, @marker)
      board_size = board.nine_space_array.count
      begin 
        move = random_move(board_size)
        move = move.to_s
      end until @validation.move_valid?(board.nine_space_array, move)  
      board = board.fill(move, @marker)
      @console_ui.computer_move_message(move)
      board
    end

    private

    def random_move(upper_limit)
      Random.rand(upper_limit)
    end
  end
end
