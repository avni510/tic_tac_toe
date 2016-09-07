module TicTacToe
  class ConsoleUI

    def initialize(wrapper)
      @wrapper = wrapper
    end

    def user_input
      @wrapper.get_action
    end

    def select_marker_message
      @wrapper.puts_string("Please enter either 'X' or 'O' for your symbol")
    end

    def valid_marker_message
      @wrapper.puts_string("Please enter a valid symbol")
    end

    def puts_markers(marker1, marker2)
      @wrapper.puts_string("Player 1's symbol is #{marker1} and Player 2's symbol is #{marker2}")  
    end
    
    def display_board(board)
      @wrapper.puts_string(" #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n")
    end

    def player_move_message
      @wrapper.puts_string("Please select your move by entering a number 0 to 8")
    end

    def player_turn_message(marker)
      @wrapper.puts_string("It is Player #{marker}'s turn")
    end

    def move_messages(board, marker)
      player_turn_message(marker)
      puts_space
      display_board(board)
      puts_space
      player_move_message
      move = user_input
      puts_space
      move
    end

    def valid_move_message
      @wrapper.puts_string("Please enter a valid move")
    end
    
    def puts_space
      @wrapper.puts_string("")
    end
    
    def won_message(marker)
      @wrapper.puts_string("Player #{marker} has won")
    end

    def tied_message
      @wrapper.puts_string("The game ended in a tie")
    end
  end
end

