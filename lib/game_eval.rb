module TicTacToe

  class GameEval

    def player_won(board, player1, player2)
      if won?(board)
        board.count(player1.marker) > board.count(player2.marker) ? player1 : player2
      end
    end
      
    def game_over?(board, player1, player2)
      tied?(board, player1, player2) || won?(board)
    end
    
  private

    def tied?(board, player1, player2)
      board.all?{ |space| space == player1.marker || space == player2.marker}
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

