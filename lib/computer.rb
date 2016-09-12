module TicTacToe
  class Computer < Player
    attr_reader :marker

    def make_move(board)
      @console_ui.move_messages(board.cells, @marker)
      move = valid_move_loop(board)
      board = board.fill(move, @marker)
      @console_ui.computer_move_message(move)
      board
    end

    private

    def valid_move_loop(board)
      begin 
        move = random_move(board)
        move = move.to_s
      end until @validation.move_valid?(board.cells, move)  
      move
    end

    def random_move(board)
      upper_limit = board_size(board) 
      Random.rand(upper_limit)
    end

    def board_size(board)
      board.cells.count
    end
  end
end
