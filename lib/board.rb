class Board 
  attr_reader :board

  def initialize 
    @board = [*'0'..'8']
  end

  def fill(position, symbol)
    @board[position.to_i] = symbol if position_conditions?(position)
		return false if position_conditions?(position) == false
    @board
  end

  private 

  def position_conditions?(position)
    valid_position?(position) && position_open?(position)
  end

  def valid_position?(position)
    not position !~ /^[0-8]{1}$/
  end

  def position_open?(position)
    not board[position.to_i] !~ /^[0-8]{1}$/
  end

end
