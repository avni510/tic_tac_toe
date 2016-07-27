module TicTacToe
  class ConsoleInterface
    attr_reader :player1_symbol
    attr_reader :player2_symbol


    def initialize(wrapper)
      @wrapper = wrapper
    end

    def select_symbol
      begin 
        @wrapper.puts_string("Player 1 please enter either 'X' or 'O' for your symbol")
        @player1_symbol = @wrapper.get_action
        @player1_symbol.upcase!
      end while (valid_symbol?(@player1_symbol))
      player2_symbol_assignment
    end

    def puts_symbols
      @wrapper.puts_string("Player 1's symbol is #{@player1_symbol} and Player 2's symbol is #{@player2_symbol}")  
    end
    
    def display_board(board)
      @wrapper.puts_string(" #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n")
    end

    def player_move
      @wrapper.puts_string("Please select your move by entering a number 0 to 8")
      move = @wrapper.get_action    
    end

    def move_messages(board)
      display_board(board)
      puts_space
      player_move
    end

    def game_over_message
      @wrapper.puts_string("Game over")
    end

    def valid_move_message
      @wrapper.puts_string("Please enter a valid move")
    end
    
    def player_turn_message(player_num)
      @wrapper.puts_string("It is Player #{player_num}'s turn")
    end

    def puts_space
      @wrapper.puts_string("")
    end
    
    def won_message(player_num)
      @wrapper.puts_string("Player #{player_num} has won")
    end

    def tied_message
      @wrapper.puts_string("The game ended in a tie")
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
end
