module TicTacToe
  class ConsoleUI

    def initialize(wrapper)
      @wrapper = wrapper
    end

    def user_input
      input = @wrapper.get_action
      puts_space
      input
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

    def move_selection_message
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

    def game_menu_messages
      @wrapper.puts_string("Please select which type of game you would like to play")
      puts_space
      @wrapper.puts_string("Enter the number next to the choice")
      puts_space
    end

    def display_game_menu(menu_options)
      menu_options.each do |selection_num, game_type|
        @wrapper.puts_string(game_type)
      end
      puts_space
    end

    def valid_menu_choice
      @wrapper.puts_string("Please enter a valid menu option")
    end

    def computer_move_message(move)
      @wrapper.puts_string("The computer will fill space #{move}")
      puts_space
    end
  end
end

