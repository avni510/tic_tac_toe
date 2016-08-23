module TicTacToe

  class GameEval

    def player_won_or_tied(board, marker1, marker2)
      return 0 if tied?(board)
      board.count(marker1) > board.count(marker2) ? 1 : 2
    end
      
    def game_over?(board) 
      tied?(board) || won?(board)
    end
    
  private

    def tied?(board)
      board.all?{ |space| space == "X" || space == "O"}
    end

    def won?(board)
      won_by_rows(board) || won_by_columns(board) || won_by_diagonals(board)
    end

    
    def won_by_rows(board)
      [board[0], board[1], board[2]].uniq.length == 1 ||
      [board[3], board[4], board[5]].uniq.length == 1 ||
      [board[6], board[7], board[8]].uniq.length == 1 
    end

    def won_by_columns(board)  
      [board[0], board[3], board[6]].uniq.length == 1 || 
      [board[1], board[4], board[7]].uniq.length == 1 || 
      [board[2], board[5], board[8]].uniq.length == 1
    end

    def won_by_diagonals(board)
      [board[0], board[4], board[8]].uniq.length == 1 ||
      [board[2], board[4], board[6]].uniq.length == 1
    end
  end
end

