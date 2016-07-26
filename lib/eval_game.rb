class EvalGame


  def tied?(board)
    board.all?{ |space| space == "X" || space == "O"}
  end

  def won?(board)
    won_by_rows(board) || won_by_columns(board) || won_by_diagonals(board)
  end

private
  def won_by_rows(board)
    board_rows = board.each_slice(3).to_a
    board_rows.each { |row| return true if row.uniq.length == 1}
    false
  end

  def won_by_columns(board)  
    [board[0], board[3], board[6]].uniq.length == 1 || 
    [board[1], board[4], board[7]].uniq.length == 1 || 
    [board[2], board[5], board[8]].uniq.length == 1
  end

  def won_by_diagonals(board)
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[8]].uniq.length == 1
  end


end
