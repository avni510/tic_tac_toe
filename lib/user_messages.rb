class UserMessages
  attr_reader :player1_symbol
  attr_reader :player2_symbol


  def initialize(wrapper)
    @wrapper = wrapper
		@board = Board.new.board
  end

  def select_symbol
    begin 
      @wrapper.puts_string("Player 1 please enter either 'X' or 'O' for your symbol")
      @player1_symbol = @wrapper.get_action
      @player1_symbol.upcase!
    end while (valid_symbol?(@player1_symbol))
    player2_symbol_assignment
    @wrapper.puts_string("Player 1's symbol is #{player1_symbol} and Player 2's symbol is #{player2_symbol}")
  end

  def display_board(board)
    @wrapper.puts_string(
      "#{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n 
      #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n 
      #{board[6]} | #{board[7]} | #{board[8]} \n")
  end

  def player_move(player_symbol)
    @wrapper.puts_string("Please select your move by entering a number 0 to 8")
		move = @wrapper.get_action    
		board = board.fill(move, player_symbol)
#		if board == false start the loop 	
  end



private

  def player2_symbol_assignment
    if @player1_symbol == "X"
      @player2_symbol = "O"
    else
      @player2_symbol = "X"
    end     
  end

  def valid_symbol?(symbol)
    symbol !~ /^(X|O)$/
  end

end
