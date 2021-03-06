module TicTacToe

  class Validation

    def move_valid?(board, move)
      valid_position?(move) && position_open?(board, move)
    end
    
    def marker_valid?(marker)
      not marker !~ /^(X|O|x|o)$/
    end 

  private 

    def valid_position?(move)
      not move !~ /^[0-8]{1}$/ 
    end

    def position_open?(board, move)
      not board[move.to_i] !~ /^[0-8]{1}$/
    end
  end
end
