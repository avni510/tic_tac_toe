module TicTacToe
  class ConsoleInterface

    def initialize(wrapper)
      @wrapper = wrapper
    end

    def select_symbol
      symbol = @wrapper.get_action
      symbol
    end

    def select_symbol_message
      @wrapper.puts_string("Player 1 please enter either 'X' or 'O' for your symbol")
    end

    def valid_symbol_message
      @wrapper.puts_string("Please enter a valid symbol")
    end

    def puts_symbols(symbol1, symbol2)
      @wrapper.puts_string("Player 1's symbol is #{symbol1} and Player 2's symbol is #{symbol2}")  
    end
    
    def display_board(board)
      @wrapper.puts_string(" #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n")
    end

    def player_move
      move = @wrapper.get_action    
      move
    end

    def player_move_message
      @wrapper.puts_string("Please select your move by entering a number 0 to 8")
    end

    def move_messages(board)
      display_board(board)
      puts_space
      player_move_message
      move = player_move
      puts_space
      move
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

  end
end

