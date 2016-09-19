module TicTacToe
  class GameEval

    def initialize
      @winning_combos = 
        [ 
          [0, 1, 2], [3, 4, 5], [6, 7, 8], 
          [0, 3, 6], [1, 4, 7], [2, 5, 8], 
          [0, 4, 8], [2, 4, 6] 
        ]
    end

    def winning_player_marker(board, marker1, marker2)
      @winning_combos.each do |combo|
        winning_board_combo = [ board[combo[0]], board[combo[1]], board[combo[2]] ]
        if winning_board_combo.count(marker1) == 3
          return marker1
        elsif winning_board_combo.count(marker2) == 3
          return marker2 
        end
      end
      nil
    end
      
    def game_over?(board, marker1, marker2)
      tied?(board, marker1, marker2) || won?(board, marker1, marker2)
    end

    def won?(board, marker1, marker2)
      return true if winning_player_marker(board, marker1, marker2)
      false
    end

    def tied?(board, marker1, marker2)
      board.all?{ |space| space == marker1 || space == marker2}
    end
  end
end

