class Board 
  attr_reader :board_array

  def initialize 
    @board_array = [*'0'..'8']
  end

  def fill(position, symbol)
    if position_conditions?(position)
      @board_array[position.to_i] = symbol      
    else
      return false
    end
    @board_array
  end

  private 

  def position_conditions?(position)
    valid_position?(position) && position_open?(position)
  end

  def valid_position?(position)
    not position !~ /^[0-8]{1}$/
  end

  def position_open?(position)
    not board_array[position.to_i] !~ /^[0-8]{1}$/
  end

end
